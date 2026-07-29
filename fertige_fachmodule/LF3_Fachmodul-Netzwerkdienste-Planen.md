# Fachmodul: Planen erforderlicher Dienste und Netzwerkkomponenten

**Kurs-ID:** 3599
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3599

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Vorgehensweise bei der Planung](#2-vorgehensweise-bei-der-planung)
3. [Bedarfsanalyse](#3-bedarfsanalyse)
4. **Planungsphasen**
5. [Dimensionierung des Netzwerks](#5-dimensionierung-des-netzwerks)
6. [Auswahl der Netzwerkkomponenten](#6-auswahl-der-netzwerkkomponenten)
7. [Dokumentation](#7-dokumentation)
8. [Bild- und Quellenverweise](#8-bild-und-quellenverweise)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- eine strukturierte Netzwerkplanung durchführen,
- Anforderungen aus dem Lastenheft in technische Spezifikationen übersetzen,
- Netzwerkkomponenten passend dimensionieren und auswählen,
- die Planung dokumentieren,
- typische Fehler vermeiden.

---

## 2. Vorgehensweise bei der Planung

Die Netzwerkplanung folgt einem strukturierten Prozess:

1. **Anforderungsanalyse**: Was soll das Netz leisten?
2. **Lastenheft**: Was sind die fachlichen Anforderungen?
3. **Pflichtenheft**: Was sind die technischen Lösungen?
4. **Design**: Wie sieht die konkrete Architektur aus?
5. **Implementierung**: Aufbau und Konfiguration
6. **Test**: Funktioniert alles?
7. **Inbetriebnahme**: Übergabe
8. **Wartung**: Dokumentation, Monitoring, Updates

---

## 3. Bedarfsanalyse

### 3.1 Was zu klären ist

- **Anzahl Endgeräte** (heute und Wachstum)
- **Anwendungen** (Web, E-Mail, Datenbank, VoIP, Streaming)
- **Bandbreitenanforderungen** (pro Anwendung und gesamt)
- **Latenzanforderungen** (Echtzeit, VoIP)
- **Verfügbarkeit** (5×8 h, 24×7)
- **Sicherheit** (Firewalls, Segmentierung)
- **Wachstum** (Skalierbarkeit)
- **Budget**
- **Zeitplan**

### 3.2 Lastenheft-Beispiel

```
Projekt: Schulnetzwerk OSZ-IMT

Anforderungen:
- 500 Endgeräte (PCs, Notebooks, mobile Geräte)
- WLAN in allen Klassenzimmern
- Internetzugang mit 500 Mbit/s
- 3 Stockwerke, je 150 PCs
- Verfügbarkeit 99 %
- Datenschutz nach DSGVO
- Skalierung auf 800 Geräte in 5 Jahren

Budget: 250.000 €
Zeit: 6 Monate
```

---

## 4. Planungsphasen

### 4.1 Konzeptphase

- Architektur (Stern, Backbone)
- Technologiewahl (LWL, Twisted Pair, WLAN-Standard)
- Komponentenwahl (Hersteller)
- Adressierung (IP-Adressen, VLANs)

### 4.2 Detailplanung

- Konkrete Komponenten mit Bestellnummern
- Verkabelungsplan mit Kabellängen
- Konfigurationsplan
- Backup-Konzept
- Security-Architektur

### 4.3 Implementierungsphase

- Schrittweise Migration
- Test des Pilotbetriebs
- Schulung der Anwender
- Übergang in den Regelbetrieb

---

## 5. Dimensionierung des Netzwerks

### 5.1 Bandbreitenrechnung

**Beispiel:** 500 PCs × 10 Mbit/s = 5000 Mbit/s Uplink-Bedarf

**Faustregeln:**

- Pro PC: 10–50 Mbit/s verfügbar
- Aggregation: 4 × 1-Gbit-Uplinks pro 48-Port-Switch
- Core: 10–40 Gbit/s zwischen Core-Switches

### 5.2 Geräteanzahl

- Access-Switches: ~48 Ports, je Stockwerk 3-5
- Core-Switches: 2 (redundant)
- Router: 1-2 (pro ISP-Uplink)
- Firewall: 1-2 (redundant)
- WLAN-APs: ~1 pro 5 Klassenzimmer

### 5.3 Beispielrechnung

```
500 PCs / 48 Ports = ~11 Switches
+ 2 Core-Switches
+ 2 Router
+ 2 Firewalls
+ 100 WLAN-APs
```

---

## 6. Auswahl der Netzwerkkomponenten

### 6.1 Auswahlkriterien

- **Leistungsfähigkeit**: Ports, Backplane, Switching-Kapazität
- **Funktionen**: VLAN, PoE, Layer-3-Switching, ACLs
- **Zuverlässigkeit**: MTBF, Redundanzmöglichkeiten
- **Management**: SNMP, Web-UI, CLI, SSH
- **Sicherheit**: MAC-Sec, 802.1X, ACLs
- **Hersteller-Support**: Garantie, Updates, Schulungen
- **Kosten**: CAPEX (Investition) und OPEX (Betrieb)

### 6.2 Switch-Auswahl

| Einsatzort | Ports | Empfehlung |
|---|---|---|
| Access (Endgeräte) | 24/48 Port | Cisco Catalyst 2960, HP Aruba 2530, Ubiquiti UniFi Switch |
| Core | Modular | Cisco Catalyst 9500, Arista 7050X |
| Aggregation | 24-48 SFP+ | Cisco Catalyst 3850, HPE Aruba 3810M |

### 6.3 Router-Auswahl

| Größe | Empfehlung |
|---|---|
| Klein | MikroTik, Ubiquiti EdgeRouter |
| Mittel | Cisco ISR 4000, Juniper SRX |
| Groß | Cisco ASR 9000, Nokia SR Linux |

### 6.4 Firewall-Auswahl

| Größe | Empfehlung |
|---|---|
| Klein | pfSense, OPNsense, Sophos XG (kostenlos) |
| Mittel | Fortinet FortiGate, Palo Alto PA-300 |
| Groß | Palo Alto PA-5200, Check Point 25000 |

---

## 7. Dokumentation

### 7.1 Netzwerkplan-Dokumentation

- **Netzwerkdiagramme** (logical und physical)
- **IP-Adressplan** mit Subnetting
- **VLAN-Tabelle**
- **Switch-Port-Dokumentation**
- **Routing-Tabellen**
- **Konfigurations-Backups**

### 7.2 Tools

- **Microsoft Visio**: professionell, kostenpflichtig
- **draw.io**: kostenlos, Browser
- **NetBox**: IPAM/DCIM-Tool, Open Source
- **DokuWiki, Confluence**: Wiki-basierte Dokumentation

### 7.3 Wichtig

- Aktuelle Dokumentation ist Pflicht
- Bei jeder Änderung aktualisieren
- Backup der Konfigurationen regelmäßig
- Patch-Management dokumentieren

---

## 8. Bild- und Quellenverweise

- draw.io: <https://www.drawio.com/>
- NetBox: <https://netbox.readthedocs.io/>
- Cisco Network Design: <https://www.cisco.com/c/en/us/solutions/design-zone/networking-design-guidelines/networking-basics.html>

---

## 9. Übungen

### Übung 1 — Lastenheft

Erstellen Sie ein Lastenheft für ein Schulnetzwerk mit 300 PCs.

### Übung 2 — Bandbreitenrechnung

Berechnen Sie den Bandbreitenbedarf für 200 VoIP-Telefone (je 100 kbit/s).

### Übung 3 — Komponentenauswahl

Wählen Sie Komponenten für ein mittleres Unternehmensnetz (50 Mitarbeiter).

### Übung 4 — IP-Adressplan

Erstellen Sie einen IP-Adressplan für 5 Abteilungen mit je 50 PCs.

### Übung 5 — Dokumentation

Dokumentieren Sie die Topologie Ihres Heimnetzwerks.

---

## 10. Zusammenfassung

**Netzwerkplanung** ist ein strukturierter Prozess:

1. **Bedarfsanalyse** → Lastenheft
2. **Konzept** → Architektur, Technologien
3. **Detailplanung** → Komponenten, Verkabelung, Konfiguration
4. **Implementierung** → Aufbau und Konfiguration
5. **Test und Inbetriebnahme**
6. **Wartung** → Dokumentation, Monitoring

**Wichtige Aspekte:**

- Bandbreitenrechnung
- Redundanz und Skalierbarkeit
- Sicherheit (Firewall, Segmentierung)
- Dokumentation (Diagramme, IP-Plan)
- Hersteller-Support und Garantien

### Selbsttest-Checkliste

- [ ] Ich erstelle ein Lastenheft.
- [ ] Ich plane Netzwerkarchitektur und Komponenten.
- [ ] Ich berücksichtige Bandbreiten und Wachstum.
- [ ] Ich dokumentiere vollständig.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3599 — Recherche 2026*
