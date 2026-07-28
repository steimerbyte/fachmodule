# Fachmodul: NW: Netzwerkkabel

**Kurs-ID:** 1915
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1915

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Kabelgebundene Netzwerkverbindungen](#2-kabelgebundene-netzwerkverbindungen)
3. [Koaxial-Kabel](#3-koaxial-kabel)
4. [Twisted-Pair-Kabel](#4-twisted-pair-kabel)
5. [RJ45-Steckerbelegung](#5-rj45-steckerbelegung)
6. [Lichtwellenleiter (LWL)](#6-lichtwellenleiter-lwl)
7. [Vergleich der Kabeltypen](#7-vergleich-der-kabeltypen)
8. [Übungen](#8-übungen)
9. [Zusammenfassung](#9-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Koaxialkabel, Twisted Pair und Lichtwellenleiter unterscheiden,
- Aufbau, Eigenschaften und Einsatzgebiete jedes Kabeltyps beschreiben,
- RJ45-Stecker korrekt nach TIA-568A/B belegen,
- passende Kabel für Anwendungsfälle wählen.

---

## 2. Kabelgebundene Netzwerkverbindungen

Ohne eine Verbindung zwischen den Clients gibt es keine Datenkommunikation. Die häufigste Art der Verbindung ist eine Kabelverbindung. Man unterscheidet:

- **Kupferkabel**: elektrische Signalübertragung
- **Lichtwellenleiter (LWL)**: optische Signalübertragung

**Kriterien für die Kabelwahl:**

- Distanz
- Datenrate
- Störanfälligkeit (EMV)
- Kosten
- Installation

---

## 3. Koaxial-Kabel

### 3.1 Aufbau

```
[Adernleiter]──[Dielektrikum]──[Schirm]──[Mantel]
```

- **Innenleiter** (Kupferdraht)
- **Dielektrikum** (Isolation)
- **Schirmung** (Geflecht + Folie)
- **Außenmantel** (PVC, LSZH)

### 3.2 Impedanz

| Impedanz | Anwendung |
|---|---|
| 50 Ω | Ethernet, Funkanlagen |
| 75 Ω | CATV, Satelliten-TV, Video |

### 3.3 Ethernet-Varianten (Legacy)

| Standard | Kabel | Max. Länge |
|---|---|---|
| 10BASE2 (Thin Ethernet) | RG-58 (50 Ω) | 185 m |
| 10BASE5 (Thin Ethernet) | RG-8 (50 Ω) | 500 m |

Heute praktisch bedeutungslos.

### 3.4 Vor-/Nachteile

| Vorteile | Nachteile |
|---|---|
| Robust | Schwer, unflexibel |
| Gute Schirmung | Hoher Biegeradius |
| Weit verbreitet in TV | Teurer als Twisted Pair |

---

## 4. Twisted-Pair-Kabel

### 4.1 Aufbau

Vier verdrillte Adernpaare (8 Adern):

```
Paar 1:    [Ader 1]-----[Ader 2]   (verdrillt)
Paar 2:    [Ader 3]-----[Ader 4]
Paar 3:    [Ader 5]-----[Ader 6]
Paar 4:    [Ader 7]-----[Ader 8]
```

Das Verdrillen reduziert elektromagnetische Störungen (Übersprechen, engl. crosstalk).

### 4.2 Schirmungsvarianten

| Kürzel | Aufbau |
|---|---|
| **U/UTP** | Ungeschirmt (früher UTP) |
| **F/UTP** | Folienschirm |
| **S/UTP** | Geflechtschirm |
| **SF/UTP** | Schirm + Folie |
| **U/FTP** | Adernpaare einzeln geschirmt |
| **S/FTP** | Geflecht + Folie + Adernpaarschirmung |
| **F/FTP** | Folie + Adernpaarschirmung |

### 4.3 Kategorien

| Kategorie | Bandbreite | 100 m? | Ethernet |
|---|---|---|---|
| CAT5 | 100 MHz | ja | 100 Mbit/s |
| CAT5e | 100 MHz | ja | 1 Gbit/s |
| CAT6 | 250 MHz | ja | 1 Gbit/s, 10 Gbit/s (55 m) |
| CAT6A | 500 MHz | ja | 10 Gbit/s |
| CAT7 | 600 MHz | ja | 10 Gbit/s |
| CAT7A | 1000 MHz | ja | 10 Gbit/s, 40 Gbit/s (50 m) |
| CAT8 | 2000 MHz | 30 m | 25/40 Gbit/s |

### 4.4 PoE (Power over Ethernet)

Twisted Pair kann auch Strom führen. PoE-Spezifikationen:

- IEEE 802.3af (PoE, 12,95 W)
- IEEE 802.3at (PoE+, 25,5 W)
- IEEE 802.3bt (PoE++, 60–100 W)

**Anwendungen:** WLAN-APs, IP-Telefone, IP-Kameras, Beleuchtung.

---

## 5. RJ45-Steckerbelegung

### 5.1 TIA-568A

```
Pin 1: Weiß-Grün      Pin 5: Weiß-Blau
Pin 2: Grün            Pin 6: Orange
Pin 3: Weiß-Orange     Pin 7: Weiß-Braun
Pin 4: Blau            Pin 8: Braun
```

### 5.2 TIA-568B (häufiger)

```
Pin 1: Weiß-Orange     Pin 5: Weiß-Blau
Pin 2: Orange          Pin 6: Grün
Pin 3: Weiß-Grün       Pin 7: Weiß-Braun
Pin 4: Blau            Pin 8: Braun
```

### 5.3 Belegung in der Praxis

- **10BASE-T/100BASE-TX**: nur Adern 1,2 (TX+) und 3,6 (TX-) verwendet
- **1000BASE-T**: alle 4 Paare
- **2.5G/5G/10GBASE-T**: alle 4 Paare, höhere Qualität nötig

---

## 6. Lichtwellenleiter (LWL)

### 6.1 Aufbau

```
[Kern]    ── Durchmesser je nach Typ
[Cladding]── niedrigere Brechzahl → Totalreflexion
[Coating]  ── Schutzmantel
[Buffer]   ── Schutz
[Jacket]   ── Außenmantel
```

### 6.2 Singlemode (Single Mode Fiber, SMF)

- Kern: 9 µm
- Mantel: 125 µm
- Wellenlänge: 1310 nm, 1550 nm
- Reichweite: bis 100 km (mit Verstärkern bis 1000+ km)
- Bandbreite: sehr hoch
- Anwendungen: WAN, Telekom-Backbone, Unterseeekabel

### 6.3 Multimode (Multi Mode Fiber, MMF)

- Kern: 50 µm (OM3/OM4/OM5) oder 62,5 µm (OM1)
- Mantel: 125 µm
- Wellenlänge: 850 nm (OM3/4) oder 1310 nm
- Reichweite: bis 2 km
- Anwendungen: Rechenzentrum, Campus-Netz, Storage Area Networks (SAN)

### 6.4 OM-Klassen (Multimode)

| Klasse | Bandbreite | Wellenlänge | Reichweite 10 Gbit/s |
|---|---|---|---|
| OM1 | 200 MHz·km | 850 nm | 33 m |
| OM2 | 500 MHz·km | 850 nm | 82 m |
| OM3 | 2000 MHz·km | 850 nm | 300 m |
| OM4 | 4700 MHz·km | 850 nm | 550 m |
| OM5 | 28000 MHz·km | 850–953 nm | 550 m |

### 6.5 Stecker

| Stecker | Eigenschaften |
|---|---|
| **ST** (Straight Tip) | Bajonett, älter |
| **SC** (Subscriber Connector) | Push-Pull, rechteckig |
| **LC** (Lucent Connector) | Small Form Factor, Push-Pull, Standard heute |
| **MTRJ** | Duplex-Stecker |
| **E2000** | Push-Pull mit Schutzklappe |

### 6.6 Vor-/Nachteile

| Vorteile | Nachteile |
|---|---|
| Sehr hohe Reichweite | Teurer |
| Unempfindlich gegen EMV | Spezialwerkzeug zum Spleißen |
| Hohe Bandbreite | Schwer zu reparieren |
| Kein Übersprechen | Knickempfindlich |

---

## 7. Vergleich der Kabeltypen

| Kriterium | Koax | Twisted Pair | Multimode-LWL | Singlemode-LWL |
|---|---|---|---|---|
| Max. Länge | 500 m | 100 m | 2 km | 100+ km |
| Datenrate | 10 Mbit/s | 10 Gbit/s | 100 Gbit/s | 1 Tbit/s+ |
| Störanfälligkeit | mittel | mittel-hoch | gering | sehr gering |
| Kosten | mittel | niedrig | mittel-hoch | hoch |
| Installation | einfach | sehr einfach | mittel | aufwändig |

---

## 8. Übungen

### Übung 1 — Kabeltypen zuordnen

Welches Kabel für welche Anwendung?

- 5-m-Verbindung PC ↔ Switch
- 100-m-Gebäudeverbindung
- 50-km-Backbone zwischen Städten
- 10-m-Rechenzentrum-Server-Verbindung

### Übung 2 — RJ45-Belegung

Erstellen Sie die Belegung für TIA-568A und TIA-568B.

### Übung 3 — PoE berechnen

Wie viele IP-Telefone (je 7 W) versorgt ein PoE+-Switch (max. 25,5 W)?

### Übung 4 — LWL-Wellenlängen

Welche Wellenlänge eignet sich für welche Anwendung?

### Übung 5 — Verkabelungsentscheidung

Sie sollen ein neues Bürogebäude verkabeln. Welche Kabel setzen Sie ein?

---

## 9. Zusammenfassung

| Kabeltyp | Reichweite | Anwendung |
|---|---|---|
| Koax (75 Ω) | bis 500 m | CATV (heute Twisted Pair) |
| Twisted Pair CAT6A | 100 m | Büro-LAN, Rechenzentrum |
| Twisted Pair CAT7/7A | 100 m | 10G-LAN |
| Multimode-LWL OM4 | 550 m | Rechenzentrum |
| Singlemode-LWL | 100+ km | WAN, Telekom |

**RJ45:**

- TIA-568A und TIA-568B üblich
- Gigabit+ benötigt alle 4 Adernpaare

**PoE:**

- Strom über Datenkabel
- IEEE 802.3af/at/bt

### Selbsttest-Checkliste

- [ ] Ich unterscheide Koax, Twisted Pair und LWL.
- [ ] Ich erkläre Aufbau und Eigenschaften jedes Typs.
- [ ] Ich belegte RJ45 nach TIA-568.
- [ ] Ich wähle passende Kabel für Anwendungen.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=1915 — Recherche 2026*
