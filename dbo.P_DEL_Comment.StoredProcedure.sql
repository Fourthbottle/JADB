USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_DEL_Comment]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[P_DEL_Comment]
(
@commentId uniqueidentifier,
@userId uniqueidentifier,
@usertype int
)
as
begin

Delete from Comments where commentId=@commentId and (userId=@userId OR @usertype=555)

select 1 as refCount from comments where commentId=@commentId and userId=@userId
end
GO
