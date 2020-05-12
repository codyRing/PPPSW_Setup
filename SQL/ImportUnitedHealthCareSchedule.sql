use [PPPSW_Contract]
GO

ALTER TABLE [dbo].[ImportUnitedHealthCareSchedule] DROP CONSTRAINT [DF__ImportUni__RowDa__4AA30C57]
GO

/****** Object:  Table [dbo].[ImportUnitedHealthCareSchedule]    Script Date: 5/11/2020 6:30:42 PM ******/
DROP TABLE [dbo].[ImportUnitedHealthCareSchedule]
GO

/****** Object:  Table [dbo].[ImportUnitedHealthCareSchedule]    Script Date: 5/11/2020 6:30:42 PM ******/
SET ANSI_NULLS ON
GO

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
	[EndDate] [date] NULL,
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[RowDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ImportUnitedHealthCareSchedule] ADD  DEFAULT (getdate()) FOR [RowDate]
GO


