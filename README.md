# Rješenje za pristup web stranicama koje zahtijevaju izmjenu postavki "Internet Options" u Internet Exploreru

    Rješenje za pristup web stranicama koje zahtijevaju izmjenu postavki "Internet Options" u Internet Exploreru
    Za pristup određenim web stranicama, poput FPU.GOV.BA, potrebno je:
    - Dodati poddomenu u sekciju "Trusted Sites" unutar postavki "Internet Options".
    - Aktivirati ActiveX kontrole kako bi stranica ispravno funkcionirala.

# PREPORUČENO: Na Računaru pokrenuti POWERSHELL ISE, a zatim odabrati "New" i kopirati skirptu u prozor i pokrenuti klikom na zeleni gumb "Run Script (F5)"
# PRIPREMILI SMO ZA VAS SKRIPTE KOJE ĆE AUTOMATSKI DEFINISATI POTREBNE POSTAVKE ZA PRISTUP NA ejs.fpu.gov.ba ILI SAJT PO VAŠOJ ŽELJI.

Nadamo se da će vam koristiti i uspješno riješiti problem.
Ipak za pokretanje skripte obratite se tehničkom osoblju ili administratoru.

# Skripta ejs.fpu.gov.ba_TrustedSite+ActiveX.ps1:
🇧🇦 Bosanski (BS):
🎯 PowerShell skripta za brzo dodavanje ejs.fpu.gov.ba u Trusted Sites i omogućavanje ActiveX kontrola

Ova skripta je kreirana s ciljem da olakša korisnicima pristup servisima poput ejs.fpu.gov.ba, koji zahtijevaju određene sigurnosne postavke unutar Internet Options (Internet Explorer-a).

🔐 Skripta automatski:

Dodaje unesenu domenu ili poddomenu u Trusted Sites (Zona 2).

Omogućava sve ključne ActiveX kontrole potrebne za rad web-aplikacija koje koriste stare IE tehnologije.

🧩 Namijenjena je za sve korisnike koji imaju problema s pokretanjem EJS servisa koji zahtijeva konfiguraciju Internet Options postavki.

💡 Napomena / Note:

Iako je Internet Explorer zastarjela tehnologija, ova skripta može pomoći u okruženjima gdje su ovi sistemi i dalje aktivni.

🇬🇧 English (EN):
🎯 PowerShell script to quickly add ejs.fpu.gov.ba to Trusted Sites and enable ActiveX controls

This script was created to help users access government or legacy systems such as ejs.fpu.gov.ba that require specific security settings within Internet Options (Internet Explorer).

🔐 The script automatically:

Adds the entered domain or subdomain to Trusted Sites (Zone 2).

Enables all major ActiveX controls needed for systems using older IE-based technologies.

🧩 Ideal for anyone experiencing issues accessing services like EJS web application requiring fine-tuned Internet Options configuration.

💡 Note:

Although Internet Explorer is a deprecated technology, this script may help in environments where these systems are still active.

# Add-Domain-To-TrustedSite-ActiveX.ps1

# Skripta Add-Domain-To-TrustedSite-ActiveX.ps1:
🇧🇦 Bosanski (BS):
🎯 PowerShell skripta za brzo dodavanje domena u Trusted Sites i omogućavanje ActiveX kontrola

Ova skripta je kreirana s ciljem da olakša korisnicima pristup servisima poput ejs.fpu.gov.ba, koji zahtijevaju određene sigurnosne postavke unutar Internet Options (Internet Explorer-a).

🔐 Skripta automatski:

Dodaje unesenu domenu ili poddomenu u Trusted Sites (Zona 2).

Omogućava sve ključne ActiveX kontrole potrebne za rad web-aplikacija koje koriste stare IE tehnologije.

Vodi korisnika kroz svaki korak, uz jasne upute na bosanskom i engleskom jeziku.

🧩 Namijenjena je za sve korisnike koji imaju problema s pokretanjem EJS servisa, kao i sličnih web-platformi koje zahtijevaju konfiguraciju Internet Options postavki.

💡 Napomena / Note:

Iako je Internet Explorer zastarjela tehnologija, ova skripta može pomoći u okruženjima gdje su ovi sistemi i dalje aktivni.

🇬🇧 English (EN):
🎯 PowerShell script to quickly add domains to Trusted Sites and enable ActiveX controls

This script was created to help users access government or legacy systems such as ejs.fpu.gov.ba that require specific security settings within Internet Options (Internet Explorer).

🔐 The script automatically:

Adds the entered domain or subdomain to Trusted Sites (Zone 2).

Enables all major ActiveX controls needed for systems using older IE-based technologies.

Guides users step-by-step with clear instructions in both Bosnian and English.

🧩 Ideal for anyone experiencing issues accessing services like EJS, or any web application requiring fine-tuned Internet Options configuration.

💡 Note:

Although Internet Explorer is a deprecated technology, this script may help in environments where these systems are still active.
