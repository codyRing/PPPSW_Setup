Test Site: https://test.mymdclarity.com/V6.45.4/LogIn.aspx?cid=PPPSW_Contract

Check Fee Compare/Audit for :59400


Still to do
1. Schedule Filepaths and directories

2. Should load data files be in the Fees job or maybe split that out?

3. Blue Cross Locality 6, missing schedule from PDF

4. Need help with contract research. Fee Logic still needs work, currently only pointing to fixed fees. 
	Anesthesiology Calcs
	Missing Codes (future not on schedule)

5. More clever way for locality to facility, currently hard coded in Blue Cross Job
	select * from CommonData..MedicareZipCodeMap where LocalityCode  like '6'

6. Modify Load-Dimensions to add "Quote Insurance"