SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\Delete-DesktopShortcut.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"
