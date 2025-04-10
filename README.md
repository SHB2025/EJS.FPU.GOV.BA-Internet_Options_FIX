# Rješenje za pristup web stranicama koje zahtijevaju izmjenu postavki "Internet Options" u Internet Exploreru

    Rješenje za pristup web stranicama koje zahtijevaju izmjenu postavki "Internet Options" u Internet Exploreru
    Za pristup određenim web stranicama, poput FPU.GOV.BA, potrebno je:
    - Dodati poddomenu u sekciju "Trusted Sites" unutar postavki "Internet Options".
    - Aktivirati ActiveX kontrole kako bi stranica ispravno funkcionirala.

# PREPORUČENO: Na Računaru pokrenuti POWERSHELL ISE, a zatim odabrati "New" i kopirati skirptu u prozor i pokrenuti klikom na zeleni gumb "Run Script (F5)"

# PRIPREMILI SMO ZA VAS SKRIPTE KOJE ĆE AUTOMATSKI DEFINISATI POTREBNE POSTAVKE ZA PRISTUP NA ejs.fpu.gov.ba ILI SAJT PO VAŠOJ ŽELJI.

Nadamo se da će vam koristiti i uspješno riješiti problem.
Ipak za pokretanje skripte obratite se tehničkom osoblju ili administratoru.

### **Opis skripte 1: ejs.fpu.gov.ba-Internet_Options-FIX.ps1**  
Ova PowerShell skripta je dizajnirana za dodavanje domene *ejs.fpu.gov.ba* u Trusted Sites zonu Internet postavki Microsoft Windowsa. Osim toga, omogućuje ključne ActiveX kontrole za ovu zonu kako bi se osigurala kompatibilnost prilikom korištenja funkcionalnosti ove domene.

#### **Glavni koraci skripte 1:**
1. **Definisanje ciljne domene:**  
   Skripta definira domenu *ejs.fpu.gov.ba* kao ciljnu domenu koju treba dodati u Trusted Sites zonu.

2. **Kreiranje puta u registru za Trusted Sites:**  
   Provjerava postoji li put u registru za ovu domenu unutar Trusted Sites zone (Zona 3). Ako ne postoji, automatski ga kreira.

3. **Dodavanje domene u Trusted Sites zonu:**  
   Dodaje odgovarajuću vrijednost u registar kako bi se domena prepoznala kao dio Trusted Sites zone.  

4. **Omogućavanje ActiveX kontrola za Trusted Sites:**  
   Skripta prilagođava specifične ActiveX postavke (npr. učitavanje kontrola i izvršavanje skripti) za Trusted Sites zonu kako bi omogućila funkcionalnost potrebnu za rad s domenom.

5. **Davanje povratnih informacija korisniku:**  
   Skripta ispisuje poruke koje jasno ukazuju na uspješnost dodavanja domene i omogućavanja ActiveX kontrola.

---

### **Opis skripte 2: ejs.fpu.gov.ba-Internet_Options-ResetToDefault.ps1**  
Ova PowerShell skripta omogućuje vraćanje postavki na tvorničke vrijednosti, uz uklanjanje domene *ejs.fpu.gov.ba* iz Trusted Sites zone. Korisna je za resetiranje sigurnosnih postavki u slučajevima kada više nije potrebno posebno prilagođavanje za ovu domenu.

#### **Glavni koraci skripte 2:**
1. **Definisanje ciljne domene:**  
   Skripta identifikuje domenu *ejs.fpu.gov.ba* kao onu koja treba biti uklonjena iz Trusted Sites zone.

2. **Provjera i brisanje domene iz Trusted Sites:**  
   Provjerava postoji li put u registru koji odgovara domeni *ejs.fpu.gov.ba*. Ako postoji, uklanja ga zajedno sa svim njegovim postavkama.

3. **Resetiranje specifičnih ActiveX postavki:**  
   Vraća ključne ActiveX postavke za Trusted Sites zonu na njihove podrazumijevane vrijednosti (npr. onemogućavanje određenih kontrola ili postavljanje postavki na "Prompt").

4. **Davanje povratnih informacija korisniku:**  
   Skripta ispisuje poruke koje obavještavaju korisnika o uspješnom uklanjanju domene i resetiranju postavki.

---

Ovi opisi jasno objašnjavaju svrhu i svaki korak izvršenja skripti na način razumljiv korisnicima. Ako trebaš dodatne izmjene ili detalje, rado ću pomoći! 😊
