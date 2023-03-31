@echo OFF

Rem First loop injects drivers into all 11 indexes of install.wim
FOR /L %%i in (1, 1, 11) DO (
imagex /mountrw c:\temp\WindowsISO\sources\install.wim %%i c:\temp\wim
dism /image:C:\temp\wim /add-driver /driver:C:\temp\drivers\ /recurse /ForceUnsigned
imagex /commit /unmount C:\temp\wim
)

Rem Second loop injects drivers into both indexes of boot.wim
FOR %%i in (1 2) DO (
imagex /mountrw c:\temp\WindowsISO\sources\boot.wim %%i c:\temp\wim
dism /image:C:\temp\wim /add-driver /driver:C:\temp\drivers\ /recurse /ForceUnsigned
imagex /commit /unmount C:\temp\wim
)

echo "Driver injection has finished, creating Win.iso"

oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bc:\temp\windowsiso\boot\etfsboot.com#pEF,e,bc:\temp\windowsiso\efi\microsoft\boot\efisys.bin c:\temp\windowsiso c:\temp\customiso\Win.iso

echo "Driver injection has finished and Win.iso has been created."