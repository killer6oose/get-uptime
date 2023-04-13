$serverList = Get-Content -Path "server.txt"
$outputFile = "output.csv"

# Create the output CSV file and write the header row
$header = "Hostname, Hours since last reboot, Online"
$header | Out-File -FilePath $outputFile -Encoding utf8 -Force

foreach ($server in $serverList) {
    try {
        # Get the uptime and calculate the hours since last reboot
        $uptime = Get-Uptime -ComputerName $server
        $lastReboot = (Get-Date) - $uptime
        $hoursSinceReboot = [math]::Round((New-TimeSpan -Start $lastReboot).TotalHours, 2)

        # Determine if the server is online
        $online = Test-Connection -ComputerName $server -Count 1 -Quiet

        # Build the output string and write it to the CSV file
        $output = "$server, $hoursSinceReboot, $online"
        $output | Out-File -FilePath $outputFile -Encoding utf8 -Append

    } catch {
        # If there's an error, write a message indicating that the server is offline
        $output = "$server, Offline, False"
        $output | Out-File -FilePath $outputFile -Encoding utf8 -Append
    }
}
