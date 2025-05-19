# Definisanje domene
$trustedSite = "ejs.fpu.gov.ba"

# Dodavanje domene u Trusted Sites zonu (Zona 3)
$zonePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\$trustedSite"
if (!(Test-Path $zonePath)) {
    New-Item -Path $zonePath -Force | Out-Null
}
Set-ItemProperty -Path $zonePath -Name "*" -Value 2
Write-Host "✅ Domena $trustedSite dodana u Trusted Sites." -ForegroundColor Green

# Putanja do postavki za Trusted Sites zonu (Zona 2)
$zoneSettingsPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"

# Detekcija verzije OS-a
$osVersion = [System.Environment]::OSVersion.Version
$skip2500 = $osVersion.Major -ge 10  # Windows 10 i noviji

# Lista ActiveX postavki i njihovih vrijednosti za IE11
$activeXSettings = @{
    "1001" = 0   # Download signed ActiveX controls → Enable
    "1004" = 0   # Download unsigned ActiveX controls → Prompt
    "1200" = 0   # Run ActiveX controls and plug-ins → Enable
    "1201" = 0   # Initialize and script ActiveX not marked safe → Enable
    "1206" = 3   # Only allow approved domains → Disable
    "1405" = 0   # Script ActiveX marked safe → Enable
    "2200" = 0   # Allow previously unused ActiveX → Enable
    "2300" = 0   # Binary and script behaviors → Enable
    "2400" = 0   # Run ActiveX controls and plug-ins → Enable
    "2702" = 0   # Allow anti-malware scan → Enable
    "2100" = 0   # Automatic prompting for ActiveX → Enable
    "2004" = 0   # Allow Scriptlets → Enable
    "2600" = 3   # Allow domains to use ActiveX without prompt → Disable
}

# Dodaj i 2500 samo ako nije Windows 10/11
if (-not $skip2500) {
    $activeXSettings["2500"] = 3  # Video without external player → Disable
    Write-Host "🔧 Uključujem 2500 postavku za starije Windows verzije." -ForegroundColor Yellow
} else {
    Write-Host "⏭️ Preskačem 2500 (nije primjenjivo za Windows 10/11)." -ForegroundColor Gray
}

# Primjena svih ActiveX postavki
foreach ($key in $activeXSettings.Keys) {
    $value = $activeXSettings[$key]
    if (!(Get-ItemProperty -Path $zoneSettingsPath -Name $key -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $zoneSettingsPath -Name $key -PropertyType DWord -Value $value | Out-Null
    } else {
        Set-ItemProperty -Path $zoneSettingsPath -Name $key -Value $value
    }
}
Write-Host "✅ ActiveX postavke konfigurirane za Trusted Sites zonu (IE11). Ukoliko pristup nije moguć ponovite učitavanje stranice u Internet Explorer Modu" -ForegroundColor Green
