SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\reinstate_print_nightmare_patches.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"