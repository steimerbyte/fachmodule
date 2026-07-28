# Fachmodul: Netzwerkkomponenten

**Kurs-ID:** 1920
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1920

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Aktive vs. passive Netzwerkkomponenten](#2-aktive-vs-passive-netzwerkkomponenten)
3. [M2: Analyse des Kundengesprächs](#3-m2-analyse-des-kundengesprächs)
4. [Die wichtigsten aktiven Komponenten im Überblick](#4-die-wichtigsten-aktiven-komponenten-im-überblick)
5. [Server im Netz](#5-server-im-netz)
6. [Switch im Detail](#6-switch-im-detail)
7. [Router im Detail](#7-router-im-detail)
8. [Hub und Bridge](#8-hub-und-bridge)
9. [Firewall und Sicherheitskomponenten](#9-firewall-und-sicherheitskomponenten)
10. [Hersteller und Produkte](#10-hersteller-und-produkte)
11. [Kundengespräch: Bedarfsanalyse](#11-kundengespräch-bedarfsanalyse)
12. [Übungen](#12-übungen)
13. [Zusammenfassung](#13-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- aktive und passive Netzwerkkomponenten unterscheiden,
- die Aufgaben von Server, Switch, Router im Netz beschreiben,
- Hub, Bridge, Switch und Router abgrenzen,
- Hersteller und Produkte überblicken,
- Bedarfsanalyse bei einem Kundengespräch durchführen.

---

## 2. Aktive vs. passive Netzwerkkomponenten

| Typ | Eigenschaften | Beispiele |
|---|---|---|
| **Passiv** | keine eigene Stromversorgung, rein mechanisch/optisch | Patchkabel, Patchfelder, Serverschränke, Stecker |
| **Aktiv** | eigene Stromversorgung, Intelligenz | Server, Router, Switches, Hubs, Bridges, Gateways, Firewalls |

Aktive Komponenten sind die zentralen Elemente des Netzwerks und sorgen maßgeblich für eine schnelle und stabile Verbindung.

---

## 3. M2: Analyse des Kundengesprächs

In diesem Lernmodul lernen Sie, ein Kundengespräch zu führen und die Anforderungen in eine Komponentenauswahl zu übersetzen.

**Schritte:**

1. **Anforderungsaufnahme**: Welche Endgeräte? Welche Bandbreiten? Welche Anwendungen?
2. **Bestandsaufnahme**: Welche Infrastruktur existiert bereits?
3. **Anforderungskatalog**: Pflichtenheft, Performance, Sicherheit, Skalierbarkeit
4. **Komponentenauswahl**: Welche Geräte mit welchen Eigenschaften?
5. **Kostenschätzung**: Hardware, Lizenzen, Verkabelung, Wartung
6. **Angebotserstellung**: Strukturiertes Angebot mit Konfigurationsbeispielen

---

## 4. Die wichtigsten aktiven Komponenten im Überblick

### 4.1 Hub

- **Layer 1 (Physical Layer)**
- Verteilt eingehende Signale an alle Ports
- Heute praktisch bedeutungslos (durch Switches ersetzt)

### 4.2 Bridge

- **Layer 2 (Data Link Layer)**
- Verbindet zwei Netzwerk-Segmente
- Filtert Frames anhand von MAC-Adressen
- Heute: Funktion vom Switch übernommen

### 4.3 Switch

- **Layer 2 (Data Link Layer)** oder **Layer 3 (Network Layer)**
- Lernt MAC-Adressen, leitet Frames zielgerichtet weiter
- Vollduplex, Punkt-zu-Punkt
- Standard im LAN

### 4.4 Router

- **Layer 3 (Network Layer)**
- Verbindet verschiedene Netzwerke
- Routing-Tabelle, Routing-Protokolle (OSPF, BGP)
- NAT, Firewall-Funktion

### 4.5 Gateway

- **Layer 5–7 (Application Layer)**
- Übersetzt zwischen Protokollen
- E-Mail-Gateway, VoIP-Gateway, IoT-Gateway

### 4.6 Firewall

- **Layer 3–7**
- Filtert Pakete, Verbindungen, Inhalte
- Stateful Inspection, Deep Packet Inspection

### 4.7 Medienkonverter

- **Layer 1**
- Wandelt zwischen Kupfer (RJ45) und LWL
- Beispiel: 1000BASE-T ↔ 1000BASE-LX

### 4.8 Modem und ONT

- **Layer 1**
- Wandlung digitales ↔ analoges Signal (Modem)
- Lichtsignalabschluss beim Endkunden (ONT)

---

## 5. Server im Netz

### 5.1 Aufgaben

- Bereitstellung von Diensten (Web, Datenbank, E-Mail, Datei)
- Authentifizierung und Autorisierung (AD, LDAP)
- Backup, Monitoring

### 5.2 Formen

| Form | Eigenschaften |
|---|---|
| **Tower-Server** | einzeln, leise, für KMU |
| **Rack-Server** | 19-Zoll, 1–4 HE, für Rechenzentrum |
| **Blade-Server** | kompakt, im Blade-Chassis |
| **Hyperconverged** | Server + Storage + Netzwerk in einem Gerät |

### 5.3 Server-Dienste

- **DHCP**: dynamische IP-Vergabe
- **DNS**: Namensauflösung
- **AD/LDAP**: Verzeichnisdienst, Authentifizierung
- **Web**: HTTP/HTTPS
- **Mail**: SMTP, IMAP, POP3
- **Datei**: SMB, NFS
- **Datenbank**: MySQL, PostgreSQL, Oracle
- **PKI**: Zertifikate

---

## 6. Switch im Detail

### 6.1 Funktionsweise

Der Switch lernt die MAC-Adressen der angeschlossenen Geräte und leitet Frames gezielt nur an den richtigen Port weiter.

**Switch-Tabelle (CAM-Tabelle):**

```
| MAC              | Port |
|------------------|------|
| AA:BB:CC:11:22:33 | 1    |
| AA:BB:CC:22:33:44 | 2    |
```

### 6.2 Switching-Modi

- **Store-and-Forward**: liest ganzen Frame, prüft CRC, leitet weiter
- **Cut-Through**: liest nur Ziel-MAC, leitet sofort weiter
- **Fragment-Free**: liest 64 Byte, dann weiterleiten

### 6.3 Funktionen moderner Switches

- VLAN (802.1Q)
- Spanning Tree Protocol (STP, RSTP, MSTP)
- Link Aggregation (LAG, LACP)
- QoS (Quality of Service, 802.1p, DSCP)
- PoE (Power over Ethernet)
- Port-Mirroring (SPAN)
- ACLs (Access Control Lists)
- SNMP (Monitoring)
- Layer-3-Switch: Routing-Funktion

### 6.4 Managed vs. Unmanaged

| Aspekt | Unmanaged | Managed |
|---|---|---|
| Konfiguration | keine | Web, CLI, SSH |
| VLAN | nein | ja |
| SNMP | nein | ja |
| Preis | niedrig | hoch |

---

## 7. Router im Detail

### 7.1 Routing-Tabelle

```
Destination      Gateway          Interface
0.0.0.0/0        192.168.1.1      eth0 (default)
10.0.0.0/8       10.0.0.1         eth1
192.168.1.0/24    —                eth0 (direkt)
```

### 7.2 Routing-Protokolle

- **RIP (Routing Information Protocol)**: Distance-Vector, Hop-Count, klein
- **OSPF (Open Shortest Path First)**: Link-State, mittelgroße Netze
- **BGP (Border Gateway Protocol)**: Path-Vector, Internet-Backbone
- **EIGRP (Cisco-proprietär)**: Hybrid

### 7.3 NAT

```
┌─────────────┐
│  Internes Netz│  192.168.1.0/24
│  PC1: 192.168.1.10
└─────────────┘
         │
         ↓
   ┌─────────────┐
   │   Router    │  NAT: 192.168.1.10 → 203.0.113.10
   └─────────────┘
         │
         ↓
   ┌─────────────┐
   │   Internet   │  203.0.113.0/24
   └─────────────┘
```

### 7.4 Firewall-Funktionen

- Stateful Inspection
- ACLs (Access Control Lists)
- DMZ (Demilitarized Zone)
- Port Address Translation (PAT)

---

## 8. Hub und Bridge

### 8.1 Hub

- Verteilt alle Signale an alle Ports
- Eine Kollisionsdomäne
- Veraltet

### 8.2 Bridge

- Trennt zwei Segmente
- Lernt MAC-Adressen
- Veraltet (Switch = Multiport-Bridge)

---

## 9. Firewall und Sicherheitskomponenten

### 9.1 Firewall-Typen

| Typ | Funktionsweise |
|---|---|
| **Paketfilter** | Layer 3/4, IP/Port |
| **Stateful Inspection** | Verbindungs-Zustand |
| **Application Proxy** | Layer 7, Inhaltsprüfung |
| **NGFW (Next-Generation Firewall)** | DPI, IDS/IPS, Sandboxing |

### 9.2 IDS/IPS

- **IDS (Intrusion Detection System)**: erkennt und meldet
- **IPS (Intrusion Prevention System)**: erkennt und blockiert

### 9.3 VPN

- Standort-VPN (Site-to-Site)
- Endgeräte-VPN (Remote Access)
- Protokolle: IPsec, SSL/TLS, WireGuard, OpenVPN

---

## 10. Hersteller und Produkte

### 10.1 Wichtige Hersteller

| Hersteller | Schwerpunkt |
|---|---|
| **Cisco** | Enterprise-Routing/Switching (Marktführer) |
| **HP / Aruba** | Enterprise und KMU |
| **Juniper Networks** | High-Performance-Netze |
| **Ubiquiti (UniFi)** | KMU, Heimbereich, sehr gutes Preis-Leistungs-Verhältnis |
| **Mikrotik** | preiswert, RouterOS |
| **TP-Link** | Heimbereich, KMU |
| **Netgear** | KMU |
| **Huawei** | Enterprise, Backbone |
| **Arista** | Rechenzentrum, High-Performance |
| **Fortinet, Palo Alto Networks, Check Point** | Firewalls/NGFW |
| **Sophos, pfSense, OPNsense** | Open-Source-Firewalls |

### 10.2 Beispiel-Konfiguration

**Klein (Heimbüro, 10 Geräte):**

- Router mit Firewall: Ubiquiti UniFi Dream Machine Pro
- Switch: 8-Port Gigabit Unmanaged
- Access Point: UniFi AC Pro

**Mittel (KMU, 100 Geräte):**

- Router: MikroTik CCR2004-1G-12S+2XS
- Switches: 2× Cisco Catalyst 2960-X (48 Ports)
- Firewall: Fortigate 60F oder pfSense
- APs: 4× Cisco Meraki MR36

**Groß (Enterprise, 1000+ Geräte):**

- Router: Cisco ASR 9000
- Core-Switches: Cisco Catalyst 9500
- Access-Switches: Cisco Catalyst 9300
- Firewall: Palo Alto PA-5220
- APs: Cisco Meraki MR46

---

## 11. Kundengespräch: Bedarfsanalyse

### 11.1 Fragetechniken

- **Offene Fragen**: "Welche Anwendungen sind geplant?"
- **Geschlossene Fragen**: "Benötigen Sie PoE?"
- **Skalierungsfragen**: "Wie viele Mitarbeiter?"
- **Sicherheitsfragen**: "Was muss geschützt werden?"

### 11.2 Lastenheft

Typische Punkte:

- Anzahl Endgeräte
- Bandbreiten-Anforderungen
- Sicherheitsanforderungen
- Skalierbarkeit
- Redundanz
- Budget

### 11.3 Pflichtenheft

- Konkrete Komponentenliste
- Konfiguration
- Verkabelungsplan
- Zeitplan
- Kostenaufstellung

---

## 12. Übungen

### Übung 1 — Komponenten zuordnen

Welche Komponente für welche Aufgabe?

### Übung 2 — Switch-Auswahl

Wählen Sie einen Switch für 48 Ports, Gigabit, PoE, VLAN-fähig.

### Übung 3 — Routing-Protokoll

Welches Routing-Protokoll für eine Filiale mit 5 Standorten?

### Übung 4 — Bedarfsanalyse

Führen Sie eine Bedarfsanalyse für ein Heimbüro mit 5 Geräten durch.

### Übung 5 — Hersteller-Recherche

Recherchieren Sie die Preise eines UniFi-Sets vs. Cisco Catalyst für 24 Ports.

---

## 13. Zusammenfassung

| Komponente | OSI | Funktion |
|---|---|---|
| Hub | 1 | Broadcast |
| Bridge | 2 | Segmentverbindung |
| Switch | 2/3 | MAC-Tabelle, VLAN |
| Router | 3 | Routing, NAT |
| Gateway | 7 | Protokollumsetzung |
| Firewall | 3–7 | Sicherheit |
| Modem/ONT | 1 | WAN-Medienwandlung |

**Bedarfsanalyse:**

1. Anforderungen erfassen
2. Bestandsaufnahme
3. Lastenheft/Pflichtenheft erstellen
4. Komponenten auswählen
5. Angebot erstellen

### Selbsttest-Checkliste

- [ ] Ich unterscheide aktive und passive Komponenten.
- [ ] Ich erkläre Hub, Switch, Router, Bridge, Gateway.
- [ ] Ich wähle Komponenten für eine Bedarfsanalyse aus.
- [ ] Ich kenne die wichtigsten Hersteller.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=1920 — Recherche 2026*
