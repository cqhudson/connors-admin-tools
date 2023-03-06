
$profiles = Get-CimInstance -ComputerName $computer -Class Win32_UserProfile

$NetworkService = "C:\WINDOWS\ServiceProfiles\NetworkService"
$LocalService = "C:\WINDOWS\ServiceProfiles\LocalService"
$System32 = "C:\WINDOWS\system32\config\systemprofile"

$CurrentUserProfile = $env:USERPROFILE

# Loop through each profile
foreach ($profile in $profiles) {
    
    $profileName = $profile.LocalPath

    # Check to make sure the selected profile is not a required Windows profile
    if ($profileName -ne $NetworkService -or $profileName -ne $LocalService -or $profileName -ne $System32) {
        
        # Check if the profile is not currently loaded
        if ($profile.Loaded -eq $false) {
        
            $profileName = $profile.LocalPath

            Write-Host "Deleting profile: $profileName"

            # Remove the profile
            Remove-CimInstance -InputObject $profile
        }

    }


    
}
