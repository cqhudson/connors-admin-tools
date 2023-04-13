$StorePath = [Environment]::GetFolderPath("Desktop")
$ShortcutName = "HUDSON.TEL.url"
$Shortcut = "$StorePath\$ShortcutName"

Remove-Item -Path $Shortcut -Force
