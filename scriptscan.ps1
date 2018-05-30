<#
Scripte pour scan security


New-Item -Name "Rapport-scan.txt" -ItemType file -Path "$PSScriptRoot"
$Rapport= "$PSScriptRoot\Rapport-scan.txt"

$windowsupdate= Get-Service -Name wuauserv |  Select-Object Status
echo $windowsupdate.Status


$windowsupdate = Get-Service -Name wuauserv 
if ( $windowsupdate.Status -like "Stopped" ) { echo "Service Window update désactiver" >> $Rapport } else {echo "Service Window update activer" >> $Rapport }
#>

New-Item -Name "Rapport-$env:COMPUTERNAME.txt" -ItemType file -Path "$PSScriptRoot"
$Rapport= "$PSScriptRoot\Rapport-$env:COMPUTERNAME.txt"

$listservice = "wscsvc","wuauserv"; 

foreach ( $checkservice in $listservice ) 
    { 
        if ( $checkservice.Status -like "Stopped" ) { 
        echo "$checkservice est désactiver" >> $Rapport 
            } else { 
                    echo "$checkservice est activer" >> $Rapport 
                    }
    }

<#
Set-Service -Name wuauserv -Status Stopped
#>



