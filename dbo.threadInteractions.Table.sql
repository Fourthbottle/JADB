USE [JA]
GO
/****** Object:  Table [dbo].[threadInteractions]    Script Date: 10/6/2018 2:14:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[threadInteractions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[threadId] [int] NULL,
	[viewCount] [int] NULL
) ON [PRIMARY]

GO
