USE [JA]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/10/2018 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[ID] [uniqueidentifier] NULL,
	[FullName] [nvarchar](250) NULL,
	[EmailId] [nvarchar](250) NULL,
	[passcode] [nvarchar](250) NULL,
	[crtdt] [datetime] NULL,
	[userType] [int] NULL
) ON [PRIMARY]

GO
