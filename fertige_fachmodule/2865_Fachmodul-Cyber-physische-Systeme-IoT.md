# Fachmodul: Cyber-physische Systeme (CPS) und IoT

**Kurs-ID:** 2865
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2865

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [CPS und IoT – Überblick](#2-cps-und-iot--überblick)
3. [Abgrenzung und Begriffe](#3-abgrenzung-und-begriffe)
4. [Architektur](#4-architektur)
5. [IoT-Kommunikationsprotokolle](#5-iot-kommunikationsprotokolle)
6. [Hardware-Plattformen](#6-hardware-plattformen)
7. [Cloud, Edge und Fog Computing](#7-cloud-edge-und-fog-computing)
8. [Sicherheit im IoT](#8-sicherheit-im-iot)
9. [Anwendungsgebiete](#9-anwendungsgebiete)
10. [Beispielprojekte](#10-beispielprojekte)
11. [Übungen](#11-übungen)
12. [Zusammenfassung](#12-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- CPS und IoT definieren und abgrenzen,
- die Architektur von IoT-Systemen beschreiben,
- gängige Protokolle (MQTT, CoAP, HTTP) einsetzen,
- Hardware-Plattformen auswählen,
- Sicherheitsaspekte beachten.

---

## 2. CPS und IoT – Überblick

### 2.1 CPS (Cyber-physische Systeme)

**CPS** sind Systeme, bei denen **Software (cyber)** und **physische Prozesse** eng gekoppelt sind. Sensoren erfassen die physische Welt, Aktoren wirken auf sie ein, eine Steuerungssoftware koordiniert das Verhalten.

**Beispiele:**

- Autonome Fahrzeuge
- Industrie-Roboter
- Smart Grid
- Medizinische Geräte
- Eingebettete Steuerungen

### 2.2 IoT (Internet of Things)

**IoT** beschreibt **vernetzte Geräte**, die Daten erfassen, austauschen und teilweise autonom handeln. Der Begriff betont stärker die Netzwerk-Konnektivität.

**Beispiele:**

- Smart-Home-Geräte (Thermostate, Lampen)
- Wearables (Smartwatches, Fitness-Tracker)
- Industrielle Sensoren
- Connected Cars
- Smart City (Verkehr, Beleuchtung, Müll)

---

## 3. Abgrenzung und Begriffe

| Begriff | Schwerpunkt |
|---|---|
| **Eingebettete Systeme** | Software in Geräten mit fester Funktion |
| **M2M (Machine-to-Machine)** | Direkte Geräte-zu-Geräte-Kommunikation |
| **CPS** | Kopplung Software ↔ physischer Prozess |
| **IoT** | Vernetzte Alltagsgegenstände |
| **Industrie 4.0** | Industrielle Anwendung von CPS/IoT |

Heute oft synonym verwendet, mit unterschiedlichem Fokus.

---

## 4. Architektur

### 4.1 3-Schicht-Architektur

```
┌─────────────────┐
│  Anwendungsschicht │ (Cloud, Server)
├─────────────────┤
│  Netzwerkschicht  │ (Internet, Funk)
├─────────────────┤
│  Wahrnehmungsschicht │ (Sensoren, Aktoren)
└─────────────────┘
```

### 4.2 5-Schicht-Architektur (Referenzarchitektur)

| Schicht | Funktion |
|---|---|
| **Geschäftsschicht** | Gesamtmodell, Prozesse, Regelwerke |
| **Anwendungsschicht** | Smart Home, Smart City, Industrie |
| **Verarbeitungsschicht** | Datenspeicherung, Analyse, KI |
| **Transportschicht** | Netzwerk (5G, WLAN, LoraWAN) |
| **Sensor-/Aktor-Schicht** | Erfassung, Steuerung |

### 4.3 Edge, Fog, Cloud

| Ebene | Beschreibung |
|---|---|
| **Edge** | Verarbeitung am Gerät selbst |
| **Fog** | Verarbeitung im lokalen Netzwerk |
| **Cloud** | Verarbeitung in entfernten Rechenzentren |

---

## 5. IoT-Kommunikationsprotokolle

### 5.1 Anwendungs-Layer-Protokolle

| Protokoll | Eigenschaften | Port | Verwendung |
|---|---|---|---|
| **HTTP/REST** | weit verbreitet, text-basiert | 80/443 | Standard Web APIs |
| **MQTT** | leichtgewichtig, Publish/Subscribe | 1883/8883 | IoT, Mobile |
| **CoAP** | REST-ähnlich für IoT, UDP | 5683 | constrained devices |
| **AMQP** | Message-Broker-Standard | 5672 | Enterprise-Messaging |
| **WebSocket** | bidirektional über HTTP | 80/443 | Echtzeit-Anwendungen |

### 5.2 MQTT im Detail

- **MQ Telemetry Transport**
- Leichtgewichtig (für IoT optimiert)
- Publish/Subscribe über Broker (z. B. Mosquitto)
- Quality of Service (QoS): 0 (at most once), 1 (at least once), 2 (exactly once)
- Topics hierarchisch (z. B. `haus/wohnzimmer/temperatur`)

**Beispiel (Publisher):**

```java
// Pseudocode
client.publish("haus/wohnzimmer/temperatur", "22.5", qos=1);
```

### 5.3 CoAP im Detail

- **Constrained Application Protocol**
- Ähnlich wie HTTP, aber für IoT optimiert
- UDP-basiert (geringer Overhead)
- CoRE-Link-Format für Ressourcen-Discovery

### 5.4 Transport und Netzwerk

- WLAN, Ethernet
- Bluetooth, BLE
- ZigBee, Z-Wave
- LoRaWAN, Sigfox (Weitbereich, niedrige Datenrate)
- NB-IoT, LTE-M (mobilfunk-basiert)
- 5G (URLLC, mMTC)

---

## 6. Hardware-Plattformen

### 6.1 Mikrocontroller

| Plattform | Eigenschaft |
|---|---|
| **Arduino Uno/Nano** | ATmega328, 8-Bit, einfach |
| **Arduino Mega** | ATmega2560, mehr I/O |
| **ESP32** | 32-Bit, WLAN, Bluetooth, günstig |
| **ESP8266** | 32-Bit, WLAN, sehr günstig |
| **STM32 (Blue Pill)** | 32-Bit ARM Cortex-M3 |
| **Raspberry Pi Pico** | RP2040, Dual-Core ARM Cortex-M0+ |
| **Teensy** | leistungsstark, Arduino-kompatibel |

### 6.2 Single Board Computer (SBC)

| Plattform | Eigenschaft |
|---|---|
| **Raspberry Pi 4/5** | ARM Cortex, Linux, 4/8 GB RAM |
| **Raspberry Pi Zero 2** | klein, günstig, WLAN |
| **BeagleBone Black** | ARM, Echtzeit-Erweiterung |
| **Orange Pi, Banana Pi** | Raspberry-Alternativen |
| **Jetson Nano** | NVIDIA, KI-Fähigkeiten |
| **Raspberry Pi 400** | Komplett-PC im Tastatur-Gehäuse |

### 6.3 Sensoren und Aktoren

| Typ | Beispiele |
|---|---|
| **Temperatur** | DS18B20, DHT22, BMP280 |
| **Abstand** | HC-SR04 (Ultraschall), VL53L1X (Laser), LIDAR |
| **Bewegung** | PIR, Accelerometer (MPU6050) |
| **Licht** | LDR, BH1750, TSL2561 |
| **Gas** | MQ-2, MQ-135 |
| **Kamera** | OV2640, Raspberry Pi Camera |
| **Display** | LCD, OLED, E-Paper, TFT |
| **Aktoren** | Servo, Schrittmotor, Relais, MOSFET |

---

## 7. Cloud, Edge und Fog Computing

### 7.1 Cloud-Plattformen

- **AWS IoT Core**: Geräteverwaltung, MQTT-Broker
- **Azure IoT Hub**: Microsoft-Cloud
- **Google Cloud IoT Core**: eingestellt, aber Firebase als Alternative
- **IBM Watson IoT**: Enterprise
- **Bosch IoT, Siemens MindSphere**: Industrie

### 7.2 Edge-Computing

- Verarbeitung direkt am Gerät
- Beispiel: Jetson Nano für KI-Inferenz
- Vorteile: niedrige Latenz, Datenschutz

### 7.3 Fog-Computing

- Verarbeitung im lokalen Netzwerk (z. B. Raspberry Pi als Gateway)
- Vermittelt zwischen Edge und Cloud
- Beispiele: AWS Greengrass, Azure IoT Edge

---

## 8. Sicherheit im IoT

### 8.1 Sicherheitsprobleme

- **Schwache Geräte** (alte Firmware, keine Updates)
- **Unsichere Funkprotokolle** (z. B. unverschlüsseltes WLAN)
- **Botnetze** (Mirai-Botnetz 2016: IoT-Geräte als Angriffsvektor)
- **Datenschutz**: persönliche Daten in der Cloud

### 8.2 Maßnahmen

- **Geräte-Authentifizierung** (z. B. X.509-Zertifikate)
- **Verschlüsselte Kommunikation** (TLS, DTLS)
- **Regelmäßige Firmware-Updates**
- **Sichere Passwörter** (nicht default)
- **Sichere Boot-Prozesse**
- **Network-Segmentation**
- **Security-by-Design**

### 8.3 Normen

- **BSI-Grundschutz für IoT**
- **ETSI EN 303 645**: Cyber Security for Consumer IoT
- **OWASP IoT Top 10**: häufigste Schwachstellen

---

## 9. Anwendungsgebiete

### 9.1 Smart Home

- Lichtsteuerung, Heizung, Sicherheit
- Sprachassistenten (Alexa, Google Home)
- Beispiele: Homematic IP, Philips Hue, KNX

### 9.2 Smart City

- Verkehrsmanagement (Ampeln, Parkleitsysteme)
- Beleuchtung (intelligente Straßenlaternen)
- Müllentsorgung (Füllstandssensoren)

### 9.3 Industrie 4.0

- Smart Factory
- Predictive Maintenance
- Digitale Zwillinge
- SCADA-Systeme

### 9.4 Smart Health

- Wearables (Smartwatches, Fitness-Tracker)
- Telemedizin
- Patientenmonitoring

### 9.5 Smart Agriculture

- Bewässerungssteuerung
- Düngung und Schädlingsbekämpfung
- Drohnen zur Feldanalyse

---

## 10. Beispielprojekte

### 10.1 Wetterstation mit ESP32

- ESP32 mit DHT22 (Temperatur/Feuchte)
- Anzeige auf OLED-Display
- MQTT-Publishing an Broker
- Grafana-Dashboard

### 10.2 Smart Home Lichtsteuerung

- Homematic IP oder ZigBee
- Zentrale Steuerung (Raspberry Pi mit Home Assistant)
- Sprachsteuerung mit Alexa

### 10.3 Pflanzenmonitor

- Bodenfeuchtesensor
- ESP32 mit WLAN
- Push-Notification bei Wassermangel

---

## 11. Übungen

### Übung 1 — IoT definieren

Erklären Sie den Unterschied zwischen CPS und IoT.

### Übung 2 — Architektur

Skizzieren Sie die 5-Schicht-Architektur für ein Smart-Home-System.

### Übung 3 — MQTT

Welche Vorteile hat MQTT gegenüber HTTP für IoT?

### Übung 4 — Plattformen auswählen

Welche Plattform für ein batteriebetriebenes IoT-Gerät mit WLAN?

### Übung 5 — Sicherheit

Welche Sicherheitsmaßnahmen sind im IoT essenziell?

### Übung 6 — Projekt planen

Planen Sie ein Smart-Garden-Projekt.

---

## 12. Zusammenfassung

**CPS** koppelt Software mit physischen Prozessen. **IoT** vernetzt Geräte.

**Architektur:**

- 3-Schicht: Wahrnehmung, Netz, Anwendung
- 5-Schicht: Sensor, Transport, Verarbeitung, Anwendung, Geschäft
- Edge/Fog/Cloud

**Protokolle:**

- **MQTT**: leichtgewichtig, Pub/Sub
- **CoAP**: für constrained devices
- **HTTP/REST**: Standard Web
- **LoRaWAN, 5G, BLE**: physische Netze

**Hardware:**

- Arduino, ESP32 für einfache Geräte
- Raspberry Pi für komplexe Gateways

**Sicherheit:** kritisch wegen vieler ungesicherter IoT-Geräte

### Selbsttest-Checkliste

- [ ] Ich erkläre CPS und IoT.
- [ ] Ich beschreibe die Architektur.
- [ ] Ich nutze MQTT und CoAP.
- [ ] Ich wähle Hardware-Plattformen.
- [ ] Ich beachte IoT-Sicherheit.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2865 — Recherche 2026*
