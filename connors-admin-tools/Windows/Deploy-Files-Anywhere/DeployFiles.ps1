# 
# Author: Connor Hudson
# January 2023
# 

# Change this to the name of the folder you are deploying
$Folder = "Folder1"

# Parent directory of the current script being executed
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition 

# This is the folder you are deploying,
# make sure it is located inside of the
# parent directory of the script.
$Source = "$PSScriptRoot\$Folder"

# $Destination is the end location where the
# folder will be deployed to.
$Destination = "C:\Users\Public\Desktop\"

# Move the $Folder and contents within to the $Destination 
Copy-Item -Path $Source -Destination $Destination -Recurse -Force #-whatif

