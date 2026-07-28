# FM: Service Request Management

**Kurs-ID:** 3569
**Kategorie:** Kursbibliothek / Fachmodule / ITSM
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3569

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Service Request Management?](#2-was-ist-service-request-management)
3. [Service Catalog](#3-service-catalog)
4. [Request-Fulfillment-Lifecycle](#4-request-fulfillment-lifecycle)
5. [Standardisierung und Self-Service](#5-standardisierung-und-self-service)
6. [Workflow und Genehmigungen](#6-workflow-und-genehmigungen)
7. [Werkzeuge](#7-werkzeuge)
8. [KPIs](#8-kpis)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Service Requests von Incidents unterscheiden,
- einen Service-Katalog erstellen,
- Self-Service-Portale einrichten,
- Genehmigungs-Workflows umsetzen,
- KPIs zur Erfolgsmessung nutzen.

---

## 2. Was ist Service Request Management?

**Service Request Management** bearbeitet **vorhersehbare, häufige Anfragen** der Anwender.

**Beispiele:**

- Passwort zurücksetzen
- Neue Software installieren
- Zugang zu einer Anwendung gewähren
- Hardware bestellen
- Verzeichniseintrag ändern

**Abgrenzung:**

| Aspekt | Service Request | Incident |
|---|---|---|
| **Art** | Standard, vorhersehbar | unvorhergesehen |
| **Dringlichkeit** | niedrig (geplant) | hoch |
| **Wiederholbarkeit** | hoch | gering |
| **Lösung** | oft Self-Service | persönliche Bearbeitung |
| **Workflow** | klar definiert | individuell |

---

## 3. Service Catalog

### 3.1 Definition

Der **Service Catalog** ist die **strukturierte, benutzerfreundliche Übersicht** aller verfügbaren IT-Services und Anfragen.

### 3.2 Inhalte

- **Service-Name** und Beschreibung
- **Kosten** (sofern relevant)
- **Genehmigungen** erforderlich?
- **Lieferzeiten**
- **SLAs** für die Bearbeitung
- **Bestell-Link**

### 3.3 Beispiel

```
Service Catalog OSZ-IMT
├── Mein Passwort zurücksetzen
├── Neue Software beantragen
├── Zugang zu Moodle beantragen
├── Hardware bestellen (Maus, Tastatur)
├── VPN-Zugang einrichten
├── E-Mail-Konto erstellen
└── Schulungsraum buchen
```

### 3.4 Mehrstufiger Service Catalog

- **Business Service**: Was der Kunde sieht
- **Service Offering**: konkrete Konfiguration
- **Service Pipeline**: in Entwicklung

---

## 4. Request-Fulfillment-Lifecycle

### 4.1 Phasen

```
[Anfrage] → [Genehmigung] → [Erstellung] → [Bereitstellung] → [Abschluss]
```

### 4.2 Anfrage

- Anwender stellt Anfrage via Self-Service-Portal, E-Mail oder Telefon
- Anfrage wird im Ticket-System erfasst
- Eindeutige Ticket-Nummer

### 4.3 Genehmigung

- Vordefinierte Genehmiger (Vorgesetzter, IT-Verantwortlicher)
- Workflow mit Genehmigungsschritten
- E-Mail-Benachrichtigung

### 4.4 Erstellung

- Berechtigungen setzen
- Software installieren
- Hardware liefern
- Account erstellen

### 4.5 Bereitstellung

- Mitteilung an Anwender
- Schulung bei Bedarf
- Test durch Anwender

### 4.6 Abschluss

- Bestätigung durch Anwender
- Ticket schließen
- Feedback einholen
- Wissensdatenbank-Update

---

## 5. Standardisierung und Self-Service

### 5.1 Standardisierung

- Häufige Anfragen als **vordefinierte Katalog-Einträge**
- Standardisierte Workflows
- Reduzierte Bearbeitungszeit
- Konsistente Ergebnisse

### 5.2 Self-Service-Portal

- Anwender bestellt 24/7
- Keine Wartezeit auf Service Desk
- Vorausgefüllte Formulare
- Statusverfolgung in Echtzeit
- Mobile-tauglich

### 5.3 Beispiele für Self-Service

- Passwort-Reset (Self-Service-Passwort-Reset, SSPR)
- Software-Download
- Hardware-Bestellung
- Raumbuchung
- Antrag auf Remote-Zugang

---

## 6. Workflow und Genehmigungen

### 6.1 Genehmigungsworkflow

```
Anwender → Vorgesetzter → IT-Verantwortlicher → Service Delivery → Anwender
```

### 6.2 Genehmigungsregeln

- Kosten unter 50 €: direkter IT-Manager
- Kosten 50-500 €: zusätzlich Abteilungsleiter
- Kosten über 500 €: zusätzlich Geschäftsführung

### 6.3 Automatisierte Genehmigungen

- Bestimmte Anfragen direkt genehmigen
- Beispiel: Passwort-Reset für alle Mitarbeiter

### 6.4 Mehrstufige Workflows

- Genehmigung, dann Implementierung, dann Benachrichtigung
- Parallele Genehmigungen (IT, HR, Compliance)
- Sequentielle Genehmigungen (mehrere Hierarchieebenen)

---

## 7. Werkzeuge

### 7.1 Service Catalog Tools

- **ServiceNow Service Catalog**
- **Jira Service Management**
- **BMC Remedy**
- **Freshservice**
- **OTRS**

### 7.2 Funktionen

- Katalog-Editor
- Bestellformulare
- Workflow-Engine
- Genehmigungen
- Reporting

---

## 8. KPIs

| KPI | Beschreibung |
|---|---|
| **Anzahl Requests** | pro Zeitraum |
| **Bearbeitungszeit** | durchschnittliche Zeit |
| **First-Contact-Resolution** | Anteil sofort gelöst |
| **Customer Satisfaction** | Zufriedenheit der Anwender |
| **Self-Service-Rate** | Anteil Self-Service-Anfragen |

---

## 9. Übungen

### Übung 1 — Service-Katalog

Erstellen Sie einen Service-Katalog mit 10 typischen IT-Services.

### Übung 2 — Workflow

Beschreiben Sie einen Genehmigungsworkflow für Hardwarbestellung.

### Übung 3 — Self-Service

Welche Services eignen sich für Self-Service?

### Übung 4 — Genehmigungsregeln

Erstellen Sie Genehmigungsregeln für Ihr Szenario.

### Übung 5 — KPIs

Welche KPIs sind für Service Request Management relevant?

---

## 10. Zusammenfassung

**Service Request Management** bearbeitet **vorhersehbare Anfragen**:

**Service Catalog:**

- Strukturierte Übersicht aller Services
- Self-Service-fähig
- Standardisierte Workflows

**Lifecycle:**

1. Anfrage
2. Genehmigung
3. Erstellung
4. Bereitstellung
5. Abschluss

**Self-Service:**

- Anwender bestellt eigenständig
- Weniger Service-Desk-Last
- Schnellere Erfüllung

**Genehmigungsworkflows:**

- Regeln je nach Kosten/Sensitivität
- Automatisierte Standardgenehmigungen
- Mehrstufige Workflows

**KPIs:** Anzahl, Bearbeitungszeit, FCR, CSAT, Self-Service-Rate

### Selbsttest-Checkliste

- [ ] Ich unterscheide Service Requests von Incidents.
- [ ] Ich erstelle einen Service-Katalog.
- [ ] Ich implementiere Self-Service-Portale.
- [ ] Ich nutze Genehmigungsworkflows.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3569 — Recherche 2026*
