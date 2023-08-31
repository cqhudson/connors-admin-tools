SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\install_network_printers.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"