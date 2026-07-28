# Fachmodul: Strukturierte Verkabelung EN 50173

**Kurs-ID:** 4664
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4664

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Strukturierte Verkabelung – Überblick](#2-strukturierte-verkabelung--überblick)
3. [Normen und Standards](#3-normen-und-standards)
4. [Drei Verkabelungsebenen](#4-drei-verkabelungsebenen)
5. [Subsysteme und Verteiler](#5-subsysteme-und-verteiler)
6. [Übertragungsklassen](#6-übertragungsklassen)
7. [Medien in der strukturierten Verkabelung](#7-medien-in-der-strukturierten-verkabelung)
8. [Patchfelder und Rangierverteiler](#8-patchfelder-und-rangierverteiler)
9. [Universelle Gebäudeverkabelung (UGV)](#9-universelle-gebaeudeverkabelung-ugv)
10. [TIA-942 für Rechenzentren](#10-tia-942-für-rechenzentren)
11. [EN 50600 (Europäische Rechenzentrums-Norm)](#11-en-50600-europaische-rechenzentrums-norm)
12. [Beispiel: OSZ-Gebäudeverkabelung](#12-beispiel-osz-gebaeudeverkabelung)
13. [Bild- und Quellenverweise](#13-bild-und-quellenverweise)
14. [Übungen](#14-übungen)
15. [Zusammenfassung](#15-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- den Aufbau der strukturierten Verkabelung nach EN 50173 erklären,
- die drei Verkabelungsebenen unterscheiden,
- Übertragungsklassen zuordnen,
- Patchfelder und Verteiler benennen,
- Anforderungen für Rechenzentren erläutern,
- die Verkabelung des eigenen Gebäudes planen.

---

## 2. Strukturierte Verkabelung – Überblick

Die **strukturierte Verkabelung** ist eine nach internationalen Normen (EN 50173, ISO/IEC 11801, TIA-568/TIA-942) aufgebaute, hersteller- und anwendungsneutrale passive Infrastruktur. Sie trennt das physische Netz von den aktiven Komponenten, sodass Änderungen an Endgeräten oder Protokollen ohne neue Kabel möglich sind.

**Vorteile:**

- Herstellerunabhängigkeit
- Flexible Erweiterbarkeit
- Investitionsschutz (15+ Jahre Lebensdauer)
- Standardisierte Komponenten
- Dokumentation und Messbarkeit

---

## 3. Normen und Standards

| Norm | Beschreibung |
|---|---|
| **EN 50173-1** | Universelle Gebäudeverkabelung |
| **EN 50173-2** | Büroverkabelung |
| **EN 50173-3** | Industrieverkabelung |
| **EN 50173-4** | Wohnungen |
| **EN 50173-5** | Rechenzentren |
| **ISO/IEC 11801** | Internationaler Standard |
| **TIA-568** | US-Standard für Büroverkabelung |
| **TIA-942** | Rechenzentrum-Telekommunikations-Infrastruktur |
| **EN 50600** | Europäische Rechenzentrums-Norm |

---

## 4. Drei Verkabelungsebenen

### 4.1 Übersicht

| Ebene | Name | Verbindung | Maximale Länge |
|---|---|---|---|
| **Primär** | Campus-Backbone | CD ↔ BD | 1500 m (LWL) |
| **Sekundär** | Gebäude-Backbone | BD ↔ IDF | 500 m (LWL) |
| **Tertiär** | Stockwerkverkabelung | IDF ↔ Dose | 90 m + 10 m Patch |

### 4.2 Hierarchische Struktur

```
              ┌──────────────────────┐
              │   Campusverteiler    │   Campus Distributor (CD)
              │       (CD)           │
              └──────────┬───────────┘
                         │
              ┌──────────┴───────────┐
              │  Gebäudeverteiler    │   Building Distributor (BD)
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

### 4.3 Verteiler-Bezeichnungen

| Deutsch | Englisch | Aufgabe |
|---|---|---|
| **Campusverteiler (CV)** | Campus Distributor (CD) | Verbindung zwischen Gebäuden |
| **Gebäudeverteiler (GV)** | Building Distributor (BD) | Verbindung Stockwerke |
| **Etagenverteiler (EV)** | Floor Distributor (FD) | Patchfeld für Endgeräte |

---

## 5. Subsysteme und Verteiler

### 5.1 Primärverkabelung

- Verbindung zwischen Campus- und Gebäudeverteilern
- **Glasfaser (Singlemode)**, gelegentlich Multimode
- Maximale Länge: 1500 m (LWL), Backup: redundante Strecken
- Spleiße in Spleißboxen

### 5.2 Sekundärverkabelung

- Verbindung zwischen Gebäudeverteiler und Etagenverteilern
- **LWL (Multimode OM3/OM4) oder Singlemode**
- Hochwertige Kupferkabel (selten)
- Maximale Länge: 500 m

### 5.3 Tertiärverkabelung

- Verbindung von Etagenverteiler zur Anschlussdose
- **Twisted Pair (Cat. 6 oder besser)**
- Sternförmige Verkabelung
- Maximale Gesamtlänge: 100 m (90 m TP + 10 m Patch)

### 5.4 Konsolidierungspunkte (CP)

Optionale Verteiler zur Konsolidierung mehrerer Anschlussdosen — heute selten verwendet.

---

## 6. Übertragungsklassen

| Klasse | Standard | Bandbreite | Anwendung |
|---|---|---|---|
| **Class A** | CAT1 | 0,1 MHz | Telefon |
| **Class B** | CAT2 | 1 MHz | ISDN |
| **Class C** | CAT3 | 16 MHz | Token Ring, 10BASE-T |
| **Class D** | CAT5e | 100 MHz | Fast Ethernet, 1000BASE-T |
| **Class E** | CAT6 | 250 MHz | 1 Gbit/s, 10 Gbit/s (kurz) |
| **Class EA** | CAT6A | 500 MHz | 10 Gbit/s (100 m) |
| **Class F** | CAT7 | 600 MHz | 10 Gbit/s+ |
| **Class FA** | CAT7A | 1000 MHz | 10/40 Gbit/s |
| **Class I/II** | CAT8 | 2000 MHz | 25/40 Gbit/s (30 m) |

---

## 7. Medien in der strukturierten Verkabelung

### 7.1 Tertiärverkabelung

- Twisted Pair CAT5e bis CAT6A
- Maximal 100 m (90 m TP + 10 m Patch)
- Sternförmig

### 7.2 Sekundär- und Primärverkabelung

- LWL Single- oder Multimode
- Reichweiten je nach Wellenlänge und Faser

| Faser | Wellenlänge | Reichweite |
|---|---|---|
| OM3 (Multimode) | 850 nm | 300 m (10 Gbit/s) |
| OM4 (Multimode) | 850 nm | 550 m (10 Gbit/s) |
| OS2 (Singlemode) | 1310 nm | 10+ km |
| OS2 (Singlemode) | 1550 nm | 40+ km |

### 7.3 Link-Budget und Dämpfung

Gesamtdämpfung = Kabellänge × Faser-Dämpfung/km + Steckerverluste + Spleißverluste + Sicherheitsreserve

---

## 8. Patchfelder und Rangierverteiler

### 8.1 Patchfeld

- 19-Zoll-Komponente
- Patchfelder mit 24 oder 48 RJ45-Ports (Twisted Pair)
- Patchfelder mit LC/SC-Ports (LWL)
- Höheneinheit: 1–2 HE

### 8.2 Rangierverteiler

- Strukturierte Anordnung mehrerer Patchfelder
- Kabelmanagement (Kabelführungen, Rangierbügel)
- Beschriftung
- 19-Zoll-Schrank mit verschiedenen Höheneinheiten

### 8.3 19-Zoll-Schrank (Server-/Netzwerkschrank)

- Höheneinheiten: 22 HE (Wandschrank) bis 48 HE (Standverteiler)
- Tiefe: 600, 800 oder 1000 mm
- Stromversorgung, Belüftung, PDUs

### 8.4 Beschriftung

- Port-IDs nach EN 50173-1
- Patchfeld-Position
- Dokumentation in Patch-Dokumentation
- Farbcodes möglich

---

## 9. Universelle Gebäudeverkabelung (UGV)

### 9.1 Definition

In Deutschland hat sich die **Universelle Gebäudeverkabelung (UGV)** als Variante der strukturierten Verkabelung etabliert. Sie unterstützt sowohl Datendienste als auch Telefonie auf denselben Kabeln.

### 9.2 Eigenschaften

- Entspricht konzeptionell der UTP-Verkabelung nach TIA-568
- Sternförmige Topologie
- Patchfelder mit RJ45 (Standard)
- LWL für Backbone
- Patch-Dokumentation erforderlich

### 9.3 Vorteile

- Sprach- und Datenübertragung über gleiche Kabel
- Flexible Zuordnung
- Investitionsschutz
- Geringere Komplexität

---

## 10. TIA-942 für Rechenzentren

### 10.1 Zweck

TIA-942 ist der **Telecommunications Infrastructure Standard for Data Centers**. Er definiert Anforderungen für hochverfügbare Rechenzentrums-Infrastrukturen.

### 10.2 Tiers

| Tier | Verfügbarkeit | Redundanz |
|---|---|---|
| **Tier I** | 99,671 % | keine |
| **Tier II** | 99,741 % | partielle |
| **Tier III** | 99,982 % | N+1 |
| **Tier IV** | 99,995 % | 2(N+1) |

### 10.3 TIA-942 Topologien

| Topologie | Beschreibung |
|---|---|
| **EoR (End-of-Row)** | Switches am Ende einer Reihe |
| **ToR (Top-of-Rack)** | Switches im Rack oben |
| **MoR (Middle-of-Row)** | Switches in der Mitte einer Reihe |

### 10.4 Spine-Leaf

```
        [Spine 1]  [Spine 2]  [Spine 3]
            /|\        /|\        /|\
           / | \      / | \      / | \
          /  |  \    /  |  \    /  |  \
       [Leaf1] [Leaf2] [Leaf3] [Leaf4] [Leaf5]
          |       |       |       |       |
       Server  Server  Server  Server  Server
```

**Eigenschaften:**

- Jeder Leaf-Switch ist mit jedem Spine-Switch verbunden
- Zwischen zwei Servern: maximal 2 Hops
- Non-blocking bei R ≥ M (Spines ≥ Leaves)
- ECMP-Routing für Lastverteilung

---

## 11. EN 50600 (Europäische Rechenzentrums-Norm)

### 11.1 Überblick

Die **EN 50600** ist die europäische Norm für Rechenzentren und unterteilt sich in mehrere Teile:

| Teil | Thema |
|---|---|
| EN 50600-1 | Allgemeine Konzepte |
| EN 50600-2-1 | Gebäudekonstruktion |
| EN 50600-2-2 | Stromversorgung |
| EN 50600-2-3 | Klimatisierung |
| EN 50600-2-4 | Telekommunikations-Infrastruktur |

### 11.2 Verfügbarkeitsklassen

| Klasse | Beschreibung |
|---|---|
| **Class 1** | einfache Infrastruktur |
| **Class 2** | redundante Komponenten |
| **Class 3** | Wartungsfreundlich, parallel wartbar |
| **Class 4** | Fehlertolerant, höchste Verfügbarkeit |

---

## 12. Beispiel: OSZ-Gebäudeverkabelung

### 12.1 Komponenten

- **CD (Campusverteiler)**: Hauptgebäude, Serverraum
- **BDs (Gebäudeverteiler)**: pro Gebäude einer
- **FDs (Etagenverteiler)**: pro Stockwerk
- **Anschlussdosen**: in jedem Klassenraum, Büro

### 12.2 Verkabelung

- Primärverkabelung: LWL zwischen Gebäuden
- Sekundärverkabelung: LWL zu Etagenverteilern
- Tertiärverkabelung: Cat6 (oder höher) zu den Dosen

### 12.3 Aktive Komponenten

- Core-Switch im CD
- Access-Switches in jedem FD
- WLAN-APs für drahtlosen Zugang

---

## 13. Bild- und Quellenverweise

- Strukturierte Verkabelung: <https://de.wikipedia.org/wiki/Strukturierte_Verkabelung>
- EN 50173 Norm: <https://www.din.de/de/mitwirken/normenausschuesse/nasg/normen/wdc-beuth:din21:268929950>
- TIA-942: <https://tiaonline.org/>
- EN 50600: <https://www.din.de/de/mitwirken/normenausschuesse/nasg/normen/wdc-beuth:din21:268929950>
- Rosenberger Strukturierte Verkabelung: <https://osi.rosenberger.com/de/news-media/strukturierte-verkabelung-en-50173/>
- Prior1 Strukturierte Verkabelung: <https://prior1.com/blog/vorteile-einer-professionellen-strukturierten-verkabelung-im-und-um-das-rechenzentrum-nicht-unterschaetzen/>

---

## 14. Übungen

### Übung 1 — Verteiler benennen

Benennen Sie die Verteiler (CD/BD/FD) im Schema Ihres OSZ.

### Übung 2 — Längen planen

Berechnen Sie die maximalen Kabellängen für ein Stockwerk mit 80-m-Verkabelung.

### Übung 3 — Klasse wählen

Welche Klasse (Class D/EA/F/FA) benötigen Sie für 1 Gbit/s, 10 Gbit/s, 40 Gbit/s?

### Übung 4 — Rechenzentrum Tier

Welche Tier-Klasse (TIA-942) entspricht welcher EN 50600-Klasse?

### Übung 5 — Patchplan

Erstellen Sie einen Patchplan für ein Stockwerk mit 20 Dosen.

---

## 15. Zusammenfassung

Die **strukturierte Verkabelung nach EN 50173 / ISO/IEC 11801 / TIA-942 / EN 50600** ist die Grundlage jedes modernen Büro- und Rechenzentrumsnetzes.

**Drei Ebenen:**

| Ebene | Medium | Max. Länge |
|---|---|---|
| Primär | LWL (Singlemode) | 1500 m |
| Sekundär | LWL (Multimode/Singlemode) | 500 m |
| Tertiär | TP (Cat6/6A) | 100 m |

**Verteiler:**

| Verteiler | Funktion |
|---|---|
| CD | Campus-Backbone |
| BD | Gebäude-Backbone |
| FD | Stockwerk-Verteilung |

**Link-Klassen (Cat.6A):**

- 10 Gbit/s über 100 m
- Klasse EA
- Standard für Neuinstallationen

**Rechenzentren:**

- TIA-942 Tier I–IV
- EN 50600 Class 1–4
- Spine-Leaf-Architektur

### Selbsttest-Checkliste

- [ ] Ich erkläre die drei Verkabelungsebenen.
- [ ] Ich benenne die Verteiler und ihre Funktion.
- [ ] Ich wähle Übertragungsklassen für Anwendungen aus.
- [ ] Ich erkläre Spine-Leaf für Rechenzentren.
- [ ] Ich kenne die Anforderungen für TIA-942 / EN 50600.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4664 — Recherche 2026*
