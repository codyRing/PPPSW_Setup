USE [PPPSW_Contract]
GO

/****** Object:  Table [dbo].[SourceScheduleData]    Script Date: 5/18/2020 12:01:25 PM ******/
--DROP TABLE [dbo].[SourceScheduleData]
--GO

--/****** Object:  Table [dbo].[SourceScheduleData]    Script Date: 5/18/2020 12:01:25 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

CREATE TABLE [dbo].[SourceScheduleData](
	[Code] [varchar](50) NULL,
	[Modifier] [varchar](50) NULL,
	[PlaceOfService] [varchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Area] [varchar](50) NULL,
	[ScheduleName] varchar(100),
	[RecordID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


