#
# Author:  
#
#    Connor Hudson
#
# Description:
#      
#    This script will install network
#    printers from a print server.
#
#    Add as many network printers to the $printers
#    variable as you want.
#
#    Copy the variables to the uninstall script if you
#    choose to use it in tandem with this script.
#

###################################################################################

############## COPY THIS BLOCK OF CODE TO THE UNINSTALL SCRIPT!!! #################

$print_server_name = "print_server.mydomain.com"

$printers = (
    "printer_name"
)

###################################################################################

Write-Host "Attempting to add printers..."

foreach ($printer in $printers) {
    $printer_name = "\\$print_server_name\$printer"
    Write-Host "Installing printer $printer_name..."
    Add-Printer -ConnectionName $printer_name
}

Write-Host "Attempting to remove printers"

foreach ($printer in $printers) {
    $printer_name = "\\$print_server_name\$printer"
    Write-Host "Uninstalling printer $printer_name..."
    Remove-Printer $printer_name
}
