<# 
# Author: Connor Hudson
# Date: April 12, 2023
#> 

$PublicDesktopPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
$ShortcutName = "Microsoft Teams.url"
$Shortcut = "$PublicDesktopPath\$ShortcutName"

Remove-Item -Path $Shortcut -Force