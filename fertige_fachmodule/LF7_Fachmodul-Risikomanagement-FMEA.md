# FM: Risikomanagement – FMEA

**Kurs-ID:** 3568
**Kategorie:** Kursbibliothek / Fachmodule / ITSM
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3568

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist FMEA?](#2-was-ist-fmea)
3. [Geschichte](#3-geschichte)
4. [Risikoprioritätszahl (RPZ)](#4-risikoprioritätszahl-rpz)
5. [FMEA-Arten](#5-fmea-arten)
6. [FMEA-Schritte](#6-fmea-schritte)
7. [Beispiel](#7-beispiel)
8. [Risikomanagement im Projekt](#8-risikomanagement-im-projekt)
9. [Werkzeuge](#9-werkzeuge)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- FMEA verstehen und anwenden,
- die Risikoprioritätszahl berechnen,
- FMEA für IT-Systeme durchführen,
- Risiken systematisch bewerten.

---

## 2. Was ist FMEA?

**FMEA (Failure Mode and Effects Analysis)** ist eine **systematische Methode** zur Identifikation und Bewertung potenzieller Fehler in Produkten, Prozessen oder Systemen.

**Ziele:**

- Fehlermodi frühzeitig erkennen
- Risiken bewerten und priorisieren
- Gegenmaßnahmen einleiten
- Qualität und Zuverlässigkeit verbessern

---

## 3. Geschichte

- **1940er**: Entwicklung in der US-Luftfahrt (Navy)
- **1960er**: NASA (Apollo-Programm)
- **1970er**: Automobilindustrie (Ford)
- **1990er**: Erweiterung auf Software, IT und Healthcare
- **Heute**: Standard in vielen Industrien

---

## 4. Risikoprioritätszahl (RPZ)

### 4.1 Berechnung

**RPZ = S × A × E**

| Faktor | Bedeutung | Werte 1–10 |
|---|---|---|
| **S** (Severity) | Schwere der Auswirkung | 1 = harmlos, 10 = katastrophal |
| **A** (Auftrittswahrscheinlichkeit, **A**bsence) | Wahrscheinlichkeit des Auftretens | 1 = unwahrscheinlich, 10 = sehr häufig |
| **E** (Entdeckungswahrscheinlichkeit) | Wahrscheinlichkeit, dass der Fehler **nicht** entdeckt wird | 1 = fast sicher entdeckt, 10 = fast nie entdeckt |

### 4.2 Bewertung der RPZ

| RPZ | Bewertung | Handlungsbedarf |
|---|---|---|
| 1–50 | niedrig | beobachten |
| 51–100 | mittel | Gegenmaßnahmen prüfen |
| 101–500 | hoch | Gegenmaßnahmen erforderlich |
| > 500 | sehr hoch | sofort handeln |

### 4.3 Beispiel

Fehlermodus: Datenbank-Backup schlägt fehl
- **S = 8** (Datenverlust ist katastrophal)
- **A = 5** (gelegentlich)
- **E = 3** (wird durch Monitoring entdeckt)
- **RPZ = 8 × 5 × 3 = 120** → Handlungsbedarf

---

## 5. FMEA-Arten

### 5.1 DFMEA (Design FMEA)

- **Design-FMEA**: Fehlermodi im Design
- Früh in der Produktentwicklung
- Vermeidung durch Design-Änderungen

### 5.2 PFMEA (Process FMEA)

- **Prozess-FMEA**: Fehlermodi in Produktions-/Geschäftsprozessen
- Beispiel: Onboarding, Deployment-Prozess

### 5.3 SFMEA (Software FMEA)

- **Software-FMEA**: Fehlermodi in Software
- Beispiele: Bugs, Performance-Issues, Sicherheitslücken

### 5.4 System-FMEA

- Betrachtet das Gesamtsystem
- Wechselwirkungen zwischen Komponenten

---

## 6. FMEA-Schritte

### 6.1 Schritt 1 – System definieren

- Was wird analysiert?
- Systemgrenzen festlegen
- Annahmen treffen

### 6.2 Schritt 2 – Funktionen identifizieren

- Welche Funktionen hat das System?
- Pro Funktion: gewünschte Eigenschaften

### 6.3 Schritt 3 – Fehlermodi identifizieren

- Wie kann jede Funktion fehlschlagen?
- Beispiel: "Backup schlägt fehl", "Login dauert zu lange"

### 6.4 Schritt 4 – Auswirkungen bewerten

- Was passiert, wenn der Fehler auftritt?
- Severity bewerten (1–10)

### 6.5 Schritt 5 – Ursachen identifizieren

- Warum tritt der Fehler auf?
- Ursache-Risiko bewerten

### 6.6 Schritt 6 – Entdeckungswahrscheinlichkeit

- Wird der Fehler rechtzeitig bemerkt?
- Wahrscheinlichkeit bewerten

### 6.7 Schritt 7 – RPZ berechnen

- RPZ = S × A × E
- Prioritäten setzen

### 6.8 Schritt 8 – Gegenmaßnahmen

- Was kann getan werden?
- Reduzierung von S, A oder E
- Verantwortliche und Termine festlegen

### 6.9 Schritt 9 – Dokumentation und Re-FMEA

- FMEA-Bericht erstellen
- Wirksamkeit der Maßnahmen überprüfen
- Regelmäßig wiederholen

---

## 7. Beispiel

### 7.1 IT-System: Web-Shop

| Fehlermodus | Auswirkung | S | A | E | RPZ | Gegenmaßnahme |
|---|---|---|---|---|---|---|
| Bezahl-System ausgefallen | Kunden können nicht zahlen | 9 | 4 | 3 | 108 | Backup-Bezahlsystem |
| Datenbank-Verbindung langsam | Ladezeiten > 5 s | 6 | 6 | 4 | 144 | Monitoring, Indizes |
| Login funktioniert nicht | Kunden können nicht bestellen | 9 | 3 | 2 | 54 | Retry-Logik |
| Bilder laden nicht | UX schlecht | 3 | 8 | 6 | 144 | CDN, lazy loading |
| Sicherheitslücke | Datenklau | 10 | 5 | 5 | 250 | Sicherheits-Audit |

### 7.2 FMEA-Tabelle

| Item | Funktion | Fehlermodus | Auswirkung | S | A | E | RPZ | Gegenmaßnahme |
|---|---|---|---|---|---|---|---|---|
| 1 | Backup | Backup schlägt fehl | Datenverlust | 8 | 5 | 3 | 120 | Backup-Monitoring |
| 2 | Login | Login fehlerhaft | Benutzerfrust | 7 | 3 | 2 | 42 | Retry-Logik |
| 3 | ... | ... | ... | ... | ... | ... | ... | ... |

---

## 8. Risikomanagement im Projekt

### 8.1 Risikomanagement-Prozess

1. **Risiken identifizieren**
2. **Risiken bewerten** (Wahrscheinlichkeit × Auswirkung)
3. **Risiken priorisieren**
4. **Gegenmaßnahmen planen und umsetzen**
5. **Risiken überwachen**

### 8.2 Risikoregister

| ID | Risiko | Wahrsch. | Auswirkung | Reaktion |
|---|---|---|---|---|
| R1 | Schlüsselentwickler krank | mittel | hoch | Cross-Training |
| R2 | Technologie veraltet | niedrig | hoch | Monitoring |
| R3 | Sicherheitsvorfall | niedrig | sehr hoch | Incident-Plan |

### 8.3 ISO 31000

Internationaler Standard für Risikomanagement:

- Risiko-Identifikation
- Risiko-Analyse
- Risiko-Bewertung
- Risiko-Behandlung
- Risiko-Überwachung

---

## 9. Werkzeuge

### 9.1 FMEA-Tools

- **Excel, LibreOffice Calc**: einfache Tabellen
- **IQ-FMEA, APIS IQ-RM**: professionell
- **FMEA-Online-Tools**: browser-basiert
- **Visio, draw.io**: Visualisierung

### 9.2 Risikomanagement

- **Risikomanagement-Tools**: ServiceNow GRC, SAP GRC
- **Excel-Vorlagen**: ISO 31000 kompatibel
- **Risikoregister in Jira, Confluence**

---

## 10. Übungen

### Übung 1 — RPZ berechnen

Fehlermodus: Festplatte fällt aus. S=9, A=3, E=2. RPZ?

### Übung 2 — FMEA durchführen

Erstellen Sie eine FMEA für einen E-Mail-Service.

### Übung 3 — Gegenmaßnahmen

Welche Gegenmaßnahmen reduzieren die RPZ eines typischen IT-Fehlers?

### Übung 4 — Risikoregister

Erstellen Sie ein Risikoregister für ein IT-Projekt.

### Übung 5 — FMEA-Typen

Wann nutzen Sie DFMEA, PFMEA, SFMEA?

---

## 11. Zusammenfassung

**FMEA (Failure Mode and Effects Analysis)** ist eine systematische Methode zur Fehleridentifikation:

**RPZ = S × A × E**

- **S** (Severity): Schwere der Auswirkung
- **A** (Auftrittswahrscheinlichkeit)
- **E** (Entdeckungswahrscheinlichkeit)

**FMEA-Arten:**

| Typ | Einsatz |
|---|---|
| DFMEA | Design |
| PFMEA | Prozesse |
| SFMEA | Software |
| System-FMEA | Gesamtsystem |

**9 Schritte:**

1. System definieren
2. Funktionen identifizieren
3. Fehlermodi identifizieren
4. Auswirkungen bewerten
5. Ursachen identifizieren
6. Entdeckungswahrscheinlichkeit
7. RPZ berechnen
8. Gegenmaßnahmen
9. Dokumentation

**Werkzeuge:** Excel, IQ-FMEA, APIS, Risikomanagement-Tools

### Selbsttest-Checkliste

- [ ] Ich erkläre FMEA und RPZ.
- [ ] Ich führe eine FMEA durch.
- [ ] Ich entwickle Gegenmaßnahmen.
- [ ] Ich nutze Risikomanagement im Projekt.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3568 — Recherche 2026*
