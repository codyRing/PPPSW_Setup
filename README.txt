Test Site: 
PPPSW	V6.46.3	C:\Builds\	V6.46.3\Console\driver.exe
https://test.mymdclarity.com/v6.46.3/LogIn.aspx?cid=PPPSW_Contract

Check Fee Compare/Audit for :59400
Check Fee Compare/Audit for :99245


Still to do
1. Schedule Filepaths and directories
	SourceData File C:\ClientData\PPPSW

Done ------ 2. Should load data files be in the Fees job or maybe split that out? Probably will do this one

Done ------- 3. Blue Cross Locality 6, missing schedule from PDF

Done ---------3.5 Create Source Schedule data table and go from individiual carrier imports to that source table

4. Need help with contract research. Fee Logic still needs work, currently only pointing to fixed fees. 
	Anesthesiology Calcs
	Missing Codes (future not on schedule)

5. More clever way for locality to facility, currently hard coded in Blue Cross Job
	select * from CommonData..MedicareZipCodeMap where LocalityCode  like '6'
	Don't use common data create on facility map.

6. Modify Load-Dimensions to add "Quote Insurance"





5/13 PM call with Colin
Done ---Scheduletype Name Fixed-Fees
Done ----Schedlue name UHC UnitedHealthCare-Fixed-Profee-Clinic???
Done -----Limit Schedule Map load to only clinic Facilities. Expectation that we may have hospital facilities in the future.
Done ------ Constrain UHC Schedule map load to facility type clinic



5/19 AM Call
Copy Place of service hospital schedule inserts. Even run incase an hospital is ever added
Done ------ Contract map Billtype constain to only profee bill types
Probably need a "Schedule date Column" to use in schedule name and to denote all of these rates from 2008 RVU's.This date will be in schedule name.
Done ------ Need a facility zip map table. 



5/20 Testing
Fix table name TransfromUnitedHealthCareSchedule    Trans From......





cd C:\Users\Public\Documents\
5/21/2020 Deployment
	Editor XML
		Contracts
			9711\PPSW_Editor\New\Contract_BlueCross.XML
			9711\PPSW_Editor\New\Contract_UHC.xml
			9711\PPSW_Editor\New\Contract_Molina.xml
		
		Fee Logic
			9711\PPSW_Editor\New\FeeLogic_BlueCross.xml
			9711\PPSW_Editor\New\FeeLogic_UnitedHealthCare.xml

		Schedule Type
			9711\PPSW_Editor\New\ScheduleType_FixedFees.xml
			
		DataFileSpec
			9711\PPSW_Editor\New\DataFileSpec_ImportBlueCrossSchedule.xml
			9711\PPSW_Editor\New\DataFileSpec_ImportUnited.xml

		Jobs
			9711\PPSW_Editor\New\Job_Load-BlueCross-Data.xml
			9711\PPSW_Editor\New\Job_Load-BlueCross-Fees.xml
			9711\PPSW_Editor\New\Job_Load-UnitedHealthCare-Data.XML
			9711\PPSW_Editor\New\Job_Load-UnitedHealthCare-Fees.xml
			
	SQL Tables
			9711\PPSW_Editor\sql\BlueCrossFacilityLocalityMap.sql
			9711\PPSW_Editor\sql\ImportBlueCrossSchedule.sql
			9711\PPSW_Editor\sql\TransfromBlueCrossSchedule.sql
			9711\PPSW_Editor\sql\ImportUnitedHealthCareSchedule.sql
			9711\PPSW_Editor\sql\TransfromUnitedHealthCareSchedule.sql
			9711\PPSW_Editor\sql\SourceScheduleData.SQL

Load files?????
Select

From(
SELECT CONVERT(XML, BulkColumn ) AS BulkColumn  
FROM OPENROWSET(BULK 'C:\Users\Public\Documents\9711\PPSW_Editor\New\Job_Load-BlueCross-Data.xml', SINGLE_BLOB) AS x;






