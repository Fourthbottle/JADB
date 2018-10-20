USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_INS_Thread_Subscription]    Script Date: 10/21/2018 12:05:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[P_INS_Thread_Subscription]
(
@threadId uniqueIdentifier,
@UserId uniqueidentifier = null,
@userEmail nvarchar(400) = null
)
AS
BEGIN
	
	IF @UserId IS NOT NULL
		BEGIN
			select @userEmail= Emailid from UserDetails where id=@UserId
		END
			insert into SubscribedEmailers(threadId,emailId,updt) values(@threadId,@userEmail,getdate())
	
END
GO
