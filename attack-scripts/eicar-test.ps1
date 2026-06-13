# EICAR Malware Test File Creation
# Run on Windows 10 VM

Write-Host "[*] Creating EICAR test file" -ForegroundColor Yellow

$eicar = "X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*"
$filePath = "C:\Users\Public\eicar.com"

$eicar | Out-File -FilePath $filePath -Encoding ascii

if (Test-Path $filePath) {
    Write-Host "[+] EICAR test file created at: $filePath" -ForegroundColor Green
    Write-Host "[*] Wazuh should generate alert within 60 seconds" -ForegroundColor Cyan
    Write-Host "[*] Check dashboard for rule 554 (file added) and rule 87105 (malicious detection)" -ForegroundColor Cyan
} else {
    Write-Host "[-] Failed to create EICAR test file" -ForegroundColor Red
}

# Cleanup option
$cleanup = Read-Host "Delete test file? (y/n)"
if ($cleanup -eq 'y') {
    Remove-Item -Path $filePath -Force
    Write-Host "[*] Test file removed" -ForegroundColor Yellow
}
