# Fachmodul: NW: Netzwerkkomponenten

**Kurs-ID:** 1916
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1916

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Aktive vs. passive Netzwerkkomponenten](#2-aktive-vs-passive-netzwerkkomponenten)
3. [Hub](#3-hub)
4. [Switch](#4-switch)
5. [Router](#5-router)
6. [Bridge](#6-bridge)
7. [Gateway](#7-gateway)
8. [Repeater](#8-repeater)
9. [Modem und ONT](#9-modem-und-ont)
10. [Firewall, Proxy, IDS/IPS](#10-firewall-proxy-idsips)
11. [WLAN-Access-Point](#11-wlan-access-point)
12. [Media Converter](#12-media-converter)
13. [OSI-Schicht-Zuordnung](#13-osi-schicht-zuordnung)
14. [Übungen](#14-übungen)
15. [Zusammenfassung](#15-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- aktive und passive Netzwerkkomponenten unterscheiden,
- die wichtigsten Komponenten (Hub, Switch, Router, Bridge, Gateway) erklären,
- jeder Komponente die passende OSI-Schicht zuordnen,
- Komponenten für konkrete Szenarien auswählen.

---

## 2. Aktive vs. passive Netzwerkkomponenten

| Typ | Beispiele |
|---|---|
| **Passiv** | Patchkabel, Anschlussstecker, Patchfelder, Serverschränke |
| **Aktiv** | Hub, Switch, Router, Firewall, WLAN-AP, Modem |

Aktive Komponenten haben eine eigene Stromversorgung und Intelligenz, um Datenpakete zu verarbeiten oder zu verteilen.

---

## 3. Hub

### 3.1 Funktionsweise

- **Layer 1 (Physical Layer)** des OSI-Modells
- Empfängt ein Signal auf einem Port und sendet es an alle anderen Ports weiter
- Keine Intelligenz, keine MAC-Adresstabelle

### 3.2 Eigenschaften

- Alle Geräte im selben **Kollisionsdomäne**
- Alle Geräte im selben **Broadcast-Domäne**
- Hohe Kollisionswahrscheinlichkeit
- Veraltet, durch Switches ersetzt

---

## 4. Switch

### 4.1 Funktionsweise

- **Layer 2 (Data Link Layer)** — typischerweise
- Lernt MAC-Adressen und schaltet gezielt (MAC-Tabelle)
- Frame wird nur an den richtigen Port weitergeleitet
- Layer-3-Switches (Multilayer-Switch): zusätzlich Routing-Funktion

### 4.2 Eigenschaften

- Trennt Kollisionsdomänen (jeder Port eigene Domäne)
- Vollduplex-Betrieb zwischen Switch und Endgerät
- Heute Standard-Komponente im LAN

### 4.3 Managed vs. Unmanaged

| Typ | Eigenschaften |
|---|---|
| **Unmanaged** | Plug-and-Play, keine Konfiguration |
| **Managed** | Konfiguration per Web/CLI: VLAN, SNMP, QoS, Mirroring |

### 4.4 Funktionen

- VLANs (802.1Q)
- Spanning Tree Protocol (STP)
- Link Aggregation (LAG)
- PoE (Power over Ethernet)
- Quality of Service (QoS)
- Port-Mirroring
- ACLs

---

## 5. Router

### 5.1 Funktionsweise

- **Layer 3 (Network Layer)** des OSI-Modells
- Verbindet verschiedene Netzwerke (z. B. LAN ↔ WAN)
- Entscheidet anhand IP-Adresse und Routing-Tabelle, wohin Pakete gehen

### 5.2 Routing-Protokolle

- **Statisches Routing**: manuelle Routen
- **Dynamisches Routing**:
  - **RIP** (Routing Information Protocol): Distance-Vector, klein
  - **OSPF** (Open Shortest Path First): Link-State, mittelgroße Netze
  - **BGP** (Border Gateway Protocol): Path-Vector, Internet-Backbone

### 5.3 NAT (Network Address Translation)

- Übersetzt private IP-Adressen in öffentliche und umgekehrt
- Masquerading: viele private Hosts teilen eine öffentliche IP

### 5.4 Eigenschaften

- Trennt Broadcast-Domänen
- Pflichtbestandteil zwischen Netzwerken
- Sicherheitsfunktion (Firewall-Funktionen)

---

## 6. Bridge

### 6.1 Funktionsweise

- **Layer 2 (Data Link Layer)**
- Verbindet zwei Netzwerk-Segmente
- Lernt MAC-Adressen und leitet nur notwendige Frames weiter
- Veraltet — Funktion durch Switch übernommen

### 6.2 Heute

Moderne Switches sind im Wesentlichen Multi-Port-Bridges.

---

## 7. Gateway

### 7.1 Funktionsweise

- **Layer 7 (Application Layer)** oder höher
- Übersetzt zwischen **verschiedenen Protokollen** (z. B. E-Mail-Gateways, VoIP-Gateways)
- Cloud-Gateway: Anbindung an Public Cloud

### 7.2 Beispiele

- **E-Mail-Gateway**: SMTP ↔ X.400
- **VoIP-Gateway**: PSTN ↔ IP-Telefonie
- **IoT-Gateway**: Sensor-Protokoll ↔ IP

---

## 8. Repeater

### 8.1 Funktionsweise

- **Layer 1 (Physical Layer)**
- Verstärkt das Signal auf langen Kabelstrecken
- Heute durch Switches oder LWL ersetzt

---

## 9. Modem und ONT

### 9.1 Modem

- Modulator/Demodulator
- Wandelt digitales Signal in analoges und umgekehrt
- DSL: Telefonleitung
- Kabelmodem: TV-Kabel (DOCSIS)
- Veraltet für Internet-Zugang in vielen Regionen

### 9.2 ONT (Optical Network Termination)

- Glasfaserabschluss beim Endkunden
- Wandelt Lichtsignal in elektrisches Ethernet
- FTTH (Fiber to the Home), FTTB (Building)

### 9.3 Provider-Architektur

```
[Provider-Backbone]
       ↓ (LWL)
[OLT - Optical Line Termination]
       ↓ (PON: G-PON, XGS-PON)
[ONT beim Kunden]
       ↓ (Ethernet)
[Router / Switch]
       ↓
[Endgeräte]
```

---

## 10. Firewall, Proxy, IDS/IPS

### 10.1 Firewall

- Filtert Pakete/Verbindungen nach Regeln
- **Paketfilter** (Layer 3/4): IP, Port
- **Stateful Inspection**: Verbindungs-Zustand
- **Application Layer Gateway (Proxy-Firewall)**: Inhaltsprüfung (Layer 7)

### 10.2 Proxy

- Vermittelt zwischen Client und Server
- **Forward Proxy** (z. B. Web-Proxy): für Clients
- **Reverse Proxy** (z. B. nginx, HAProxy): vor Servern
- **Transparenter Proxy**: ohne Client-Konfiguration

### 10.3 IDS/IPS

- **IDS (Intrusion Detection System)**: erkennt Angriffe, meldet
- **IPS (Intrusion Prevention System)**: erkennt und blockiert
- Methoden: Signatur-basiert, Anomalie-basiert, Verhalten

---

## 11. WLAN-Access-Point

### 11.1 Funktionsweise

- **Layer 2** (Data Link Layer), drahtlos
- Stellt WLAN-Funknetz für Endgeräte bereit
- Sendet SSID (Netzwerkname)
- Wechselmodi: 802.11a/b/g/n/ac/ax (Wi-Fi 6/6E/7)

### 11.2 Architektur

- **Standalone APs**: einzeln konfiguriert
- **Controller-basierte APs**: zentral verwaltet
- **Cloud-basierte APs**: Management in der Cloud

---

## 12. Media Converter

### 12.1 Funktionsweise

- Wandelt Medien zwischen zwei Kabeltypen
- Kupfer ↔ LWL
- Multimode ↔ Singlemode
- Ethernet auf RS-232, RS-485, ...

---

## 13. OSI-Schicht-Zuordnung

| Komponente | OSI-Schicht |
|---|---|
| Hub | 1 (Bitübertragung) |
| Repeater | 1 |
| Media Converter | 1 |
| Bridge | 2 |
| Switch (Layer 2) | 2 |
| Router | 3 |
| Layer-3-Switch | 3 |
| Firewall (Paketfilter) | 3–4 |
| Load Balancer | 4–7 |
| IDS/IPS | 3–7 |
| WLAN-AP | 2 |
| Gateway | 5–7 |
| Proxy | 5–7 |

---

## 14. Übungen

### Übung 1 — Komponenten zuordnen

Welche Komponente für welche Schicht?

### Übung 2 — LAN-Design

Planen Sie ein LAN mit 50 PCs, 3 Switches, einem Router. Welche Komponenten?

### Übung 3 — Routing-Protokolle

Welches Routing-Protokoll für: kleines Netz, mittleres Unternehmen, Internet-Backbone?

### Übung 4 — FTTH

Beschreiben Sie die Provider-Architektur bei FTTH.

### Übung 5 — Sicherheit

Welche Sicherheitskomponenten setzen Sie in einem Unternehmensnetz ein?

---

## 15. Zusammenfassung

| Komponente | OSI-Schicht | Funktion |
|---|---|---|
| Hub | 1 | Broadcast auf alle Ports |
| Switch | 2 | Gezielte Frame-Verteilung |
| Router | 3 | Verbindung von Netzwerken |
| Bridge | 2 | Segmentverbindung (veraltet) |
| Gateway | 7 | Protokollübersetzung |
| Repeater | 1 | Signalverstärkung |
| Firewall | 3–7 | Sicherheitsregeln |
| WLAN-AP | 2 | Drahtloser Zugang |
| Modem/ONT | 1 | Medienwandlung (WAN) |

### Selbsttest-Checkliste

- [ ] Ich unterscheide aktive und passive Komponenten.
- [ ] Ich erkläre Hub, Switch, Router, Bridge, Gateway.
- [ ] Ich ordne Komponenten OSI-Schichten zu.
- [ ] Ich wähle Komponenten für Szenarien aus.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=1916 — Recherche 2026*
