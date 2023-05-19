# Disable three and four finger touchpad gestures

Start-Transcript -Path "C:\temp\powershell_logs\disable_touchpad_gestures_log.txt"

# Check if registry key exists
try {
    if (-not (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad")) {
        Write-Host "Could not find regkey HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad"
        Write-Host "Creating regkey..."
        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Force

        Write-Host "Attempting to disable ThreeFingerSlide"
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Name "ThreeFingerSlideEnabled" -Value 0 -PropertyType DWORD -Force

        Write-Host "Attempting to disable ThreeFingerTap"
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Name "ThreeFingerTapEnabled" -Value 0 -PropertyType DWORD -Force

        Write-Host "Attempting to disable FourFingerSlide"
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Name "FourFingerSlideEnabled" -Value 0 -PropertyType DWORD -Force

        Write-Host "Attempting to disable FourFingerTap"
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Name "FourFingerTapEnabled" -Value 0 -PropertyType DWORD -Force
    }
    else {
        Write-Host "Found existing regkey at HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad"
        Write-Host "Attempting to disable touchpad using regkey..."

        Write-Host "Attempting to disable ThreeFingerSlide"
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Name "ThreeFingerSlideEnabled" -Value 0 -PropertyType DWORD -Force

        Write-Host "Attempting to disable ThreeFingerTap"
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Name "ThreeFingerTapEnabled" -Value 0 -PropertyType DWORD -Force

        Write-Host "Attempting to disable FourFingerSlide"
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Name "FourFingerSlideEnabled" -Value 0 -PropertyType DWORD -Force

        Write-Host "Attempting to disable FourFingerTap"
        New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" -Name "FourFingerTapEnabled" -Value 0 -PropertyType DWORD -Force
    }
}
catch {
    Write-Error $_.Exception.Message
}

Stop-Transcript