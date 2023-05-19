# Disable Three Finger and Four Finger Gestures and Taps

$RegistryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad"

$TFSE = "ThreeFingerSlideEnabled"
$TFTE = "ThreeFingerTapEnabled"

$FFSE = "FourFingerSlideEnabled"
$FFTE = "FourFingerTapEnabled"

$ThreeFingerSlideEnabled = $RegistryPath + $TFSE
$ThreeFingerTapEnabled = $RegistryPath + $TFTE

$FourFingerSlideEnabled = $RegistryPath + $FFSE
$FourFingerTapEnabled = $RegistryPath + $FFTE

Start-Transcript -Path "C:\temp\powershell_logs\disable_touchpad_gestures_log.txt"

if (-not (Test-Path $ThreeFingerSlideEnabled)) {
    New-ItemProperty -Path $RegistryPath -Name $TFSE -Value 0
}
else {
    # Set the value of the key to 0
    Set-ItemProperty -Path $RegistryPath -Name $TFSE -Value 0
}


if (-not (Test-Path $ThreeFingerTapEnabled)) {
    New-ItemProperty -Path $RegistryPath -Name $TFTE -Value 0
}
else {
    # Set the value of the key to 0
    Set-ItemProperty -Path $RegistryPath -Name $TFTE -Value 0
}


if (-not (Test-Path $FourFingerSlideEnabled)) {
    New-ItemProperty -Path $RegistryPath -Name $FFSE -Value 0
}
else {
    # Set the value of the key to 0
    Set-ItemProperty -Path $RegistryPath -Name $FFSE -Value 0
}


if (-not (Test-Path $FourFingerTapEnabled)) {
    New-ItemProperty -Path $RegistryPath -Name $FFTE -Value 0
}
else {
    # Set the value of the key to 0
    Set-ItemProperty -Path $RegistryPath -Name $FFTE -Value 0
}

Stop-Transcript