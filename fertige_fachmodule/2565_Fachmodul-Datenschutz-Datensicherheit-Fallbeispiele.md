# Fachmodul: Datenschutz & Datensicherheit – Fallbeispiele

**Kurs-ID:** 2565
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Sicherheit
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2565

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Wichtige Datenschutz-Vorfälle](#2-wichtige-datenschutz-vorfälle)
3. [Analyse von Vorfällen](#3-analyse-von-vorfällen)
4. [Lessons Learned](#4-lessons-learned)
5. [Best Practices](#5-best-practices)
6. [Übungen](#6-übungen)
7. [Zusammenfassung](#7-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- reale Datenschutz-Vorfälle analysieren,
- typische Schwachstellen identifizieren,
- Best Practices ableiten.

---

## 2. Wichtige Datenschutz-Vorfälle

### 2.1 Facebook / Cambridge Analytica (2018)

- 87 Mio. Nutzerprofile ohne Einwilligung gesammelt
- Daten für Wahlkampagnen genutzt
- Bußgeld: 5 Mrd. $ (FTC)
- DSGVO: 1,2 Mrd. € Bußgeld (2023)

**Schwachstelle:** API-Datenweitergabe unzureichend geschützt

### 2.2 Marriott (2018)

- Daten von 500 Mio. Gästen kompromittiert
- Starwood-Hotels jahrelang infiltriert
- Bußgeld: 18,4 Mio. £ (ICO UK)

**Schwachstelle:** Mangelnde Netzwerksegmentierung nach Akquisition

### 2.3 Yahoo (2013-2014)

- 3 Mrd. Konten kompromittiert (alle Yahoo-Konten)
- Verzögerte Bekanntgabe um 3 Jahre
- Bußgeld: 35 Mio. $ (SEC)

**Schwachstelle:** Verzögerte Offenlegung

### 2.4 Equifax (2017)

- 147 Mio. Personen betroffen
- US-Sozialversicherungsnummern, Geburtsdaten, Führerscheinnummern
- Bußgeld: 575-700 Mio. $ Vergleich

**Schwachstelle:** Apache Struts Lücke ungepatcht

### 2.5 Volkswagen Dieselgate (2015)

- 11 Mio. Fahrzeuge mit Manipulationssoftware
- CO2-Werte verfälscht
- Bußgeld: 30 Mrd. $ (weltweit)

**Schwachstelle:** Verstoß gegen Umweltrecht durch Software

### 2.6 Sony Pictures (2014)

- 100 TB Daten gestohlen
- Filme unreleased veröffentlicht
- Schaden: 100 Mio. $

**Schwachstelle:** Phishing-Mail, schwache Passwörter

### 2.7 Capital One (2019)

- 100 Mio. Personen betroffen
- AWS-Fehlkonfiguration
- Bußgeld: 190 Mio. $

**Schwachstelle:** SSRF auf AWS

### 2.8 Log4Shell (2021)

- CVE-2021-44228 in Apache Log4j
- Millionen Anwendungen verwundbar
- Vollständige Übernahme möglich

**Schwachstelle:** Log4j erlaubt Code-Ausführung über Log-Strings

---

## 3. Analyse von Vorfällen

### 3.1 Typische Schwachstellen

| Schwachstelle | Beispiel |
|---|---|
| **Schwache Passwörter** | Marriott, Sony |
| **Fehlende Patches** | Equifax, Log4Shell |
| **Fehlkonfiguration Cloud** | Capital One |
| **Phishing** | Sony, RSA |
| **Unzureichende Segmentierung** | Marriott |
| **Verzögerte Offenlegung** | Yahoo |
| **Datenweitergabe ohne Einwilligung** | Facebook |
| **Mitarbeiter-Fehler** | viele |

### 3.2 Angriffskette (Cyber Kill Chain)

1. **Reconnaissance**: Ziele identifizieren
2. **Weaponization**: Exploits vorbereiten
3. **Delivery**: Angriff ausliefern (Email)
4. **Exploitation**: Schwachstelle ausnutzen
5. **Installation**: Schadsoftware installieren
6. **Command & Control**: Kommunikation aufbauen
7. **Actions on Objectives**: Daten exfiltrieren

---

## 4. Lessons Learned

### 4.1 Proaktive Maßnahmen

- **Patch-Management**: zeitnahe Updates
- **Multi-Faktor-Authentifizierung (MFA)**
- **Security Awareness Training**: Mitarbeiter schulen
- **Penetrationstests**: regelmäßig testen
- **Zero Trust Architecture**

### 4.2 Reactive Maßnahmen

- **Incident Response Plan**: vorbereitet sein
- **Detection & Response**: schnelle Erkennung
- **Backup & Recovery**: 3-2-1-Regel
- **Forensik**: Spuren sichern
- **Offenlegung**: 72-Stunden-Frist (DSGVO)

### 4.3 Organisatorische Maßnahmen

- **Datenschutzbeauftragter**
- **Security-Policy**
- **ISO 27001 / BSI Grundschutz**
- **Regelmäßige Audits**

---

## 5. Best Practices

### 5.1 DSGVO-Compliance

- **Datenschutz-Folgenabschätzung** (DSFA)
- **Privacy by Design**
- **Rechenschaftspflicht**: Dokumentation
- **TOMs**: technische und organisatorische Maßnahmen

### 5.2 NIS2

- **Cyber-Sicherheits-Risikomanagement**
- **Meldepflichten**: 24h Frühwarnung, 72h Meldung
- **Lieferketten-Sicherheit**

### 5.3 Sichere Entwicklung (SSDLC)

- **Security by Design**
- **Code Reviews**
- **Statische Code-Analyse** (SAST)
- **Penetrationstests**
- **Schwachstellen-Scanner**

### 5.4 Notfallkonzepte

- **BCP** (Business Continuity Plan)
- **DRP** (Disaster Recovery Plan)
- **Backup-Strategie**: 3-2-1 (3 Kopien, 2 Medien, 1 offsite)
- **Cyber-Versicherung**: Kosten bei Vorfällen

---

## 6. Übungen

### Übung 1 — Vorfall analysieren

Analysieren Sie einen aktuellen Datenschutz-Vorfall.

### Übung 2 — Schwachstellen identifizieren

Welche Schwachstellen ermöglichten bekannte Vorfälle?

### Übung 3 — Gegenmaßnahmen

Welche Maßnahmen hätten die Vorfälle verhindert?

### Übung 4 — Incident Response Plan

Erstellen Sie einen Incident Response Plan für ein KMU.

### Übung 5 — DSFA

Führen Sie eine DSFA für ein neues Verfahren durch.

### Übung 6 — Meldepflicht

Welche Fristen gelten bei einer Datenpanne?

---

## 7. Zusammenfassung

**Datenschutz-Vorfälle** zeigen wiederkehrende Muster:

**Häufigste Schwachstellen:**

- Schwache Passwörter, fehlende Patches
- Cloud-Fehlkonfiguration
- Phishing, fehlende MFA

**Best Practices:**

- Patch-Management
- MFA, Least Privilege
- Security Awareness Training
- Incident Response Plan
- 72-Stunden-Meldung an Aufsichtsbehörde

**Gesetzliche Anforderungen:**

- DSGVO (Datenverarbeitung)
- NIS2 (Cybersicherheit für KRITIS)

### Selbsttest-Checkliste

- [ ] Ich erkenne typische Schwachstellen.
- [ ] Ich leite Gegenmaßnahmen ab.
- [ ] Ich plane Incident Response.
- [ ] Ich kenne Meldepflichten.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2565 — Recherche 2026*
