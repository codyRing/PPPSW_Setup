USE [PPPSW_Contract]
GO

/****** Object:  Table [dbo].[ImportUnitedHealthCareSchedule]    Script Date: 5/18/2020 3:19:34 PM ******/
--DROP TABLE [dbo].[ImportUnitedHealthCareSchedule]
--GO

--/****** Object:  Table [dbo].[ImportUnitedHealthCareSchedule]    Script Date: 5/18/2020 3:19:34 PM ******/
--SET ANSI_NULLS ON
--GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ImportUnitedHealthCareSchedule](
	[Fname] [varchar](100) NULL,
	[Code] [varchar](50) NULL,
	[Modifier] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
	[TypeOfService] [varchar](100) NULL,
	[PlaceOfService] [varchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL
) ON [PRIMARY]
GO


