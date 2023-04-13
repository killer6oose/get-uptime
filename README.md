# Server Uptime Script

This PowerShell script retrieves the uptime of a list of servers and outputs the results to a CSV file. The script reads a list of server hostnames from a file named `server.txt` and retrieves the uptime of each server using the `Get-Uptime` cmdlet. The output is then written to a CSV file named `output.csv`, which includes the hostname, hours since last reboot, and online status for each server.

## Prerequisites

- Windows PowerShell 3.0 or higher
- A list of server hostnames in a text file named `server.txt`

## Usage

1. Clone or download the repository to your local machine.
2. Add the list of server hostnames to a text file named `server.txt`. Each server hostname should be on a separate line.
3. Open PowerShell and navigate to the directory where the script is located.
4. Run the script using the following command:
```powershell
.\server-uptime.ps1
```
5. The output will be written to a CSV file named `output.csv` in the same directory as the script.

## Notes

- If a server is offline or unreachable, the script will output a message indicating that the server is offline in the CSV file.
- The output file will be overwritten each time the script is run, so be sure to save a copy of the previous output if needed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
