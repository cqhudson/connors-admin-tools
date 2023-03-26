SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\Uninstall-SpecifiedDrivers.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"