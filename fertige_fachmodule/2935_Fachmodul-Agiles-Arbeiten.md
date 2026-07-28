# Fachmodul: Agiles Arbeiten

**Kurs-ID:** 2935
**Kategorie:** Kursbibliothek / Fachmodule / Software-Engineering
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2935

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Agiles Manifest](#2-agiles-manifest)
3. [Scrum](#3-scrum)
4. [Kanban](#4-kanban)
5. [Extreme Programming (XP)](#5-extreme-programming-xp)
6. [User Stories und Story Points](#6-user-stories-und-story-points)
7. [Tools und Vergleich](#7-tools-und-vergleich)
8. [Übungen](#8-übungen)
9. [Zusammenfassung](#9-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- das Agile Manifest verstehen,
- Scrum, Kanban und XP einsetzen,
- User Stories und Story Points nutzen,
- agile Methoden vergleichen.

---

## 2. Agiles Manifest

2001 haben 17 Software-Entwickler das **Agile Manifest** unterzeichnet:

> "Wir entdecken bessere Wege, Software zu entwickeln, indem wir es tun und anderen dabei helfen. Durch diese Arbeit sind wir zu folgendem gekommen:

> **Wir schätzen:**

> - **Menschen und Interaktionen** über Prozesse und Werkzeuge
> - **Funktionierende Software** über umfassende Dokumentation
> - **Zusammenarbeit mit dem Kunden** über Vertragsverhandlungen
> - **Reagieren auf Veränderung** über das Befolgen eines Plans

> Das heißt, obwohl die Werte auf der rechten Seite wichtig sind, schätzen wir die Werte auf der linken Seite höher."

### 2.1 Zwölf Prinzipien

- Frühzeitige und kontinuierliche Lieferung
- Veränderung als Wettbewerbsvorteil
- Häufige Lieferung (Wochen, nicht Monate)
- Enge Zusammenarbeit mit dem Kunden
- Motivierte, vertrauensvolle Teams
- Persönliche Gespräche
- Funktionierende Software als Maß
- Nachhaltiges Tempo
- Technische Exzellenz
- Einfachheit
- Selbstorganisierende Teams
- Regelmäßige Reflexion

---

## 3. Scrum

### 3.1 Rollen

- **Product Owner**: Anforderungen, Priorisierung, Vision
- **Scrum Master**: Prozess-Coach, Hindernisse beseitigen
- **Development Team**: cross-funktional, selbstorganisiert

### 3.2 Events

- **Sprint**: 2-4 Wochen, fester Zeitrhythmus
- **Sprint Planning**: Was wird im Sprint erreicht?
- **Daily Scrum**: Tägliches 15-minütiges Stand-up
- **Sprint Review**: Ergebnis dem Stakeholder präsentieren
- **Sprint Retrospective**: Verbesserung des Prozesses

### 3.3 Artefakte

- **Product Backlog**: priorisierte Liste aller Anforderungen
- **Sprint Backlog**: für den Sprint ausgewählte Items
- **Increment**: fertiges, nutzbares Produktinkrement

### 3.4 Ablauf eines Sprints

```
Sprint Planning → Daily Scrums → Sprint Review → Sprint Retro → nächster Sprint
```

---

## 4. Kanban

### 4.1 Prinzipien

- **Visualisierung** des Arbeitsflusses (Kanban-Board)
- **Limitierung** paralleler Aufgaben (WIP-Limits)
- **Fluss-Optimierung**
- **Kontinuierliche Verbesserung**

### 4.2 Kanban-Board

```
| Backlog | In Progress | Code Review | Testing | Done |
|---------|-------------|-------------|---------|------|
| Story A  | Story B     | Story C     | Story D |      |
| Story E  |             |             |         |      |
```

### 4.3 Spalten

- Anpassbar an den Prozess
- Oft: Backlog, In Progress, Review, Test, Done
- WIP-Limits pro Spalte

### 4.4 Metriken

- **Lead Time**: vom Anfrage bis Lieferung
- **Cycle Time**: vom Start bis Lieferung
- **Throughput**: Items pro Zeiteinheit
- **WIP**: Anzahl gleichzeitiger Items

---

## 5. Extreme Programming (XP)

### 5.1 Kernpraktiken

- **Pair Programming**: zwei Entwickler pro Bildschirm
- **Test-Driven Development (TDD)**: Test zuerst
- **Continuous Integration**: häufige Integration
- **Refactoring**: kontinuierliche Verbesserung
- **Simple Design**: so einfach wie möglich
- **Collective Code Ownership**: alle dürfen alles ändern
- **On-Site Customer**: Kunde vor Ort
- **Sustainable Pace**: 40-Stunden-Woche

### 5.2 XP im Vergleich zu Scrum

| Aspekt | XP | Scrum |
|---|---|---|
| Iterationslänge | Minuten/Wochen | 2-4 Wochen |
| Rollen | flexibel | klar definiert |
| Planung | Story Cards | Sprint Planning |
| Vorgehen | sehr technisch | Projekt-Framework |

---

## 6. User Stories und Story Points

### 6.1 User Story

**Format:** "Als **Rolle** möchte ich **Funktionalität**, damit **Nutzen**."

**Beispiel:**

> "Als **Kunde** möchte ich **meine Bestellung mit Sendungsverfolgung ansehen** können, damit **ich weiß, wann meine Lieferung kommt**."

### 6.2 INVEST-Kriterien

Gute User Stories sind:

- **I**ndependent (unabhängig)
- **N**egotiable (verhandelbar)
- **V**aluable (wertvoll)
- **E**stimable (schätzbar)
- **S**mall (klein)
- **T**estable (testbar)

### 6.3 Story Points (Schätzungen)

| Story Points | Bedeutung |
|---|---|
| 1 | sehr klein |
| 2 | klein |
| 3 | mittel |
| 5 | groß |
| 8 | sehr groß |
| 13 | zu groß (zerlegen!) |
| 20+ | Epic (zerlegen!) |

### 6.4 Planning Poker

- Schätzmethode für Story Points
- Karten mit Fibonacci-Zahlen
- Diskussion und Konsens

---

## 7. Tools und Vergleich

### 7.1 Agile Tools

- **Jira**: Standard in Unternehmen
- **Azure DevOps**: Microsoft
- **GitHub Issues / Projects**: für kleinere Teams
- **GitLab Issues**: ähnlich GitHub
- **Trello**: einfach, visuell
- **Shortcut (ehem. Clubhouse)**: für Software-Teams

### 7.2 Vergleich der Frameworks

| Framework | Fokus | Iterationslänge |
|---|---|---|
| **Scrum** | iterativ, Sprints | 2-4 Wochen |
| **Kanban** | kontinuierlicher Fluss | keine festen |
| **XP** | technische Praktiken | Minuten bis Wochen |
| **SAFe** | Skalierung, mehrere Teams | Programm-Inkremente |

### 7.3 Hybride Ansätze

- **Scrumban**: Scrum + Kanban
- **Scrum + XP**: technische Praktiken aus XP

---

## 8. Übungen

### Übung 1 — Agile Manifesto

Erklären Sie eine der vier Werte des Agilen Manifests.

### Übung 2 — User Stories

Formulieren Sie 5 User Stories für ein Bibliothekssystem.

### Übung 3 — Story Points

Schätzen Sie User Stories mit Planning Poker.

### Übung 4 — Kanban-Board

Erstellen Sie ein Kanban-Board für ein Software-Projekt.

### Übung 5 — Sprint Planning

Planen Sie einen 2-wöchigen Sprint.

### Übung 6 — Retrospektive

Führen Sie eine Retrospektive durch.

---

## 9. Zusammenfassung

**Agiles Arbeiten** ermöglicht **flexible, iterative Software-Entwicklung**:

**Manifest:**

- Menschen, funktionierende Software, Zusammenarbeit, Veränderung

**Scrum:**

- Product Owner, Scrum Master, Development Team
- Sprint, Daily Scrum, Review, Retro

**Kanban:**

- Board, WIP-Limits, Fluss-Optimierung

**XP:**

- Pair Programming, TDD, CI, Simple Design

**User Stories:** INVEST, Story Points, Planning Poker

### Selbsttest-Checkliste

- [ ] Ich erkläre das Agile Manifest.
- [ ] Ich wende Scrum an.
- [ ] Ich nutze Kanban.
- [ ] Ich formuliere User Stories.
- [ ] Ich schätze mit Story Points.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2935 — Recherche 2026*
