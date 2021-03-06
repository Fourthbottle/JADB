USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_INS_RATING]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[P_INS_RATING]
(
@UserId uniqueidentifier,
@rating int,
@threadId uniqueidentifier,
@isAnanomys int
)
AS
BEGIN

if exists(select 1 from userratings where threadId=@threadId and userId=@UserId)
	begin
		update userratings set rate =@rating,updt=getdate()
		where threadId=@threadId and userId=@UserId
	end
else
	begin
		insert into userratings(threadId,userId,rate,isAnanomys,updt)
		values( @threadId,@UserId,@rating,@isAnanomys,getdate())
	end

END

 


GO
