USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_CRT_THREAD]    Script Date: 12/16/2018 9:44:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[P_CRT_THREAD]
(
@DetailId UniqueIdentifier,
@Builder nvarchar(100),
@project nvarchar(250),
@propertyType nvarchar(100),
@location nvarchar(250),
@userId uniqueIdentifier,
@Comment nvarchar(max),
@threadId uniqueIdentifier,
@commentId uniqueIdentifier,
@Rating int=null,
@PinCode bigint = null
)
AS
BEGIN
	
	Declare @city varchar(200),@state nvarchar(200)

	if @PinCode is not null
		begin
			select @city=District,@state=stateName from pincodes where pincode=@pincode
		end

	Insert into Details(Id,Builder,Project,PropertyType,location,lstupdtDt,PinCode,City,[State])
	Values (@DetailId,@Builder,@project,@propertyType,@location,GETDATE(),@PinCode,@city,@state)

		Declare @threadUrl nvarchar(500) = @Builder+'-'+@Project+'-'+@location+'-Reviews'
		Declare @title nvarchar(200) = @Builder+' '+@Project+' '+@location+' Reviews and Rating'
	
	if exists(select 1 from Threads where threadUrl=@threadUrl)
		Begin set @threadUrl = @threadUrl+'-'+CONVERT(varchar(10), floor(rand()*1000000)) end
		
		Insert into Threads(title,threadUrl,userid,lstupddt,detailId,threadId)
		Values (@title,@threadUrl,@userId,GETDATE(),@DetailId,@threadId)
	
	insert into Comments(threadId,comment,userId,crtdt,commentId)
		values(@threadId,@Comment,@userId,GETDATE(),@commentId)

	insert into SubscribedEmailers(threadId, EmailId, updt)
		select @threadId,Emailid,getdate() from UserDetails where ID=@userId

	if @Rating is not null
		insert into UserRatings (threadId,userId,rate,updt)
		values(@threadId,@userId,@Rating,getdate()) 


	select thrds.title,thrds.threadUrl,dtls.Builder,dtls.Project,dtls.location,udtls.FullName,dtls.lstupdtDt,
			udtls.ID as UserId
	 from Details dtls join Threads thrds on dtls.ID=thrds.detailId
	 join UserDetails udtls on udtls.Id= thrds.userid
	  where dtls.ID=@DetailId

END

GO
