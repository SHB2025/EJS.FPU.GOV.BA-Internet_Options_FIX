# Brisanje domene iz Trusted Sites
$trustedSite = "ejs.fpu.gov.ba"
$zonePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\$trustedSite"
if (Test-Path $zonePath) {
    Remove-Item -Path $zonePath -Recurse -Force
    Write-Host "✅ Domena $trustedSite uklonjena iz Trusted Sites." -ForegroundColor Green
}

# Postavljanje specifičnih ActiveX postavki za Trusted Sites (Zona 3)
$activeXSettings = @{
    "1001" = 1
    "1004" = 3
    "1200" = 0
    "1201" = 3
    "1405" = 0
}
$zoneSettingsPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"

foreach ($key in $activeXSettings.Keys) {
    if (!(Get-ItemProperty -Path $zoneSettingsPath -Name $key -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $zoneSettingsPath -Name $key -PropertyType DWord -Value $activeXSettings[$key] | Out-Null
    } else {
        Set-ItemProperty -Path $zoneSettingsPath -Name $key -Value $activeXSettings[$key]
    }
}
Write-Host "✅ ActiveX postavke za Trusted Sites uspješno ažurirane." -ForegroundColor Green
