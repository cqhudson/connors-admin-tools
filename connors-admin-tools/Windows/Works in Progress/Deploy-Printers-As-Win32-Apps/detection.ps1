$print_server = "print_server.mydomain.com"
$printer = ("printer_name_here")

$result = Get-Printer -Name "\\$print_server\$printer"

if($result) {
    Write-Output "Found printer"
    exit 0
} else {
    Write-Output "No printer found"
    exit 1
}