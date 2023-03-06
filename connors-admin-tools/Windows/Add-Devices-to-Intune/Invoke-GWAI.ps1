<#PSScriptInfo

.VERSION 1.0.0

.GUID c9709396-afeb-4445-b5c5-16cc781de6ef

.AUTHOR Bill Deitrick

.COMPANYNAME Christ Wesleyan Church

.COPYRIGHT

.TAGS

.LICENSEURI https://raw.githubusercontent.com/Christ-Wesleyan-Church/autopilot-hash-collector/master/LICENSE

.PROJECTURI https://github.com/Christ-Wesleyan-Church/autopilot-hash-collector

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
Version 1.0: First version.

#>

<#

.SYNOPSIS
Wrapper for the Get-WindowsAutoPilotInfo script from Microsoft/Michael Niehaus.

.PARAMETER GWAIVersion
Version of the Get-WindowsAutoPilotInfo script to download. Defaults to 1.6.

.PARAMETER GWAIFileName
The file name of the Get-WindowsAutoPilotInfo script to extract. Defaults to Get-WindowsAutoPilotInfo.ps1.

.PARAMETER GWAIPkgURI
The URL for the Get-WindowsAutoPilotInfo script on the PowerShell Gallery. Defaults to https://www.powershellgallery.com/api/v2/package/Get-WindowsAutoPilotInfo/.

.PARAMETER GWAIOutFile
The output CSV to which hashes should be appended. Defaults to hashes.csv.

.DESCRIPTION
This script executes the Get-WindowsAutoPilotInfo script or downloads it if it's not present in the same directory. Useful for collecting hardware hashes to USB in audit mode.

.EXAMPLE
.\Invoke-GWAI.ps1
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)] [String] $GWAIVersion = "1.6",
    [Parameter(Mandatory=$false)] [String] $GWAIFileName = "Get-WindowsAutoPilotInfo.ps1",
    [Parameter(Mandatory=$false)] [String] $GWAIPkgURI = "https://www.powershellgallery.com/api/v2/package/Get-WindowsAutoPilotInfo/",
    [Parameter(Mandatory=$false)] [String] $GWAIOutFile = "hashes.csv"
)

try {
    # Ensure we have a copy of the GWAI script
    if (-Not (Test-Path "$PSScriptRoot\$GWAIFileName")) {
        Write-Host "Get-WindowsAutoPilotInfo.ps1 not found. Downloading..." -ForegroundColor Yellow

        # Create a temporary directory
        $temp_dir = New-Item -ItemType Directory -Path "$PSScriptRoot\temp"

        Write-Host "Downloading version $GWAIVersion." -ForegroundColor Yellow

        # Download the current version
        $archive_path = ($temp_dir.FullName + "\GWAI.zip")
        Invoke-WebRequest -Uri ($GWAIPkgURI + $GWAIVersion) -OutFile $archive_path

        # Extract and copy $GWAIFileName
        $extract_path = ($temp_dir.FullName + "\extract")
        Expand-Archive -LiteralPath $archive_path -DestinationPath $extract_path

        # Grab the script
        Copy-Item -Path ($extract_path + "\" + $GWAIFileName) -Destination "$PSScriptRoot\$GWAIFileName"

        Write-Host "..download finished." -ForegroundColor Yellow
    } 
} finally {
    # Delete the temp dir
    Remove-Item -Path "$PSScriptRoot\temp" -Recurse -ErrorAction Ignore
}

# We should have the script by now. Let's run it
& "$PSScriptRoot\$GWAIFileName" -OutputFile "$PSScriptRoot\$GWAIOutFile" -Append

if ($?) {
    Write-Host "Successfully got hash!" -ForegroundColor Green
} else {
    Write-Host "Failed getting hash!" -ForegroundColor Red
}