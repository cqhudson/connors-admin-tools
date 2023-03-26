SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\Install-SpecifiedDrivers.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"