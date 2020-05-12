USE [PPPSW_Contract]
GO

ALTER TABLE [dbo].[ImportBlueCrossSchedule] DROP CONSTRAINT [DF__ImportBlu__RowDa__55209ACA]
GO

/****** Object:  Table [dbo].[ImportBlueCrossSchedule]    Script Date: 5/12/2020 6:01:20 PM ******/
DROP TABLE [dbo].[ImportBlueCrossSchedule]
GO

/****** Object:  Table [dbo].[ImportBlueCrossSchedule]    Script Date: 5/12/2020 6:01:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ImportBlueCrossSchedule](
	[Fname] [varchar](100) NULL,
	[Area] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[GlobalComponent] [decimal](18, 2) NULL,
	[ProfessionalComponent] [decimal](18, 2) NULL,
	[TechincalComponent] [decimal](18, 2) NULL,
	[FacilityComponent] [decimal](18, 2) NULL,
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[RowDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ImportBlueCrossSchedule] ADD  DEFAULT (getdate()) FOR [RowDate]
GO


