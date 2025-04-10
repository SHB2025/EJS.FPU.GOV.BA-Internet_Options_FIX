# Definisanje domene
$trustedSite = "ejs.fpu.gov.ba"

# Dodavanje domene u Trusted Sites zonu (Zona 3)
$zonePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\$trustedSite"
if (!(Test-Path $zonePath)) {
    New-Item -Path $zonePath -Force | Out-Null
}
Set-ItemProperty -Path $zonePath -Name "*" -Value 2
Write-Host "✅ Domena $trustedSite dodana u Trusted Sites." -ForegroundColor Green

# Omogućavanje ActiveX kontrola za Trusted Sites (Zona 3)
$activeXKeys = @("1001", "1004", "1200", "1201", "1405")
$zoneSettingsPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"

foreach ($key in $activeXKeys) {
    if (!(Get-ItemProperty -Path $zoneSettingsPath -Name $key -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $zoneSettingsPath -Name $key -PropertyType DWord -Value 0 | Out-Null
    } else {
        Set-ItemProperty -Path $zoneSettingsPath -Name $key -Value 0
    }
}
Write-Host "✅ ActiveX kontrole omogućene za Trusted Sites." -ForegroundColor Green
