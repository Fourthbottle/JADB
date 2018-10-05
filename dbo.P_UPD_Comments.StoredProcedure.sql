USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_UPD_Comments]    Script Date: 10/6/2018 2:14:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[P_UPD_Comments]
(
@comment nvarchar(max),
@userId uniqueidentifier,
@threadId int,
@rating int
)
AS
BEGIN
	update comments
	set
	comment=isnull(@comment,comment),
	crtdt=GETDATE()
	where threadId=@threadId and userId=@userId

	update userratings 
	set
	rate=isnull(@rating,rate),
	updt = GETDATE()
	where threadId=@threadId and userId=@userId


	select cmnts.comment,cmnts.Id as commentId,cmnts.threadId,cmnts.userId,rating.rate as rating,
			cmnts.crtdt as commenetedOn
	 from Comments cmnts 
					left outer join UserRatings rating on
					cmnts.threadId=rating.threadId and 
					cmnts.userId = rating.userId
				where cmnts.threadId=@threadId and cmnts.userId=@userId

END


GO
