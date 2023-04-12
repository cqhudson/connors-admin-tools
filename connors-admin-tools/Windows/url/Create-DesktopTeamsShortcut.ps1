<# 
# Author: Connor Hudson
# Date: April 12, 2023
#> 

# Use this variable if you want to make a .url visible on all user desktops
$PublicDesktopPath = [Environment]::GetFolderPath("CommonDesktopDirectory")

$ShortcutName = "Microsoft Teams.url"
$URL = "https://teams.microsoft.com"


$Shell = New-Object -ComObject ("WScript.Shell")

$Shortcut = $Shell.CreateShortcut("$PublicDesktopPath\$ShortcutName")
$Shortcut.Targetpath = $URL
$Shortcut.Save()

# Gets the parent directory of the current running script. This directory is where teams.ico is stored.
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$IconFile = "$PSScriptRoot\teams.ico"

# next update the shortcut with a path to the icon file and the index of that icon
# you can do that because a .url file is just a text file in INI format
Add-Content -Path "$PublicDesktopPath\$ShortcutName" -Value "IconFile=$IconFile"
Add-Content -Path "$PublicDesktopPath\$ShortcutName" -Value "IconIndex=0"

$Icon = ".\tea"

# clean up the COM objects
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($shortcut) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($shell) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()