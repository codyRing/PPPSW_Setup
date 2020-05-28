use PPPSW_Contract
------Variables
--Declare @Schedule varchar(50) ='BlueCross%'
Declare @Schedule varchar(50) ='United%'

Declare @TestCode Table(
code varchar(50))
insert into @TestCode (code) values
-- ('0005U'),('0006M'),('0006U'),('0007M')
--,('0007U'),('0008U'),('0009U'),('0010U')
 ('99203'),('87491'),('87591'),('87806')


--select * from @TestCode
-------Setup---------------------
--Truncate table	[dbo].[ImportUnitedHealthCareSchedule]
--Truncate table  [dbo].[TransformUnitedHealthCareSchedule]

--Truncate table	[dbo].[ImportBlueCrossSchedule]
--Truncate table  [dbo].[TransformBlueCrossSchedule]

--Delete from dbo.SourceScheduleData where ScheduleName like @Schedule
--Delete from dbo.FeeScheduleRecord where Schedule like @Schedule

----execute jobs
--C:\Builds\V6.46.3\Console\driver.exe /exec 'MDClarityMaster' 'PPPSW_Contract' 'Load-BlueCross-Data'
--C:\Builds\V6.46.3\Console\driver.exe /exec 'MDClarityMaster' 'PPPSW_Contract' 'Load-BlueCross-Fees'
--C:\Builds\V6.46.3\Console\driver.exe /exec 'MDClarityMaster' 'PPPSW_Contract' 'Load-UnitedHealthCare-Data'
--C:\Builds\V6.46.3\Console\driver.exe /exec 'MDClarityMaster' 'PPPSW_Contract' 'Load-UnitedHealthCare-Fees'


select
	'import'
	,* 
from dbo.ImportBlueCrossSchedule i ----Only records from file that was just loaded
	join @TestCode t
		on i.code = t.code


select 
	'transform',
            indx = row_number() OVER (
                PARTITION BY 
                    i.code
                    ,placeOfService
                    ,area
                    ,modifier 
                ORDER BY 
                    StartDate DESC      )
	, *
from dbo.TransformBlueCrossSchedule  i   -------All records we've ever received
	join @TestCode t
		on i.code = t.code

select 
	'source'
	, * 
from dbo.SourceScheduleData i   ----------------------Only what is going to be used in FSR
	join @TestCode t
		on i.code = t.code
and ScheduleName like @Schedule


Select 
	'FSR'
	, *
from dbo.FeeScheduleRecord i
	join @TestCode t
		on i.Member = t.code
and schedule like @Schedule