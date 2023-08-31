# 
# Author: 
#
#    Connor Hudson
# 
# Description:
#
#    Reinstate print nightmare patches.
#    
#    Removing the RestrictDriverInstallationToAdministrators value to 1
#    should prevent standard users from installing type 3 print drivers from the print
#    server. They will get a UAC prompt stopping them.
#    
#    Running this means the machine is no longer vulnerable to the print nightmare vulnerability.
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
$debug_log_path = "C:\temp\intunelogs\install_printers\PRINTER_PRECONFIGURATION_UNINSTALL.log"

Start-Transcript -Path $debug_log_path

if (Test-Path $registry_key_path) { # Key exists
    Remove-ItemProperty -Path $registry_key_path -Name $registry_value_name
    exit 0
} 
else {
    # if else clause runs, there is no key/value to delete, so its a success regardless.
    exit 0
}

Stop-Transcript