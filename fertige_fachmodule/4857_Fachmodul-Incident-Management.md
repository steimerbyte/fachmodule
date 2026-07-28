# FM: Incident Management

**Kurs-ID:** 4857
**Kategorie:** Kursbibliothek / Fachmodule / ITSM
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4857

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist ein Incident?](#2-was-ist-ein-incident)
3. [Ziele des Incident Managements](#3-ziele-des-incident-managements)
4. [Incident-Lifecycle](#4-incident-lifecycle)
5. [Priorisierung (Impact × Urgency)](#5-priorisierung-impact--urgency)
6. [Eskalation](#6-eskalation)
7. [Major Incident](#7-major-incident)
8. [Werkzeuge und Tools](#8-werkzeuge-und-tools)
9. [KPIs und Reporting](#9-kpis-und-reporting)
10. [Best Practices](#10-best-practices)
11. [Übungen](#11-übungen)
12. [Zusammenfassung](#12-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- den Incident-Lifecycle erklären,
- Incidents korrekt priorisieren,
- Eskalationspfade einrichten,
- Major Incidents handhaben,
- KPIs und Reporting umsetzen.

---

## 2. Was ist ein Incident?

Ein **Incident** ist eine **ungeplante Unterbrechung oder Reduktion der Qualität eines IT-Services**.

**Beispiele:**

- E-Mail-Server ausgefallen
- Anwendung reagiert nicht
- Drucker druckt nicht
- Langsame Netzwerkverbindung
- Login funktioniert nicht

**Abgrenzung:**

- **Incident**: Symptom, einzelnes Ereignis
- **Problem**: Ursache, oft mehrere Incidents
- **Service Request**: Standard-Anfrage, kein Ausfall
- **Change**: geplante Änderung

---

## 3. Ziele des Incident Managements

- **Schnellstmögliche Wiederherstellung** des Services
- **Minimierung** der Auswirkungen auf das Geschäft
- **Hohe Kundenzufriedenheit**
- **Erfüllung der SLAs**
- **Aufbau einer Wissensdatenbank** für die Zukunft

---

## 4. Incident-Lifecycle

### 4.1 Phasen

```
[Erkennen] → [Loggen] → [Kategorisieren] → [Priorisieren] →
[Eskalieren] → [Bearbeiten] → [Lösen] → [Schließen]
```

### 4.2 Erkennen

- Endbenutzer meldet Störung
- Monitoring-Tool schlägt Alarm
- Service Desk nimmt Anruf entgegen

### 4.3 Loggen

- Eindeutige Ticket-Nummer
- Ersteller, Zeit, Quelle
- Beschreibung des Problems
- Symptome, Fehlermeldungen

### 4.4 Kategorisieren

- **Kategorie**: z. B. Hardware, Software, Netzwerk
- **Subkategorie**: z. B. Drucker/Laserdrucker
- **Konfigurationsobjekt**: betroffenes CI

### 4.5 Priorisieren

(siehe 5.)

### 4.6 Eskalation

(siehe 6.)

### 4.7 Bearbeiten und Lösen

- 1st-Level-Support: Standardprobleme
- 2nd-Level-Support: Spezialistenteams
- 3rd-Level-Support: Hersteller, Engineering

### 4.8 Schließen

- Bestätigung durch Anwender
- Lösung dokumentieren
- Wissensdatenbank-Update
- Falls Problem vermutet: Übergang an Problem Management

---

## 5. Priorisierung (Impact × Urgency)

### 5.1 Impact (Auswirkung)

| Stufe | Beschreibung |
|---|---|
| **Hoch** | Viele Anwender betroffen, geschäftskritisch |
| **Mittel** | Einzelner Anwender oder -Team, Workaround möglich |
| **Niedrig** | Einzelne Anfrage, geringe Auswirkung |

### 5.2 Urgency (Dringlichkeit)

| Stufe | Beschreibung |
|---|---|
| **Hoch** | Sofortige Bearbeitung nötig |
| **Mittel** | Bearbeitung im Lauf des Tages |
| **Niedrig** | Bearbeitung im Service-Zeitfenster |

### 5.3 Prioritätsmatrix

| | **Impact: Niedrig** | **Impact: Mittel** | **Impact: Hoch** |
|---|---|---|---|
| **Urgency: Hoch** | P3 | P2 | **P1** |
| **Urgency: Mittel** | P4 | P3 | P2 |
| **Urgency: Niedrig** | P5 | P4 | P3 |

### 5.4 SLA-Zeiten

| P | Reaktion | Lösung |
|---|---|---|
| **P1** | 15 min | 4 h |
| **P2** | 30 min | 8 h |
| **P3** | 2 h | 24 h |
| **P4** | 8 h | 72 h |
| **P5** | 24 h | 1 Woche |

---

## 6. Eskalation

### 6.1 Funktionale Eskalation

Übergabe an spezialisierteres Team:

- 1st Level → 2nd Level (z. B. Netzwerk)
- 2nd Level → 3rd Level (z. B. Engineering)
- 3rd Level → Hersteller

### 6.2 Hierarchische Eskalation

Einbindung höherer Managementebenen:

- Team-Lead
- Service-Manager
- IT-Direktor
- Geschäftsführung

### 6.3 SLA-Eskalation

Automatische Eskalation bei SLA-Verletzung:

- 50 % der Reaktionszeit verstrichen → Vorwarnung
- 75 % verstrichen → Erinnerung
- 90 % verstrichen → Eskalation
- 100 % verstrichen → Verstoß-Meldung

---

## 7. Major Incident

### 7.1 Definition

Ein **Major Incident** ist ein Incident mit **hohem Impact** auf das Geschäft:

- Mehrere Services ausgefallen
- Viele Anwender betroffen
- Geschäftskritische Funktion betroffen
- Medienwirksam

### 7.2 Major-Incident-Prozess

1. **Erkennen und Klassifikation** als Major Incident
2. **Incident Manager** ernennen (kann auch Senior-Agent sein)
3. **Kommunikation** an Geschäftsleitung
4. **War Room** einrichten (virtuell oder physisch)
5. **Regelmäßige Updates** an Stakeholder
6. **Technische Wiederherstellung**
7. **Kommunikation der Lösung**
8. **Post-Incident-Review** (PIR / Post-Mortem)

### 7.3 Post-Incident-Review

- Was ist passiert?
- Warum ist es passiert?
- Welche Maßnahmen verhindern Wiederholung?
- Dokumentation
- Lessons Learned

---

## 8. Werkzeuge und Tools

### 8.1 Ticket-Systeme

- **Jira Service Management** (ehem. Jira Service Desk)
- **ServiceNow**
- **Freshdesk, Freshservice**
- **Zammad, GLPI** (Open Source)
- **OTRS** (Open Source)
- **BMC Remedy**

### 8.2 Funktionen

- Ticketerfassung
- Ticket-Lifecycle
- SLA-Management
- Wissensdatenbank
- Reporting
- CMDB-Integration

---

## 9. KPIs und Reporting

### 9.1 Wichtige KPIs

| KPI | Beschreibung |
|---|---|
| **MTTR** (Mean Time To Restore) | durchschnittliche Wiederherstellungszeit |
| **MTTD** (Mean Time To Detect) | durchschnittliche Erkennungszeit |
| **MTBF** (Mean Time Between Failures) | Zuverlässigkeit |
| **FCR** (First Call Resolution) | Erstlösungsquote |
| **SLA-Compliance** | Einhaltung der SLA-Zeiten |
| **Anzahl Incidents** | pro Zeitraum, pro Service |

### 9.2 Beispiel-Berechnung

```
MTTR = Summe Lösungszeiten / Anzahl Incidents
FCR = Anzahl Incidents beim ersten Kontakt gelöst / Gesamtanzahl
```

### 9.3 Berichte

- Tagesbericht: aktuelle P1-Incidents
- Wochenbericht: Trends, Auffälligkeiten
- Monatsbericht: SLA-Auswertung, Statistiken
- Quartalsbericht: strategische Auswertung

---

## 10. Best Practices

- **Klare Eskalationspfade** definieren
- **Tickets niemals schließen ohne Bestätigung**
- **Wissensdatenbank** aktiv pflegen
- **Self-Service-Portal** anbieten
- **Templates** für häufige Incidents
- **Self-Service-Password-Reset** entlasten Service Desk
- **Chatbots und KI** für First-Level-Support
- **Major-Incident-Übungen** regelmäßig durchführen

---

## 11. Übungen

### Übung 1 — Incident erkennen

Beschreiben Sie drei Incidents in Ihrer Umgebung und klassifizieren Sie sie.

### Übung 2 — Priorisierung

Priorisieren Sie die folgenden Incidents:

- Einzelner Drucker druckt nicht (Urgency: niedrig, Impact: niedrig)
- E-Mail-Server ausgefallen (Urgency: hoch, Impact: hoch)
- Anmeldung im CRM langsam (Urgency: mittel, Impact: mittel)

### Übung 3 — SLA formulieren

Formulieren Sie SLAs für einen E-Mail-Service.

### Übung 4 — Major Incident

Beschreiben Sie den Ablauf eines Major Incidents.

### Übung 5 — MTTR berechnen

Drei Incidents wurden in 2 h, 4 h und 8 h gelöst. MTTR?

### Übung 6 — Ticket-Lifecycle

Beschreiben Sie den Lifecycle eines Tickets vom Eingang bis zum Schließen.

---

## 12. Zusammenfassung

**Incident Management** zielt auf **schnellstmögliche Wiederherstellung** ausgefallener Services:

**Lifecycle:**

Erkennen → Loggen → Kategorisieren → Priorisieren → Bearbeiten → Lösen → Schließen

**Priorisierung:** Impact × Urgency

**Eskalation:** funktional (Spezialistenteam) oder hierarchisch (Management)

**Major Incident:** hoher Impact, eigene Verfahren, Post-Incident-Review

**KPIs:** MTTR, FCR, SLA-Compliance

**Tools:** Jira Service Management, ServiceNow, OTRS, Zammad

### Selbsttest-Checkliste

- [ ] Ich erkläre den Incident-Lifecycle.
- [ ] Ich priorisiere Incidents korrekt.
- [ ] Ich kenne Eskalationspfade.
- [ ] Ich handhabe Major Incidents.
- [ ] Ich nutze KPIs zur Auswertung.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4857 — Recherche 2026*
