function Set-ShortcutIcon {
    param ( [string]$IconName )

    $IconFile = "$PSScriptRoot\$IconName"
    Write-Host $IconFile
    Add-Content -Path "$StorePath\$ShortcutName" -Value "IconFile=$IconFile"
    Add-Content -Path "$StorePath\$ShortcutName" -Value "IconIndex=0"
}


# Path where you want to store the shortcut. Set to the currently logged in user's Desktop folder.
$StorePath = [Environment]::GetFolderPath("Desktop") # Change to ("CommonDesktopDirectory") for Public Desktop

$URL = "https://teams.microsoft.com" # Change to whatever link you want
$ShortcutName = "Microsoft Teams.url" # Must end with .url
$IconFileName = "teams.ico"
$Shell = New-Object -ComObject ("WScript.Shell")

$Shortcut = $Shell.CreateShortcut("$StorePath\$ShortcutName")
$Shortcut.Targetpath = $URL
$Shortcut.Save()

$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition 
Set-ShortcutIcon -IconName $IconFileName # Delete or comment out this line if you don't want a custom icon

# clean up the COM objects
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Shortcut) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Shell) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()
