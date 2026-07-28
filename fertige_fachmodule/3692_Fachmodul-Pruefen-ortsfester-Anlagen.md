# Fachmodul: Prüfen ortsfester Anlagen

**Kurs-ID:** 3692
**Kategorie:** Kursbibliothek / Fachmodule / Elektroinstallation
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3692

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Wiederholungsprüfung – Überblick](#2-wiederholungsprüfung--überblick)
3. [Rechtliche Grundlagen](#3-rechtliche-grundlagen)
4. [Prüfablauf nach DIN VDE 0100-600](#4-prüfablauf-nach-din-vde-0100-600)
5. [Prüfschritte im Detail](#5-prüfschritte-im-detail)
6. [Prüfprotokoll](#6-prüfprotokoll)
7. [Prüfgeräte](#7-prüfgeräte)
8. [Übungen](#8-übungen)
9. [Zusammenfassung](#9-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Wiederholungsprüfungen ortsfester Anlagen durchführen,
- die relevanten Normen und Vorschriften benennen,
- Prüfschritte korrekt anwenden,
- ein Prüfprotokoll erstellen,
- geeignete Prüfgeräte auswählen.

---

## 2. Wiederholungsprüfung – Überblick

Eine **ortsfeste elektrische Anlage** muss regelmäßig auf ihren sicheren Zustand geprüft werden.

**Anlässe für Prüfungen:**

- **Erstprüfung** nach Errichtung oder wesentlicher Änderung
- **Wiederholungsprüfung** im Bestand
- **Prüfung nach Schaden** (Brand, Wasser, mechanische Beschädigung)

**Ziele:**

- Personenschutz
- Brandschutz
- Sachwertschutz

---

## 3. Rechtliche Grundlagen

### 3.1 Normen und Vorschriften

- **DIN VDE 0100-600** (Errichten und Prüfen von Niederspannungsanlagen)
- **DGUV Vorschrift 3** (Elektrische Anlagen und Betriebsmittel)
- **BetrSichV** (Betriebssicherheitsverordnung)
- **TRBS 1201** (Technische Regeln für Betriebssicherheit)
- **DIN VDE 0105-100** (Betrieb von elektrischen Anlagen)

### 3.2 Verantwortlich

- **Arbeitgeber**: muss sichere Arbeitsmittel bereitstellen
- **Anlagenbetreiber**: verantwortlich für Prüfungen
- **Elektrofachkraft**: führt die Prüfung durch
- **Verantwortliche Elektrofachkraft** (VEFK): Prüfung der Organisation

### 3.3 Fristen (DGUV V3)

| Anlage | Frist |
|---|---|
| Industrie, gewerblich | 1-2 Jahre |
| Büro | 2-4 Jahre |
| Schulen | 1-3 Jahre |
| Baustellen | 1 Jahr |
| Wohnungen | nicht zwingend (Empfehlung: bei Mieterwechsel) |

---

## 4. Prüfablauf nach DIN VDE 0100-600

### 4.1 Prüfschritte

1. **Besichtigen**
2. **Erproben**
3. **Messen**

### 4.2 Reihenfolge

1. Vorbereitung (Schaltplan, Stromlaufplan)
2. Sichtprüfung (Besichtigen)
3. Funktionsprüfung (Erproben)
4. Messungen (Messen)
5. Protokollierung
6. Bewertung und Mängelbeseitigung

---

## 5. Prüfschritte im Detail

### 5.1 Besichtigen (Sichtprüfung)

**Zu prüfen:**

- Übereinstimmung mit Plänen (Stromlaufplan, Installationsplan)
- Auswahl der Betriebsmittel nach Schutzart
- Leiterquerschnitte und Absicherungen
- Schutzleiteranschlüsse
- Kennzeichnung von Stromkreisen und Schutzgeräten
- Sauberkeit der Installation

### 5.2 Erproben (Funktionsprüfung)

**Zu prüfen:**

- Funktion der Schutzgeräte (FI-Schalter mit Test-Taste)
- Funktion der Schalter
- Drehfeld (bei Drehstromanschlüssen)
- Not-Aus-Schalter
- Sicherheitsbeleuchtung

### 5.3 Messen

**Reihenfolge:**

1. **Durchgängigkeit der Schutzleiter**
2. **Isolationswiderstand** (zwischen aktiven Leitern und Erde)
3. **Schutzleiterwiderstand** (Schleifenimpedanz)
4. **RCD-Auslösezeit** und Auslösestrom
5. **Drehfeldprüfung** (Phasenfolge)
6. **Schutz gegen elektrischen Schlag** durch SELV, PELV oder Schutztrennung

### 5.4 Messwerte (Mindestwerte)

| Messung | Mindestwert |
|---|---|
| Isolationswiderstand | ≥ 0,5 MΩ |
| Schleifenimpedanz | gemäß Absicherung errechnen |
| RCD-Auslösezeit (30 mA) | ≤ 300 ms |
| RCD-Auslösestrom | 30 mA (max. 15-30 mA) |
| Schutzleiterwiderstand | ≤ 0,3 Ω (kurze Leitungen) |

### 5.5 Berechnungsbeispiel Schleifenimpedanz

Für LS B16 (max. Impedanz für Abschaltung in 5 s):

```
Zs_max = U₀ / Ia
U₀ = 230 V (Sternspannung)
Ia = Abschaltstrom (z. B. 80 A für B16, 5 s)
Zs_max = 230 / 80 = 2,875 Ω
```

---

## 6. Prüfprotokoll

### 6.1 Inhalt

- Anlagenidentifikation (Adresse, Anlagenteil)
- Prüfer (Name, Qualifikation)
- Datum
- Prüfgrund (Erstprüfung, Wiederholungsprüfung)
- Verwendete Prüfgeräte (inkl. Kalibrierung)
- Messwerte
- Bewertung (Bestanden / Nicht bestanden)
- Mängelliste
- Unterschriften

### 6.2 Beispiel

```
Anlage: Hauptgebäude, 1. OG
Prüfer: M. Müller, EFK
Datum: 15.03.2024
Prüfgerät: Fluke 1664 FC (kalibriert 01/2024)

Isolationswiderstand L1-N-PE: 280 MΩ ✓
Schleifenimpedanz L1: 0,42 Ω ✓
RCD-Auslösezeit FI 30 mA: 28 ms ✓
RCD-Auslösestrom: 22 mA ✓

Bewertung: Bestanden
Mängel: Keine
```

### 6.3 Aufbewahrungspflicht

- Nach DGUV V3: Protokolle während der Lebensdauer der Anlage aufbewahren
- Bei Verkauf oder Eigentümerwechsel Übergabe empfohlen

---

## 7. Prüfgeräte

### 7.1 Installationstester

- Fluke 1664 FC (Profi)
- Beha-Amprobe MWT-2
- Gossen Metrawatt Profitest
- Benning IT 130
- Chauvin Arnoux CA 6160

### 7.2 Funktionen

- Isolationswiderstandsmessung
- Schleifenimpedanz-Messung
- RCD-Auslösezeit/Strom
- Drehfeldprüfung
- Niederohm-Messung
- True-RMS-Multimeter

### 7.3 Auswahlkriterien

- Messgenauigkeit (mind. Klasse 2)
- Aktuelle Kalibrierung
- VDE-Zulassung
- Messbereich
- Robustheit
- Bedienbarkeit

### 7.4 Wartung der Prüfgeräte

- Regelmäßige Kalibrierung (Herstellerangaben)
- Sichtprüfung vor jedem Einsatz
- Funktionstest mit Referenz
- Aufbewahrung in geeignetem Koffer

---

## 8. Übungen

### Übung 1 — Prüfschritte

Welche drei Hauptschritte umfasst die Prüfung?

### Übung 2 — Messwerte

Welcher Isolationswiderstand ist Mindestwert?

### Übung 3 — Schleifenimpedanz

Berechnen Sie die maximale Schleifenimpedanz für LS B16.

### Übung 4 — RCD

Welche Auslösezeit ist maximal zulässig für 30 mA FI?

### Übung 5 — Prüfprotokoll

Erstellen Sie ein Prüfprotokoll für eine Wohnungsprüfung.

---

## 9. Zusammenfassung

**Wiederholungsprüfung ortsfester Anlagen:**

**Rechtsgrundlagen:**

- DIN VDE 0100-600
- DGUV Vorschrift 3
- BetrSichV
- TRBS 1201

**Drei Prüfschritte:**

1. Besichtigen
2. Erproben
3. Messen

**Wichtige Messwerte:**

- Isolationswiderstand: ≥ 0,5 MΩ
- Schleifenimpedanz: je nach Absicherung
- RCD: ≤ 300 ms / ≤ 30 mA

**Prüfgeräte:** Fluke, Beha, Gossen Metrawatt (Installationstester)

**Fristen:** je nach Anlage 1-4 Jahre

### Selbsttest-Checkliste

- [ ] Ich erkläre die drei Prüfschritte.
- [ ] Ich wende die relevanten Normen an.
- [ ] Ich führe Messungen korrekt durch.
- [ ] Ich erstelle ein Prüfprotokoll.
- [ ] Ich nutze geeignete Prüfgeräte.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3692 — Recherche 2026*
