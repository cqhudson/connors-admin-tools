# Uninstall any drivers specified in the .\drivers directory using pnputil.exe

$TempLogs = "$env:HOMEDRIVE\Temp\Logs\Uninstall-SpecifiedDrivers_LOG.txt"
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

Start-Transcript -Path $TempLogs

Get-ChildItem "$PSScriptRoot\drivers\" -Recurse -Filter "*.inf" | 
    ForEach-Object { 
        $DriverFullName = $_.FullName
        pnputil.exe /delete-driver $DriverFullName /uninstall
        Write-Host "Driver: $DriverFullName"
    }

Stop-Transcript