USE [JA]
GO
/****** Object:  Table [dbo].[SubscribedEmailers]    Script Date: 10/10/2018 12:08:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscribedEmailers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[threadId] [uniqueidentifier] NULL,
	[EmailId] [nvarchar](400) NULL,
	[Updt] [datetime] NULL
) ON [PRIMARY]

GO
