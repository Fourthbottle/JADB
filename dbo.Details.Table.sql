USE [JA]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 10/10/2018 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[ID] [uniqueidentifier] NULL,
	[Builder] [nvarchar](100) NULL,
	[Project] [nvarchar](250) NULL,
	[PropertyType] [nvarchar](100) NULL,
	[location] [nvarchar](250) NULL,
	[lstupdtDt] [datetime] NULL
) ON [PRIMARY]

GO
