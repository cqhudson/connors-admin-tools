$StorePath = [Environment]::GetFolderPath("Desktop")
$ShortcutName = "Microsoft Teams.url"
$Shortcut = "$StorePath\$ShortcutName"

Remove-Item -Path $Shortcut -Force
