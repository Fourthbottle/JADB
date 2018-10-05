USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_CRT_THREAD]    Script Date: 10/6/2018 2:14:00 AM ******/
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
@Comment nvarchar(max)
)
AS
BEGIN
	Insert into Details(Id,Builder,Project,PropertyType,location,lstupdtDt)
	Values (@DetailId,@Builder,@project,@propertyType,@location,GETDATE())

		Declare @threadUrl nvarchar(500) = @Builder+'-'+@Project+'-'+@location+'-Reviews'
		Declare @title nvarchar(200) = @Builder+' '+@Project+' '+@location+' Reviews and Rating'
	
	if exists(select 1 from Threads where threadUrl=@threadUrl)
		Begin set @threadUrl = @threadUrl+'-'+CONVERT(varchar(10), floor(rand()*1000000)) end
		
		Insert into Threads(title,threadUrl,userid,lstupddt,detailId)
		Values (@title,@threadUrl,@userId,GETDATE(),@DetailId)
		Declare @lastUpdated int =@@IDENTITY

	insert into Comments(threadId,comment,userId,crtdt)
		values(@lastUpdated,@Comment,@userId,GETDATE())

	select thrds.title,thrds.threadUrl,dtls.Builder,dtls.Project,dtls.location,udtls.FullName,dtls.lstupdtDt,
			udtls.ID as UserId
	 from Details dtls join Threads thrds on dtls.ID=thrds.detailId
	 join UserDetails udtls on udtls.Id= thrds.userid
	  where dtls.ID=@DetailId

END

GO
