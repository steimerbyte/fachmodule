# Fachmodul: Robotik

**Kurs-ID:** 2866
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2866

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Robotik – Überblick](#2-robotik--überblick)
3. [Komponenten eines Roboters](#3-komponenten-eines-roboters)
4. [Sensoren](#4-sensoren)
5. [Aktoren](#5-aktoren)
6. [Steuerungsarchitektur](#6-steuerungsarchitektur)
7. [Kinematik](#7-kinematik)
8. [Roboterarten](#8-roboterarten)
9. [Robot Operating System (ROS)](#9-robot-operating-system-ros)
10. [Anwendungen](#10-anwendungen)
11. [Übungen](#11-übungen)
12. [Zusammenfassung](#12-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die Komponenten eines Roboters benennen,
- Sensoren und Aktoren unterscheiden,
- Steuerungsarchitekturen erläutern,
- ROS-Grundlagen verstehen,
- Roboterarten einordnen.

---

## 2. Robotik – Überblick

**Robotik** ist die Wissenschaft und Technik der **Entwicklung und Steuerung von Robotern**.

**Schlüsselmerkmale:**

- Wahrnehmung (Sensoren)
- Verarbeitung (Steuerung, KI)
- Aktion (Aktoren)
- Autonomie (teilweise oder vollständig)

**Meilensteine:**

| Jahr | Ereignis |
|---|---|
| 1921 | Karel Čapek prägt den Begriff "Roboter" |
| 1961 | Unimate – erster Industrieroboter |
| 1979 | Stanford Cart – autonom navigierender Roboter |
| 1997 | Mars Pathfinder mit Sojourner |
| 2004 | iRobot Roomba wird Massenprodukt |
| 2012 | selbstfahrendes Auto Google Waymo |

---

## 3. Komponenten eines Roboters

### 3.1 Übersicht

| Komponente | Aufgabe |
|---|---|
| **Sensoren** | Umgebung wahrnehmen |
| **Aktoren** | physikalische Aktionen |
| **Steuerung** | Daten verarbeiten, Entscheidungen treffen |
| **Mechanik** | Chassis, Gelenke, Effektoren |
| **Energieversorgung** | Akku, Batterie |

### 3.2 Beispiel-Struktur

```
[Sensoren] → [Steuerung] → [Aktoren]
                ↑
                ↓
           [Mechanik]
                ↑
                ↓
          [Energieversorgung]
```

---

## 4. Sensoren

### 4.1 Abstandssensoren

- **Ultraschall** (HC-SR04): 2-400 cm, günstig, langsam
- **Infrarot** (Sharp GP2Y0A21): 10-80 cm, analog
- **Laser (LIDAR)** (VL53L1X, RPLIDAR): präzise, schnell, teurer
- **Time-of-Flight (ToF)**: 3D-Tiefenbild

### 4.2 Kameras

- RGB-Kamera für visuelle Erkennung
- Tiefenkameras (Kinect, RealSense)
- Stereo-Kameras für Tiefenrekonstruktion
- OpenCV für Bildverarbeitung

### 4.3 IMU (Inertial Measurement Unit)

- Accelerometer (Beschleunigung)
- Gyroskop (Drehrate)
- Magnetometer (Kompass)
- Kombiniert für Lagebestimmung

### 4.4 Weitere Sensoren

- **GPS** für Outdoor-Navigation
- **Encoder** an Motoren für Drehwinkel
- **Kraftsensoren** in Greifern
- **LIDAR** für 2D/3D-Umgebungsscan
- **Taktile Sensoren** in Fingern

---

## 5. Aktoren

### 5.1 Servomotoren

- **PWM-Steuerung** (Pulsweitenmodulation)
- Winkelgenauigkeit (1-2° bei günstigen Servos)
- Beispiel: SG90, MG996R
- Drehmoment: 1-20 kg·cm

### 5.2 Schrittmotoren (Stepper)

- **Schrittgenauigkeit** (z. B. 1,8° pro Schritt = 200 Schritte/Umdrehung)
- Keine Encoder notwendig (Open-Loop)
- Stepper-Treiber (A4988, DRV8825, TMC2209)
- Verwendung: 3D-Drucker, CNC

### 5.3 DC-Motoren

- Einfache Drehzahlregelung (PWM)
- Hohe Drehzahlen möglich
- Mit Encoder für Closed-Loop
- Verwendung: Antriebsräder

### 5.4 BLDC-Motoren (Brushless DC)

- Höherer Wirkungsgrad
- Längere Lebensdauer
- Elektronische Kommutierung
- Verwendung: Drohnen, E-Bikes

### 5.5 Pneumatik und Hydraulik

- Druckluft (Pneumatik) für Greifer
- Hydraulik für schwere Lasten
- Industrieroboter

---

## 6. Steuerungsarchitektur

### 6.1 Sense-Plan-Act (SPA)

```
Sensoren → Plan → Aktoren
```

- Klassisch in der Robotik
- Beispiel: autonomes Fahrzeug

### 6.2 Subsumption Architecture (Brooks)

- Schichten von Verhalten
- Niedere Schichten haben Vorrang
- Beispiel: Hindernisvermeidung > Exploration

### 6.3 Verhaltensbasierte Robotik

- Direkte Kopplung Sensor → Aktion
- Reaktiv, keine komplexe Planung
- Beispiel: Braitenberg-Vehikel

### 6.4 Hierarchische Architektur

- Top-Down-Planung
- Beispiel: Mission-Plan → Pfad-Plan → Bewegungs-Steuerung

---

## 7. Kinematik

### 7.1 Vorwärtskinematik (Forward Kinematics)

Berechnung der **End-Effektor-Position** aus den Gelenkwinkeln.

```
T = f(θ₁, θ₂, ..., θₙ)
```

### 7.2 Rückwärtskinematik (Inverse Kinematics)

Berechnung der **erforderlichen Gelenkwinkel** für eine gewünschte End-Effektor-Position.

```
θ = f⁻¹(x, y, z)
```

### 7.3 DH-Parameter (Denavit-Hartenberg)

- Standardisierte Beschreibung von Roboterkinematiken
- 4 Parameter pro Gelenk: a, α, d, θ

### 7.4 Bahnplanung

- **PTP** (Point-to-Point): direkter Weg
- **CP** (Continuous Path): glatte Bahn
- **Trajektorie**: zeitlicher Verlauf der Gelenkwinkel

### 7.5 SLAM

- **Simultaneous Localization and Mapping**
- Karte erstellen UND Position bestimmen
- Algorithmen: EKF-SLAM, Graph-SLAM, ORB-SLAM

---

## 8. Roboterarten

| Art | Beschreibung | Beispiele |
|---|---|---|
| **Industrieroboter** | für Fertigung | Schweißroboter, Lackierroboter |
| **Serviceroboter** | für Dienstleistungen | Reinigungsroboter, Lieferroboter |
| **Mobile Roboter** | selbstständig navigierend | AGV, AMR |
| **Humanoide Roboter** | menschenähnlich | ASIMO, Pepper, Atlas |
| **Medizinroboter** | für Chirurgie | da Vinci |
| **Kollaborative Roboter (Cobots)** | arbeiten mit Menschen | Universal Robots UR5 |
| **Schwimmroboter** | für Unterwasserinspektion | AUVs |
| **Flugroboter** | UAVs, Drohnen | DJI Mavic |
| **AgrarroBoter** | für Landwirtschaft | autonomer Traktor |

---

## 9. Robot Operating System (ROS)

### 9.1 Überblick

**ROS** ist ein **Open-Source-Framework** für Roboter-Software-Entwicklung.

**Kernkomponenten:**

- **Publisher/Subscriber**: Node-Kommunikation über Topics
- **Services**: synchrone Anfrage/Antwort
- **Actions**: asynchrone Ziele mit Feedback
- **TF (Transform)**: Koordinatensysteme
- **RViz**: 3D-Visualisierung
- **Gazebo**: Robotersimulation

### 9.2 Beispiel: Publisher

```python
import rospy
from std_msgs.msg import String

rospy.init_node('publisher')
pub = rospy.Publisher('chatter', String, queue_size=10)

while not rospy.is_shutdown():
    pub.publish("Hallo ROS")
    rospy.sleep(1)
```

### 9.3 ROS 2

- **ROS 2**: Nachfolger, DDS-basiert
- Echtzeitfähig
- Multi-Robot-Systeme
- Industrie-tauglich

---

## 10. Anwendungen

### 10.1 Fertigung

- Schweißen, Lackieren, Montage
- KUKA, ABB, Fanuc
- Industrie 4.0

### 10.2 Medizin

- Chirurgieroboter (da Vinci)
- Rehabilitations-Robotik
- Pflege-Roboter

### 10.3 Logistik

- Autonome mobile Roboter (AMR)
- AGVs in Lagern
- Lieferroboter (Starship, Lieferando)

### 10.4 Exploration

- Mars-Rover (Perseverance, Curiosity)
- Tiefsee-Roboter (Alvin)
- Drohnen (Vermessung, Inspektion)

### 10.5 Militär und Sicherheit

- Entschärfungsroboter
- Aufklärungsdrohnen
- Minenräumung

---

## 11. Übungen

### Übung 1 — Roboter-Komponenten

Listen Sie die Komponenten eines konkreten Roboters auf.

### Übung 2 — Sensoren

Welche Sensoren brauchen Sie für: Linienverfolgung, Hinderniserkennung, 3D-Mapping?

### Übung 3 — Aktoren

Wann nutzen Sie Servo, Schrittmotor, DC-Motor?

### Übung 4 — Architektur

Vergleichen Sie SPA und Subsumption Architecture.

### Übung 5 — Roboterart

Welche Roboterart eignet sich für eine bestimmte Anwendung?

### Übung 6 — ROS

Schreiben Sie ein einfaches Publisher-Subscriber-System in ROS.

---

## 12. Zusammenfassung

**Robotik** umfasst **Sensorik**, **Aktorik** und **Steuerung**:

**Sensoren:**

- Abstand: Ultraschall, IR, LIDAR
- Kamera, IMU, GPS

**Aktoren:**

- Servo, Schrittmotor, DC, BLDC

**Steuerungsarchitekturen:**

- Sense-Plan-Act
- Subsumption
- Verhaltensbasiert

**Kinematik:**

- Vorwärts- und Rückwärtsrechnung
- SLAM für Navigation

**ROS:** Standard-Framework für Roboter-Software

**Roboterarten:** Industrie-, Service-, Mobile-, Humanoide, Cobots, Drohnen

### Selbsttest-Checkliste

- [ ] Ich erkläre Roboter-Komponenten.
- [ ] Ich wähle Sensoren und Aktoren aus.
- [ ] Ich erkläre Kinematik und SLAM.
- [ ] Ich nutze ROS-Grundlagen.
- [ ] Ich ordne Roboterarten zu.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2866 — Recherche 2026*
