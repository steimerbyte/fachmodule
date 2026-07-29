# Fachmodul: Spannungserzeugung

**Kurs-ID:** 7716
**Kategorie:** Kursbibliothek / Fachmodule / Elektrotechnik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=7716

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Spannungserzeugung – Überblick](#2-spannungserzeugung--überblick)
3. [Induktion und Faradaysches Gesetz](#3-induktion-und-faradaysches-gesetz)
4. [Generator-Prinzip](#4-generator-prinzip)
5. [Wechsel- und Drehstromgenerator](#5-wechsel-und-drehstromgenerator)
6. [Spannungsquellen: Batterie, Solar, Dynamo](#6-spannungsquellen-batterie-solar-dynamo)
7. [USV und Generatoren](#7-usv-und-generatoren)
8. [Netzparallelbetrieb und Inselbetrieb](#8-netzparallelbetrieb-und-inselbetrieb)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- das Faradaysche Induktionsgesetz anwenden,
- den Aufbau eines Generators erklären,
- Gleich- und Wechselspannungsgeneratoren unterscheiden,
- Spannungsquellen in der Praxis benennen.

---

## 2. Spannungserzeugung – Überblick

**Spannungserzeugung** ist die Umwandlung anderer Energieformen in elektrische Energie:

- **Mechanisch → Elektrisch**: Generator
- **Chemisch → Elektrisch**: Batterie, Brennstoffzelle
- **Licht → Elektrisch**: Solarzelle (Photovoltaik)
- **Wärme → Elektrisch**: Thermoelement
- **Kernenergie → Elektrisch**: Kernkraftwerk (über Wärme → Dampf → Turbine → Generator)

---

## 3. Induktion und Faradaysches Gesetz

### 3.1 Elektromagnetische Induktion

Wird ein **Leiter** in einem **Magnetfeld** bewegt, wird eine Spannung induziert.

### 3.2 Faradaysches Induktionsgesetz

```
U = -N · dΦ/dt
```

- **U**: induzierte Spannung
- **N**: Anzahl der Windungen
- **Φ**: magnetischer Fluss (Φ = B · A)

### 3.3 Lenzsche Regel

Der induzierte Strom ist so gerichtet, dass er seiner Ursache entgegenwirkt.

### 3.4 Wichtige Faktoren

- **Stärke des Magnetfelds** (B)
- **Anzahl der Windungen** (N)
- **Geschwindigkeit** der Relativbewegung (dΦ/dt)

---

## 4. Generator-Prinzip

### 4.1 Aufbau

- **Rotor** (Läufer): drehbar, mit Magnet oder Elektromagnet
- **Stator** (Ständer): feststehend, mit Spulen
- **Schleifringe und Bürsten** (bei Wechselstrom) oder **Kommutator** (bei Gleichstrom)
- **Antrieb**: mechanische Energie (Turbine, Verbrennungsmotor)

### 4.2 Funktionsweise

1. Rotor dreht sich im Magnetfeld
2. Magnetischer Fluss durch die Spulen ändert sich
3. Spannung wird induziert
4. Spannung wird über Bürsten abgegriffen

### 4.3 Frequenz

```
f = (n · p) / 60
```

- n: Drehzahl (U/min)
- p: Polpaarzahl

**Beispiel:** 3000 U/min, 1 Polpaar → 50 Hz

---

## 5. Wechsel- und Drehstromgenerator

### 5.1 Wechselstromgenerator

- Einphasen- oder Dreiphasen-Ausführung
- Heute Standard in Kraftwerken
- Drehstrom mit 50 Hz (Europa) / 60 Hz (USA)

### 5.2 Drehstromgenerator (Synchrongenerator)

- Drei Spulen um 120° versetzt
- Erzeugt Drehstrom
- Synchron mit Netzfrequenz

### 5.3 Spannungsregelung

- **Erregerstrom** im Rotor steuert die Spannung
- AVR (Automatic Voltage Regulator)
- Halten der Spannung bei Laständerungen

---

## 6. Spannungsquellen: Batterie, Solar, Dynamo

### 6.1 Batterien (Akkumulatoren)

**Typen:**

- **Blei-Säure**: klassische Autobatterie
- **Lithium-Ionen**: Smartphones, E-Autos, Heimspeicher
- **NiMH**: ältere Geräte
- **Brennstoffzelle**: Wasserstoff + Sauerstoff → Strom

**Spannungen:**

- Blei-Säure: 2 V/Zelle, 6 Zellen = 12 V
- Li-Ion: 3,7 V/Zelle

### 6.2 Solarzellen (Photovoltaik)

- Silizium-basierte Halbleiter
- Licht erzeugt Elektron-Loch-Paare
- Spannung pro Zelle: ~0,5-0,7 V (Leerlauf)
- Module: 36 Zellen in Serie → 12 V oder 60 Zellen → 30 V
- Wechselrichter wandelt in 230 V Wechselstrom

### 6.3 Dynamo

- Gleichstromgenerator (kleiner Leistung)
- Fahrrad, Lichtmaschine im Auto
- Permanentmagnet-Rotor

### 6.4 Thermoelemente

- Seebeck-Effekt: Spannung durch Temperaturdifferenz
- Kleine Spannungen (mV)
- Temperaturmessung

---

## 7. USV und Generatoren

### 7.1 USV (Unterbrechungsfreie Stromversorgung)

**Typen:**

- **Offline / Standby**: bei Netzausfall Umschaltung (~10 ms)
- **Line-Interactive**: Spannungsregulierung + Batterie
- **Online / Doppelwandler**: kontinuierliche Wandlung

**Einsatzgebiete:**

- Rechenzentren
- Krankenhäuser
- Industrieanlagen

### 7.2 Notstromaggregat

- **Dieselaggregat**: Dieselgenerator + USV für Übergang
- **BHKW** (Blockheizkraftwerk): Kraft-Wärme-Kopplung
- **Brennstoffzellen-Notstrom**: emissionsarm

---

## 8. Netzparallelbetrieb und Inselbetrieb

### 8.1 Netzparallelbetrieb

- Generator läuft synchron mit dem öffentlichen Netz
- Übergabe von Leistung ins Netz
- Voraussetzung: exakte Synchronisation (Spannung, Frequenz, Phase)

### 8.2 Inselbetrieb

- Eigenständige Stromversorgung ohne Netz
- Beispiel: Inselnetz auf Insel, Notstrombetrieb

### 8.3 Photovoltaik-Einspeisung

- **Volleinspeisung**: gesamter Strom ins Netz
- **Überschusseinspeisung**: Eigenverbrauch + Überschuss
- **Inselbetrieb**: mit Speicher und Notstromfunktion

---

## 9. Übungen

### Übung 1 — Induktionsgesetz

Erklären Sie das Faradaysche Induktionsgesetz.

### Übung 2 — Frequenz

Ein Generator mit 3000 U/min und 1 Polpaar erzeugt welche Frequenz?

### Übung 3 — Spannungsquellen

Vergleichen Sie Batterie, Solarzelle und Dynamo.

### Übung 4 — USV

Welche USV-Typen gibt es?

### Übung 5 — Netzparallelbetrieb

Welche Bedingungen muss ein Generator für Netzparallelbetrieb erfüllen?

---

## 10. Zusammenfassung

**Spannungserzeugung** wandelt andere Energieformen in elektrische Energie:

**Induktion** (Faraday): `U = -N · dΦ/dt`

**Generator:**

- Dreht Rotor im Magnetfeld
- Erzeugt Wechsel- oder Drehstrom
- Synchron mit Netzfrequenz

**Spannungsquellen:**

- Batterien: chemisch
- Solarzellen: Licht
- Dynamos: mechanisch
- Thermoelemente: Temperatur

**USV:** Notstromversorgung für kritische Anwendungen

**Netzparallelbetrieb vs. Inselbetrieb**

### Selbsttest-Checkliste

- [ ] Ich erkläre das Faradaysche Induktionsgesetz.
- [ ] Ich beschreibe den Generator-Aufbau.
- [ ] Ich vergleiche Spannungsquellen.
- [ ] Ich erkläre USV-Typen.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=7716 — Recherche 2026*
