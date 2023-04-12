SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\Create-DesktopTeamsShortcut.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"