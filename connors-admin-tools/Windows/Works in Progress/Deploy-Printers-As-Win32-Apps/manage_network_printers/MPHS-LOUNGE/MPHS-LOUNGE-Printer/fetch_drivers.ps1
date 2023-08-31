# Replace these with actual values
$printServer = "\\mphs-dc1.magnoliaschools.net"
$printerDriverName = "TOSHIBA Universal PS3"

# Check if the printer driver is already installed
$driverInstalled = Get-PrinterDriver -Name $printerDriverName -ErrorAction SilentlyContinue

if ($driverInstalled) {
    Write-Host "Printer driver '$printerDriverName' is already installed."
} else {
    # Install the printer driver from the print server
    try {
        Add-PrinterDriver -Name $printerDriverName -ComputerName $env:COMPUTERNAME -Verbose

        Write-Host "Printer driver '$printerDriverName' installed successfully."
    } catch {
        Write-Host "Failed to install printer driver: $_"
    }
}
