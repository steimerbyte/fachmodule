# Fachmodul: Realisierung interoperabler CP-Systeme

**Kurs-ID:** 3758
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3758

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Interoperabilität – Überblick](#2-interoperabilität--überblick)
3. [Standards und Protokolle](#3-standards-und-protokolle)
4. [Industrie 4.0 und RAMI 4.0](#4-industrie-40-und-rami-40)
5. [Asset Administration Shell (AAS)](#5-asset-administration-shell-aas)
6. [OPC UA](#6-opc-ua)
7. [Semantic Interoperability](#7-semantic-interoperability)
8. [Beispielprojekte](#8-beispielprojekte)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Interoperabilität im Kontext von Industrie 4.0 erklären,
- OPC UA und AAS einordnen,
- semantische Interoperabilität erläutern,
- Anwendungsbeispiele skizzieren.

---

## 2. Interoperabilität – Überblick

**Interoperabilität** bezeichnet die **Fähigkeit verschiedener Systeme, zusammenzuarbeiten** und Informationen auszutauschen.

**Dimensionen:**

| Dimension | Beispiel |
|---|---|
| **Technisch** | gemeinsame Schnittstellen, Protokolle |
| **Syntaktisch** | gleiche Datenformate (XML, JSON) |
| **Semantisch** | gleiche Bedeutung der Daten |
| **Organisatorisch** | gleiche Prozesse, Rollen |

### 2.1 Wichtig für Industrie 4.0

- Unterschiedliche Anlagen, Steuerungen, Cloud-Systeme müssen kommunizieren
- Herstellerunabhängige Standards erforderlich
- Datenaustausch zwischen Maschinen, ERP, Cloud

---

## 3. Standards und Protokolle

### 3.1 OPC UA

- **OPC Unified Architecture**
- Plattformunabhängig
- Service-orientiert
- Sicher mit Verschlüsselung
- Companion Specifications für Branchen

### 3.2 MQTT

- Leichtgewichtig, Pub/Sub
- Für IoT und Edge
- Broker-basiert

### 3.3 AMQP

- Message-Broker-Standard
- Industrie-tauglich
- Mit RabbitMQ verbreitet

### 3.4 Weitere

- **DDS** (Data Distribution Service): Echtzeit, IoT
- **CoAP**: Constrained Devices
- **OPC UA Pub/Sub**: Erweiterung von OPC UA
- **WebSocket**: bidirektional

---

## 4. Industrie 4.0 und RAMI 4.0

### 4.1 Industrie 4.0

- Vernetzung von Maschinen, Produkten, Geschäftsprozessen
- Cyber-physische Systeme (CPS)
- Smart Factory
- Big Data und KI

### 4.2 RAMI 4.0 (Referenzarchitekturmodell Industrie 4.0)

```
┌──────────────────────────────────────────────────┐
│ Geschäftsprozesse / Wertschöpfung                │
├──────────────────────────────────────────────────┤
│ Funktionsmodelle                                  │
│ (Geschäftsfunktionen, Information, Integration) │
├──────────────────────────────────────────────────┤
│ Asset (digitale Zwillinge, AAS)                   │
├──────────────────────────────────────────────────┤
│ Integration (Datenaustausch, Dienste)            │
├──────────────────────────────────────────────────┤
│ Kommunikation (OPC UA, MQTT, 5G)                 │
├──────────────────────────────────────────────────┤
│ Asset (Maschinen, Steuerungen)                    │
└──────────────────────────────────────────────────┘
```

- **3 Achsen**: Architektur, Lebenszyklus, Hierarchie
- Definiert ein gemeinsames Vokabular für Industrie 4.0

---

## 5. Asset Administration Shell (AAS)

### 5.1 Definition

Der **AAS** ist eine **digitale Repräsentation** eines physischen oder immateriellen Assets (z. B. Maschine).

### 5.2 Eigenschaften

- Industrie-4.0-Konzept von Plattform Industrie 4.0
- **Submodelle** beschreiben Eigenschaften
- Standardisierte JSON/XML-Repräsentation
- **Herstellerunabhängig**

### 5.3 Aufbau

```
[AAS]
├── Asset Identification
├── Asset Documentation
├── Capability Description
├── Condition Monitoring
└── Submodels (z. B. Nameplate, OperatingData)
```

### 5.4 Beispiel JSON

```json
{
  "id": "https://example.com/aas/maschine1",
  "assetKind": "Instance",
  "globalAssetId": "urn:uuid:...",
  "submodels": [
    { "idShort": "Nameplate", ... },
    { "idShort": "OperatingData", ... }
  ]
}
```

### 5.5 Nutzen

- Digitaler Zwilling
- Interoperabilität zwischen Systemen
- Lebenszyklus-Management

---

## 6. OPC UA

### 6.1 Überblick

**OPC UA** ist der wichtigste Standard für **industrielle Interoperabilität**:

- Maschine-zu-Maschine (M2M)
- Maschine-zu-Cloud
- Sicher, plattformübergreifend

### 6.2 Architektur

- **Adressraum**: Knoten mit Attributen und Referenzen
- **Services**: Lesen, Schreiben, Methodenaufrufe, Subscriptions
- **Companion Specifications**: branchenspezifische Modelle

### 6.3 Beispiel Anwendungen

- Maschinendaten erfassen
- Steuerungsbefehle senden
- Historische Daten lesen
- Alarme/Audit-Logs abrufen

### 6.4 Tools

- **OPC UA Server**: in Steuerungen integriert (z. B. Siemens SIMATIC, Beckhoff)
- **OPC UA Clients**: SCADA, MES, Cloud
- **OPC UA Test-Server**: zur Entwicklung

---

## 7. Semantic Interoperability

### 7.1 Definition

**Semantische Interoperabilität**: Verschiedene Systeme verstehen die **gleiche Bedeutung** der ausgetauschten Daten.

### 7.2 Mittel

- **Taxonomien** (z. B. eCl@ss, UNSPSC)
- **Ontologien** (z. B. RDF Schema, OWL)
- **Asset Administration Shell** (standardisierte Submodelle)
- **JSON-LD** für Linked Data
- **OPC UA Companion Specifications**

### 7.3 Beispiel

- Asset mit Eigenschaft "Temperatur" → semantisch eindeutig definiert in AAS
- Beide Systeme verstehen "Temperatur in °C"
- Standardisierte Submodelle vermeiden Mehrdeutigkeit

---

## 8. Beispielprojekte

### 8.1 Smart Factory

- Maschinen mit OPC UA-Servern
- ERP-System über Middleware
- Cloud-Analyse der Produktionsdaten
- AAS für jeden Maschinenzustand

### 8.2 Smart Grid

- OPC UA für Smart-Meter
- MQTT für Heimenergiesysteme
- AAS für Anlagenpassung

### 8.3 Smart City

- Verkehr: OPC UA für Lichtsignalanlagen
- Umwelt: Sensoren mit MQTT
- Plattform: AAS für urbane Assets

### 8.4 Smart Farming

- Sensoren erfassen Bodenfeuchte
- MQTT zur Cloud
- AAS für Landmaschinen

---

## 9. Übungen

### Übung 1 — Interoperabilität

Erklären Sie die vier Dimensionen der Interoperabilität.

### Übung 2 — RAMI 4.0

Welche Schichten hat RAMI 4.0?

### Übung 3 — AAS

Erstellen Sie ein einfaches AAS-JSON für eine Maschine.

### Übung 4 — OPC UA

Welche OPC UA Companion Specifications gibt es?

### Übung 5 — Standards

Welcher Standard eignet sich für welche Anwendung?

### Übung 6 — Smart Factory

Planen Sie ein Smart-Factory-Projekt.

---

## 10. Zusammenfassung

**Interoperabilität** in Industrie 4.0 basiert auf **Standards**:

**RAMI 4.0:** Referenzarchitekturmodell Industrie 4.0

**AAS:** Digitale Repräsentation eines Assets

**OPC UA:** Industrie-Standard für M2M-Kommunikation

**MQTT, AMQP:** IoT-Protokolle

**Semantische Interoperabilität:** Taxonomien, Ontologien, AAS-Submodelle

### Selbsttest-Checkliste

- [ ] Ich erkläre Interoperabilität und ihre Dimensionen.
- [ ] Ich beschreibe RAMI 4.0.
- [ ] Ich nutze AAS und OPC UA.
- [ ] Ich kenne semantische Standards.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3758 — Recherche 2026*
