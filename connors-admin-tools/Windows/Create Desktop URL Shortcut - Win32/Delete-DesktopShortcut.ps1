$StorePath = [Environment]::GetFolderPath("CommonDesktopDirectory")
$ShortcutName = "Microsoft Teams.lnk"
$Shortcut = "$StorePath\$ShortcutName"
$IconFileName = "example.ico" # The icon file you want to use
$IconStore = "$env:PUBLIC\Link_Icons" # Where the *.ico file will be saved (Currently C:\Users\Public\Link_Icons)

Remove-Item -Path $Shortcut -Force # Delete the shortcut
Remove-Item -Path "$IconStore\$IconFileName" -Force
