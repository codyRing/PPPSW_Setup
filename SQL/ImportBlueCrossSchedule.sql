USE [PPPSW_Contract]
GO

/****** Object:  Table [dbo].[ImportBlueCrossSchedule]    Script Date: 5/18/2020 2:50:37 PM ******/
--DROP TABLE [dbo].[ImportBlueCrossSchedule]
--GO

--/****** Object:  Table [dbo].[ImportBlueCrossSchedule]    Script Date: 5/18/2020 2:50:37 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

CREATE TABLE [dbo].[ImportBlueCrossSchedule](
	[Fname] [varchar](100) NULL,
	[Area] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[GlobalComponent] [decimal](18, 2) NULL,
	[ProfessionalComponent] [decimal](18, 2) NULL,
	[TechincalComponent] [decimal](18, 2) NULL,
	[FacilityComponent] [decimal](18, 2) NULL
) ON [PRIMARY]
GO


