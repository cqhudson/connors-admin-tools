SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\Create-DesktopShortcut.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"