# Install any drivers specified in the .\drivers directory using pnputil.exe

$TempLogs = "$env:HOMEDRIVE\Temp\Logs\Install-SpecifiedDrivers_LOG.txt"
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

Start-Transcript -Path $TempLogs

Get-ChildItem "$PSScriptRoot\drivers\" -Recurse -Filter "*.inf" | 
    ForEach-Object { 
        $DriverFullName = $_.FullName
        pnputil.exe /add-driver $DriverFullName /install
        Write-Host "Driver: $DriverFullName"
    }

Stop-Transcript