if (-not(Test-Path "$env:USERPROFILE\.ssh\id_rsa.pub" -PathType Leaf) -or -not(Test-Path "$env:USERPROFILE\.ssh\id_rsa" -PathType Leaf)){echo 'y' | ssh-keygen.exe -f $env:USERPROFILE\.ssh\id_rsa -q -N '""'} type $env:USERPROFILE\.ssh\id_rsa.pub | Set-Clipboard

