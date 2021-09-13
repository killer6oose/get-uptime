Function Get-Uptime {
<#
.Synopsis
    This will check how long the computer has been running and when was it last rebooted.
 
 
.NOTES
    Name: Get-Uptime
    Author: Andrew Hatton
    Version: 1.4
    DateCreated: 2018-Jun-16
 
.LINK
    https://cronotech.us/ -
 
 
.PARAMETER ComputerName
    By default it will check the local computer.
 
    Description:
    Check the computers in selected file for their boottime/uptime.
 
#>
 
   $serverlist = "Path\To\Server\List\sl.txt" 
$reporttextfile = "Path\To\Save\Report\uptimereport.txt" 
out-file -filepath $reporttextfile -append -InputObject ("Uptime Report Run " + (Get-Date)) 
foreach ($server in Get-Content $serverlist) 
{ 
 $ping = gwmi win32_pingstatus -f "Address = '$server'" 
 if($ping.statuscode -eq 0) 
 { 
    $wmi = Get-WmiObject -ComputerName $server -Query "SELECT LastBootUpTime FROM Win32_OperatingSystem"     
    $now = Get-Date     
    $boottime = $wmi.ConvertToDateTime($wmi.LastBootUpTime) 
    out-file -filepath $reporttextfile -append -InputObject ("Uptime for " + $server + ": " + ($now - $boottime)) 
 } 
 else 
 { 
    out-file -filepath $reporttextfile -append -InputObject ("Uptime for " + $server + ": Host offline") 
 } 
}
