USE [PPPSW_Contract]
GO

--ALTER TABLE [dbo].[TransformUnitedHealthCareSchedule] DROP CONSTRAINT [DF__Transform__RowDa__15C52FC4]
--GO

--ALTER TABLE [dbo].[TransformUnitedHealthCareSchedule] DROP CONSTRAINT [DF__Transform__Recor__14D10B8B]
--GO

--/****** Object:  Table [dbo].[TransformUnitedHealthCareSchedule]    Script Date: 5/21/2020 11:52:12 AM ******/
--DROP TABLE [dbo].[TransformUnitedHealthCareSchedule]
--GO

/****** Object:  Table [dbo].[TransformUnitedHealthCareSchedule]    Script Date: 5/21/2020 11:52:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TransformUnitedHealthCareSchedule](
	[Fname] [varchar](100) NULL,
	[Area] varchar(50) null,
	[Code] [varchar](50) NULL,
	[Modifier] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
	[TypeOfService] [varchar](100) NULL,
	[PlaceOfService] [varchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[RecordID] [uniqueidentifier] NOT NULL,
	[RowDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TransformUnitedHealthCareSchedule] ADD  DEFAULT (newid()) FOR [RecordID]
GO

ALTER TABLE [dbo].[TransformUnitedHealthCareSchedule] ADD  DEFAULT (getdate()) FOR [RowDate]
GO


