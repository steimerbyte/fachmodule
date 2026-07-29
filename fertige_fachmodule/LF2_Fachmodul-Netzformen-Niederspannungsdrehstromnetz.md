# Fachmodul: Netzformen im Niederspannungs-Drehstromnetz

**Kurs-ID:** 3655
**Kategorie:** Kursbibliothek / Fachmodule / Elektroinstallation
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3655

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Drehstrom (Dreiphasenwechselstrom)](#2-drehstrom-dreiphasenwechselstrom)
3. [Stern- und Dreieckschaltung](#3-stern-und-dreieckschaltung)
4. [Spannungsebenen](#4-spannungsebenen)
5. [Hausanschluss](#5-hausanschluss)
6. [Zähler](#6-zähler)
7. [Verteilung im Gebäude](#7-verteilung-im-gebäude)
8. [Sternpunktbehandlung](#8-sternpunktbehandlung)
9. [Normen und Vorschriften](#9-normen-und-vorschriften)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Drehstrom und seine Eigenschaften erklären,
- Stern- und Dreieckschaltung unterscheiden,
- Spannungsebenen im Niederspannungsnetz benennen,
- den Hausanschluss und die Verteilung beschreiben.

---

## 2. Drehstrom (Dreiphasenwechselstrom)

### 2.1 Definition

**Drehstrom** (Dreiphasenwechselstrom) besteht aus **drei Wechselströmen**, die um **120° versetzt** sind.

### 2.2 Formel

```
u₁(t) = Û · sin(ω·t)
u₂(t) = Û · sin(ω·t - 120°)
u₃(t) = Û · sin(ω·t + 120°)
```

### 2.3 Eigenschaften

- **Effizient** (weniger Material)
- **Konstante Leistung** im Dreiphasensystem
- **Drehfeld** in Motoren (Asynchronmotor)
- **Höhere Leistung** übertragbar

### 2.4 Frequenz

- 50 Hz in Europa
- 60 Hz in USA

---

## 3. Stern- und Dreieckschaltung

### 3.1 Sternschaltung (Y)

- Alle drei Phasen an einem Punkt verbunden (**Sternpunkt**)
- Sternpunkt oft mit Neutralleiter (N) verbunden
- Spannungen:
  - **Leiterspannung** U_L = 400 V (zwischen Phasen)
  - **Sternspannung** U_Phase = 230 V (zwischen Phase und Neutralleiter)
- Verhältnis: U_L = √3 × U_Phase ≈ 400 V

### 3.2 Dreieckschaltung (Δ)

- Phasen in einem Dreieck verschaltet
- Nur Leiterspannung (400 V), kein Neutralleiter
- Spannung U_Phase = U_L = 400 V

### 3.3 Vergleich

| Aspekt | Stern | Dreieck |
|---|---|---|
| Leiterspannung U_L | 400 V | 400 V |
| Phasenspannung U_Phase | 230 V | 400 V |
| Neutralleiter | ja | nein |
| Leistung pro Phase | niedrig | hoch |
| Anwendung | Niederspannungsnetz | Motoren, Hochlast |

---

## 4. Spannungsebenen

### 4.1 Europäisches Verbundnetz

| Ebene | Spannung |
|---|---|
| **Höchstspannung (HöS)** | 220/380 kV, 380/400 kV |
| **Hochspannung (HS)** | 110 kV |
| **Mittelspannung (MS)** | 10 kV, 20 kV |
| **Niederspannung (NS)** | 230/400 V |

### 4.2 Niederspannungsnetz

- Drehstrom 400 V (zwischen Phasen)
- Sternspannung 230 V (Phase gegen Neutralleiter)
- 50 Hz
- TN-C-S Standard in Deutschland

---

## 5. Hausanschluss

### 5.1 Komponenten

- **Hausanschlusskasten** (HAK): Übergang vom Netz zur Anlage
- **Hauptleitung** vom HAK zur Hauptverteilung
- **Hauptsicherungen**: Übergangspunkte zum Verteilnetz

### 5.2 Anschlussarten

| Anschluss | Größe |
|---|---|
| **Kleinanschluss** | bis 30 kW (Standard-Wohnhaus) |
| **Standardanschluss** | bis 100 kW |
| **Großanschluss** | > 100 kW (Gewerbe, Industrie) |

### 5.3 Hausanschlussraum

- Platz für HAK, Zähler, Hauptverteilung
- Belüftung, Beleuchtung
- Abschließbar
- Nicht als Lagerraum nutzen

---

## 6. Zähler

### 6.1 Funktion

- **Energiezähler** messen den Energieverbrauch
- Heute: **moderne Messeinrichtungen** und **intelligente Messsysteme** (Smart Meter)
- Abrechnung mit Netzbetreiber

### 6.2 Zählertypen

- **Ferraris-Zähler**: alte elektromechanische Zähler
- **Elektronischer Zähler**: heute Standard
- **Smart Meter**: mit Kommunikationsschnittstelle

### 6.3 Zählerplatz

- Im Hausanschlussraum oder Zählerschrank
- Nach **TAB** (Technische Anschlussbedingungen)
- Zugänglich für Netzbetreiber

---

## 7. Verteilung im Gebäude

### 7.1 Hauptverteilung

- **Zählerschrank** mit Hauptsicherungen
- **Hauptverteilerschrank** mit Schutzgeräten
- Optional: Überspannungsschutz Typ 1

### 7.2 Unterverteilungen

- Pro Stockwerk oder Gebäudeteil
- Schutzgeräte (LS, FI)
- Reihenklemmen für Abgangsklemmen

### 7.3 Stromkreise

- Trennung nach Bereichen (Licht, Steckdosen, Herd)
- Pro Raum eigener Stromkreis empfohlen
- FI-Schutz für Steckdosen ≤ 20 A

---

## 8. Sternpunktbehandlung

### 8.1 TN-C-S-System

In Deutschland **Standard**:
- **T**: Direkte Erdung eines Sternpunkts im Netz
- **N**: Neutralleiter
- **C**: Kombinierter PEN-Leiter im Netz
- **S**: Getrennter PE und N in der Anlage

### 8.2 PEN-Leiter

- **PEN** = PE + N kombiniert
- Grün-gelbe Isolierung mit blauer Markierung
- Im Hausanschluss getrennt: ab Hauptverteilung PE und N getrennt

### 8.3 Spannungsversorgung im Haus

```
Netzbetreiber → Hausanschlusskasten → Hauptsicherung → Zähler →
└── PEN zur Hauptverteilung → ab dort PE und N getrennt
```

---

## 9. Normen und Vorschriften

### 9.1 Wichtige Normen

- **VDE-AR-N 4101**: Technische Anschlussbedingungen Niederspannung (TAB)
- **DIN VDE 0100**: Errichten von Niederspannungsanlagen
- **DIN VDE 0100-100**: Allgemeine Anforderungen
- **VDE-AR-N 4400**: Erzeugungsanlagen am Niederspannungsnetz

### 9.2 Netzbetreiber (Verteilnetzbetreiber)

- **Stromnetz Berlin, EWE, EnBW, RWE, Netze BW** etc.
- Regeln Netzbetreiber verbindlich (TAB)

---

## 10. Übungen

### Übung 1 — Drehstrom

Welche Phasenverschiebung hat Drehstrom?

### Übung 2 — Spannungen

Wie groß sind Leiterspannung und Sternspannung im TN-C-S-Netz?

### Übung 3 — Anschluss

Welche Anschlussleistung brauchen Sie für ein Einfamilienhaus?

### Übung 4 — Sternpunkt

Welche Netzform ist Standard in Deutschland?

### Übung 5 — Verteilung

Welche Komponenten gehören in den Hauptverteilerschrank?

---

## 11. Zusammenfassung

**Drehstrom** ist die Grundlage des Niederspannungs-Drehstromnetzes:

**Spannungen:**

- Leiterspannung: 400 V (zwischen Phasen)
- Sternspannung: 230 V (Phase-N)
- Frequenz: 50 Hz

**Netzform:** TN-C-S in Deutschland

**Hausanschluss:**

- HAK → Hauptsicherung → Zähler → Hauptverteilung → Unterverteilung

**Spannungsebenen:**

| Ebene | Spannung |
|---|---|
| HS | 110 kV |
| MS | 10/20 kV |
| NS | 230/400 V |

### Selbsttest-Checkliste

- [ ] Ich erkläre Drehstrom und Stern-/Dreieckschaltung.
- [ ] Ich beschreibe den Hausanschluss.
- [ ] Ich kenne Spannungsebenen.
- [ ] Ich verstehe TN-C-S.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3655 — Recherche 2026*
