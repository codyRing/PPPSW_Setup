USE [PPPSW_Contract]
--GO

--ALTER TABLE [dbo].[TransformBlueCrossSchedule] DROP CONSTRAINT [DF__Transform__RowDa__086B34A6]
--GO

--ALTER TABLE [dbo].[TransformBlueCrossSchedule] DROP CONSTRAINT [DF__Transform__Recor__0777106D]
--GO

--/****** Object:  Table [dbo].[TransformBlueCrossSchedule]    Script Date: 5/20/2020 5:31:02 PM ******/
--DROP TABLE [dbo].[TransformBlueCrossSchedule]
--GO

/****** Object:  Table [dbo].[TransformBlueCrossSchedule]    Script Date: 5/20/2020 5:31:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TransformBlueCrossSchedule](
	[Area] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[PlaceOfService] [varchar](50) NULL,
	[Modifier] [varchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[RecordID] [uniqueidentifier] NOT NULL,
	[RowDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TransformBlueCrossSchedule] ADD  DEFAULT (newid()) FOR [RecordID]
GO

ALTER TABLE [dbo].[TransformBlueCrossSchedule] ADD  DEFAULT (getdate()) FOR [RowDate]
GO


