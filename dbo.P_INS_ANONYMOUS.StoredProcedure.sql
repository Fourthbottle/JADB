USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_INS_ANONYMOUS]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[P_INS_ANONYMOUS]
(
@fullName nvarchar(250),
@emailId nvarchar(250),
@rating int,
@threadId uniqueidentifier,
@commentId uniqueidentifier,
@comment nvarchar(max),
@passcode varchar(250),
@userID uniqueidentifier
)
As
Begin

	insert into UserDetails(ID,FullName,EmailId,passcode,crtdt,userType)
	values (@userID,@fullName,@emailId,@passcode,getdate(),357)

	if(@rating<>0)
		BEGIN
		insert into UserRatings(threadId,userId,rate,updt,isAnanomys)
		values(@threadId,@userID,@rating,getdate(),0)
		END 
	
	insert into Comments(commentId,threadId,comment,userId,crtdt)
	values(@commentId,@threadId,@comment,@userID,getdate())

End

GO
