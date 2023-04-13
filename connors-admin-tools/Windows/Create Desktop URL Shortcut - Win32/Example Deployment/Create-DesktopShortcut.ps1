$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition 
$IconStore = "$env:PUBLIC\Link_Icons" # Where the *.ico file will be saved (Currently C:\Users\Public\Link_Icons)
$URL = "https://teams.microsoft.com" # Change to whatever link you want
$ShortcutName = "Microsoft Teams.lnk" # Must end with .lnk for icon to work
$IconFileName = "teams.ico" # The icon file you want to use

# Path where you want to store the shortcut. Set to the currently logged in user's Desktop folder.
$StorePath = [Environment]::GetFolderPath("CommonDesktopDirectory") # Set to ("CommonDesktopDirectory") for Public Desktop

# Store the Icon file locally to access
if (Test-Path -Path $IconStore) {
    if (-not (Test-Path -Path "$IconStore\$IconFileName")){
        Copy-Item -Path "$PSScriptRoot\$IconFileName" -Destination $IconStore -PassThru # Move the icon to local storage
        attrib +h "$IconStore\$IconFileName"
    }
}
else {
    New-Item -Path "$IconStore" -ItemType Directory # Directory to store the icon file in
    attrib +h $IconStore # Make directory hidden to keep users from messing with it
    Copy-Item -Path "$PSScriptRoot\$IconFileName" -Destination $IconStore -PassThru # Move the icon to local storage
    attrib +h "$IconStore\$IconFileName"
}

$Shell = New-Object -ComObject ("WScript.Shell")

$Shortcut = $Shell.CreateShortcut("$StorePath\$ShortcutName")
$Shortcut.Targetpath = $URL
$Shortcut.IconLocation = "$IconStore\$IconFileName"
$Shortcut.Save()

# clean up the COM objects
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Shortcut) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Shell) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()
