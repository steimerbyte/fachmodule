# FM: Change Enablement

**Kurs-ID:** 4859
**Kategorie:** Kursbibliothek / Fachmodule / ITSM
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4859

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Change Enablement?](#2-was-ist-change-enablement)
3. [Change-Typen](#3-change-typen)
4. [Change-Lifecycle](#4-change-lifecycle)
5. [Change Advisory Board (CAB)](#5-change-advisory-board-cab)
6. [Risikobewertung und Impact-Analyse](#6-risikobewertung-und-impact-analyse)
7. [7 Rs des Change Managements](#7-7-rs-des-change-managements)
8. [Emergency Changes](#8-emergency-changes)
9. [Werkzeuge](#9-werkzeuge)
10. [KPIs und Erfolgsmessung](#10-kpis-und-erfolgsmessung)
11. [Übungen](#11-übungen)
12. [Zusammenfassung](#12-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Change Enablement definieren und von anderen Prozessen abgrenzen,
- Change-Typen unterscheiden,
- den Change-Lifecycle durchführen,
- Risiken bewerten und das CAB einbinden,
- Emergency Changes handhaben.

---

## 2. Was ist Change Enablement?

**Change Enablement** (in ITIL v4) löst den älteren Begriff **Change Management** ab.

**Definition:** Change Enablement stellt sicher, dass **Veränderungen** an Services mit **minimalem Risiko** und angemessener **Geschwindigkeit** umgesetzt werden.

**Ziele:**

- Risikominimierung bei Änderungen
- Schnelle Bereitstellung von Verbesserungen
- Nachvollziehbarkeit aller Änderungen
- Schutz vor ungewollten Service-Ausfällen

---

## 3. Change-Typen

### 3.1 Standard Change

- Vorab genehmigt
- Niedriges Risiko, bekannte Verfahren
- Beispiel: Passwort-Reset für Benutzer, geplante Wartung
- **Keine** CAB-Genehmigung erforderlich

### 3.2 Normal Change

- Genehmigung erforderlich
- Mittleres Risiko
- Beispiel: Server-Upgrade, neue Software-Installation
- **CAB-Genehmigung** erforderlich

### 3.3 Emergency Change

- Schneller Prozess
- Hohes Risiko, dringend
- Beispiel: Sicherheits-Patch, kritischer Bugfix
- **ECAB** (Emergency CAB)

---

## 4. Change-Lifecycle

### 4.1 Phasen

```
[Anfrage (RFC)] → [Bewertung] → [Genehmigung] → [Planung] →
[Vorbereitung] → [Implementierung] → [Verifizierung] →
[Review] → [Schließung]
```

### 4.2 RFC (Request for Change)

Jeder Change wird als **Request for Change (RFC)** erfasst mit:

- Beschreibung der Änderung
- Begründung
- Risikoeinschätzung
- Zeitplan
- Verantwortliche
- Backout-Plan

### 4.3 Bewertung

- Technische Bewertung (Machbarkeit, Risiken)
- Geschäftliche Bewertung (Nutzen, Kosten)
- Sicherheitsbewertung (CVE-Bewertung)
- Compliance-Bewertung (DSGVO, Branchenvorschriften)

### 4.4 Implementierung

- Wartungsfenster (Change Window)
- Backup vor Change
- Schrittweise Implementierung
- Kommunikation an Stakeholder
- Rollback-Plan bereithalten

### 4.5 Verifizierung

- Tests nach Change
- Funktionstest
- Performance-Vergleich
- Anwender-Feedback

### 4.6 Post-Implementation-Review (PIR)

- Was lief gut?
- Was lief schlecht?
- Lessons Learned
- Wissensdatenbank-Update

---

## 5. Change Advisory Board (CAB)

### 5.1 Aufgaben

Das **CAB** ist ein Beratungsgremium, das Changes bewertet und genehmigt.

### 5.2 Mitglieder

- IT-Manager
- Service-Owner
- Vertreter der Fachbereiche
- Security
- Compliance
- Externe Berater (bei Bedarf)

### 5.3 Ablauf

- **Antrag**: Change wird im CAB-System erfasst
- **Sitzung**: Regelmäßige CAB-Meetings (meist wöchentlich)
- **Bewertung**: Diskussion und Bewertung
- **Entscheidung**: Genehmigt / Abgelehnt / Zurückgestellt
- **Dokumentation**: Protokoll, Begründung

### 5.4 ECAB (Emergency CAB)

- Ad-hoc-Sitzung bei Notfällen
- Kleinere Gruppe
- Schnelle Entscheidung
- Dokumentation im Nachgang

---

## 6. Risikobewertung und Impact-Analyse

### 6.1 Risikokategorien

- **Technisch**: Ausfall, Datenverlust, Inkompatibilität
- **Sicherheit**: Offenlegung, Zugriff
- **Compliance**: DSGVO, Audit-Risiko
- **Geschäftlich**: Ausfallzeit, Kunden-Impact
- **Finanziell**: Kosten, Strafen

### 6.2 Impact-Analyse

- **Wer ist betroffen?** (Anwender, Systeme, Services)
- **Wie viele sind betroffen?**
- **Wie lange?**
- **Wann?** (Zeitpunkt)
- **Workaround verfügbar?**

### 6.3 Backout-Plan

- **Pflicht für jeden Change**
- Wie kann der Change zurückgerollt werden?
- Zeit für Backout
- Verantwortliche

---

## 7. 7 Rs des Change Managements

### 7.1 Die 7 Fragen

| R | Frage | Bedeutung |
|---|---|---|
| **Raiser** | Wer hat den Change beantragt? | Antragsteller |
| **Reason** | Was ist der Grund für den Change? | Motivation |
| **Return** | Was ist der erwartete Nutzen? | Business Case |
| **Risks** | Welche Risiken bestehen? | Risikobewertung |
| **Resources** | Welche Ressourcen werden benötigt? | Aufwand |
| **Responsible** | Wer ist verantwortlich? | Owner |
| **Result** | Wie wird Erfolg gemessen? | KPIs |

---

## 8. Emergency Changes

### 8.1 Wann?

- Sicherheitslücken (Zero-Day)
- Kritische Systemausfälle
- Compliance-Verletzungen
- Datenschutz-Vorfälle

### 8.2 Vorgehensweise

1. **Sofortige Reaktion** des Change Owners
2. **ECAB-Sitzung** (kann virtuell, ad-hoc sein)
3. **Sofortige Genehmigung**
4. **Implementierung** (typisch außerhalb der Wartungszeiten)
5. **Nachbereitung**:
   - Detaillierte Dokumentation
   - Post-Implementation-Review
   - Lessons Learned
6. **Nachmeldung** an CAB

### 8.3 Beispiel

> Sicherheits-Patch für kritische Log4j-Lücke (CVE-2021-44228)

- Erkannt: Donnerstag
- ECAB: Donnerstag Abend
- Patch-Ausbringung: Freitag Nacht
- PIR: Montag

---

## 9. Werkzeuge

### 9.1 Tools

- Jira Service Management
- ServiceNow
- BMC Remedy
- Zendesk
- OTRS

### 9.2 Funktionen

- Change-Datenbank
- Workflow-Engine
- CAB-Sitzungsplanung
- Risikobewertungs-Vorlagen
- Backout-Plan-Templates
- Reporting und Dashboards

---

## 10. KPIs und Erfolgsmessung

### 10.1 KPIs

| KPI | Beschreibung |
|---|---|
| **Anzahl Changes** | pro Zeitraum |
| **Erfolgsquote** | erfolgreiche Changes / Gesamt-Changes |
| **Backout-Rate** | Anteil der Changes mit Rückabwicklung |
| **Durchschnittliche Bearbeitungszeit** | RFC bis Schließung |
| **Notfall-Changes** | Anzahl / pro Zeitraum |

### 10.2 Erfolgsfaktoren

- Klare Prozesse
- Effektive CAB-Sitzungen
- Gute Backout-Pläne
- Lessons Learned nutzen
- Stakeholder-Einbindung

---

## 11. Übungen

### Übung 1 — Change-Typen

Welcher Change-Typ passt für: Patch für kritische Sicherheitslücke, Standard-Release, neues Feature?

### Übung 2 — RFC erstellen

Erstellen Sie ein RFC für ein Windows-Server-Upgrade.

### Übung 3 — 7 Rs

Wenden Sie die 7 Rs auf ein selbst gewähltes Change-Beispiel an.

### Übung 4 — Risikoanalyse

Erstellen Sie eine Risikoanalyse für einen Datenbank-Migrations-Change.

### Übung 5 — ECAB

Beschreiben Sie den Ablauf eines ECAB bei einem Sicherheits-Patch.

### Übung 6 — Backout-Plan

Erstellen Sie einen Backout-Plan für einen Switch-Firmware-Update.

---

## 12. Zusammenfassung

**Change Enablement** steuert Veränderungen mit minimalem Risiko:

**Change-Typen:**

| Typ | Risiko | Genehmigung |
|---|---|---|
| Standard | niedrig | vorab |
| Normal | mittel | CAB |
| Emergency | hoch | ECAB |

**Lifecycle:** RFC → Bewertung → Genehmigung → Planung → Implementierung → Verifizierung → PIR

**7 Rs:** Raiser, Reason, Return, Risks, Resources, Responsible, Result

**Tools:** Jira, ServiceNow, Remedy

### Selbsttest-Checkliste

- [ ] Ich unterscheide Change-Typen.
- [ ] Ich erstelle RFCs mit allen relevanten Informationen.
- [ ] Ich nutze die 7 Rs.
- [ ] Ich plane Backouts.
- [ ] Ich handle Emergency Changes.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4859 — Recherche 2026*
