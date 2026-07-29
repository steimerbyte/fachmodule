# Fachmodul: Schulungskoffer homematic IP

**Kurs-ID:** 3755
**Kategorie:** Kursbibliothek / Fachmodule / Elektrotechnik / Smart Home
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3755

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [homematic IP – Überblick](#2-homatic-ip--überblick)
3. [Schulungskoffer – Inhalt](#3-schulungskoffer--inhalt)
4. [Funkschnittstelle BidCoS und IPv6](#4-funkschnittstelle-bidcos-und-ipv6)
5. [Komponenten](#5-komponenten)
6. [Einrichtung und Konfiguration](#6-einrichtung-und-konfiguration)
7. [Programmierung mit WebUI und App](#7-programmierung-mit-webui-und-app)
8. [Sicherheit und Datenschutz](#8-sicherheit-und-datenschutz)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die homematic IP Systemarchitektur erklären,
- die Komponenten des Schulungskoffers benennen,
- die Funkkommunikation (BidCoS, IPv6) beschreiben,
- Anlagen konfigurieren und programmieren.

---

## 2. homematic IP – Überblick

**homematic IP** ist ein **Smart-Home-System** der Firma eQ-3 AG (Vertrieb: eQ-3 / ELV).

**Eckpfeiler:**

- **Funkstandard**: BidCoS (868 MHz, proprietär)
- **Verschlüsselung**: AES-128
- **Cloud-Server in Deutschland**
- **IPv6-fähig** (Homematic IP Wired)
- **Mehrere 100 Komponenten**

**Anwendungsbereiche:**

- Lichtsteuerung
- Heizungssteuerung
- Sicherheit (Tür-/Fensterkontakte, Alarmanlagen)
- Rollladensteuerung
- Wetterdaten

---

## 3. Schulungskoffer – Inhalt

### 3.1 Komponenten im Schulungskoffer

| Komponente | Funktion |
|---|---|
| **HmIP-HAP / HmIP-CCU3** | Access Point / Zentrale |
| **HmIP-PSM** | Schaltsteckdose |
| **HmIP-BSM** | Schalt-/Mess-Aktor (Unterputz) |
| **HmIP-WSM** | Wandtaster |
| **HmIP-SMO** | Bewegungsmelder (Outdoor) |
| **HmIP-SWDO** | Fenster-/Türkontakt |
| **HmIP-FROLL** | Rollladenaktor |
| **HmIP-eTRV** | Heizkörperthermostat |
| **HmIP-STH** | Temperatur-/Feuchtesensor |
| **HmIP-K-DRILLI** | Fenster-Drehgriffkontakt |
| **HmIP-WTH** | Wandthermostat |
| **HmIP-FBL** | Fußbodenheizungsaktor |

### 3.2 Zubehör

- Netzteil
- Schrauben, Dübel
- Batterien
- Dokumentation
- Demoskasten mit Aufbauanleitung

---

## 4. Funkschnittstelle BidCoS und IPv6

### 4.1 BidCoS (Bidirectional Communication Standard)

- **868 MHz** Funkfrequenz (SRD-Band)
- Proprietärer Funkprotokoll
- **Bidirektional**: beide Geräte können senden und empfangen
- **AES-128** Verschlüsselung
- Reichweite: 100-300 m (Freifeld), 20-50 m (Gebäude)
- Geringer Energieverbrauch (Batteriebetrieb möglich)

### 4.2 IPv6 (Homematic IP Wired)

- **RS485** oder **KNX-Bus**
- IPv6-Protokoll
- kabelgebunden
- für feste Verkabelung

---

## 5. Komponenten

### 5.1 Access Point (HmIP-HAP)

- Zentrale Steuerung
- WLAN-Verbindung zum Heimnetz
- Cloud-Verbindung
- App-Anbindung
- Konfiguration per App oder WebUI

### 5.2 HmIP-PSM (Schaltsteckdose)

- Stecker-Zwischengerät
- Misst Stromverbrauch
- Schaltet Verbraucher bis 16 A

### 5.3 HmIP-BSM (Unterputz-Aktor)

- In Unterputzdose
- Schaltet Licht
- Misst Strom (optional)

### 5.4 HmIP-WSM (Wandtaster)

- 2 oder 6 Tasten
- Batteriebetrieb
- Funk-Verbindung

### 5.5 HmIP-SMO (Bewegungsmelder Outdoor)

- PIR-Sensor
- IP54 spritzwassergeschützt
- Erfasst Bewegung bis 12 m

### 5.6 HmIP-SWDO (Fensterkontakt)

- Magnetischer Kontakt
- Batteriebetrieb
- Zustand: offen/geschlossen

### 5.7 HmIP-FROLL (Rollladenaktor)

- Unterputz-Einbau
- Steuerung Rollläden/Markisen
- Position anfahren (z. B. 50 %)

### 5.8 HmIP-eTRV (Heizkörperthermostat)

- Austausch gegen Standard-Thermostat
- Wochenprogramme
- Erkennung offener Fenster
- 1,5 °C Genauigkeit

---

## 6. Einrichtung und Konfiguration

### 6.1 Schritt 1: Access Point einrichten

1. Stromversorgung anschließen
2. Netzwerk-Kabel verbinden
3. WLAN einrichten
4. QR-Code scannen für App-Konfiguration

### 6.2 Schritt 2: Geräte anlernen

1. Batterien einlegen
2. Anlern-Taste drücken (oder QR-Code scannen)
3. Im Access Point bestätigen
4. Konfiguration per App vornehmen

### 6.3 Schritt 3: Konfiguration

- Gerätenamen vergeben
- Räume zuordnen
- Gewerke zuordnen (Licht, Heizung, etc.)
- Verknüpfungen erstellen (Taster → Aktor)

---

## 7. Programmierung mit WebUI und App

### 7.1 App (homematic IP)

- Smart Home-Steuerung
- Visualisierung
- Alarm und Push-Benachrichtigungen
- Zeitprofile

### 7.2 WebUI

- Browser-basiert
- Erweiterte Konfiguration
- Zugriff auch über Cloud

### 7.3 Home Assistant Integration

```yaml
homematicip_cloud:
    - token: HmIP_Cloud_Token
```

### 7.4 CCU3 (Alternative Zentrale)

- Lokale Zentrale ohne Cloud-Pflicht
- WebUI für komplexe Konfiguration
- AddOns (z. B. CUxD, E-Mail)

---

## 8. Sicherheit und Datenschutz

### 8.1 Sicherheit

- AES-128 Verschlüsselung
- ISO 27001 zertifiziert (eQ-3)
- Funkstandard SRD 868 MHz (verschlüsselt)
- Zwei-Wege-Authentifizierung

### 8.2 Datenschutz

- Cloud-Server in Deutschland (ISO 27001-zertifiziert)
- DSGVO-konform
- eQ-3 hat seinen Sitz in Leer (Ostfriesland)

### 8.3 Angriffsszenarien

- Theoretisch möglich: Jamming, Replay
- Bisher keine bekannt gewordenen Angriffe
- Homematic IP nutzt AES-128 und Rolling Code

---

## 9. Übungen

### Übung 1 — Schulungskoffer erkunden

Listen Sie die Komponenten des Schulungskoffers auf.

### Übung 2 — Aktoren

Welche Aktoren schalten Lasten, welche messen, welche steuern Heizung?

### Übung 3 — Sensoren

Welche Sensoren erfassen Zustand, welche Bewegung, welche Temperatur?

### Übung 4 — Konfiguration

Richten Sie einen Access Point und ein Gerät ein.

### Übung 5 — Verknüpfungen

Erstellen Sie eine Verknüpfung: Taster → Schaltaktor → Leuchte.

### Übung 6 — Heizungsprogramm

Erstellen Sie ein Wochenprogramm für die Heizung.

---

## 10. Zusammenfassung

**homematic IP** ist ein deutsches Smart-Home-System:

**System-Architektur:**

- Access Point als Zentrale
- BidCoS (868 MHz) Funkstandard
- AES-128 Verschlüsselung
- Cloud-Server in Deutschland

**Komponenten-Schulungskoffer:**

- Schalten (PSM, BSM)
- Messen (STH, eTRV)
- Steuern (FROLL, eTRV)
- Sensoren (SMO, SWDO, STH)
- Wandtaster (WSM)
- Heizung (eTRV, FBL)

**Sicherheit:** AES-128, ISO 27001, DSGVO-konform

### Selbsttest-Checkliste

- [ ] Ich erkläre die homematic IP Architektur.
- [ ] Ich benenne die Schulungskoffer-Komponenten.
- [ ] Ich richte Access Point und Geräte ein.
- [ ] Ich erstelle Verknüpfungen und Programme.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3755 — Recherche 2026*
