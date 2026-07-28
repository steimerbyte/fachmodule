# Fachmodul: Mikrocontroller

**Kurs-ID:** 3757
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3757

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Mikrocontroller – Überblick](#2-mikrocontroller--überblick)
3. [Aufbau](#3-aufbau)
4. [Architekturen](#4-architekturen)
5. [Bekannte Familien](#5-bekannte-familien)
6. [Programmierung](#6-programmierung)
7. [Entwicklungsumgebungen](#7-entwicklungsumgebungen)
8. [Speicheraufteilung](#8-speicheraufteilung)
9. [Interrupts](#9-interrupts)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Mikrocontroller von Mikroprozessoren unterscheiden,
- den Aufbau eines Mikrocontrollers erklären,
- gängige Familien (AVR, ARM, ESP) einordnen,
- Mikrocontroller in C/C++ programmieren,
- Entwicklungsumgebungen nutzen.

---

## 2. Mikrocontroller – Überblick

Ein **Mikrocontroller** (MCU) ist ein **einzelner Chip**, der CPU, Speicher und Peripherie integriert.

**Unterschied zum Mikroprozessor:**

| | Mikrocontroller | Mikroprozessor |
|---|---|---|
| **CPU** | eingebaut | eingebaut |
| **RAM** | eingebaut (kB-Bereich) | extern |
| **ROM/Flash** | eingebaut | extern |
| **Peripherie** | eingebaut | extern |
| **Taktfrequenz** | oft <200 MHz | bis 5+ GHz |
| **Leistungsaufnahme** | mW | W bis 100 W |
| **Anwendung** | eingebettet, IoT | PC, Server |

---

## 3. Aufbau

```
┌─────────────────────────────────────┐
│ CPU (ALU, Register, Steuerwerk)       │
├─────────────────────────────────────┤
│ ROM/Flash    │ RAM    │ EEPROM      │  ← Speicher
├─────────────────────────────────────┤
│ Timer/Counter │ ADC/DAC │ PWM-Module │  ← Peripherie
├─────────────────────────────────────┤
│ UART/SPI/I2C │ USB    │ CAN        │  ← Kommunikation
├─────────────────────────────────────┤
│ GPIO (digitale I/O-Pins)             │
└─────────────────────────────────────┘
```

---

## 4. Architekturen

### 4.1 8-Bit: AVR (Atmel/Microchip)

- RISC-Architektur
- 8-Bit-Daten, 16-Bit-Befehle
- Arduino-Board basiert auf ATmega328
- Auch ATmega2560 (Arduino Mega)

### 4.2 32-Bit: ARM Cortex-M

- Marktführer bei Mikrocontrollern
- Cortex-M0/M0+: minimaler Stromverbrauch
- Cortex-M3: mittlere Leistung
- Cortex-M4: mit DSP und FPU
- Cortex-M7: hochleistungsfähig
- STM32 (STMicroelectronics), NXP Kinetis, Nordic nRF

### 4.3 32-Bit: ESP32 (Tensilica Xtensa LX6/LX7)

- WLAN, Bluetooth, BLE integriert
- Geringer Preis (ab ca. 3 €)
- Sehr beliebt für IoT
- Arduino-kompatibel

### 4.4 Weitere

- **PIC** (Microchip): klassisch
- **8051**: uralt, aber noch verbreitet
- **RISC-V**: neue offene Architektur

---

## 5. Bekannte Familien

### 5.1 ATmega328 (Arduino Uno)

- 8-Bit AVR
- 16 MHz Taktfrequenz
- 32 KB Flash
- 2 KB RAM
- 14 digitale I/O-Pins, 6 analoge Eingänge
- Sehr weit verbreitet

### 5.2 STM32 (Blue Pill)

- ARM Cortex-M3
- 72 MHz Taktfrequenz
- 64 KB Flash
- 20 KB RAM
- Sehr preiswert (ca. 2 €)
- ST-Link für Programmierung

### 5.3 ESP32

- Tensilica Dual-Core
- 240 MHz Taktfrequenz
- 4 MB Flash
- 520 KB RAM
- WLAN, Bluetooth, BLE
- Arduino-kompatibel, MicroPython-Unterstützung

### 5.4 RP2040 (Raspberry Pi Pico)

- ARM Cortex-M0+ Dual-Core
- 133 MHz Taktfrequenz
- 2 MB Flash
- 264 KB RAM
- Sehr günstig (~4 €)
- Eigene Programmiersprache MicroPython, C/C++

### 5.5 Vergleichstabelle

| Modell | Bit | Takt | Flash | RAM | Besonderheit |
|---|---|---|---|---|---|
| ATmega328 | 8 | 16 MHz | 32 KB | 2 KB | Arduino Uno |
| STM32F103 | 32 | 72 MHz | 64 KB | 20 KB | Blue Pill |
| ESP32 | 32 | 240 MHz | 4 MB | 520 KB | WLAN, BT |
| RP2040 | 32 | 133 MHz | 2 MB | 264 KB | PIO, Pico |

---

## 6. Programmierung

### 6.1 Arduino-Sprache (C/C++-Variante)

```cpp
const int LED_PIN = 13;

void setup() {
    pinMode(LED_PIN, OUTPUT);
}

void loop() {
    digitalWrite(LED_PIN, HIGH);
    delay(1000);
    digitalWrite(LED_PIN, LOW);
    delay(1000);
}
```

### 6.2 Bare-Metal C

```c
#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    DDRB |= (1 << PB5);  // Pin 13 als Ausgang

    while (1) {
        PORTB |= (1 << PB5);   // LED an
        _delay_ms(500);
        PORTB &= ~(1 << PB5);  // LED aus
        _delay_ms(500);
    }
}
```

### 6.3 MicroPython

```python
import machine
import time

led = machine.Pin(13, machine.Pin.OUT)

while True:
    led.value(1)
    time.sleep_ms(500)
    led.value(0)
    time.sleep_ms(500)
```

### 6.4 Block-based

- **Scratch for Arduino (S4A)**: für Einsteiger
- **MakeCode für micro:bit**: Microsoft

---

## 7. Entwicklungsumgebungen

### 7.1 Arduino IDE

- Einfach, weit verbreitet
- Wenig Features, gut für Anfänger
- Board-Manager für verschiedene Boards

### 7.2 PlatformIO

- Erweiterte IDE auf VS Code
- Multi-Board, Multi-Framework
- Library-Manager
- Unit-Tests

### 7.3 STM32CubeIDE

- ST-Microelectronics
- CubeMX für Pinout
- HAL-Libraries
- Debugging mit ST-Link

### 7.4 ESP-IDF (Espressif IoT Development Framework)

- Offizielle ESP32-Framework
- C/C++
- RTOS
- Umfangreiche Komponenten

### 7.5 Arduino Web Editor

- Online-Editor
- Projekte in Cloud
- Kostenlose Nutzung

---

## 8. Speicheraufteilung

```
┌─────────────────────┐ 0x0000
│ Interrupt-Vektoren   │
├─────────────────────┤
│ Programm-Code (Flash)│
├─────────────────────┤
│ Static Data          │
├─────────────────────┤
│ BSS (Null-initialized)│
├─────────────────────┤
│ Heap (malloc, new)    │
├─────────────────────┤
│ ↓ wächst nach unten   │
│ Stack                 │
├─────────────────────┤
│ ↑ wächst nach oben   │
│ Interrupt-Stack       │
└─────────────────────┘
```

- **Flash (ROM)**: Programm-Code, persistente Daten
- **RAM**: Variablen, Stack, Heap
- **EEPROM**: persistente Konfigurationsdaten (kB-Bereich)

---

## 9. Interrupts

### 9.1 Konzept

Interrupts ermöglichen **sofortige Reaktion** auf Ereignisse, ohne Polling.

### 9.2 Interrupt-Vektor-Tabelle

Jeder Interrupt hat eine **Adresse** in der Vektor-Tabelle, die auf die ISR (Interrupt Service Routine) zeigt.

### 9.3 Beispiel

```cpp
volatile bool interruptFlag = false;

void setup() {
    attachInterrupt(digitalPinToInterrupt(2), myISR, FALLING);
}

void myISR() {
    interruptFlag = true;
}

void loop() {
    if (interruptFlag) {
        interruptFlag = false;
        // Reaktion auf Interrupt
    }
}
```

### 9.4 Wichtige Regeln

- ISR so kurz wie möglich
- Keine blockierenden Funktionen (delay, Serial.print)
- Keine floating-point Operationen (langsam)
- `volatile` für Variablen, die in ISR und Hauptcode verwendet werden

---

## 10. Übungen

### Übung 1 — LED-Blinken

Schreiben Sie ein Blink-Programm.

### Übung 2 — Taster

Schreiben Sie ein Programm, das eine LED bei Tastendruck einschaltet.

### Übung 3 — PWM

Schreiben Sie ein Programm für PWM-LED-Helligkeitssteuerung.

### Übung 4 — ADC

Lesen Sie einen analogen Sensor aus.

### Übung 5 — Interrupt

Schreiben Sie ein Programm mit Interrupt.

### Übung 6 — Serielle Kommunikation

Senden Sie Sensordaten über UART.

---

## 11. Zusammenfassung

**Mikrocontroller** sind **integrierte Ein-Chip-Systeme** mit CPU, Speicher und Peripherie:

**Architekturen:**

- 8-Bit: AVR (ATmega328)
- 32-Bit: ARM Cortex-M (STM32), ESP32, RP2040

**Familien:**

| Modell | Takt | Flash | RAM | Besonderheit |
|---|---|---|---|---|
| ATmega328 | 16 MHz | 32 KB | 2 KB | Arduino Uno |
| STM32F103 | 72 MHz | 64 KB | 20 KB | Blue Pill |
| ESP32 | 240 MHz | 4 MB | 520 KB | WLAN, BT |

**Programmierung:**

- Arduino (C/C++)
- Bare-Metal C
- MicroPython
- Block-based (S4A, MakeCode)

**IDEs:**

- Arduino IDE
- PlatformIO
- STM32CubeIDE
- ESP-IDF

### Selbsttest-Checkliste

- [ ] Ich erkläre den Aufbau eines Mikrocontrollers.
- [ ] Ich wähle eine Plattform für meine Anwendung.
- [ ] Ich nutze GPIO, ADC, PWM.
- [ ] Ich setze Interrupts ein.
- [ ] Ich nutze eine geeignete IDE.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3757 — Recherche 2026*
