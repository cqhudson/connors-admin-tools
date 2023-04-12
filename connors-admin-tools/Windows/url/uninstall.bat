SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\Delete-DesktopTeamsShortcut.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"