# Fachmodul: PoE – Power over Ethernet

**Kurs-ID:** 5696
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=5696

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist PoE?](#2-was-ist-poe)
3. [IEEE-Standards](#3-ieee-standards)
4. [Mode A und Mode B](#4-mode-a-und-mode-b)
5. [Kabel und Reichweiten](#5-kabel-und-reichweiten)
6. [PoE-Geräte](#6-poe-geräte)
7. [PoE im Rechenzentrum und Büro](#7-poe-im-rechenzentrum-und-büro)
8. [Sicherheit und Erkennung](#8-sicherheit-und-erkennung)
9. [Planung einer PoE-Infrastruktur](#9-planung-einer-poe-infrastruktur)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- das Prinzip von Power over Ethernet erklären,
- die IEEE-Standards 802.3af/at/bt unterscheiden,
- PoE-Geräte planen und in Betrieb nehmen,
- Sicherheitsaspekte berücksichtigen.

---

## 2. Was ist PoE?

**Power over Ethernet (PoE)** ermöglicht die **gleichzeitige Übertragung von Daten und Strom** über ein einzelnes Twisted-Pair-Kabel.

**Vorteile:**

- Eine Verkabelung für Daten und Strom
- Kein separates Netzteil am Endgerät nötig
- Flexiblere Platzierung von Endgeräten
- Zentrale Stromversorgung (USV möglich)

---

## 3. IEEE-Standards

| Standard | Bezeichnung | Leistung PSE | Leistung PD |
|---|---|---|---|
| **IEEE 802.3af** | PoE | bis 15,4 W | bis 12,95 W |
| **IEEE 802.3at** | PoE+ | bis 30 W | bis 25,5 W |
| **IEEE 802.3bt Type 3** | PoE++ / 4PPoE | bis 60 W | bis 51 W |
| **IEEE 802.3bt Type 4** | PoE++ / 4PPoE High Power | bis 90–100 W | bis 71 W |

### 3.1 Class 0 bis Class 8

| Klasse | Max. Leistung PD | Anwendung |
|---|---|---|
| 0 | 0,44–12,95 W | Legacy |
| 1 | 0,44–4 W | sehr kleine Geräte |
| 2 | 0,44–7 W | Telefone |
| 3 | 0,44–15,4 W | Standard (WLAN-AP) |
| 4 | bis 30 W | PoE+ |
| 5 | bis 45 W | PoE++ |
| 6 | bis 60 W | PoE++ |
| 7 | bis 75 W | PoE++ |
| 8 | bis 96 W | PoE++ High Power |

---

## 4. Mode A und Mode B

### 4.1 Mode A (Phantomspeisung)

- Strom wird über die **Datenpaare** eingespeist
- Gleiche Adernpaare wie für Daten
- Erfordert 10BASE-T oder besser mit allen 4 Paaren
- Funktioniert auch bei 100BASE-TX und 1000BASE-T

### 4.2 Mode B (Spare-Pair-Speisung)

- Strom wird über die **freien Paare** eingespeist
- Bei 10BASE-T/100BASE-TX sind Paare 4-5 und 7-8 ungenutzt
- Bei 1000BASE-T: alle 4 Paare für Daten, Mode B nicht mehr möglich
- **Heute irrelevant** für Gigabit+

### 4.3 4PPoE (Four-Pair Power over Ethernet)

- Strom über **alle 4 Paare**
- Höhere Leistung (bis 100 W)
- IEEE 802.3bt Standard
- Weniger Leitungsverluste

---

## 5. Kabel und Reichweiten

### 5.1 Kabeltypen

- **CAT5e**: bis PoE+ (30 W) sicher
- **CAT6/CAT6A**: Standard für PoE+
- **CAT7/CAT7A**: PoE+ und PoE++ möglich
- **CAT8**: Rechenzentrum, hohe PoE-Leistungen

### 5.2 Kabelqualität und PoE

- Adernquerschnitt wichtig (24 AWG besser als 26 AWG)
- Kabelqualität und Verarbeitung wichtig
- Bündelung reduziert Wärmeableitung
- Mehrere gebündelte PoE-Kabel können sich erwärmen

### 5.3 Reichweite

- 100 m Twisted Pair maximal (Standard-Ethernet)
- Spannungsabfall bei langen Kabeln beachten
- CAT6 oder besser für hohe PoE-Lasten empfohlen

### 5.4 Spannungsabfall

- PSE liefert z. B. 48 V
- Auf 100 m CAT5e: ca. 3-5 V Abfall bei 30 W
- PD muss mit minimaler Spannung arbeiten können

---

## 6. PoE-Geräte

### 6.1 PSE (Power Sourcing Equipment)

- **PoE-Switch**: Endspan-Modus
- **PoE-Injektor (Midspan)**: speist Strom zwischen Switch und Endgerät ein
- **PoE-Splitter**: trennt Strom und Daten am Endgerät

### 6.2 PD (Powered Device)

- WLAN-Access-Point
- IP-Telefon
- IP-Kamera (PTZ-Kameras oft PoE+)
- Zutrittskontrollsysteme
- LED-Beleuchtung
- IoT-Gateways
- Thin Clients
- Videokonferenzsysteme

### 6.3 Beispiele

| Gerät | Klasse | Leistung |
|---|---|---|
| WLAN-AP | 3 | 15 W |
| IP-Telefon | 2-3 | 7-15 W |
| PTZ-Kamera | 4 | 30 W |
| Thin Client | 4 | 30 W |
| LED-Fluter | 6-8 | 60-100 W |

---

## 7. PoE im Rechenzentrum und Büro

### 7.1 Rechenzentrum

- PoE für Thin Clients, Konsolen-Server
- Bis 100 W für Hochleistungs-WLAN-APs
- Kabelführung in Bodenschächten oder Tragschienen

### 7.2 Büro

- PoE-WLAN-APs an Decken (60+ W)
- PoE-IP-Telefone (3-7 W)
- PoE-Kameras für Sicherheit
- PoE-Zutrittskontrolle

### 7.3 Vorteile im Büro

- Schnellere Installation
- Flexiblere Platzierung
- Zentrale USV-Versorgung
- Niedrigere Kosten (kein Elektriker nötig)

---

## 8. Sicherheit und Erkennung

### 8.1 PoE-Erkennung

PSE erkennt vor der Stromzufuhr:

1. **Detektion**: Widerstandsmessung (25 kΩ)
2. **Klassifikation**: Stromstärke-Messung (Class)
3. **Stromzufuhr**: erst nach erfolgreicher Klassifikation

### 8.2 Schutzmechanismen

- **Kurzschluss-Schutz**: bei Kurzschluss wird Stromzufuhr gestoppt
- **Überlast-Schutz**: bei Überschreitung der Klasse wird Strom reduziert
- **Überspannungsschutz**: bei Spannungsspitzen wird getrennt
- **Temperatur-Überwachung**: bei Überhitzung wird PoE deaktiviert

### 8.3 Passive PoE-Gefahr

- **Passive PoE-Geräte** (z. B. ältere Mikrotik-Geräte) legen unkontrolliert Spannung an
- Können Endgeräte ohne PoE-Unterstützung beschädigen
- Heute nicht mehr empfohlen

---

## 9. Planung einer PoE-Infrastruktur

### 9.1 PoE-Budget berechnen

```
Summe aller PDs × Leistung pro PD = Gesamt-PoE-Budget
```

Beispiel: 20 WLAN-APs × 25 W = 500 W

PSE muss dieses Budget liefern können. Switch mit z. B. 600 W Budget.

### 9.2 Switch-Auswahl

- **PoE-Ports**: z. B. 24 × PoE+
- **PoE-Budget**: z. B. 380 W (Reichweite)
- **Verwaltung**: managed Switch für QoS, VLAN
- **Backplane**: ausreichend für Datenverkehr

### 9.3 Verkabelung

- CAT6 oder besser
- Professionelle Installation
- Bündelung mit Hinblick auf Wärmeableitung
- Kabellängen < 80 m empfohlen für hohe PoE-Klassen

### 9.4 Stromversorgung

- USV für PoE-Switches
- PoE-budget und Stromverbrauch prüfen
- Sicherung der Stromversorgung

---

## 10. Übungen

### Übung 1 — PoE-Standard

Welcher PoE-Standard für 25 W pro Gerät?

### Übung 2 — Budget berechnen

Berechnen Sie das PoE-Budget für 30 WLAN-APs à 15 W und 10 IP-Telefone à 7 W.

### Übung 3 — Mode A vs. Mode B

Welcher Modus eignet sich bei Gigabit-Ethernet?

### Übung 4 — Sicherheit

Welche Schutzmaßnahmen sollten PoE-PSE haben?

### Übung 5 — Planung

Planen Sie PoE für ein Bürogebäude mit 50 Arbeitsplätzen.

---

## 11. Zusammenfassung

**Power over Ethernet (PoE)** überträgt Daten und Strom über ein Twisted-Pair-Kabel:

**IEEE-Standards:**

| Standard | Leistung | Anwendung |
|---|---|---|
| 802.3af (PoE) | 15,4 W | IP-Telefon |
| 802.3at (PoE+) | 30 W | WLAN-AP, Kamera |
| 802.3bt Type 3 | 60 W | PTZ, Thin Client |
| 802.3bt Type 4 | 100 W | Hochleistungs-APs |

**Modi:**

- **Mode A**: Strom über Datenpaare (Standard heute)
- **Mode B**: Strom über freie Paare (nur bei 10/100 Mbit/s)
- **4PPoE**: Strom über alle 4 Paare (802.3bt)

**Sicherheit:**

- 5-Stufen-Erkennung (Detektion, Klassifikation, Stromzufuhr, Überwachung, Trennung)
- Kein Strom an fremde Endgeräte
- Passive PoE vermeiden

### Selbsttest-Checkliste

- [ ] Ich erkläre die PoE-Standards.
- [ ] Ich unterscheide Mode A und Mode B.
- [ ] Ich plane ein PoE-Budget.
- [ ] Ich wähle passende Kabel und Komponenten.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=5696 — Recherche 2026*
