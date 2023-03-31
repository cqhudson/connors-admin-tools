STEP ONE: Create these folders:
	- C:\temp\WindowsISO
	- C:\temp\CustomISO
	- C:\temp\drivers
	- C:\temp\wim

STEP TWO: Mount a Windows.iso image and copy the contents of it to the (C:\temp\WindowsISO) folder.

STEP THREE: Put all drivers inside of the (C:\temp\drivers) folder. The (C:\temp\drivers) folder will be recursively checked for any drivers, so any folders within (C:\temp\drivers), such as (C:\temp\drivers\eMMC) or (C:\temp\drivers\WLAN) will be checked.

STEP FOUR: Run (Deployment and Imaging Tools Environment) as Administrator

STEP FIVE: From the (Deployment and Imaging Tools Environment) command prompt, run (inject-drivers.bat).

STEP SIX: Wait for (inject-drivers.bat) to finish running. This can take quite a bit of time to finish.

Once (inject-drivers.bat) finishes injecting the drivers, it will automatically create a UEFI compatible Win.iso file, located at (C:\temp\CustomISO). You can take this Win.iso file and burn it to a USB with Rufus.



Run all of the following commands in order:

// Potentially skip this part
- Setup install.wim
1. imagex /mountrw c:\temp\WindowsISO\sources\install.wim 4 c:\temp\wim
2. dism /image:C:\temp\wim /add-driver /driver:C:\temp\drivers\ /recurse /ForceUnsigned
3. imagex /commit /unmount C:\temp\wim

// Required
- Setup boot.wim
1. imagex /mountrw c:\temp\WindowsISO\sources\boot.wim 2 c:\temp\wim      
2. dism /image:C:\temp\wim /add-driver /driver:C:\temp\drivers\ /recurse /ForceUnsigned 
3. imagex /commit /unmount C:\temp\wim    

- Create the media.iso file (copy and paste this command into the terminal)
1. oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bc:\temp\windowsiso\boot\etfsboot.com#pEF,e,bc:\temp\windowsiso\efi\microsoft\boot\efisys.bin c:\temp\windowsiso c:\temp\customiso\Win.iso

