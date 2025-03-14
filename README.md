# Game of Dorms - Password Cracking Script

## Beskrivelse
Dette script er udviklet til at brute-force en ZIP-fil ved at generere mulige passwords baseret på en given fødselsdato og karakterer fra *Game of Thrones: A Song of Ice and Fire*. Opgaven kommer fra [ECSC Game of Dorms Challenge](https://challenges.ecsc.eu/challenges/game-of-dorms).

### **Scenario**
En studerende har glemt adgangskoden til en vigtig ZIP-fil (*thesis.zip*). De kan kun huske, at adgangskoden er sammensat af deres fødselsdato **26-11-1997** og navnet på en karakter fra *Game of Thrones*.

Dette script forsøger at generere alle mulige kombinationer og tester dem mod ZIP-filen.

## **Forudsætninger**
Før du kører scriptet, skal du have følgende R-pakker installeret:
```r
install.packages(c("rvest", "stringr", "gtools", "zip"))
```

Du skal også have **unzip**-værktøjet installeret på dit system (standard på Linux/macOS, men kan kræve installation på Windows).

## **Hvordan scriptet fungerer**

### **1. Scraper karakterer fra Wikipedia**
- Scriptet henter *Game of Thrones*-karakterer fra Wikipedia.
- Karakterernes navne gemmes i en liste.

### **2. Genererer mulige adgangskoder**
- Datoen *26-11-1997* opdeles i dele: `["26", "11", "1997"]`.
- Hver karakter bruges i forskellige permutationer med fødselsdatoen.
- Alle mulige kombinationer genereres og gemmes i en liste.

### **3. Tester adgangskoder på ZIP-filen**
- Scriptet prøver alle kombinationer en efter en på ZIP-filen `thesis.zip`.
- Hvis en adgangskode virker, stopper scriptet og viser koden.

## **Brug af scriptet**

1. **Opdater ZIP-filens sti** i scriptet:
   ```r
   zip_file <- "Downloads/thesis.zip"  # Opdater stien hvis nødvendigt
   ```
2. **Kør scriptet i RStudio eller en R-terminal**.
3. **Når adgangskoden findes**, vil den blive printet i konsollen.

## **Forventet output**
Eksempel på output i terminalen:
```
Trying password: 26EddardStark1997
Trying password: 1997EddardStark26
...

Password found: 11EddardStark199726
```

## **Mulige forbedringer**
- Bruge en ZIP-cracking pakke direkte i R i stedet for at køre systemkommandoer.
- Optimere brute-force processen ved at prioritere de mest sandsynlige passwords.
- Tilføje understøttelse for andre ZIP-krypteringsformater.

---
### 🚀 **Nu kan du brute-force ZIP-filer med R og Game of Thrones!** 🏰

