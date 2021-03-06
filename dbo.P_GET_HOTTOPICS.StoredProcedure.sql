USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_GET_HOTTOPICS]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[P_GET_HOTTOPICS]
(
@THREADURL NVARCHAR(500) = null,
@UiLocation nvarchar(500)= null
)
AS
BEGIN
DECLARE @LOCATION NVARCHAR(500)
 IF @THREADURL IS NOT NULL OR @UILOCATION IS NOT NULL
	BEGIN
		select @LOCATION=d.City from Details d join Threads T on t.detailId =d.ID
		where t.threadUrl=@THREADURL

		if @UiLocation is not null and @THREADURL is null
			begin
				set @LOCATION =@UiLocation
			end

		select top 5 
		t.title,t.threadurl from threads t join userratings r on t.threadid = r.threadid
		join comments c on c.threadid = t.threadid join details d on d.ID =t.detailId
		where d.City=@LOCATION
		group by r.threadid ,t.title,t.id,t.threadurl
		having avg(rate) >3 and count(r.threadid) >=1
		order by t.id desc
	END
ELSE
	BEGIN
		select top 5 
		 t.title,t.threadurl from threads t join userratings r on t.threadid = r.threadid
		join comments c on c.threadid = t.threadid
		group by r.threadid ,t.title,t.id,t.threadurl
		having avg(rate) >3 and count(r.threadid) >=1
		order by t.id desc

	END
END
GO
