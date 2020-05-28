#CD C:\Users\crissler\Documents\Source
#import-module .\mdc.psm1 -force
$base = Get-ScriptRoot
cd $base



$csv = @()

gci .\UnitedSchedules -Filter *.csv |% {

$csv = import-csv -Path $_.Fullname -Delimiter ","

$fname = $_.BaseName
$csv| Select-Object @{N = 'Fname'; E={$fname}}, `
                    @{ N= 'Code'; E = 'CPT/HCPCS'},`
                    @{ N= 'Modifier'; E = {($_."Modifier").Replace('00','').trim()}},`
                    @{ N= 'Remark'; E = 'CPT/HCPCS Description'},`
                    @{ N= 'TypeOfService'; E = 'Type of Service'},`
                    @{ N= 'PlaceOfService'; E = 'Place of Service'},`
                    @{ N= 'Amount'; E = {($_."Fee Amount").Replace('$','').trim()}},`
                    @{ N= 'StartDate'; E = 'Effective Date'},`
                    @{ N= 'EndDate'; E = 'Exp. Date'}`

              
} |
Export-Csv .\UnitedSchedules\UnitedSchedulesZD9509.csv -NoTypeInformation







