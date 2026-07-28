# FM: Problem Management

**Kurs-ID:** 4858
**Kategorie:** Kursbibliothek / Fachmodule / ITSM
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4858

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Problem Management?](#2-was-ist-problem-management)
3. [Unterschied zu Incident Management](#3-unterschied-zu-incident-management)
4. [Reaktives Problem Management](#4-reaktives-problem-management)
5. [Proaktives Problem Management](#5-proaktives-problem-management)
6. [Ursachenanalyse-Methoden](#6-ursachenanalyse-methoden)
7. [Known Error Database (KEDB)](#7-known-error-database-kedb)
8. [Werkzeuge](#8-werkzeuge)
9. [KPIs und Erfolgsmessung](#9-kpis-und-erfolgsmessung)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Problem Management von Incident Management abgrenzen,
- reaktive und proaktive Methoden anwenden,
- Ursachenanalysen (5-Why, Ishikawa) durchführen,
- Known Errors dokumentieren,
- Wiederholungsfehler verhindern.

---

## 2. Was ist Problem Management?

**Problem Management** untersucht die **Ursachen** von Incidents und entwickelt **Lösungen**, um Wiederholungen zu verhindern.

**Ziele:**

- Wiederholungsfehler verhindern
- Ursachen identifizieren und beseitigen
- Known Errors dokumentieren
- Stabilität der IT-Services erhöhen

---

## 3. Unterschied zu Incident Management

| Aspekt | Incident | Problem |
|---|---|---|
| **Ziel** | Service wiederherstellen | Ursache finden |
| **Dringlichkeit** | hoch | niedriger |
| **Lebensdauer** | Stunden bis Tage | Wochen bis Monate |
| **Verantwortlich** | Service Desk | 2nd-Level / Spezialisten |
| **Beziehung** | Symptom | Ursache |

**Beispiel:**

- **Incident**: E-Mail-Server ausgefallen, Anwender können nicht senden
- **Problem**: Festplatte voll, weil Log-Rotation defekt — verhindert künftige Ausfälle

---

## 4. Reaktives Problem Management

### 4.1 Definition

Reaktives Problem Management **analysiert vergangene Incidents**, um Muster und Ursachen zu erkennen.

### 4.2 Schritte

1. Incidents mit ähnlichen Symptomen clustern
2. Hypothesen für gemeinsame Ursache aufstellen
3. Ursache verifizieren
4. Lösung umsetzen
5. Known Error dokumentieren

### 4.3 Trigger

- Mehrere ähnliche Incidents
- Wiederkehrender Major Incident
- Hohe Ausfallrate

---

## 5. Proaktives Problem Management

### 5.1 Definition

Proaktives Problem Management **sucht nach potenziellen Problemen**, bevor Incidents auftreten.

### 5.2 Methoden

- **Trend-Analyse**: Auswertung historischer Daten
- **Capacity Planning**: Vermeidung von Überlastungen
- **Health Checks**: regelmäßige Prüfungen
- **Post-Mortem-Analyse**: Lessons Learned aus Incidents
- **Supplier-Reviews**: Risiken aus Lieferanten identifizieren
- **Standards**: bekannte Schwachstellen dokumentieren

---

## 6. Ursachenanalyse-Methoden

### 6.1 5-Why-Methode (Toyota)

Fünfmaliges "Warum?" hinterfragen:

**Beispiel:** Server-Ausfall
- Warum? Festplatte voll
- Warum? Logs werden nicht gelöscht
- Warum? Logrotate-Service läuft nicht
- Warum? Service wurde deaktiviert
- Warum? Wartungsplan nicht aktualisiert
→ **Root Cause**: fehlende Prozess-Pflege

### 6.2 Ishikawa-Diagramm (Fischgrät)

Kategorisierte Ursachenanalyse:

```
                  ┌── Methode
                  ├── Mensch
                  ├── Material
                  ├── Messung
                  ├── Maschine
                  ├── Umgebung
                  └── Management
```

### 6.3 Pareto-Analyse (80/20-Regel)

80 % der Probleme entstehen durch 20 % der Ursachen. Identifikation dieser Hauptursachen beschleunigt die Problemlösung.

### 6.4 Fault Tree Analysis (FTA)

Top-down-Analyse: Wie kann ein Ereignis eintreten?

### 6.5 5-Whys vs. Ishikawa

- **5-Why**: schnelle, einfache Ursachenanalyse
- **Ishikawa**: systematische, kategorisierte Analyse
- **Kombination**: 5-Why für Hypothesen, Ishikawa für Strukturierung

---

## 7. Known Error Database (KEDB)

### 7.1 Definition

Eine **Known Error Database** dokumentiert bekannte Probleme, ihre Ursachen und Workarounds.

### 7.2 Eintrag enthält

- Problem-ID
- Beschreibung
- Ursache
- Workaround
- Permanente Lösung
- Bekannt seit
- Verantwortlicher
- Status

### 7.3 Beispiel

```
ID: PRB-2024-001
Titel: E-Mail-Server stürzt bei großen Anhängen ab
Ursache: Speicher-Limit in Postfix-Konfiguration auf 50 MB gesetzt
Workaround: Anhänge über Cloud-Service senden
Lösung: Limit auf 100 MB erhöhen + Monitoring einrichten
```

---

## 8. Werkzeuge

### 8.1 Ticket-Systeme mit Knowledge-Base

- Jira Service Management
- ServiceNow
- OTRS
- Zammad

### 8.2 Spezialtools für Ursachenanalyse

- **Ishikawa-Diagramm-Editor**: draw.io, Mermaid, Visio
- **5-Why-Vorlagen**: einfache Textdokumente

---

## 9. KPIs und Erfolgsmessung

### 9.1 KPIs

| KPI | Beschreibung |
|---|---|
| **Anzahl Probleme** | im Berichtszeitraum |
| **Gelöste Probleme** | pro Zeiteinheit |
| **Durchschnittliche Lösungszeit** | vom Erkennen bis zur Lösung |
| **Wiederkehrende Incidents** | Anzahl pro Problem |
| **Bekannte Fehler** | Anzahl in KEDB |

### 9.2 Erfolgsmessung

- Reduktion der Incidents pro Problem
- Schnellere Erkennung
- Höhere Erstlösungsquote

---

## 10. Übungen

### Übung 1 — 5-Why

Wenden Sie die 5-Why-Methode auf ein konkretes Problem aus Ihrem Arbeitsalltag an.

### Übung 2 — Ishikawa

Erstellen Sie ein Ishikawa-Diagramm für "Website reagiert langsam".

### Übung 3 — Known Error

Erstellen Sie einen Known-Error-Eintrag für ein erfundenes Problem.

### Übung 4 — Reaktiv vs. Proaktiv

Beschreiben Sie Beispiele für reaktives und proaktives Problem Management.

### Übung 5 — KEDB

Welche Felder sollte eine KEDB enthalten?

---

## 11. Zusammenfassung

**Problem Management** identifiziert und beseitigt **Ursachen** von Incidents:

**Unterschied zu Incident Management:**

- Incident: Symptom (schnell lösen)
- Problem: Ursache (nachhaltig beseitigen)

**Reaktiv:** Analyse vergangener Incidents

**Proaktiv:** Vermeidung zukünftiger Probleme

**Methoden:**

- **5-Why**: einfache Ursachenanalyse
- **Ishikawa**: strukturierte Fischgrät-Analyse
- **Pareto**: 80/20-Regel
- **Fault Tree Analysis**: Top-Down-Analyse

**Werkzeuge:**

- KEDB für bekannte Fehler
- Ishikawa-Diagramme
- Service-Management-Tools

### Selbsttest-Checkliste

- [ ] Ich unterscheide Incident und Problem Management.
- [ ] Ich wende 5-Why und Ishikawa an.
- [ ] Ich dokumentiere Known Errors.
- [ ] Ich betreibe proaktives Problem Management.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4858 — Recherche 2026*
