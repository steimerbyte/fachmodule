# Fachmodul: Stromkreisverteiler

**Kurs-ID:** 3570
**Kategorie:** Kursbibliothek / Fachmodule / Elektroinstallation
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3570

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Stromkreisverteiler – Überblick](#2-stromkreisverteiler--überblick)
3. [Aufbau und Komponenten](#3-aufbau-und-komponenten)
4. [Schutzgeräte](#4-schutzgeräte)
5. [Dimensionierung](#5-dimensionierung)
6. [Verkabelung im Verteiler](#6-verkabelung-im-verteiler)
7. [Normen und Vorschriften](#7-normen-und-vorschriften)
8. [Dokumentation und Beschriftung](#8-dokumentation-und-beschriftung)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Aufbau und Komponenten eines Stromkreisverteilers erklären,
- Schutzgeräte korrekt auswählen,
- einen Verteiler normgerecht planen und verdrahten,
- die Beschriftung und Dokumentation umsetzen.

---

## 2. Stromkreisverteiler – Überblick

Ein **Stromkreisverteiler** (auch: Sicherungskasten, Unterverteilung, Sicherungs- und Verteilerschrank) ist die zentrale Stelle zur **Verteilung elektrischer Energie** in Gebäuden.

**Hauptfunktionen:**

- Stromverteilung auf Endstromkreise
- Schutz gegen Überlast und Kurzschluss
- Trennung und Freischaltung einzelner Stromkreise
- Messung (bei Hauptverteilung mit Zähler)

---

## 3. Aufbau und Komponenten

### 3.1 Äußerer Aufbau

- **Schrank oder Kasten** aus Metall (Stahlblech) oder Kunststoff
- **Schutzart** mindestens IP2X (Schutz gegen Berührung)
- Aufputz oder Unterputz
- Tür mit Scharnier, abschließbar

### 3.2 Innere Komponenten

| Komponente | Funktion |
|---|---|
| **Sammelschiene** (L1, L2, L3, N, PE) | gemeinsame Stromverteilung |
| **Hauptschalter** | zentrales Ein-/Ausschalten |
| **Sammelschienenadapter** | für modulare Komponenten |
| **Reihenklemmen** | Anschluss der Abgangsleitungen |
| **Schutzgeräte** | LS, FI, Überspannung |
| **Schütze und Relais** | Steuerungsaufgaben |

### 3.3 Hauptverteilung vs. Unterverteilung

| | Hauptverteilung | Unterverteilung |
|---|---|---|
| **Ort** | Hausanschlussraum | Etagenverteiler |
| **Inhalt** | Zähler, Hauptschalter, Hauptsicherungen | Unterverteilung der Stockwerke |
| **Aufgabe** | Übergang vom Netz zur Anlage | Verteilung im Gebäude |

---

## 4. Schutzgeräte

### 4.1 Leitungsschutzschalter (LS-Schalter)

- Schutz vor Überlast und Kurzschluss
- **Auslösecharakteristik**: B (Wohnen), C (Standard), D (Motoren)
- Nennströme: 6, 10, 13, 16, 20, 25, 32, 40 A

### 4.2 FI-Schutzschalter (RCD)

- **Fehlerstrom-Schutzschalter**
- Schutz vor elektrischem Schlag
- Auslösestrom: 30 mA (Personenschutz), 300 mA (Brandschutz)
- Typ A, B, AC je nach Anwendung

### 4.3 Überspannungsschutz (SPD)

- **Surge Protective Device**
- Schutz vor Blitzschlag und Spannungsspitzen
- Typ 1 (Blitz), Typ 2 (Überspannung), Typ 3 (Endgerät)
- Kombi-Ableiter für Hauptverteilung

### 4.4 Sicherungen (Legacy)

- **Schmelzsicherungen** (Diazed, Neozed)
- Heute durch LS ersetzt
- Noch in Altanlagen

### 4.5 Lasttrennschalter / Hauptschalter

- Freischalten der Anlage für Wartung
- Bis 63 A / 100 A Standard

---

## 5. Dimensionierung

### 5.1 Bemessungsstrom

- Summe aller Verbraucher-Ströme
- Gleichzeitigkeitsfaktor berücksichtigen
- Typisch: 6 A Beleuchtung, 16 A Steckdosen, 25 A Herd

### 5.2 Auswahl der Schutzgeräte

- LS-Schalter: 16 A für Steckdosen, 10 A für Beleuchtung
- FI-Schalter: 30 mA für Steckdosen ≤ 20 A
- Überspannungsschutz: Typ 1 + 2 in Hauptverteilung

### 5.3 Beispiel-Dimensionierung

```
Wohnung 100 m²:
- 6 Lichtstromkreise (je 6 A)
- 3 Steckdosenstromkreise (je 16 A)
- 1 Herdstromkreis (25 A, 3-phasig)
- 1 Trockner (16 A)
- 1 Spülmaschine (16 A)
- 1 Bad (16 A mit FI 30 mA)
- 1 Außen (16 A mit FI 30 mA)

Hauptsicherung: 3 × 63 A
FI-Schalter: 2 × 40 A / 30 mA
LS-Schalter: 12 × B16, 6 × B10
```

---

## 6. Verkabelung im Verteiler

### 6.1 Adernfarben

| Farbe | Funktion |
|---|---|
| **Braun** | L1 (Phase 1) |
| **Schwarz** | L2 (Phase 2) |
| **Grau** | L3 (Phase 3) |
| **Blau** | N (Neutralleiter) |
| **Grün-Gelb** | PE (Schutzleiter) |

### 6.2 Verdrahtungsreihenfolge

- Hauptstrompfad oben
- Schutzgeräte in der Mitte
- Abgangsklemmen unten
- PE-Schiene (Sammelschiene für Schutzleiter) durchgehend

### 6.3 Reihenklemmen

- Standard-Reihenklemmen für N und PE
- Durchgangsklemmen für mehradrige Verbindungen
- Aderendhülsen bei feindrähtigen Leitern

---

## 7. Normen und Vorschriften

### 7.1 Wichtige Normen

- **DIN VDE 0100** (Errichten von Niederspannungsanlagen)
- **VDE 0660** (Niederspannungs-Schaltgeräte)
- **DIN 43871** (Verteilerschränke)
- **VDE 0613** (Verbindungsmaterial)

### 7.2 TAB (Technische Anschlussbedingungen)

- Vorgaben des **Netzbetreibers**
- Zählerplatz, Hauptsicherungen
- Anschlussraum

### 7.3 Prüfungen

- Erstprüfung nach VDE 0100-600
- Wiederholungsprüfung regelmäßig
- Prüfprotokoll nach VDE 0100-600

---

## 8. Dokumentation und Beschriftung

### 8.1 Stromlaufplan

- Welche Sicherung für welchen Stromkreis
- Welche Phase
- Kabelfarbe und -querschnitt

### 8.2 Verteilerplan

- Anordnung der Schutzgeräte
- Reihenfolge der Stromkreise

### 8.3 Beschriftung

- Jedes Schutzgerät beschriftet
- Stromkreise eindeutig bezeichnet
- Verteilerschrank innen und außen beschriftet

### 8.4 Beispiel-Beschriftung

```
Sicherung 1: Licht Küche
Sicherung 2: Licht Wohnzimmer
Sicherung 3: Steckdose Schlafzimmer
Sicherung 4: Herd
Sicherung 5: Spülmaschine
```

---

## 9. Übungen

### Übung 1 — Schutzgeräte auswählen

Wählen Sie für eine Wohnung passende Schutzgeräte.

### Übung 2 — Dimensionierung

Berechnen Sie die Hauptsicherung für ein Einfamilienhaus.

### Übung 3 — Stromlaufplan

Erstellen Sie einen Stromlaufplan für einen Verteiler mit 6 Stromkreisen.

### Übung 4 — Adernfarben

Welche Aderfarbe gehört zu welcher Funktion?

### Übung 5 — FI-Schalter

Wann ist ein 30 mA, wann ein 300 mA FI-Schalter einzusetzen?

---

## 10. Zusammenfassung

**Stromkreisverteiler** verteilen elektrische Energie und schützen vor Fehlern:

**Aufbau:**

- Schrank oder Kasten
- Sammelschienen (L1, L2, L3, N, PE)
- Hauptschalter, Schutzgeräte, Reihenklemmen

**Schutzgeräte:**

- LS-Schalter: Überlast und Kurzschluss
- FI-Schalter: Personenschutz (30 mA)
- Überspannungsschutz: Typ 1, 2, 3

**Normen:**

- DIN VDE 0100 (Niederspannungsanlagen)
- TAB des Netzbetreibers

**Dokumentation:**

- Stromlaufplan
- Verteilerplan
- Beschriftung

### Selbsttest-Checkliste

- [ ] Ich erkläre den Aufbau eines Verteilers.
- [ ] Ich wähle Schutzgeräte dimensioniert aus.
- [ ] Ich verkable nach Adernfarben.
- [ ] Ich dokumentiere normgerecht.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3570 — Recherche 2026*
