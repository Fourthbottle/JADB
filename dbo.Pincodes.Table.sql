USE [JA]
GO
/****** Object:  Table [dbo].[Pincodes]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pincodes](
	[Location] [nvarchar](255) NULL,
	[PinCode] [float] NULL,
	[Taluk] [nvarchar](255) NULL,
	[District] [nvarchar](255) NULL,
	[StateName] [nvarchar](255) NULL
) ON [PRIMARY]

GO
