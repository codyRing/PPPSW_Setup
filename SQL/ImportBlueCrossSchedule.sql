USE [PPPSW_Contract]
GO

/****** Object:  Table [dbo].[ImportBlueCrossSchedule]    Script Date: 5/20/2020 5:32:19 PM ******/
--DROP TABLE [dbo].[ImportBlueCrossSchedule]
--GO

--/****** Object:  Table [dbo].[ImportBlueCrossSchedule]    Script Date: 5/20/2020 5:32:19 PM ******/
--SET ANSI_NULLS ON
--GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ImportBlueCrossSchedule](
	[Fname] [nvarchar](100) NULL,
	[Area] [int] NULL,
	[Code] [nvarchar](100) NULL,
	[GlobalComponent] [float] NULL,
	[ProfessionalComponent] [float] NULL,
	[TechincalComponent] [float] NULL,
	[FacilityComponent] [float] NULL,
	[StartDate] Date not null,
	[EndDate] date not null
) ON [PRIMARY]
GO


