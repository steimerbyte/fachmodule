# Fachmodul: Grundlagen Excel

**Kurs-ID:** 3531
**Kategorie:** Kursbibliothek / Fachmodule / Wirtschaft
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3531

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Excel – Überblick](#2-excel--überblick)
3. [Arbeitsoberfläche und Grundlagen](#3-arbeitsoberflache-und-grundlagen)
4. [Formeln und Funktionen](#4-formeln-und-funktionen)
5. [Diagramme](#5-diagramme)
6. [Pivot-Tabellen](#6-pivot-tabellen)
7. [Tipps und Tricks](#7-tipps-und-tricks)
8. [Übungen](#8-übungen)
9. [Zusammenfassung](#9-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- mit Excel Arbeitsblätter erstellen,
- Formeln und Funktionen anwenden,
- Diagramme erstellen,
- Pivot-Tabellen nutzen.

---

## 2. Excel – Überblick

**Microsoft Excel** ist das meistgenutzte **Tabellenkalkulationsprogramm** der Welt.

**Einsatzgebiete:**

- Datenverarbeitung
- Berechnungen und Auswertungen
- Diagramme und Visualisierungen
- Berichte und Dashboards
- Datenanalyse mit Pivot

---

## 3. Arbeitsoberfläche und Grundlagen

### 3.1 Oberfläche

- **Menüband (Ribbon)**: Reiter (Start, Einfügen, Formeln, Daten)
- **Bearbeitungsleiste**: zeigt aktuelle Zelle und Formel
- **Arbeitsblatt**: Tabelle aus Zellen
- **Arbeitsmappe**: Datei mit mehreren Arbeitsblättern

### 3.2 Zellen

- **Spalte** (A, B, C, ...) und **Zeile** (1, 2, 3, ...) → Zelladresse (z. B. A1)
- Jede Zelle kann Text, Zahl, Datum oder Formel enthalten

### 3.3 Datentypen

- **Text**: "Hallo"
- **Zahl**: 42, 3.14
- **Datum**: 01.01.2024
- **Währung**: € 100,00
- **Boolesch**: WAHR/FALSCH

### 3.4 Formatierung

- Schriftart, -größe, -farbe
- Zahlenformat (Währung, Prozent)
- Hintergrundfarbe, Rahmen
- Bedingte Formatierung

---

## 4. Formeln und Funktionen

### 4.1 Formel-Grundlagen

Formel beginnt mit `=`:

```
=A1+B1
=SUMME(A1:A10)
=WENN(A1>100; "hoch"; "niedrig")
```

### 4.2 Wichtige Funktionen

| Funktion | Bedeutung |
|---|---|
| `SUMME(Bereich)` | Summe |
| `MITTELWERT(Bereich)` | Durchschnitt |
| `MIN`, `MAX` | Minimum, Maximum |
| `ANZAHL(Bereich)` | Anzahl Zahlen |
| `ANZAHL2(Bereich)` | Anzahl nicht-leerer Zellen |
| `WENN(Bedingung; Dann; Sonst)` | Bedingung |
| `SVERWEIS(Suchwert; Tabelle; Spalte; Bereich_Verweis)` | Suche in Tabelle |
| `WVERWEIS` | Horizontaler Verweis |
| `XVERWEIS` | Moderner Verweis (Office 365) |
| `INDEX`, `VERGLEICH` | Matrix-Lookup |
| `LINKS`, `RECHTS`, `TEIL` | Text-Funktionen |
| `LÄNGE` | Textlänge |
| `HEUTE`, `JETZT` | Datum |
| `KALENDERWOCHE` | Kalenderwoche |
| `DATEDIF` | Differenz zwischen Daten |
| `RUNDEN`, `AUFRUNDEN`, `ABRUNDEN` | Runden |
| `ZUFALLSZAHL`, `ZUFALLSBEREICH` | Zufallszahlen |

### 4.3 Verschachtelte Funktionen

```
=WENN(A1>100; SUMME(B1:B10)*1,19; SUMME(B1:B10))
```

### 4.4 Zellbezüge

- **Relativ**: A1 (verändert sich beim Kopieren)
- **Absolut**: $A$1 (bleibt gleich)
- **Gemischt**: $A1 oder A$1
- **Tabellenübergreifend**: `Tabelle1!A1`

---

## 5. Diagramme

### 5.1 Diagrammtypen

| Typ | Verwendung |
|---|---|
| **Balken-/Säulendiagramm** | Vergleich |
| **Liniendiagramm** | zeitliche Entwicklung |
| **Kreisdiagramm** | Anteile |
| **Punktdiagramm** | Korrelationen |
| **Flächendiagramm** | Volumen über Zeit |
| **Boxplot** | Verteilungen |

### 5.2 Erstellung

1. Daten markieren
2. Einfügen → Diagramm
3. Typ wählen
4. Datenreihen zuordnen
5. Layout anpassen
6. Achsen beschriften

### 5.3 Formatierung

- Titel, Legende
- Farben, Schriftarten
- Achsen skalieren
- Datenbeschriftungen

---

## 6. Pivot-Tabellen

### 6.1 Zweck

**Pivot-Tabellen** fassen große Datenmengen nach **verschiedenen Dimensionen** zusammen.

### 6.2 Erstellung

1. Daten markieren
2. Einfügen → PivotTable
3. Zeilen, Spalten, Werte definieren
4. Filter setzen

### 6.3 Beispiel

```
Daten: Verkäufe (Datum, Produkt, Region, Menge, Preis)

Pivot:
- Zeilen: Produkt
- Spalten: Region
- Werte: Summe(Preis)
- Filter: Datum > 01.01.2024
```

### 6.4 Pivot-Charts

- Visualisierung der Pivot-Tabelle als Diagramm
- Interaktive Filter

---

## 7. Tipps und Tricks

### 7.1 Tastenkürzel

| Aktion | Shortcut |
|---|---|
| Neue Zeile einfügen | Strg+`+` |
| Formel anzeigen | `=` |
| Kopieren | Strg+C |
| Einfügen | Strg+V |
| Rückgängig | Strg+Z |
| Wiederherstellen | Strg+Y |
| Zelle bearbeiten | F2 |
| Speichern | Strg+S |
| Filter aktivieren | Strg+Shift+L |
| Pivot aktualisieren | Alt+F5 |

### 7.2 Tipps

- **Namen für Bereiche** vergeben (z. B. `=SUMME(Umsatz)`)
- **Tabellenformat** für strukturierte Daten (Strg+T)
- **Datenvalidierung** für Eingabebeschränkung
- **Solver** für Optimierung
- **Zielwertsuche**: Daten → Was-wäre-wenn-Analyse
- **Datenüberprüfung**: Formel-Editor

### 7.3 Häufige Fehler vermeiden

- Keine zusammengeführten Zellen für Daten
- Keine Daten in Kommentaren
- Konsistente Datumsformate
- Keine leeren Zeilen/Spalten in Daten

---

## 8. Übungen

### Übung 1 — Grundrechenarten

Erstellen Sie eine Tabelle mit Rechenaufgaben.

### Übung 2 — WENN-Funktion

Erstellen Sie eine Funktion zur Notenberechnung.

### Übung 3 — SVERWEIS

Erstellen Sie eine Anwendung mit SVERWEIS.

### Übung 4 — Diagramm

Erstellen Sie ein Säulendiagramm für Verkaufszahlen.

### Übung 5 — Pivot-Tabelle

Erstellen Sie eine Pivot-Tabelle für Verkaufsdaten.

### Übung 6 — Bedingte Formatierung

Formatieren Sie Zellen bedingt (z. B. rot bei negativen Werten).

---

## 9. Zusammenfassung

**Excel** ist das Standardwerkzeug für Tabellenkalkulation:

**Grundlagen:**

- Zellbezüge: relativ/absolut
- Datentypen
- Formatierung

**Funktionen:**

- SUMME, MITTELWERT, WENN, SVERWEIS, INDEX/VERGLEICH
- Verschachtelte Funktionen

**Diagramme:**

- Säulen, Balken, Linien, Torten
- Pivot-Charts

**Pivot-Tabellen:**

- Daten zusammenfassen
- Mehrere Dimensionen

### Selbsttest-Checkliste

- [ ] Ich nutze Formeln und Funktionen.
- [ ] Ich erstelle Diagramme.
- [ ] Ich baue Pivot-Tabellen.
- [ ] Ich nutze Tastenkürzel.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3531 — Recherche 2026*
