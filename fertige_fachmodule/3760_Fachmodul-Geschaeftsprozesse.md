# Fachmodul: Geschäftsprozesse

**Kurs-ID:** 3760
**Kategorie:** Kursbibliothek / Fachmodule / Wirtschaft
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3760

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Geschäftsprozess – Überblick](#2-geschaeftsprozess--überblick)
3. [Prozessmodellierung mit BPMN](#3-prozessmodellierung-mit-bpmn)
4. [Workflow und Prozessautomatisierung](#4-workflow-und-prozessautomatisierung)
5. [Werkzeuge](#5-werkzeuge)
6. [Übungen](#6-übungen)
7. [Zusammenfassung](#7-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Geschäftsprozesse identifizieren und modellieren,
- BPMN-Diagramme erstellen und lesen,
- Prozesse mit Tools automatisieren.

---

## 2. Geschäftsprozess – Überblick

Ein **Geschäftsprozess** ist eine **Folge von Aktivitäten**, die zur Erreichung eines Geschäftsziels dient.

**Beispiele:**

- Auftragsabwicklung: Bestellung → Auftragsbestätigung → Lieferung → Rechnung
- Bewerbungsprozess: Bewerbung → Sichtung → Vorstellungsgespräch → Entscheidung
- Reisekostenabrechnung: Antrag → Prüfung → Genehmigung → Erstattung

**Bausteine:**

- **Ereignis**: Auslöser oder Ergebnis
- **Aktivität**: zu erledigende Tätigkeit
- **Gateway**: Entscheidung, Parallelisierung
- **Sequenzfluss**: Reihenfolge

---

## 3. Prozessmodellierung mit BPMN

### 3.1 BPMN (Business Process Model and Notation)

- **Standard** der OMG (seit 2005)
- Aktuelle Version: BPMN 2.0
- Grafische Notation für Geschäftsprozesse

### 3.2 Grundelemente

| Element | Bedeutung |
|---|---|
| **Start-Ereignis** (grüner Kreis) | Prozessbeginn |
| **End-Ereignis** (roter Kreis) | Prozessende |
| **Zwischenereignis** | Ereignis im Prozess |
| **Aufgabe** (Rechteck, abgerundet) | menschliche Tätigkeit |
| **Service-Aufgabe** | automatische Aktion |
| **Gateway exklusiv** (Raute, X) | Entweder-oder |
| **Gateway parallel** (+) | Parallel |
| **Sequenzfluss** (Pfeil) | Reihenfolge |

### 3.3 Beispiel: Bestellprozess

```
Start → Bestellung aufgeben → Auftragsbestätigung → [Lager vorhanden?]
                                                                          │
                                                                          ├─ ja → Lieferung → Rechnung → Zahlung → Ende
                                                                          │
                                                                          └─ nein → Nachbestellung → Wareneingang → Lieferung → ...
```

### 4. Werkzeuge

- **Camunda Modeler**: BPMN-Modellierung, Open Source
- **Bizagi Modeler**: BPMN-Suite
- **ARIS**: Business Process Analysis
- **Signavio**: kollaboratives Tool
- **bpmn.io**: Open-Source-Editor

---

## 4. Workflow und Prozessautomatisierung

### 4.1 Workflow-Systeme

- **Camunda Platform**: Open Source
- **IBM BPM**: Enterprise
- **Appian**: Low-Code
- **Power Automate (Microsoft)**: Power Platform
- **n8n**: Open Source, Self-Hosted

### 4.2 RPA (Robotic Process Automation)

- **UiPath**: Marktführer
- **Automation Anywhere**
- **Blue Prism**

### 4.3 Low-Code-Plattformen

- **Microsoft Power Platform**
- **Mendix**
- **OutSystems**
- **Salesforce Lightning Platform**

---

## 5. Werkzeuge

| Aufgabe | Werkzeug |
|---|---|
| Modellierung | Camunda, Bizagi, Signavio |
| Ausführung | Camunda, IBM BPM, Power Automate |
| RPA | UiPath, Automation Anywhere |
| Low-Code | Mendix, OutSystems |
| Analyse | Celonis, Minit |

---

## 6. Übungen

### Übung 1 — Prozess identifizieren

Wählen Sie einen Prozess in Ihrem Betrieb und modellieren Sie ihn.

### Übung 2 — BPMN erstellen

Erstellen Sie ein BPMN-Diagramm für einen Bestellprozess.

### Übung 3 — Gateways

Welche Gateway-Typen gibt es und wann nutzen Sie sie?

### Übung 4 — Automatisierung

Welche Teile des Prozesses automatisieren Sie?

### Übung 5 — RPA

Welche Aufgaben eignen sich für RPA?

### Übung 6 — Tool-Vergleich

Vergleichen Sie Camunda mit Power Automate.

---

## 7. Zusammenfassung

**Geschäftsprozesse** sind **strukturierte Abläufe** in Unternehmen:

**Modellierung:**

- BPMN 2.0 als Standard
- Elemente: Ereignisse, Aktivitäten, Gateways
- Tools: Camunda, Bizagi, Signavio

**Automatisierung:**

- **Workflow-Systeme**: Camunda, IBM BPM
- **RPA**: UiPath, Automation Anywhere
- **Low-Code**: Mendix, OutSystems

**Vorteile:**

- Standardisierung
- Effizienz
- Nachvollziehbarkeit
- Skalierbarkeit

### Selbsttest-Checkliste

- [ ] Ich identifiziere Geschäftsprozesse.
- [ ] Ich modelliere mit BPMN.
- [ ] Ich nutze Gateways korrekt.
- [ ] Ich automatisiere mit Workflow-Tools.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3760 — Recherche 2026*
