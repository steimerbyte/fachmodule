# Fachmodul: Netzwerktopologien und Strukturierte Verkabelung

**Kurs-ID:** 1913
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1913

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Einführung und Motivation](#2-einführung-und-motivation)
3. [Physische und logische Topologie](#3-physische-und-logische-topologie)
4. [Topologie-Arten im Überblick](#4-topologie-arten-im-überblick)
5. [Bustopologie](#5-bustopologie)
6. [Sterntopologie](#6-sterntopologie)
7. [Ringtopologie](#7-ringtopologie)
8. [Baumtopologie](#8-baumtopologie)
9. [Maschentopologie](#9-maschentopologie)
10. [Vergleich der Topologien](#10-vergleich-der-topologien)
11. [Übertragungsmedien (Schicht 1)](#11-übertragungsmedien-schicht-1)
12. [Strukturierte Verkabelung (EN 50173-1)](#12-strukturierte-verkabelung-en-50173-1)
13. [Handlungsauftrag: Drei Stationen](#13-handlungsauftrag-drei-stationen)
14. [Bild- und Quellenverweise](#14-bild-und-quellenverweise)
15. [Lernaufgaben](#15-lernaufgaben)
16. [Zusammenfassung](#16-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- physische und logische Topologie unterscheiden,
- Bustopologie, Sterntopologie, Ringtopologie, Baumtopologie und Maschentopologie beschreiben,
- Vor- und Nachteile jeder Topologie benennen,
- Übertragungsmedien (Koax, Twisted Pair, LWL) auswählen,
- den Aufbau der Strukturierten Verkabelung nach EN 50173-1 erläutern,
- typische Fehlerquellen in Netzwerken identifizieren.

---

## 2. Einführung und Motivation

Der Aufbau eines IT-Netzes erfolgt nach einem hierarchischen Modell, dem **OSI-Schichtenmodell**. In diesem Fachmodul beschäftigen wir uns mit **Schicht 1 (Physical Layer)**: physikalische Übertragungsmedien und Verkabelungsstruktur.

> **Wichtig:** Ca. 80 % aller Fehler, Ausfälle und Störungen entstehen durch **Schäden an der Verkabelung und durch defekte Netzwerkgeräte**!

Eine durchdachte Verkabelungsstruktur ist daher die Grundlage jedes stabilen Netzwerks.

---

## 3. Physische und logische Topologie

| Begriff | Bedeutung |
|---|---|
| **Physische Topologie** | Tatsächliche Verkabelung der Geräte |
| **Logische Topologie** | Art der Datenübertragung im Netz |

**Beispiele:**

- Eine physische Sterntopologie kann logisch als Bus (Token Ring auf Stern) arbeiten.
- Ethernet heute: physisch Stern (mit Switches), logisch als Bus (CSMA/CD, in der Praxis nicht mehr relevant durch Switches).

---

## 4. Topologie-Arten im Überblick

| Topologie | Beschreibung |
|---|---|
| **Bus** | Alle Geräte an einem zentralen Kabel |
| **Stern** | Alle Geräte an einem zentralen Knoten (Hub/Switch) |
| **Ring** | Jedes Gerät hat genau zwei Nachbarn |
| **Baum** | Hierarchische Erweiterung des Sterns |
| **Masche** | Mehrere Verbindungen, oft redundant |
| **Hybrid** | Kombination mehrerer Topologien |

---

## 5. Bustopologie

### 5.1 Aufbau

```
[PC1]──┬──┬──┬──┬──┬──┬──[Kabel]──┬──┬──┬──[PC2]
       │  │  │  │  │  │           │  │  │
      [PC3] [PC4] ...        [PC5] [PC6]
```

Alle Geräte teilen sich ein gemeinsames Übertragungsmedium (Koaxialkabel oder Twisted Pair).

### 5.2 Eigenschaften

- Alle Geräte hören alle Übertragungen (Broadcast)
- Abschlusswiderstände (Terminatoren) an beiden Enden
- Maximale Kabellänge begrenzt (z. B. 185 m bei 10BASE2)

### 5.3 Vor-/Nachteile

| Vorteil | Nachteil |
|---|---|
| Wenig Kabelmaterial nötig | Bei Defekt fällt das gesamte Netz aus |
| Einfache Verkabelung | Niedrige Performance bei vielen Geräten |
| | Schwer erweiterbar |

### 5.4 Kollisionen

Wenn zwei Geräte gleichzeitig senden, kollidieren die Signale (CSMA/CD verhindert Datenverlust).

---

## 6. Sterntopologie

### 6.1 Aufbau

```
       [PC1]
         |
       [Switch]
       /  |  \
      /   |   \
   [PC2] [PC3] [PC4]
```

Alle Geräte sind sternförmig mit einem zentralen Hub oder Switch verbunden.

### 6.2 Eigenschaften

- Heute die **Standardtopologie in LANs**
- Hub: sendet alles an alle (Broadcast)
- Switch: lernt MAC-Adressen, leitet gezielt weiter
- Vorteil: bei Kabeldefekt nur ein Gerät betroffen

### 6.3 Vor-/Nachteile

| Vorteil | Nachteil |
|---|---|
| Ausfall eines Kabels betrifft nur ein Gerät | Höherer Kabelverbrauch |
| Einfache Erweiterung | Zentrale Komponente (Single Point of Failure) |
| Gute Performance mit Switches | |

### 6.4 Hierarchischer Stern

Sterne werden oft in Backbone- und Access-Sterne verschachtelt:

```
       [Kern-Switch]
       /          \
[Verteiler 1]  [Verteiler 2]
    |  |  \      /  |  |
   PC PC PC  PC  PC PC
```

---

## 7. Ringtopologie

### 7.1 Aufbau

```
[PC1]──[PC2]
  │         │
[PC6]     [PC3]
  │         │
[PC5]──[PC4]
```

Jedes Gerät ist mit genau zwei Nachbarn verbunden. Daten durchlaufen den Ring.

### 7.2 Eigenschaften

- Token Passing: nur wer das Token hat, darf senden (kein CSMA/CD nötig)
- Heute: Token Ring (IBM), FDDI (Glasfaser-Ring), SONET/SDH (Telekommunikation)
- **Single Point of Failure**: bei einem Kabelbruch fällt das Netz aus
- Dual Ring mit Backup-Pfad

### 7.3 Vor-/Nachteile

| Vorteil | Nachteil |
|---|---|
| Deterministische Performance | Ein Geräteausfall kann das Netz stoppen |
| Gut für große, gleichmäßige Last | Komplexe Fehlersuche |
| | Heute selten in LANs |

---

## 8. Baumtopologie

### 8.1 Aufbau

Hierarchische Struktur: Wurzel → Äste → Blätter. In der Praxis ein **verschachtelter Stern** (siehe 6.4).

### 8.2 Eigenschaften

- Backbone → Verteilerswitch → Access-Switch → Endgeräte
- Typisch in Rechenzentren, Campus-Netzen
- Skaliert gut

---

## 9. Maschentopologie

### 9.1 Aufbau

```
   [A]──[B]
   /│    │\
  / │    │ \
[C]─┼────┼──[D]
  \ │    │ /
   \│    │/
   [E]──[F]
```

Jedes Gerät hat mehrere Verbindungen zu anderen Geräten.

### 9.2 Varianten

- **Vollständig vermascht**: jeder mit jedem
- **Teilweise vermascht**: gezielte Redundanz
- **Vermascht im Kern, Stern im Access**: typisch

### 9.3 Vor-/Nachteile

| Vorteil | Nachteil |
|---|---|
| Hohe Ausfallsicherheit (Redundanz) | Hoher Kabelaufwand |
| Lastverteilung über mehrere Pfade | Komplexes Routing-Protokoll nötig |
| | Hohe Kosten |

---

## 10. Vergleich der Topologien

| Topologie | Aufwand | Ausfall | Performance | Heute |
|---|---|---|---|---|
| Bus | gering | Total | gering | veraltet |
| Stern | mittel | lokal | hoch | Standard (LAN) |
| Ring | mittel | total | hoch (Token) | Telekom (SONET) |
| Baum | mittel-hoch | partiell | hoch | Standard (WAN/Rechenzentrum) |
| Masche | hoch | keiner | hoch | Backbone |

---

## 11. Übertragungsmedien (Schicht 1)

### 11.1 Koaxialkabel

- Aufbau: Innenleiter, Dielektrikum, Schirm, Mantel
- Impedanz: 50 Ω (Ethernet) oder 75 Ω (CATV)
- Legacy: 10BASE2 (Thin Ethernet), 10BASE5 (Thick Ethernet)

### 11.2 Twisted Pair

- Adernpaare verdrillt zur Reduktion von Übersprechen
- Schirmung: UTP (ungeschirmt), FTP, STP, S/FTP
- Kategorien: CAT5e bis CAT8

### 11.3 RJ45-Steckerbelegung

**TIA-568A:**

```
Pin 1: Weiß-Grün      Pin 5: Weiß-Blau
Pin 2: Grün            Pin 6: Orange
Pin 3: Weiß-Orange     Pin 7: Weiß-Braun
Pin 4: Blau            Pin 8: Braun
```

**TIA-568B:**

```
Pin 1: Weiß-Orange     Pin 5: Weiß-Blau
Pin 2: Orange          Pin 6: Grün
Pin 3: Weiß-Grün       Pin 7: Weiß-Braun
Pin 4: Blau            Pin 8: Braun
```

### 11.4 Lichtwellenleiter (LWL)

- Singlemode (9/125 µm): bis 100 km, hohe Bandbreite
- Multimode (50/125 µm OM3/OM4, 62,5/125 µm OM1): bis 2 km
- Wellenlängen: 850 nm, 1310 nm, 1550 nm
- Stecker: ST, SC, LC, MTRJ, E2000

---

## 12. Strukturierte Verkabelung (EN 50173-1)

### 12.1 Zweck

Eine **strukturierte Verkabelung** ermöglicht:

- Flexibilität bei Umzügen und Erweiterungen
- Einheitliche Standards
- Investitionsschutz

### 12.2 Hierarchischer Aufbau

```
              ┌──────────────────────┐
              │   Campusverteiler    │
              │       (CD)           │
              └──────────┬───────────┘
                         │
              ┌──────────┴───────────┐
              │  Gebäudeverteiler    │
              │       (BD)           │
              └──────────┬───────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────┴──────┐ ┌───────┴──────┐ ┌────────┴─────┐
│ Etagenverteiler│ │Etagenverteiler│ │ Etagenverteiler │
│     (IDF)     │ │     (IDF)     │ │     (IDF)      │
└───────┬──────┘ └───────┬──────┘ └────────┬──────┘
        │                │                │
   Endgeräte       Endgeräte       Endgeräte
```

### 12.3 Verkabelungs-Hierarchie

| Ebene | Verbindung | Maximale Länge |
|---|---|---|
| **Primärverkabelung** | CD ↔ BD | 1500 m (LWL) |
| **Sekundärverkabelung** | BD ↔ IDF | 500 m (LWL) |
| **Tertiärverkabelung** | IDF ↔ Dose | 90 m Twisted Pair |

### 12.4 Link-Klassen

| Klasse | Standard | Frequenz | Anwendung |
|---|---|---|---|
| Class D | CAT5e | 100 MHz | Fast Ethernet |
| Class E | CAT6 | 250 MHz | Gigabit Ethernet |
| Class EA | CAT6A | 500 MHz | 10 Gigabit Ethernet |
| Class F | CAT7 | 600 MHz | Rechenzentrum |
| Class FA | CAT7A | 1000 MHz | Backbone |

### 12.5 Patchfeld und Rangierverteiler

- **Patchfeld**: 19-Zoll-Komponente mit RJ45-Buchsen
- **Rangierverteiler**: strukturiertes Patchfeld für flexible Verbindungen
- **Spleißbox**: für LWL-Spleiße

### 12.6 Tertiärverkabelung

- Sternförmige Verkabelung von IDF zur Anschlussdose
- Maximal 90 m (ohne Patch-Kabel)
- Maximal 10 m Patch-Kabel
- Insgesamt maximal 100 m

### 12.7 TIA-942 (Rechenzentrum)

Speziell für Rechenzentren:

- Top-of-Rack, Middle-of-Row, End-of-Row
- Höhere Anforderungen an Redundanz
- Hot- und Cold-Aisle-Konfiguration

---

## 13. Handlungsauftrag: Drei Stationen

### 13.1 Station 1 — Topologien (Einzelarbeit, 15 min)

- Informationstext zu Topologien lesen
- Arbeitsblatt Topologien bearbeiten
- Ergebnisse dokumentieren

### 13.2 Station 2 — Kabelverbindungen (Einzelarbeit, 40 min)

- Infotext Koax-/Twisted-Pair-Kabel lesen
- Infotext Steckerbelegung RJ-Stecker lesen
- Infotext LWL-Kabel lesen
- Kabeltypen unterscheiden und Einsatzgebiete benennen

### 13.3 Station 3 — Strukturierte Verkabelung (Einzelarbeit, 25 min)

- Infotext Strukturierte Verkabelung lesen
- Skizze der eigenen Schulumgebung anfertigen
- Komponenten identifizieren

---

## 14. Bild- und Quellenverweise

### Bildverweise

- Bustopologie: <https://commons.wikimedia.org/wiki/Category:Network_topology>
- Sterntopologie: <https://de.wikipedia.org/wiki/Netzwerktopologie>
- RJ45-Stecker: <https://commons.wikimedia.org/wiki/File:Rj45plug-8p8c.png>
- LWL: <https://commons.wikimedia.org/wiki/Category:Fiber_optics>

### Quellen

- EN 50173-1: Informationstechnik — Universelle Gebäudeverkabelheit
- IEEE 802.3 (Ethernet)
- TIA-568 (Commercial Building Telecommunications Cabling Standard)
- TIA-942 (Telecommunications Infrastructure Standard for Data Centers)
- Tanenbaum, A.: *Computernetzwerke*
- Kurose, J., Ross, K.: *Computernetzwerke*

---

## 15. Lernaufgaben

### Übung 1 — Topologien zuordnen

Welche Topologie passt zu welchem Szenario?

- Klassisches Ethernet mit Hub
- Modernes Büronetz mit Switch
- WLAN mit mehreren APs
- Campus-Netz mit Redundanz

### Übung 2 — Kabellängen berechnen

Berechnen Sie die maximale Länge für Tertiärverkabelung bei 95 m Twisted Pair + Patch-Kabeln.

### Übung 3 — RJ45-Belegung

Erstellen Sie die Belegung für TIA-568A und TIA-568B.

### Übung 4 — Strukturierte Verkabelung skizzieren

Skizzieren Sie die strukturierte Verkabelung Ihres OSZ-Gebäudes.

### Übung 5 — Link-Klasse wählen

Welche Link-Klasse benötigen Sie für: Fast Ethernet, Gigabit Ethernet, 10 Gigabit Ethernet?

---

## 16. Zusammenfassung

| Topologie | Eigenschaft | Einsatz |
|---|---|---|
| Bus | Einfach, anfällig | veraltet |
| Stern | Standard, lokal ausfallsicher | LAN-Standard |
| Ring | Token-Passing, telekomm-tauglich | Telekom |
| Baum | Hierarchisch, skaliert | Rechenzentren, WAN |
| Masche | Hochverfügbar, redundant | Backbone |

**Kabeltypen:**

- Koax: Legacy (CATV, 10BASE2/5)
- Twisted Pair: CAT5e bis CAT8 (Standard-LAN)
- LWL: Singlemode (100+ km), Multimode (Rechenzentrum, Backbone)

**Strukturierte Verkabelung:**

- EN 50173-1 / EN 50173-2 / EN 50173-3
- Hierarchie: CD → BD → IDF → Dose
- Tertiärverkabelung: max. 90 m TP + 10 m Patch
- Link-Klassen: Class D bis FA

### Selbsttest-Checkliste

- [ ] Ich unterscheide physische und logische Topologie.
- [ ] Ich erkläre Stern-, Bus-, Ring-, Baum- und Maschentopologie.
- [ ] Ich wähle passende Kabeltypen aus.
- [ ] Ich erkläre die strukturierte Verkabelung.
- [ ] Ich kenne die maximalen Längen.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=1913 — Recherche 2026*
