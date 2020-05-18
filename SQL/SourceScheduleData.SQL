USE [PPPSW_Contract]
GO

/****** Object:  Table [dbo].[SourceScheduleData]    Script Date: 5/18/2020 11:41:58 AM ******/
DROP TABLE [dbo].[SourceScheduleData]
GO

/****** Object:  Table [dbo].[SourceScheduleData]    Script Date: 5/18/2020 11:41:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SourceScheduleData](
	[Code] [varchar](50) NULL,
	[Modifier] [varchar](50) NULL,
	[PlaceOfService] [varchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Area] [varchar](50) NULL
) ON [PRIMARY]
GO


