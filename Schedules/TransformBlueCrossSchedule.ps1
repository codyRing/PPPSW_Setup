CD C:\Users\crissler\Documents\Source
import-module .\mdc.psm1 -force
$base = Get-ScriptRoot
cd $base

$StartDate = '2019-07-01'
$EndDate = '2999-12-31'

Function ExportWSToCSV ($excelFileName, $csvLoc)
{
    $excelFile = "C:\Users\crissler\Documents\Ticket_Research\9711_9509_PPContract\BlueCrossSchedules\" + $excelFileName + ".xlsx"
    $E = New-Object -ComObject Excel.Application
    $E.Visible = $false
    $E.DisplayAlerts = $false
    $wb = $E.Workbooks.Open($excelFile)
    foreach ($ws in $wb.Worksheets)
    {
        $n = $excelFileName + "_" + $ws.Name
        $ws.SaveAs($csvLoc + $n + ".csv", 6)
    }
    $E.Quit()
}
#ExportWSToCSV -excelFileName "AnthemSchedule" -csvLoc "C:\Users\crissler\Documents\Ticket_Research\9711_9509_PPContract\BlueCrossSchedules\"

gci .\BlueCrossSchedules -Filter  *anthem*.csv |% {

$csv = import-csv -Path $_.Fullname -Delimiter ","
#$csv -replace '$',''
$fname = $_.BaseName
$csv| Select-Object @{N = 'Fname'; E={$fname}}, `
                    @{N = 'Area'; E= 'Area' },`
                    @{N = 'Code'; E= 'CODE' },`
                    @{N = 'GlobalComponent'; E= {($_.'Global Component/ Rental Price').Replace('-','').trim()} },`
					@{N = 'ProfessionalComponent'; E= {($_.'Professional Component / Purchased New').Replace('-','').trim()} },`
					@{N = 'TechincalComponent'; E= {($_.'Technical Component / Purchased Used').Replace('-','').trim()} },`
					@{N = 'FacilityComponent'; E= {($_.'Facility Allowance').Replace('-','').trim()} },`
                    @{N = 'StartDate'; E = {$StartDate}}, `
                    @{N = 'EndDate'; E = {$EndDate}}       
                   
              
} |
Export-Csv .\BlueCrossSchedules\BlueCrossSchedulesZD9738.csv -NoTypeInformation