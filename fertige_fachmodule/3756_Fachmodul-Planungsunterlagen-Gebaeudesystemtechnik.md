# Fachmodul: Planungsunterlagen Gebäudesystemtechnik

**Kurs-ID:** 3756
**Kategorie:** Kursbibliothek / Fachmodule / Elektrotechnik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3756

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Gebäudesystemtechnik – Überblick](#2-gebaeudesystemtechnik--überblick)
3. [Gewerke](#3-gewerke)
4. **Standards und Bussysteme**
5. [Planungsunterlagen erstellen](#5-planungsunterlagen-erstellen)
6. [Symbole und Schaltzeichen](#6-symbole-und-schaltzeichen)
7. [Lastenheft und Pflichtenheft](#7-lastenheft-und-pflichtenheft)
8. [Tools und Software](#8-tools-und-software)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Gebäudesystemtechnik (GST) erläutern,
- Gewerke und Bussysteme benennen,
- Planungsunterlagen erstellen,
- Symbole interpretieren.

---

## 2. Gebäudesystemtechnik – Überblick

**Gebäudesystemtechnik (GST)** integriert alle **technischen Anlagen** eines Gebäudes:

- Elektroinstallation
- Heizung, Lüftung, Klima (HLK)
- Sanitär
- Sicherheit
- Beleuchtung
- Kommunikation

**Ziel:** Komfort, Energieeffizienz, Sicherheit, Wirtschaftlichkeit

---

## 3. Gewerke

### 3.1 Heizung, Lüftung, Sanitär (HLS / SHK)

- Heizungskessel, Wärmepumpen, Solar
- Klimaanlage, Lüftung
- Sanitärinstallation

### 3.2 Elektro

- Stromverteilung
- Beleuchtung
- Notstrom
- Kommunikationsanlagen

### 3.3 Sicherheitstechnik

- Brandmeldeanlagen (BMA)
- Einbruchmeldeanlagen (EMA)
- Zutrittskontrolle
- Videoüberwachung

### 3.4 Aufzüge und Förderanlagen

### 3.5 Gebäudeautomation (GA)

- Zentrales Steuern und Überwachen
- Optimierung des Energieverbrauchs

---

## 4. Standards und Bussysteme

### 4.1 KNX (früher EIB)

- **Standard für Haus- und Gebäudesystemtechnik**
- ISO/IEC 14543
- Seit 1990
- Medien: TP (Twisted Pair), PL (Powerline), RF (Funk), IP

### 4.2 BACnet

- **Building Automation and Control Networks**
- ISO 16484
- Für HVAC, Beleuchtung, Sicherheit
- Über Ethernet (BACnet/IP)

### 4.3 LON (Local Operating Network)

- LonWorks
- Heute seltener
- Vor allem in Bestandsgebäuden

### 4.4 DALI

- **Digital Addressable Lighting Interface**
- IEC 62386
- Beleuchtungssteuerung

### 4.5 Weitere

- **ZigBee**: Smart-Home-Bereich
- **Z-Wave**: Smart-Home
- **Modbus**: Industriestandard
- **BACnet/IP, LonWorks, Niagara (Honeywell)**: Gewerke

### 4.6 Auswahl

| Anforderung | Empfehlung |
|---|---|
| Smarthome | KNX, ZigBee, Z-Wave, proprietär |
| Industrie-Gebäudeautomation | BACnet, Modbus |
| Beleuchtung | DALI |
| Große, gewerbliche Gebäude | BACnet, KNX |

---

## 5. Planungsunterlagen erstellen

### 5.1 Phasen der Planung

1. **Grundlagenermittlung**: Bestandsaufnahme, Bedarfsanalyse
2. **Vorplanung**: Konzeptvarianten
3. **Entwurfsplanung**: Systemauswahl, Schemata
4. **Genehmigungsplanung**: baurechtliche Genehmigungen
5. **Ausführungsplanung**: Detailpläne
6. **Vorbereitung Vergabe**: Leistungsverzeichnis
7. **Mitwirkung Vergabe**: Angebotsauswertung
8. **Objektüberwachung**: Bauüberwachung
9. **Objektbetreuung**: Inbetriebnahme, Wartung

### 5.2 Planungsinhalte

- Schemata (z. B. Stromlaufplan, R&I-Schemata)
- Grundrisse mit Komponenten
- Stücklisten
- Leistungsverzeichnis
- Kostenberechnung

---

## 6. Symbole und Schaltzeichen

### 6.1 Elektrotechnik

- DIN EN 60617
- Symbole für Schalter, Steckdosen, Lampen, Verteiler

### 6.2 Heizung/Sanitär

- DIN ISO 14617
- Symbole für Heizkessel, Pumpen, Ventile

### 6.3 Lüftung/Klima

- Symbole für Lüftungskanäle, Ventilatoren, Filter

### 6.4 Beispiele GST

| Symbol | Bedeutung |
|---|---|
| 🛢 | Pumpe |
| ⊙ | Ventil |
| 🌀 | Ventilator |
| 🔥 | Heizkessel |

---

## 7. Lastenheft und Pflichtenheft

### 7.1 Lastenheft

- Beschreibung der **Anforderungen** aus Sicht des Auftraggebers
- Was, aber nicht wie
- Funktionen, Eigenschaften, Schnittstellen

### 7.2 Pflichtenheft

- Beschreibung der **Umsetzung** durch den Auftragnehmer
- Wie, mit welchen Mitteln
- Konkrete Technologien, Geräte, Schnittstellen

### 7.3 Beispiel GST-Pflichtenheft

```
Anforderung: Lichtsteuerung
Umsetzung: KNX-Bussystem mit DALI-Gateway
- 100 Leuchten in 20 Räumen
- Bewegungsmelder und Helligkeitssensoren
- Tageslichtabhängige Steuerung
- Szenensteuerung (Meeting, Präsentation)
- KNX/IP-Router für Visualisierung
```

---

## 8. Tools und Software

### 8.1 Planungssoftware

- **DDS-CAD**: führend in DE für TGA
- **Trimble Nova** (ehem. Plancal nova)
- **AutoCAD MEP**
- **Revit MEP**: BIM-basiert
- **Solarcomputer**

### 8.2 Funktionen

- Grundrisse mit Komponenten
- Schemata zeichnen
- Stücklisten
- Kostenberechnung (nach DIN 276)
- Ausschreibungstexte

### 8.3 BIM (Building Information Modeling)

- 3D-Modell des Gebäudes
- Verknüpfung mit allen Gewerken
- Kollisionsprüfung
- BIM wird Pflicht bei öffentlichen Bauprojekten

---

## 9. Übungen

### Übung 1 — GST definieren

Welche Gewerke gehören zur GST?

### Übung 2 — Standards

Welcher Standard eignet sich für welches Gebäude?

### Übung 3 — Pflichtenheft

Erstellen Sie ein Lastenheft für ein Bürogebäude.

### Übung 4 — Symbole

Erkennen Sie gängige GST-Symbole.

### Übung 5 — Planungstool

Welche Planungstools kennen Sie?

### Übung 6 — BIM

Was ist BIM und welche Vorteile bietet es?

---

## 10. Zusammenfassung

**Gebäudesystemtechnik** integriert alle technischen Anlagen:

**Gewerke:**

- Elektroinstallation
- HLK (Heizung, Lüftung, Klima)
- Sanitär
- Sicherheitstechnik
- Gebäudeautomation

**Standards und Bussysteme:**

- **KNX**: Haus- und Gebäudesystemtechnik
- **BACnet**: Gebäudeautomation
- **DALI**: Beleuchtung
- **Modbus**: Industrie

**Planungsphasen:** 9 Phasen nach HOAI

**Tools:** DDS-CAD, Trimble Nova, AutoCAD MEP, Revit MEP

**Trends:** BIM (Building Information Modeling)

### Selbsttest-Checkliste

- [ ] Ich erkläre GST und Gewerke.
- [ ] Ich wähle passende Standards.
- [ ] Ich erstelle Pflichtenhefte.
- [ ] Ich kenne Planungstools.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3756 — Recherche 2026*
