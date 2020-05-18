use PPPSW_Contract
DECLARE @code VARCHAR(50) = '59400'
Declare @servicedate date = '4/1/2020'

Declare @t table(
ticket varchar(50),
remark varchar(50),
insurance varchar(50))

insert into @t ([Ticket],[remark], [Insurance]) values
('9711', 'https://app.clickup.com/t/4wc4vy', 'Molina'), 
('9509', 'https://app.clickup.com/t/5pgc3k', 'United Healthcare'),
('9738','https://app.clickup.com/t/6we9y2','Blue Cross')
--('N/A','','Medicare')
/*
('9509', 'https://app.clickup.com/t/5pgc3k', 'United Healthcare Medi-Cal'),
('9711', 'https://app.clickup.com/t/4wc4vy', 'Molina Medi-Cal'), 
('NA', 'Example', 'Medi-Cal'),
*/
select 
t.ticket
,t.insurance
,t.remark
,i.CreatedOn as 'Insurance_Created'
,i.UpdatedOn as 'Insurance_Updated'
,c.CreatedOn as 'Contract_Created'
,c.UpdatedOn as 'Contract_Updated'
,f.CreatedOn as 'FeeLogic_Created'
,f.UpdatedOn as 'FeeLogic_Updated'
,m.StartEffectiveDate as 'CM_eff_Start'
,m.EndEffectiveDate as 'CM_eff_End'
,m.Fac_Count
,m.Billtype_Count

From @t	t
	left join Insurance i
		on i.[Key] = t.insurance

	left join Contract c
		on c.[Key] = t.insurance

	left join FeeLogic F
		on f.[Key] = t.insurance

	left join (
				SELECT 
					[contract]
					,StartEffectiveDate
					,EndEffectiveDate
					,count(DISTINCT facility) as Fac_Count
					,count(DISTINCT billtype) as Billtype_Count
				FROM dbo.ContractMap
				GROUP BY [contract]
					,StartEffectiveDate
					,EndEffectiveDate
				) m
		on m.[contract] = t.insurance


-------------------------Fee Logic and Schedule--------------------------
Select
[key]
,fl.Body
,Body.value('(/Entity/BaseCalculations/Calculation/Name)[1]','varchar(max)') Name_1
,Body.value('(/Entity/BaseCalculations/Calculation/ScheduleType)[1]','varchar(max)') ScheduleType_1

,Body.value('(/Entity/BaseCalculations/Calculation/Name)[2]','varchar(max)') Name_2
,Body.value('(/Entity/BaseCalculations/Calculation/ScheduleType)[2]','varchar(max)') ScheduleType_2

,Body.value('(/Entity/BaseCalculations/Calculation/Name)[3]','varchar(max)') Name_3
,Body.value('(/Entity/BaseCalculations/Calculation/ScheduleType)[3]','varchar(max)') ScheduleType_3

,Body.value('(/Entity/BaseCalculations/Calculation/Name)[4]','varchar(max)') Name_4
,Body.value('(/Entity/BaseCalculations/Calculation/ScheduleType)[4]','varchar(max)') ScheduleType_4

,Body.value('(/Entity/BaseCalculations/Calculation/Name)[5]','varchar(max)') Name_5
,Body.value('(/Entity/BaseCalculations/Calculation/ScheduleType)[5]','varchar(max)') ScheduleType_5
from dbo.FeeLogic fl
	join @t t
		on fl.[Key] = t.insurance


-------------------------Dimension Member--------------------------------
--select
--row_number() over(partition by t.insurance order by d.dimension)
--,t.ticket
--,t.insurance
--, d.*
--from @t t
--left join DimensionMember d
--	on t.insurance = d.Member
----------------------------------------------------------------------------------
--------------Carrier Mapping----------------------------------
--select 
--indx = row_Number() over (partition by si.insurance order by payername)
--,PayerName
--,si.Insurance
--,EligibilityCheck
--,AvailityPayerID
-- from dbo.SourceInsuranceMap si
--	join @t t
--		on si.Insurance = t.insurance


----------------------Check Amounts--------------------------------------------------
Select 
S_Map.ticket
,S_Map.insurance
--,S_Map.remark
,s_map.Schedule
,S_map.ScheduleType
,s_map.StartEffectiveDate
,S_Map.EndEffectiveDate
,fee.*
from FeeScheduleRecord fee
join(
select 
row_number() over (partition by t.insurance,scheduletype order by endeffectivedate desc) as indx,
t.ticket
,t.insurance
--,T.REMARK
,s.Schedule
,s.ScheduleType
,s.StartEffectiveDate
,s.EndEffectiveDate

from @t t
	left join dbo.ScheduleMap s
		on Case 
		when t.insurance in (select distinct insurance from ScheduleMap) then t.insurance
		else 'Charges'
		End = s.Insurance
		where EndEffectiveDate >= @servicedate and StartEffectiveDate <= @servicedate
) S_Map
	on fee.Schedule = s_map.Schedule
		where 
		s_map.indx = 1 and
		Member like @code