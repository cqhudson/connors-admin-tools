# 
# Author: Connor Hudson
# Date: July-2022
#
# Bypass for Windows Print Nightmare problem,
# Works for print servers on anything newer than Windows Server 2016
#
# This allows users to directly download print drivers from the print server
# without UAC popup asking for Administrator account. 
# 
# Leaves you vulnerable to the exploit, 
# but if you run this then you already decided that it doesn't matter
# 
# Only neccessary if your print server has a lot of Type 3 drivers that
# can not be updated for one reason or another.
#

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name "RestrictDriverInstallationToAdministrators" -Value "0" -PropertyType DWORD -Force
