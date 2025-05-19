
# Brisanje domene iz Trusted Sites
$trustedSite = "ejs.fpu.gov.ba"
$zonePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\$trustedSite"
if (Test-Path $zonePath) {
    Remove-Item -Path $zonePath -Recurse -Force
    Write-Host "✅ Domena $trustedSite uklonjena iz Trusted Sites." -ForegroundColor Green
}

# Postavljanje specifičnih ActiveX postavki za Trusted Sites (Zona 3)
$activeXSettings = @{
    "1001" = 1  # Download signed ActiveX controls = Enable
    "1004" = 3  # Download unsigned ActiveX controls = Prompt
    "1200" = 0  # Run ActiveX controls and plug-ins = Enable
    "1201" = 3  # Initialize and script ActiveX not marked as safe = Enable
    "1206" = 3  # Automatic prompting for ActiveX = Enable
    "1209" = 3  # Allow Scriptlets = Enable
    "120b" = 3  # Only allow approved domains = Disable
    "1405" = 0  # Script ActiveX controls marked safe = Enable
    "1601" = 0  # Submit non-encrypted form data = Enable
    "1604" = 0  # Drag/drop files = Enable
    "1803" = 0  # File download = Enable
    "1804" = 1  # Font download = Enable
    "1809" = 0  # Pop-up blocker = Enable
    "2000" = 0  # Binary and script behaviours = Enable
    "2001" = 0  # .NET signed components = Enable
    "2101" = 0  # Open files by content = Enable
    "2500" = 3  # Video without external player = Disable
    "270C" = 0  # Run anti-malware software = Enable
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
