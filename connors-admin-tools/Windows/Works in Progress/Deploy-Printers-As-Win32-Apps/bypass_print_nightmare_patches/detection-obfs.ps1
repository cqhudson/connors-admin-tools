# Author: Connor Hudson
#
# do not read it please
# it is a pain in the ass
# turn away now, or suffer
$registry_key_path="HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint";$registry_value_name="RestrictDriverInstallationToAdministrators";$expected_value=0;Start-Transcript -Path "C:\temp\intunelogs\install_printers\dependencies\detection_result.log" -Force;if (Test-Path $registry_key_path){$result = Get-Item -Path $registry_key_path;if($result.Property -contains $registry_value_name){if ((Get-ItemProperty -Path $registry_key_path -Name $registry_value_name).$registry_value_name -eq $expected_value){Write-Output "$registry_value_name exists and is equal to $expected_value";exit 0;}else{Write-Output "$registry_value_name exists but is not equal to $expected_value";exit 1;}}else{Write-Output "$registry_value_name does not exist.";exit 1;}};Stop-Transcript