# FM: Service Configuration Management

**Kurs-ID:** 4860
**Kategorie:** Kursbibliothek / Fachmodule / ITSM
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4860

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Configuration Management?](#2-was-ist-configuration-management)
3. [Configuration Items (CIs)](#3-configuration-items-cis)
4. [Configuration Management Database (CMDB)](#4-configuration-management-database-cmdb)
5. [Beziehungen zwischen CIs](#5-beziehungen-zwischen-cis)
6. [Discovery und CI-Erfassung](#6-discovery-und-ci-erfassung)
7. [Baseline und Audit](#7-baseline-und-audit)
8. [Werkzeuge](#8-werkzeuge)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Configuration Items (CIs) identifizieren und kategorisieren,
- eine CMDB aufbauen und pflegen,
- Beziehungen zwischen CIs modellieren,
- Discovery-Tools einsetzen,
- Baselines und Audits durchführen.

---

## 2. Was ist Configuration Management?

**Service Configuration Management** verwaltet alle Komponenten, die zur Bereitstellung von IT-Services beitragen.

**Ziele:**

- Vollständiger Überblick über IT-Komponenten
- Schnelle Ursachenanalyse bei Incidents
- Impact-Analyse vor Changes
- Compliance-Nachweis (z. B. Lizenzen)

---

## 3. Configuration Items (CIs)

### 3.1 Definition

Ein **Configuration Item (CI)** ist jede Komponente, die zur Bereitstellung eines IT-Services verwaltet werden muss.

### 3.2 CI-Kategorien

| Kategorie | Beispiele |
|---|---|
| **Hardware** | Server, Router, Switches, PCs |
| **Software** | Betriebssysteme, Anwendungen, Lizenzen |
| **Netzwerk** | VLANs, IP-Adressen, Firewall-Regeln |
| **Dokumente** | Verträge, SLAs, Runbooks |
| **Services** | E-Mail, Datenbank, Webserver |
| **Personen** | Mitarbeiter, Rollen, Berechtigungen |
| **Standorte** | Rechenzentren, Büroräume |

### 3.3 CI-Attribute

- Eindeutige CI-ID
- Name
- Typ/Kategorie
- Version
- Standort
- Verantwortlicher
- Status (in Betrieb, in Wartung, ausgemustert)
- Kaufdatum, Garantie
- Kosten
- Beziehungen zu anderen CIs

### 3.4 CI-Hierarchie

- **Level 1**: Geschäftsprozesse
- **Level 2**: IT-Services
- **Level 3**: IT-Komponenten (Anwendungen, Server, Netzwerk)

---

## 4. Configuration Management Database (CMDB)

### 4.1 Definition

Eine **CMDB** speichert Informationen über alle CIs und ihre Beziehungen.

### 4.2 Funktionen

- Speicherung der CI-Daten
- Beziehungen zwischen CIs
- Versionierung und Historisierung
- Abfragen und Reports
- Visualisierung von Abhängigkeiten

### 4.3 Federated CMDB

Eine **federated CMDB** integriert Daten aus mehreren Quellsystemen:

- ServiceNow CMDB
- AWS Config
- Microsoft Intune (für Endgeräte)
- Spezialtools (z. B. Monitoring)

### 4.4 Wichtige Metadaten

- **Source of Truth**: Welches System hat die korrekten Daten?
- **Konsistenz**: Daten zwischen Systemen synchronisieren
- **Aktualität**: Wie schnell werden Daten aktualisiert?

---

## 5. Beziehungen zwischen CIs

### 5.1 Beziehungsarten

- **Läuft auf**: Anwendung läuft auf Server
- **Nutzt**: Service nutzt Datenbank
- **Verbindet zu**: Server ist mit Switch verbunden
- **Gehört zu**: Komponente gehört zu Service
- **Abhängig von**: Service hängt von Netzwerk ab

### 5.2 Beispiel

```
[E-Mail-Service]
   ├── nutzt → [Exchange Server]
   │               ├── läuft auf → [Windows Server 2022]
   │               │                    ├── läuft auf → [VMWare ESXi]
   │               │                    └── nutzt → [SAN Storage]
   │               └── nutzt → [Active Directory]
   ├── nutzt → [DNS Server]
   │               └── läuft auf → [Linux Server]
   └── nutzt → [Netzwerk-VLAN 10]
```

### 5.3 Visualisierung

- **Abhängigkeitsgraph**: Knoten = CI, Kanten = Beziehungen
- **Hierarchie**: Bäume
- **Heatmap**: Kritikalität

---

## 6. Discovery und CI-Erfassung

### 6.1 Methoden

- **Agent-basiert**: Agent auf jedem Gerät (z. B. ServiceNow Agent)
- **Agentless**: SNMP, SSH, WMI, REST
- **Active Discovery**: Netzwerk scannen
- **Passive Discovery**: Netzwerkverkehr beobachten

### 6.2 Discovery-Tools

- **ServiceNow Discovery**
- **Device42**
- **Lansweeper**
- **Snipe-IT** (Asset-Management)
- **OCS Inventory** (Open Source)
- **LizardFS, NetBox** (IPAM)

### 6.3 CI-Lebenszyklus

```
Identifikation → Registrierung → Discovery → Klassifikation → Beziehungen → Pflege → Ausmusterung
```

---

## 7. Baseline und Audit

### 7.1 Baseline

Eine **Baseline** ist der zu einem Zeitpunkt erfasste Soll-Zustand der CMDB. Sie dient als Referenz für Audits.

### 7.2 Audit

- **Regelmäßige Audits** prüfen CMDB-Pflege
- **Abweichungen** zwischen CMDB und Realität identifizieren
- **Korrekturmaßnahmen** einleiten

### 7.3 Audit-Häufigkeit

- Kritische CIs: monatlich
- Standard-CIs: quartalsweise
- Jährlicher Gesamt-Audit

---

## 8. Werkzeuge

### 8.1 CMDB-Tools

- **ServiceNow CMDB**: Marktführer
- **Device42**: Cloud-fähig, gut für Netzwerk
- **i-doit**: Open Source
- **NetBox**: Open Source, IPAM/DCIM
- **CMDBuild**: Open Source

### 8.2 Discovery-Tools

- **ServiceNow Discovery**
- **Device42**
- **Lansweeper**

---

## 9. Übungen

### Übung 1 — CI identifizieren

Listen Sie 20 CIs für Ihr Heim- oder Schulnetzwerk auf.

### Übung 2 — Beziehungen modellieren

Modellieren Sie die CI-Beziehungen für einen Webservice.

### Übung 3 — Discovery planen

Planen Sie die Discovery-Strategie für ein mittleres Unternehmen.

### Übung 4 — Audit erstellen

Erstellen Sie einen Audit-Plan für eine CMDB.

### Übung 5 — Tool-Vergleich

Vergleichen Sie ServiceNow CMDB mit Device42.

---

## 10. Zusammenfassung

**Service Configuration Management** schafft Überblick über alle IT-Komponenten:

**Configuration Items (CIs):**

- Hardware, Software, Netzwerk, Dokumente, Services, Personen, Standorte
- Attribute: ID, Name, Typ, Version, Verantwortlicher, Status, Kosten

**CMDB:**

- Speichert CIs und Beziehungen
- Federation mit anderen Datenquellen

**Beziehungen:**

- Läuft auf, nutzt, verbindet, gehört zu, abhängig von

**Discovery:**

- Agent-basiert, agentless, aktiv, passiv

**Baseline + Audit:**

- Soll-Zustand definieren
- Regelmäßige Überprüfung

### Selbsttest-Checkliste

- [ ] Ich identifiziere CIs.
- [ ] Ich modelliere CI-Beziehungen.
- [ ] Ich nutze Discovery-Tools.
- [ ] Ich führe Audits durch.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4860 — Recherche 2026*
