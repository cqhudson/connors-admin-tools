###
### Author: Connor Hudson
### Date: March 2023
###
###
### Description: Wipes all user profiles from device aside from the current user running the script
###

Clear-Host

$profiles = Get-CimInstance -ComputerName $computer -Class Win32_UserProfile

### These 3 profiles are used by Windows, they should not be deleted if
### they are all loaded, but just to be safe, we will check against them
### when looping through profiles
$NetworkService = "C:\WINDOWS\ServiceProfiles\NetworkService"
$LocalService = "C:\WINDOWS\ServiceProfiles\LocalService"
$System32 = "C:\WINDOWS\system32\config\systemprofile"

$CurrentUserProfile = $env:USERPROFILE

### Loop through each profile
foreach ($profile in $profiles) {
    
    $profileName = $profile.LocalPath

    switch ($profileName)
    {
        
        ### Do nothing to these accounts
        $NetworkService     {Write-Host "Doing nothing to $NetworkService";     Break}
        $LocalService       {Write-Host "Doing nothing to $LocalService";       Break}
        $System32           {Write-Host "Doing nothing to $System32";           Break}
        $CurrentUserProfile {Write-Host "Doing nothing to $CurrentUserProfile"; Break}

        ### If none of the above accounts, delete it
        $profileName {
            Write-Host "Going to delete $profileName"
            $ProfileToSignOut = $profile.LocalPath.Split("\")[-1]

            ### Check if the profile needs to be signed out before deleting
            if($profile.Loaded -eq $true){

                try {

                    Write-Host "Signing out account:"$ProfileToSignOut
                    $quserResult = quser $ProfileToSignOut

                    ### Ugly solution to dealing with quser, edited from source (https://devblogs.microsoft.com/scripting/automating-quser-through-powershell/)
                    $quserRegex = $quserResult | ForEach-Object -Process { $_ -replace '\s{2,}',',' }
                    $quserObject = $quserRegex | ConvertFrom-Csv
                    $userSession = $quserObject | Where-Object -FilterScript { $_.USERNAME -eq $ProfileToSignOut }

                    logoff $userSession.SESSIONNAME 
                    Write-Host "$ProfileToSignOut has been signed out"

                } catch {Write-Warning "Could not sign out accout: $ProfileToSignOut"}

            }
            
            Remove-CimInstance -InputObject $profile

        }

    }

}