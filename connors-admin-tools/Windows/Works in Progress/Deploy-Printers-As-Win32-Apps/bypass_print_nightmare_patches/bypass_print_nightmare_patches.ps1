# 
# Author: 
#
#    Connor Hudson
# 
# Description:
#
#    Bypass print nightmare patches.
#    
#    Setting the RestrictDriverInstallationToAdministrators value to 0
#    should allow standard users to install print drivers from the print
#    server without the UAC prompt stopping them.
#    
#    Running this means the machine is vulnerable to the print nightmare vulnerability.
#
# Intune Instructions:
#    
#    Either use this script as a Remediation or a standard, run-once Script.
#
#    Using as a Remediation will mean running the remediation as "detection only"
#    mode, which means that only the detection script (this script) will run. There
#    is no actual "remediation script" that will be run.
#    
#    Set the script to run as System, running using logged-on credentials will
#    cause the script to fail.
#

$registry_key_path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint"
$registry_value_name = "RestrictDriverInstallationToAdministrators"
$registry_value = 0
$process_time_in_seconds = 20
$debug_log_path = "C:\temp\intunelogs\install_printers\PRINTER_PRECONFIGURATION_INSTALL.log"

Start-Transcript -Path $debug_log_path

if (Test-Path $registry_key_path) { # Key exists
    Set-ItemProperty -Path $registry_key_path -Name $registry_value_name -Value $registry_value
} else { # Key does not exist, create it and the $registry_value_name
    New-Item -Path $registry_key_path -Force | Out-Null
    Set-ItemProperty -Path $registry_key_path -Name $registry_value_name -Value $registry_value
}

# Registry changes do not immediately take effect, causing an error when running the install printer scripts immediately after this one.
# We wait for a couple of seconds to give Windows time to process the changes.
Write-Output "Going to pause this script for $process_time_in_seconds seconds in order to let Windows process registry changes."
Start-Sleep -Seconds $process_time_in_seconds
Write-Output "Ending pause, should be good to install printers."

Stop-Transcript