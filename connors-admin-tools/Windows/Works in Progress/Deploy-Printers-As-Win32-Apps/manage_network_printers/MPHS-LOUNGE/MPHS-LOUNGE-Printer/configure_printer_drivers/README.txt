Package the scripts as a Win32 App for Intune, run the app using an Administrator context, and set the app as a dependency for the actual printer installer.

This app will run under the LOCAL ADMINISTRATOR of the machine (MACHINE_NAME\Administrator). This is important for a few reasons.

1. Printers are installed per user.
2. Printer drivers are installed per machine.

The printers will only install under the administrator account, but the drivers are available to all users.

By running this as a dependency, we can preinstall the printer drivers as an administrator, bypassing the UAC prompt that standard users will get when pulling drivers from the print server.

We can then remove the printers from the administrator account, leaving only the drivers.

Then we run a separate Win32 app that installs the printers, running under the currently logged-in user context.

This app will be set as a dependency to the app that adds the printers to the logged-in user.

---------------------------------------------------------------------------------------------------------------------------------

- install_printer_drivers_as_admin.ps1
This script runs the Add-Printer / Remove-Printer cmdlets. Edit this script to have the names of your printers and print server.

- install.bat
This script is for simplicity when configuring the app in Intune. The install command will be: "install.bat"

- uninstall.bat
This script is for simplicity when configuring the app in Intune. The uninstall command will be: "uninstall.bat"
