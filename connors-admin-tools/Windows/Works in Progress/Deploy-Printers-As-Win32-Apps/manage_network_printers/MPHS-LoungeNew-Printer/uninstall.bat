SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\uninstall_network_printers.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"