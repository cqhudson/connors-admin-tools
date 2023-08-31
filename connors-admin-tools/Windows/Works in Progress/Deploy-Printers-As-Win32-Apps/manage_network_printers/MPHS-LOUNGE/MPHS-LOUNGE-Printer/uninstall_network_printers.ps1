#
# Author:  
#
#    Connor Hudson
#
# Description:
#      
#    This script will uninstall network
#    printers from a print server.
#
#    Add as many network printers to the $printers
#    variable as you want.
#
#    Copy the variables to the install script if you
#    choose to use it in tandem with this script.
#

###################################################################################

############### COPY THIS BLOCK OF CODE TO THE INSTALL SCRIPT!!! ##################

$print_server_name = "mphs-dc1.magnoliaschools.net"

$printers = (
    "MPHS-LOUNGE"
)

###################################################################################

Start-Transcript -Path "C:\temp\intunelogs\install_printers\UNINSTALL_PRINTERS.log"

Write-Output "Running whoami to determine user for log"
whoami.exe

Write-Host "Attempting to remove printers"

foreach ($printer in $printers) {
    $printer_name = "\\$print_server_name\$printer"
    Write-Host "Uninstalling printer $printer_name..."
    Remove-Printer $printer_name
}

Stop-Transcript
