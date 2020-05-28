USE [PPPSW_Contract]
GO

--ALTER TABLE [dbo].[BlueCossFacilityLocalityMap] DROP CONSTRAINT [FK__BlueCossF__Facil__6F9F86DC]
--GO

--/****** Object:  Table [dbo].[BlueCossFacilityLocalityMap]    Script Date: 5/20/2020 12:49:17 PM ******/
--DROP TABLE [dbo].[BlueCossFacilityLocalityMap]
--GO

--/****** Object:  Table [dbo].[BlueCossFacilityLocalityMap]    Script Date: 5/20/2020 12:49:17 PM ******/
--SET ANSI_NULLS ON
--GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BlueCossFacilityLocalityMap](
	[Facility] [varchar](50) NULL,
	[Locality] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BlueCossFacilityLocalityMap]  WITH CHECK ADD FOREIGN KEY([Facility])
REFERENCES [dbo].[Facility] ([Key])
GO


insert into [BlueCossFacilityLocalityMap] ([Facility], [Locality]) Values
('2E863B41-F3B9-4768-AC31-AA300DAA9003', '4'), 
('ACB96567-0B1F-4AF7-81FC-598B26C3E3DC', '4'), 
('4BD8BD13-6076-4C78-AC9E-FEEC37F226D5', '6'), 
('7A28E85F-A7F9-4A54-903C-26E90CBD8EAE', '6'), 
('C1CAF54E-57B5-4A9F-84E7-554A8EF4EADB', '6'), 
('05483D36-4D7C-49B7-8FF1-7AE9FA0E2825', '7'), 
('0565487A-C88D-484C-9759-3DF762EA0695', '7'), 
('239055AA-220B-4F4B-BC82-0A40825A2F2C', '7'), 
('5BADD676-ACED-4037-9DC3-DEDC65026B87', '7'), 
('68C7DDB4-834A-4ABC-B3EB-87BF71D60F41', '7'), 
('6CB12D65-A88C-405C-89C0-7FE677C9D638', '7'), 
('6FAF7F6A-0424-41B0-8B13-D2678C76898A', '7'), 
('782C0260-7552-426E-87D6-38F073F40DAD', '7'), 
('9B706667-0AC8-4BAB-AC72-63B0075D05BF', '7'), 
('9EA2DE96-E929-499E-819B-4128A72CBC7B', '7'), 
('A0D201B2-7AD9-40DD-8A0B-F270478B1736', '7'), 
('D89E78A1-F4E4-4DC5-8A7A-BCC316E3A747', '7'), 
('DA5FCD52-AFBE-47F9-A2A2-D96601252CDF', '7'), 
('5C8A71F3-7496-4C4F-86E8-AEE02ADECCF4', '9')