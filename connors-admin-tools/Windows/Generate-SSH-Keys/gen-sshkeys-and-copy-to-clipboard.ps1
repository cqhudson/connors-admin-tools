
$Private_Key = "$env:USERPROFILE\.ssh\id_rsa"
$Public_Key = "$env:USERPROFILE\.ssh\id_rsa.pub"

# Check to see if the public and private keys already exist so we dont overwrite them.
# If either of them are missing, generate them.
if (-not(Test-Path $Public_Key -PathType Leaf) -or -not(Test-Path $Private_Key -PathType Leaf))
{
    # echo 'y' 
    echo 'y' | ssh-keygen.exe -f $env:USERPROFILE\.ssh\id_rsa -q -N '""'
} 

# Print the contents of id_rsa.pub and copy them into the clipboard
type $env:USERPROFILE\.ssh\id_rsa.pub | Set-Clipboard
