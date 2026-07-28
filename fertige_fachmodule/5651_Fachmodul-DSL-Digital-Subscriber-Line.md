# Fachmodul: DSL (Digital Subscriber Line)

**Kurs-ID:** 5651
**Kategorie:** Kursbibliothek / Fachmodule / Netzwerk
**Quelle:** https://moodle.oszimt.de/course/view.php?id=5651

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist DSL?](#2-was-ist-dsl)
3. [Geschichte](#3-geschichte)
4. [Physikalische Grundlagen](#4-physikalische-grundlagen)
5. [DSL-Varianten](#5-dsl-varianten)
6. [Komponenten](#6-komponenten)
7. [Installation und Konfiguration](#7-installation-und-konfiguration)
8. [PPP, PPPoE und IP-Vergabe](#8-ppp-pppoe-und-ip-vergabe)
9. [Triple Play](#9-triple-play)
10. [Glasfaser-Alternativen](#10-glasfaser-alternativen)
11. [Bild- und Quellenverweise](#11-bild-und-quellenverweise)
12. [Übungen](#12-übungen)
13. [Zusammenfassung](#13-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- den Begriff DSL erklären und die Funktionsweise beschreiben,
- die verschiedenen DSL-Varianten (ADSL, ADSL2+, VDSL, VDSL2, G.fast) unterscheiden,
- die Architektur (DSLAM, MSAN, Splitter) beschreiben,
- typische Konfigurationen vornehmen,
- Glasfaser-Alternativen einordnen.

---

## 2. Was ist DSL?

**DSL (Digital Subscriber Line)** ist eine Familie von Übertragungstechnologien für breitbandigen Internetzugang über die **Kupferdoppelader** der Telefonleitung.

**Eigenschaften:**

- Immer eingeschaltet ("always on")
- Daten und Sprache parallel (Frequenzmultiplex)
- Bis zu mehreren hundert Mbit/s
- Reichweite begrenzt (max. ~5 km)

---

## 3. Geschichte

| Jahr | Standard | Datenrate |
|---|---|---|
| 1988 | ISDN | 2 × 64 kbit/s |
| 1998 | ADSL | 8 Mbit/s down / 1 Mbit/s up |
| 2002 | ADSL2+ | 24 Mbit/s down / 1,4 Mbit/s up |
| 2006 | VDSL2 | 100 Mbit/s (symmetrisch bis 30 Mbit/s) |
| 2015 | G.fast | 1 Gbit/s über Kupfer (kurz) |
| Heute | FTTH (Glasfaser) | 1+ Gbit/s |

---

## 4. Physikalische Grundlagen

### 4.1 Frequenzbänder

DSL nutzt das **Hochfrequenzband** (ab 25 kHz), während das Telefonsignal nur bis 4 kHz nutzt. Splitter trennen die Bänder.

```
Frequenz:
  0–4 kHz       POTS (Telefon)
  25–138 kHz    ADSL Upstream
  138 kHz–1,1 MHz ADSL Downstream
  bis 30 MHz    VDSL2 (Vectoring)
```

### 4.2 DMT (Discrete Multi-Tone)

DSL nutzt **DMT-Modulation**: 256 (ADSL) bis 4096 (VDSL2) Trägerfrequenzen (Tones). Jeder Tone trägt ein Teil der Daten.

### 4.3 Vectoring

VDSL2 Vectoring reduziert Übersprechen durch Koordination zwischen DSL-Leitungen — erfordert Vectoring-fähige DSLAMs.

---

## 5. DSL-Varianten

| Standard | Datenrate Down | Datenrate Up | Reichweite |
|---|---|---|---|
| **ADSL** | 8 Mbit/s | 1 Mbit/s | 5 km |
| **ADSL2** | 12 Mbit/s | 1,4 Mbit/s | 5 km |
| **ADSL2+** | 24 Mbit/s | 1,4 Mbit/s | 3 km |
| **VDSL2** | 100 Mbit/s | 40 Mbit/s | 500 m |
| **VDSL2 Vectoring** | 200 Mbit/s | 100 Mbit/s | 500 m |
| **G.fast** (G.9701) | 1 Gbit/s | 1 Gbit/s | 100 m |
| **G.fast extension** | 2,5 Gbit/s | 1,25 Gbit/s | 50 m |

### 5.1 Asymmetrisch vs. symmetrisch

- **ADSL**: asymmetrisch (mehr Downstream als Upstream)
- **VDSL2**: symmetrisch möglich
- **SDSL (Symmetric DSL)**: symmetrisch für Business

---

## 6. Komponenten

### 6.1 DSL-Architektur

```
[Kunde: DSL-Modem/Router] <── Twisted-Pair ──> [DSLAM (Vermittlungsstelle)]
                                                              │
                                                              ▼
                                                     [BRAS (Backbone)]
                                                              │
                                                              ▼
                                                    [Internet-Service-Provider]
```

### 6.2 DSL-Modem

- Wandelt DSL-Signal in Ethernet
- Oft im Router integriert
- Splitter trennt Telefon- und Datensignal

### 6.3 DSLAM (DSL Access Multiplexer)

- Multiplexer in der Vermittlungsstelle
- Modem/Demodulation
- Bündelt DSL-Verbindungen
- Oft heute in MSAN (Multi-Service Access Node) integriert

### 6.4 MSAN (Multi-Service Access Node)

- Kombination aus DSLAM, Splitter, VoIP-Gateway
- Übergang zum IP-Backbone

### 6.5 BRAS (Broadband Remote Access Server)

- Authentifizierung (RADIUS, Diameter)
- IP-Vergabe (DHCP)
- QoS, Routing
- Verbindungsmanagement

### 6.6 Splitter

- Frequenzweiche
- Trennt POTS (Telefon) und DSL

---

## 7. Installation und Konfiguration

### 7.1 Anschlussdose

- TAE-Dose (Telekommunikations-Anschluss-Einheit)
- Splitter wird in der Anschlussdose oder am Router integriert

### 7.2 DSL-Router konfigurieren

Typische Konfigurationsschritte:

1. **PPPoE-Zugangsdaten** vom Provider
2. **DSL-Schnittstelle** konfigurieren
3. **ATM/PTM-Modus**: ADSL/VDSL2
4. **VLAN-ID** (z. B. 7 bei deutschen ISPs)
5. **PPPoE-Passwort** und Username
6. **LAN/WLAN** konfigurieren

### 7.3 Beispiel-Konfiguration (Deutsche Telekom)

```
Anbieter: Telekom
VLAN-ID: 7
Protokoll: PPPoE
Username: anschlussnummer@t-online.de
Passwort: vom Anbieter
MTU: 1492 (PPPoE-Header)
```

---

## 8. PPP, PPPoE und IP-Vergabe

### 8.1 PPP (Point-to-Point Protocol)

- Verbindungsorientiertes Protokoll für Punkt-zu-Punkt-Verbindungen
- Authentifizierung, Aushandlung von Netzwerkparametern

### 8.2 PPPoE (PPP over Ethernet)

- PPP wird über Ethernet gekapselt
- Erfordert zusätzliche 8 Byte Header
- MTU oft auf 1492 reduziert (1500 - 8)
- Häufig bei ADSL und VDSL
- Wird zunehmend durch **IPoE** (IP over Ethernet) abgelöst

### 8.3 PPPoE-Authentifizierung

- **CHAP** (Challenge-Handshake Authentication Protocol) meist üblich
- **PAP** (Password Authentication Protocol) unsicher

### 8.4 IP-Vergabe

- **DHCP**: dynamisch vom Provider
- **Statische IP**: bei Business-Anschlüssen

---

## 9. Triple Play

### 9.1 Triple Play

Viele DSL-Anbieter bieten ein Dreifach-Paket:

- **Telefon** (VoIP)
- **Internet** (DSL)
- **Fernsehen** (IPTV)

### 9.2 IPTV-Anforderungen

- Multicast für Live-TV
- Hohe Bandbreite
- Niedrige Latenz für HD/4K
- Quality of Service (QoS)

### 9.3 VLAN-Priorisierung

Triple Play nutzt VLANs, um Datenverkehr zu trennen:

- VLAN für Internet (best effort)
- VLAN für IPTV (hohe Priorität, Multicast)
- VLAN für VoIP (höchste Priorität, niedrige Latenz)

---

## 10. Glasfaser-Alternativen

### 10.1 FTTH (Fiber to the Home)

- Glasfaser bis in die Wohnung
- 1+ Gbit/s symmetrisch
- GPON (2,4 Gbit/s down / 1,2 Gbit/s up) oder XGS-PON (10 Gbit/s)

### 10.2 FTTC (Fiber to the Curb)

- Glasfaser bis zum Kabelverzweiger
- Letzte 100-300 m über Kupfer (VDSL2 mit Vectoring)

### 10.3 FTTB (Fiber to the Building)

- Glasfaser bis in den Keller
- Verteilung im Haus über Kupfer oder LWL

### 10.4 Vergleich

| Technologie | Datenrate | Reichweite |
|---|---|---|
| DSL (VDSL2 Vectoring) | 100-200 Mbit/s | 500 m |
| G.fast | 1 Gbit/s | 100 m |
| GPON (FTTH) | 2,4 Gbit/s | 20+ km |
| XGS-PON (FTTH) | 10 Gbit/s | 20+ km |

---

## 11. Bild- und Quellenverweise

- DSL-Architektur: <https://de.wikipedia.org/wiki/Digital_Subscriber_Line>
- ITU-T G.9701: <https://www.itu.int/rec/T-REC-G.9701>
- Deutsche Telekom DSL: <https://www.telekom.de/glasfaser>
- PPPoE: <https://datatracker.ietf.org/doc/html/rfc2516>
- Vectoring: <https://www.bundesnetzagentur.de/>

---

## 12. Übungen

### Übung 1 — DSL-Varianten

Welche DSL-Variante für 100 Mbit/s über 300 m Kupfer?

### Übung 2 — Architektur

Erstellen Sie ein Diagramm der DSL-Architektur vom Kundenmodem zum Internet.

### Übung 3 — PPPoE

Welche MTU empfehlen Sie für PPPoE?

### Übung 4 — Triple Play

Welche VLANs würden Sie für Triple Play konfigurieren?

### Übung 5 — Glasfaser-Migration

Welche Alternativen gibt es zu DSL in ländlichen Gebieten?

---

## 13. Zusammenfassung

**DSL** ist eine Familie von Breitband-Technologien über Kupferdoppeladern:

| Variante | Max. Downstream | Reichweite |
|---|---|---|
| ADSL2+ | 24 Mbit/s | 3 km |
| VDSL2 | 100 Mbit/s | 500 m |
| VDSL2 Vectoring | 200 Mbit/s | 500 m |
| G.fast | 1 Gbit/s | 100 m |

**Architektur:**

- Kunde: DSL-Modem/Router
- Vermittlungsstelle: DSLAM / MSAN
- Backbone: BRAS

**Triple Play:**

- Telefon (VoIP), Internet (DSL), TV (IPTV)
- VLAN-Trennung und QoS

**Glasfaser-Alternativen:**

- FTTH (Faser bis Wohnung) — 1+ Gbit/s
- FTTC (Faser bis Kabelverzweiger) — VDSL2 Vectoring
- FTTB (Faser bis Keller) — Verteilung im Haus

### Selbsttest-Checkliste

- [ ] Ich erkläre DSL und seine Varianten.
- [ ] Ich beschreibe die DSL-Architektur.
- [ ] Ich konfiguriere PPPoE.
- [ ] Ich kenne Glasfaser-Alternativen.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=5651 — Recherche 2026*
