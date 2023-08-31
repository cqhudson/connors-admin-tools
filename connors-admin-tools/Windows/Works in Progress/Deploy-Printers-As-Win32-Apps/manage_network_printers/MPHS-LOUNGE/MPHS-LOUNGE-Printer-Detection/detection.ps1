$print_server = "mphs-dc1.magnoliaschools.net"
$printer = ("MPHS-LOUNGE")

$result = Get-Printer -Name "\\$print_server\$printer"

if($result) {
    Write-Output "Found printer"
    exit 0
} else {
    Write-Output "No printer found"
    exit 1
}