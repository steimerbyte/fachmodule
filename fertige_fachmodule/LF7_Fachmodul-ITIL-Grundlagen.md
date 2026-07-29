# Fachmodul: IT Service Management mit ITIL

**Kurs-ID:** 2820
**Kategorie:** Kursbibliothek / Fachmodule / IT-Service-Management
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2820

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [ITSM – Überblick](#2-itsm--überblick)
3. [ITIL – Geschichte und Versionen](#3-itil--geschichte-und-versionen)
4. [ITIL v4 Service Value System (SVS)](#4-itil-v4-service-value-system-svs)
5. [Service Value Chain](#5-service-value-chain)
6. [34 Practices (Praktiken)](#6-34-practices-praktiken)
7. [Guiding Principles](#7-guiding-principles)
8. [Incident Management](#8-incident-management)
9. [Problem Management](#9-problem-management)
10. [Change Enablement](#10-change-enablement)
11. [Service Desk](#11-service-desk)
12. [SLAs, OLAs, UCs](#12-slas-olas-ucs)
13. [Vergleich mit COBIT, ISO 20000](#13-vergleich-mit-cobit-iso-20000)
14. [Übungen](#14-übungen)
15. [Zusammenfassung](#15-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- ITSM und ITIL einordnen,
- ITIL v4 Konzepte (SVS, Guiding Principles, Practices) erläutern,
- Incident, Problem, Change Management erklären,
- Service Desk und Ticket-Lifecycle beschreiben,
- SLAs formulieren,
- ITIL mit anderen Frameworks vergleichen.

---

## 2. ITSM – Überblick

**IT Service Management (ITSM)** umfasst alle Tätigkeiten, die notwendig sind, um IT-Dienste zu planen, bereitzustellen, zu betreiben und kontinuierlich zu verbessern.

**Ziele:**

- Ausrichtung der IT an Geschäftsanforderungen
- Steigerung der Servicequalität
- Kostenoptimierung
- Risikominimierung

**Wichtige Frameworks:**

- **ITIL** (Information Technology Infrastructure Library) — De-facto-Standard
- **COBIT** — IT-Governance
- **ISO 20000** — internationaler Standard für ITSM
- **IT4IT** — alternative Referenzarchitektur
- **FitSM** — leichtgewichtiges Framework

---

## 3. ITIL – Geschichte und Versionen

| Version | Jahr | Schwerpunkt |
|---|---|---|
| ITIL v1 | 1989 | britische Regierungsveröffentlichung |
| ITIL v2 | 2000 | prozessorientierte Struktur |
| ITIL v3 / 2011 | 2007/2011 | Service-Lifecycle (5 Phasen) |
| ITIL 4 | 2019 | Service Value System, 34 Practices |

---

## 4. ITIL v4 Service Value System (SVS)

Das **Service Value System** ist das zentrale Modell in ITIL 4. Es beschreibt, wie eine Organisation Wert für Stakeholder schafft.

### 4.1 Komponenten des SVS

| Komponente | Beschreibung |
|---|---|
| **Opportunity/Demand (O/D)** | Marktchancen und Nachfrage |
| **Value** | wahrgenommener Nutzen, Wichtigkeit, Anwendbarkeit |
| **Organization** | die gesamte Organisation |
| **People** | Menschen, Kultur, Strukturen |
| **Products** | Produkte, Ressourcen |
| **Partners** | externe Partner |
| **Processes** | Prozesse |
| **Service Value Chain** | Aktivitätenkette zur Werterstellung |
| **Practices** | 34 etablierte Praktiken |
| **Guiding Principles** | 7 Leitlinien |
| **Continual Improvement** | kontinuierliche Verbesserung |

### 4.2 Wertbegriff

Wert ist subjektiv und hängt ab von:

- **Utility (Nützlichkeit)**: Was das Produkt/Dienst leistet
- **Warranty (Sicherheit)**: Wie gut es funktioniert

---

## 5. Service Value Chain

Die **Service Value Chain** ist eine flexible Kette von Aktivitäten:

```
[Plan] ──→ [Improve] ──→ [Engage] ──→ [Design & Transition] ──→ [Obtain/Build] ──→ [Deliver & Support]
```

| Aktivität | Beschreibung |
|---|---|
| **Plan** | Strategische Planung |
| **Improve** | Kontinuierliche Verbesserung auf allen Ebenen |
| **Engage** | Stakeholder-Engagement |
| **Design & Transition** | Service-Design und -Einführung |
| **Obtain/Build** | Komponenten beschaffen und bauen |
| **Deliver & Support** | Service liefern und betreuen |

Jede Aktivität kann mehrfach und in unterschiedlichen Kombinationen durchlaufen werden.

---

## 6. 34 Practices (Praktiken)

Die 34 Practices sind in ITIL 4 in drei Kategorien und 14 Practice-Pfade organisiert:

### 6.1 Allgemeine Management-Praktiken (15)

- Architecture Management
- Continual Improvement
- Information Security Management
- Knowledge Management
- Measurement and Reporting
- Organizational Change Management
- Portfolio Management
- Project Management
- Relationship Management
- Risk Management
- Service Financial Management
- Strategy Management
- Supplier Management
- Workforce and Talent Management

(teils variiert je nach Gruppierung)

### 6.2 Service-Management-Praktiken (17)

- **Availability Management**
- **Business Analysis**
- Capacity and Performance Management
- Change Enablement
- Incident Management
- IT Asset Management
- Monitoring and Event Management
- Problem Management
- Release Management
- Service Catalog Management
- Service Configuration Management
- Service Continuity Management
- Service Design
- Service Desk
- Service Level Management
- Service Request Management
- Service Validation and Testing

### 6.3 Technische Management-Praktiken

- Deployment Management
- Infrastructure and Platform Management
- Software Development and Management

---

## 7. Guiding Principles

Die **7 Leitlinien** sind universelle Empfehlungen für jede Initiative:

1. **Focus on value**: Alles Handeln auf Wertschöpfung ausrichten
2. **Start where you are**: Aktuellen Zustand bewerten
3. **Progress iteratively with feedback**: Schrittweise mit Feedback
4. **Collaborate and promote visibility**: Zusammenarbeit und Transparenz
5. **Think and work holistically**: Ganzheitlich denken
6. **Keep it simple and practical**: Einfach und praktisch halten
7. **Optimize and automate**: Optimieren und automatisieren

---

## 8. Incident Management

### 8.1 Definition

Ein **Incident** ist eine ungeplante Unterbrechung oder Reduktion der Qualität eines IT-Services.

### 8.2 Ziele

- Wiederherstellung des Services so schnell wie möglich
- Minimierung der Auswirkungen auf Geschäftsprozesse

### 8.3 Lifecycle

```
Erkennen → Loggen → Kategorisieren → Priorisieren → Eskalieren → Bearbeiten → Lösen → Schließen
```

### 8.4 Priorität

**P = Impact × Urgency**

| Impact | Dringlichkeit | Priorität |
|---|---|---|
| Hoch | Hoch | P1 |
| Hoch | Mittel | P2 |
| Mittel | Mittel | P3 |
| Niedrig | Niedrig | P4 |

### 8.5 Eskalation

- **Funktionale Eskalation**: Spezialistenteam übernimmt
- **Hierarchische Eskalation**: Vorgesetzter wird eingebunden

### 8.6 Major Incident

- Schwere Vorfälle mit hohem Impact
- Eigener Major-Incident-Prozess
- Incident Manager koordiniert
- Post-Incident-Review nach Lösung

---

## 9. Problem Management

### 9.1 Definition

Ein **Problem** ist die Ursache eines oder mehrerer Incidents.

### 9.2 Reaktiv vs. Proaktiv

- **Reaktives Problem Management**: analysiert vergangene Incidents
- **Proaktives Problem Management**: sucht nach potenziellen Problemen

### 9.3 Techniken

- **5-Why-Methode**: Ursachenanalyse
- **Ishikawa/Fischgrät**: Systematische Ursachenanalyse
- **Pareto-Analyse**: 80/20-Regel
- **Fault Tree Analysis**: Fehlerbaumanalyse

### 9.4 Known Error

- Bekanntes Problem mit identifizierter Ursache
- Workaround dokumentiert
- Eintrag in Known Error Database (KEDB)

---

## 10. Change Enablement

### 10.1 Definition

Ein **Change** ist die Hinzufügung, Modifikation oder Entfernung von etwas, das Auswirkungen auf Services hat.

### 10.2 Change-Typen

| Typ | Beschreibung | Beispiel |
|---|---|---|
| **Standard Change** | vorab genehmigt, niedriges Risiko | Passwort-Reset |
| **Normal Change** | regulärer Genehmigungsprozess | Server-Upgrade |
| **Emergency Change** | dringend, schneller Prozess | Sicherheits-Patch |

### 10.3 Change Advisory Board (CAB)

- Beratungsgremium für Changes
- Vertreter aus Fachbereichen, IT, Security
- Bewertung von Risiko, Impact, Kosten

### 10.4 7R der Change-Bewertung

- **Raiser** (wer beantragt?)
- **Reason** (warum?)
- **Return** (Nutzen?)
- **Risks** (Risiken?)
- **Resources** (Ressourcen?)
- **Responsible** (verantwortlich?)
- **Result** (messbar?)

---

## 11. Service Desk

### 11.1 Funktion

Zentrale Anlaufstelle für alle Service-Anfragen, Incidents und Störungen.

### 11.2 Funktionen

- Single Point of Contact (SPOC)
- Ticketerfassung
- First-Level-Support
- Eskalation an 2nd/3rd Level
- Information der Anwender
- Reporting

### 11.3 Service-Desk-Modelle

| Modell | Beschreibung |
|---|---|
| **Lokal** | jeder Standort eigener Service Desk |
| **Zentral** | eine zentrale Anlaufstelle |
| **Virtuell** | mehrere Standorte, virtuell zusammengefasst |
| **Follow-the-Sun** | 24/7 durch globale Rotation |

### 11.4 Ticket-Lifecycle

```
Neu → Zugewiesen → In Bearbeitung → Eskaliert → Gelöst → Geschlossen
```

---

## 12. SLAs, OLAs, UCs

### 12.1 SLA (Service Level Agreement)

- Vereinbarung zwischen **IT und Kunde**
- Quantifizierbare Service-Ziele
- Beispiel: "Antwortzeit P1-Incident ≤ 15 min, Lösungszeit ≤ 4 h"

### 12.2 OLA (Operational Level Agreement)

- Vereinbarung **innerhalb der IT** zwischen Abteilungen
- Unterstützt die Erreichung der SLAs

### 12.3 UC (Underpinning Contract)

- Vertrag zwischen **IT und externem Lieferanten**
- Stützt die Erbringung der Services

### 12.4 Beispiel-SLA

| Priorität | Reaktionszeit | Lösungszeit |
|---|---|---|
| P1 | 15 min | 4 h |
| P2 | 30 min | 8 h |
| P3 | 2 h | 24 h |
| P4 | 8 h | 72 h |

---

## 13. Vergleich mit COBIT, ISO 20000

### 13.1 COBIT (Control Objectives for Information and Related Technologies)

- IT-Governance und -Management
- Stärker strategisch ausgerichtet
- Reifegradmodell (CMMI)
- 40 Ziele für Governance und Management

### 13.2 ISO 20000

- Internationaler Standard für ITSM
- Anforderungen an ein Service Management System (SMS)
- Zertifizierung möglich
- Stark von ITIL inspiriert

### 13.3 Vergleich

| Aspekt | ITIL | COBIT | ISO 20000 |
|---|---|---|---|
| Typ | Best Practice | Governance-Rahmen | Standard |
| Umfang | Service Management | IT-Governance | SMS |
| Zertifizierung | keine (nur Schulungen) | keine | möglich |
| Detaillierungsgrad | hoch (Practices) | mittel (Ziele) | mittel (Anforderungen) |

---

## 14. Übungen

### Übung 1 — ITIL-Versionen

Welche ITIL-Versionen gibt es und worin unterscheiden sie sich?

### Übung 2 — Guiding Principles

Wählen Sie zwei Guiding Principles und beschreiben Sie ihre Anwendung.

### Übung 3 — Incident Management

Beschreiben Sie den Lifecycle eines Incidents.

### Übung 4 — SLA formulieren

Formulieren Sie ein SLA für einen E-Mail-Service.

### Übung 5 — Major Incident

Welche Schritte leiten Sie bei einem Major Incident ein?

### Übung 6 — Praxis-Vergleich

Vergleichen Sie ITIL mit COBIT und ISO 20000.

---

## 15. Zusammenfassung

**ITIL 4** ist das aktuelle Rahmenwerk für ITSM:

**Service Value System (SVS):**

- Opportunity/Demand
- Value (Utility + Warranty)
- Organisation, Menschen, Produkte, Partner
- Service Value Chain
- 34 Practices
- 7 Guiding Principles
- Continual Improvement

**Kernpraktiken:**

- Incident Management: schnellstmögliche Wiederherstellung
- Problem Management: Ursachenanalyse
- Change Enablement: kontrollierte Änderungen
- Service Desk: SPOC für Anwender

**Service Level Agreements (SLAs)** quantifizieren die Service-Qualität.

### Selbsttest-Checkliste

- [ ] Ich erkläre das ITIL 4 SVS.
- [ ] Ich beschreibe die Service Value Chain.
- [ ] Ich wende Incident/Problem/Change Management an.
- [ ] Ich formuliere SLAs.
- [ ] Ich kenne Guiding Principles und Practices.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2820 — Recherche 2026*
