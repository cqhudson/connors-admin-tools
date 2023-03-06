SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\DeployFiles.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"