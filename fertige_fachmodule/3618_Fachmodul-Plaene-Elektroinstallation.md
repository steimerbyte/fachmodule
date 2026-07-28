# Fachmodul: Pläne der Elektroinstallation

**Kurs-ID:** 3618
**Kategorie:** Kursbibliothek / Fachmodule / Elektroinstallation
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3618

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Installationsplan – Überblick](#2-installationsplan--überblick)
3. [Stromlaufplan](#3-stromlaufplan)
4. [Installationsplan (Grundriss)](#4-installationsplan-grundriss)
5. [Übersichtsschaltplan](#5-übersichtsschaltplan)
6. [Verteilerplan](#6-verteilerplan)
7. [Symbole und Schaltzeichen](#7-symbole-und-schaltzeichen)
8. [Softwaretools](#8-softwaretools)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Installationspläne lesen und erstellen,
- verschiedene Planungsarten unterscheiden,
- Schaltzeichen und Symbole interpretieren,
- Softwaretools zur Planung nutzen.

---

## 2. Installationsplan – Überblick

Die Planung einer Elektroinstallation erfordert mehrere Planungsdokumente:

| Plan | Zweck |
|---|---|
| **Stromlaufplan** | Logische Verschaltung der Komponenten |
| **Installationsplan** | Position der Geräte im Gebäude |
| **Übersichtsschaltplan** | Vereinfachte Darstellung der Stromverteilung |
| **Verteilerplan** | Innenleben der Verteilerschränke |

Alle Pläne müssen zusammenpassen und auf dem gleichen Stand sein.

---

## 3. Stromlaufplan

### 3.1 Definition

Ein **Stromlaufplan** zeigt die **logische Verschaltung** aller Komponenten. Er beschreibt, wie die elektrischen Bauteile verbunden sind — unabhängig von ihrer räumlichen Lage.

### 3.2 Symbole (Beispiele)

| Symbol | Bedeutung |
|---|---|
| ⏚ | Schutzleiteranschluss |
| ⊗ | Lampe |
| ⚡ | Steckdose |
| ⏛ | Schalter |
| ⏹ | LS-Schalter |
| ⏺ | FI-Schalter |

### 3.3 Beispiel: Steckdose mit Schutz

```
L ──── [LS B16] ──── [Steckdose] ──── N
                     │
                     ⏚ PE
```

---

## 4. Installationsplan (Grundriss)

### 4.1 Definition

Der **Installationsplan** zeigt die **Position aller elektrischen Betriebsmittel** im Gebäudegrundriss.

### 4.2 Inhalt

- Steckdosen
- Lichtauslässe
- Schalter
- Verteiler
- Kabeltrassen
- Erdungsanlage
- Antennen- und Netzwerkdosen

### 4.3 Symbole (DIN EN 60617)

| Symbol | Bedeutung |
|---|---|
| ⊗ | Lichtauslass |
| ⊗° | Lichtauslass mit Bewegungsmelder |
| ⚡ | Steckdose |
| ⚡⊗ | Kombi-Auslass |
| ⏛ | Ausschalter |
| ⏛⏛ | Wechselschalter |
| ⏛⏛⏛ | Kreuzschalter |
| ⏚ | Schutzleiter-Anschluss |
| ⏹ | Verteiler |

### 4.4 Höhenangaben

Typische Montagehöhen:

| Element | Höhe über OKF |
|---|---|
| Steckdose (Wohnen) | 30 cm |
| Steckdose (Küche Arbeitsplatte) | 110 cm |
| Lichtschalter | 105 cm |
| Wandleuchte | 150-180 cm |
| Verteiler | 150-180 cm |

OKF = Oberkante Fertigfußboden

---

## 5. Übersichtsschaltplan

### 5.1 Definition

Ein **Übersichtsschaltplan** zeigt die **vereinfachte Darstellung der Hauptstromkreise** — von der Einspeisung über die Hauptverteilung bis zu den Unterverteilungen.

### 5.2 Inhalt

- Hausanschluss
- Zähler
- Hauptverteilung
- Unterverteilungen
- Hauptstromkreise mit Querschnitten und Absicherungen

### 5.3 Symbole

| Symbol | Bedeutung |
|---|---|
| ⊘ | Transformator |
| ⚡ | Energiezähler |
| ⊗ | Leistungsschalter |
| ⏹ | Schaltgerät |
| ─ | Einfachleitung |
| ═ | Dreifachleitung (3 Phasen) |

---

## 6. Verteilerplan

### 6.1 Definition

Ein **Verteilerplan** zeigt die **Bestückung und Verdrahtung** eines Stromkreisverteilers.

### 6.2 Inhalt

- Anordnung der Schutzgeräte
- Reihenfolge der Stromkreise
- Klemmenbelegung
- Beschriftung

### 6.3 Typische Anordnung

```
┌─────────────────────────────────┐
│  [Hauptschalter]                 │
├─────────────────────────────────┤
│  [FI 1]    [FI 2]    [FI 3]     │
├─────────────────────────────────┤
│  [LS] [LS] [LS] [LS] [LS] [LS]  │
│   L1   L1   L1   L2   L2   L3   │
├─────────────────────────────────┤
│  [Reihenklemmen N + PE]         │
└─────────────────────────────────┘
```

---

## 7. Symbole und Schaltzeichen

### 7.1 Norm

- **DIN EN 60617**: international genormte Schaltzeichen
- Früher: DIN 40900

### 7.2 Beispiele

| Symbol | Komponente |
|---|---|
| ─ ─ | Einpoliger Schalter |
| ─┤├─ | LS-Schalter |
| ─⌇─ | FI-Schalter |
| ⏚ | Schutzleiter |
| ⏛ | Ausschalter |
| ⏛⏛ | Wechselschalter |
| ⚡ | Steckdose |
| ⊗ | Leuchte |
| ⏍ | Schütz |
| ⊐─ | Sicherung |

### 7.3 Anordnungsplan

- Symbole werden im Installationsplan positioniert
- Stromlaufplan zeigt logische Verschaltung
- Verteilerplan zeigt Innenleben des Verteilers

---

## 8. Softwaretools

### 8.1 Elektro-CAD

- **DDS-CAD**: Marktführer in Deutschland
- **Trimble Nova**: Elektro- und Haustechnik
- **StriePlan**: Solar-Planung
- **AutoCAD**: allgemeine CAD, mit Elektro-Symbolbibliotheken
- **Target Elektroplanung**: einfache Lösung

### 8.2 Funktionen

- Grundrisse zeichnen
- Symbole platzieren
- Stromlaufplan zeichnen
- Stücklisten generieren
- Ausschreibungstexte erstellen

---

## 9. Übungen

### Übung 1 — Symbole

Welches Symbol steht für: Steckdose, Lichtauslass, Schutzleiter?

### Übung 2 — Stromlaufplan

Zeichnen Sie einen Stromlaufplan für eine Steckdose mit LS B16 und FI 30 mA.

### Übung 3 — Installationsplan

Erstellen Sie einen Installationsplan für einen 20-m²-Raum.

### Übung 4 — Verteilerplan

Zeichnen Sie einen Verteilerplan für eine Wohnung mit 8 Stromkreisen.

### Übung 5 — Höhenangaben

In welcher Höhe werden welche Komponenten installiert?

---

## 10. Zusammenfassung

**Installationsplanung** umfasst mehrere Dokumente:

| Plan | Zweck |
|---|---|
| **Stromlaufplan** | logische Verschaltung |
| **Installationsplan** | Position der Betriebsmittel |
| **Übersichtsschaltplan** | Hauptstromkreise |
| **Verteilerplan** | Innenleben der Verteilerschränke |

**Symbole nach DIN EN 60617**

**Softwaretools:** DDS-CAD, Trimble Nova, StriePlan, AutoCAD, Target

**Standard-Höhen:** Steckdosen 30 cm, Schalter 105 cm, Verteiler 150-180 cm

### Selbsttest-Checkliste

- [ ] Ich unterscheide die Planungsarten.
- [ ] Ich interpretiere Schaltzeichen.
- [ ] Ich nutze Installationsplan-Werkzeuge.
- [ ] Ich erstelle einen Verteilerplan.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3618 — Recherche 2026*
