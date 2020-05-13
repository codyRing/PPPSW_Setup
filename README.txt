Test Site: https://test.mymdclarity.com/V6.45.4/LogIn.aspx?cid=PPPSW_Contract

Check Fee Compare/Audit for :59400


Still to do
1. Schedule Filepaths and directories

2. Should load data files be in the Fees job or maybe split that out? Probably will do this one

3. Blue Cross Locality 6, missing schedule from PDF

3.5 Create Source Schedule data table and go from individiual carrier imports to that source table

4. Need help with contract research. Fee Logic still needs work, currently only pointing to fixed fees. 
	Anesthesiology Calcs
	Missing Codes (future not on schedule)

5. More clever way for locality to facility, currently hard coded in Blue Cross Job
	select * from CommonData..MedicareZipCodeMap where LocalityCode  like '6'

6. Modify Load-Dimensions to add "Quote Insurance"





5/13 PM call with Colin
Scheduletype Name Fixed-Fees
Schedlue name UHC UnitedHealthCare-Fixed-Profee-Clinic???
Limit Schedule Map load to only clinic Facilities. Expectation that we may have hospital facilities in the future.
Constrain UHC Schedule map load to facility type clinic