# --------------------------------------------
# 🛠 KAKO KORISTITI / HOW TO USE:
# --------------------------------------------
# 1️⃣  Kada se zatraži, unesite samo naziv domene ili poddomene.
#     🔸 PRIMJER: ejs.fpu.gov.ba
#     ⚠️  NE unosite http:// ili https:// !
#
# 1️⃣  When prompted, enter only the domain or subdomain name.
#     🔸 EXAMPLE: ejs.fpu.gov.ba
#     ⚠️  DO NOT include http:// or https:// !
#
# 2️⃣  Skripta dodaje domenu u Trusted Sites (Zona 2)
#     This script adds the domain to Trusted Sites (Zone 2)
#
# 3️⃣  Omogućava sve glavne ActiveX kontrole za tu zonu
#     Enables all major ActiveX controls for that zone
#
# 4️⃣  Zatvorite i ponovo pokrenite Internet Explorer ako je bio otvoren
#     Close and reopen Internet Explorer if it was open
# --------------------------------------------

Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "🛠 KAKO KORISTITI / HOW TO USE:" -ForegroundColor Yellow
Write-Host "1️⃣  Unesite naziv domene (npr. ejs.fpu.gov.ba)" -ForegroundColor White
Write-Host "2️⃣  ⚠️  Ne unosite http:// ili https:// !" -ForegroundColor Red
Write-Host "3️⃣  Skripta dodaje domenu u Trusted Sites i omogućava ActiveX" -ForegroundColor White
Write-Host "4️⃣  Zatvorite i ponovo pokrenite Internet Explorer" -ForegroundColor White
Write-Host "----------------------------------------`n" -ForegroundColor Cyan

# 🔹 Traženje unosa domene od korisnika / Prompt user for domain input
$trustedSite = Read-Host "🔹 Unesite NAZIV DOMENE (bez http/https), npr. ejs.fpu.gov.ba / Enter DOMAIN NAME (without http/https)"

# ⚠️ Validacija unosa / Input validation
if ([string]::IsNullOrWhiteSpace($trustedSite)) {
    Write-Host "`n⚠️  Niste unijeli domenu. Izlazim iz skripte. / No domain entered. Exiting script." -ForegroundColor Yellow
    exit
}

if ($trustedSite -match "^https?://") {
    Write-Host "`n❌ Ne unosite http:// ili https://. Samo naziv domene! / Do not enter http:// or https://. Only domain name!" -ForegroundColor Red
    exit
}

# ➕ Dodavanje domene u Trusted Sites zonu (zona 2) / Add domain to Trusted Sites (zone 2)
$zonePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\$trustedSite"
if (!(Test-Path $zonePath)) {
    New-Item -Path $zonePath -Force | Out-Null
}
Set-ItemProperty -Path $zonePath -Name "*" -Value 2
Write-Host "`n✅ Domena $trustedSite dodana u Trusted Sites. / Domain $trustedSite added to Trusted Sites." -ForegroundColor Green

# 🔓 Omogućavanje ActiveX postavki za zonu 2 / Enable ActiveX settings for Zone 2
$activeXKeys = @("1001", "1004", "1200", "1201", "1405")
$zoneSettingsPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"

foreach ($key in $activeXKeys) {
    if (!(Get-ItemProperty -Path $zoneSettingsPath -Name $key -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $zoneSettingsPath -Name $key -PropertyType DWord -Value 0 | Out-Null
    } else {
        Set-ItemProperty -Path $zoneSettingsPath -Name $key -Value 0
    }
}
Write-Host "✅ ActiveX kontrole omogućene za Trusted Sites. / ActiveX controls enabled for Trusted Sites." -ForegroundColor Green

# ℹ️ Završna poruka / Final message
Write-Host "`nℹ️ Ako je Internet Explorer bio otvoren, zatvorite ga i pokrenite ponovo. / If Internet Explorer was open, close and reopen it." -ForegroundColor Cyan
