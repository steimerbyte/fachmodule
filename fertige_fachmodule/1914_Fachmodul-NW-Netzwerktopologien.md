# Fachmodul: NW: Netzwerktopologien

**Kurs-ID:** 1914
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1914

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Topologie?](#2-was-ist-topologie)
3. [Physische vs. logische Topologie](#3-physische-vs-logische-topologie)
4. [Die wichtigsten Topologien](#4-die-wichtigsten-topologien)
5. [Zugriffsverfahren (logische Topologien)](#5-zugriffsverfahren-logische-topologien)
6. [Vergleich der Topologien](#6-vergleich-der-topologien)
7. [Übungen](#7-übungen)
8. [Zusammenfassung](#8-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- physische und logische Topologie unterscheiden,
- Bustopologie, Sterntopologie und Ringtopologie beschreiben,
- Zugriffsverfahren (CSMA/CD, Token Passing) erklären,
- Vor- und Nachteile jeder Topologie benennen,
- die passende Topologie für ein Szenario wählen.

---

## 2. Was ist Topologie?

Unter der **Topologie** wird die Struktur der Verbindung mehrerer Geräte des Netzes verstanden. Dabei ist zwischen der physischen und der logischen Struktur zu unterscheiden.

- **Physische Topologie**: hardwaremäßig vorhandene Verkabelung
- **Logische Topologie**: Datenfluss-Beschreibung (Zugriffsverfahren)

---

## 3. Physische vs. logische Topologie

| Aspekt | Physisch | Logisch |
|---|---|---|
| Was | Verkabelung | Datenübertragung |
| Beispiel | Sternverkabelung | Token Ring (logisch Ring, physisch Stern) |
| Sichtbar | Ja | Nein |

**Wichtiges Beispiel:** Ethernet heute ist physisch **Stern** (mit Switches), logisch aber wie Bus, aber mit Switches arbeitet jede Verbindung als Punkt-zu-Punkt (kein CSMA/CD mehr nötig).

---

## 4. Die wichtigsten Topologien

### 4.1 Bustopologie

```
[PC1]──┬──┬──┬──[Buskabel]──┬──┬──[PC2]
       │  │  │
      [PC3] [PC4]
```

**Eigenschaften:**

- Alle Geräte teilen sich ein gemeinsames Kabel
- Abschlusswiderstände (Terminatoren) an beiden Enden
- Kollisionen möglich → CSMA/CD
- Bei Kabelbruch fällt das gesamte Netz aus

**Logische Topologie:** Bus (Broadcast)

### 4.2 Sterntopologie

```
       [PC1]
         |
       [Switch]
       /  |  \
      /   |   \
   [PC2] [PC3] [PC4]
```

**Eigenschaften:**

- Alle Geräte an einem zentralen Knoten
- Bei Switches: Punkt-zu-Punkt-Verbindungen
- Bei Hub: Broadcast

**Logische Topologie:** bei Switches effektiv Punkt-zu-Punkt

### 4.3 Ringtopologie

```
[PC1]──[PC2]
  │         │
[PC6]     [PC3]
  │         │
[PC5]──[PC4]
```

**Eigenschaften:**

- Jedes Gerät mit zwei Nachbarn verbunden
- Token Passing (Recht zum Senden)
- Single Point of Failure

**Logische Topologie:** Ring

### 4.4 Baumtopologie

```
       [Kern-Switch]
       /          \
[Verteiler 1]  [Verteiler 2]
    |  |  \      /  |  |
   PC PC PC  PC  PC PC
```

**Eigenschaften:**

- Hierarchische Struktur
- Kombination mehrerer Sterne

**Logische Topologie:** wie Stern

### 4.5 Maschentopologie

```
   [A]──[B]
   /│    │\
  / │    │ \
[C]─┼────┼──[D]
  \ │    │ /
   \│    │/
   [E]──[F]
```

**Eigenschaften:**

- Mehrere Verbindungen pro Knoten
- Hohe Ausfallsicherheit durch Redundanz
- Komplexes Routing

**Logische Topologie:** Masche (Routing)

---

## 5. Zugriffsverfahren (logische Topologien)

### 5.1 CSMA/CD (Carrier Sense Multiple Access / Collision Detection)

**Verfahren:**

1. **Carrier Sense**: Vor dem Senden hört das Gerät das Medium ab
2. **Multiple Access**: Mehrere Geräte teilen sich das Medium
3. **Collision Detection**: Wenn zwei gleichzeitig senden, wird die Kollision erkannt
4. Beide Geräte warten eine zufällige Zeit und senden erneut

**Einsatz:** Klassisches Ethernet (10BASE5, 10BASE2, 10BASE-T mit Hub)

**Heute:** Mit Switches nicht mehr relevant, da Punkt-zu-Punkt-Verbindungen

### 5.2 CSMA/CA (Collision Avoidance)

**Verfahren:**

- WLAN (Wi-Fi)
- Vermeidet Kollisionen, da nicht erkennbar (Sender kann eigene Sendung nicht hören)
- RTS/CTS-Handshake oder Backoff

### 5.3 Token Passing

**Verfahren:**

- Spezielles Datenpaket (Token) wandert durch den Ring
- Nur wer das Token hat, darf senden
- Garantiert keine Kollisionen
- Deterministische Performance

**Einsatz:** Token Ring (IBM), FDDI, ARCNET

### 5.4 Token Bus

**Verfahren:**

- Token wandert nur auf logischem Ring (Teilnehmern zugewiesener Reihenfolge)
- Heute selten

---

## 6. Vergleich der Topologien

| Topologie | Aufwand | Ausfall | Performance | Zugriff | Heute |
|---|---|---|---|---|---|
| Bus | gering | Total | gering | CSMA/CD | veraltet |
| Stern | mittel | lokal | hoch | CSMA/CD (Hub) / P2P (Switch) | Standard |
| Ring | mittel | total | hoch | Token | Telekom |
| Baum | mittel-hoch | partiell | hoch | CSMA/CD | Standard |
| Masche | hoch | keiner | hoch | Routing | Backbone |

---

## 7. Übungen

### Übung 1 — Topologien erkennen

Beschreiben Sie die Topologie Ihres Schulnetzwerks.

### Übung 2 — Szenarien zuordnen

Welche Topologie passt für:

- 5-PC-Heimnetz
- Campus mit 1000 Teilnehmern
- Rechenzentrum mit höchster Verfügbarkeit
- Produktionshalle mit Echtzeitanforderungen

### Übung 3 — CSMA/CD erklären

Erklären Sie CSMA/CD Schritt für Schritt und warum es bei modernen Switch-Netzwerken nicht mehr relevant ist.

### Übung 4 — Token Passing

Welche Vorteile hat Token Passing gegenüber CSMA/CD?

### Übung 5 — Mesh-Topologie

Warum ist eine vollständige Masche in der Praxis zu teuer? Welche Alternative gibt es?

---

## 8. Zusammenfassung

| Aspekt | Wissen |
|---|---|
| Physische Topologie | Verkabelungsstruktur (Bus, Stern, Ring, Baum, Masche) |
| Logische Topologie | Datenfluss / Zugriffsverfahren |
| CSMA/CD | Standard in Ethernet (mit Hub); bei Switch entbehrlich |
| Token Passing | Token Ring, FDDI, ARCNET |
| Standard heute | Stern mit Switch |

### Selbsttest-Checkliste

- [ ] Ich unterscheide physische und logische Topologie.
- [ ] Ich erkläre CSMA/CD.
- [ ] Ich erkläre Token Passing.
- [ ] Ich wähle Topologien situationsgerecht aus.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=1914 — Recherche 2026*
