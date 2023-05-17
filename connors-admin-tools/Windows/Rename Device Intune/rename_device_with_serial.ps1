<# 
 # Assign this to run per device in Intune.
 # If Autopilot does not properly rename the device, this script will.
 # Forces a restart after device has been renamed.
 #>

$SN = [string](Get-WmiObject Win32_Bios).SerialNumber
$Prefix = [string]"COMP-"
$ExpectedComputerName = $Prefix + $SN

Start-Transcript -Path "C:\temp\powershell_logs\rename_student_computer.txt"

Write-Output "Serial Number is '$SN'"
Write-Output "Prefix is '$Prefix'"
Write-Output "Expected Computer Name is $ExpectedComputerName"
Write-Output "Student Computer Name is $env:ComputerName"

if (-not ($env:ComputerName -eq $ExpectedComputerName)){
    Rename-Computer -NewName $ExpectedComputerName -Restart
}
else {
    Write-Output "No issues detected with computer name. Device not renamed."
}

Stop-Transcript

