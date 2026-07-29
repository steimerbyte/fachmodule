# FM: Troubleshooting

**Kurs-ID:** 3567
**Kategorie:** Kursbibliothek / Fachmodule / ITSM
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3567

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Troubleshooting?](#2-was-ist-troubleshooting)
3. [Methodisches Vorgehen](#3-methodisches-vorgehen)
4. [Werkzeuge](#4-werkzeuge)
5. [Häufige Fehlerbilder](#5-häufige-fehlerbilder)
6. [Dokumentation](#6-dokumentation)
7. [Übungen](#7-übungen)
8. [Zusammenfassung](#8-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- methodisches Troubleshooting betreiben,
- Fehler systematisch eingrenzen,
- Diagnose-Tools einsetzen,
- Lösungen reproduzierbar dokumentieren.

---

## 2. Was ist Troubleshooting?

**Troubleshooting** ist die systematische **Suche und Behebung** von Fehlern in IT-Systemen.

**Unterschied zu Problem Management:**

- Troubleshooting: kurzfristig, ein konkretes Problem
- Problem Management: langfristig, Ursachenanalyse

**Voraussetzungen:**

- Fundiertes technisches Wissen
- Kenntnisse der Systemarchitektur
- Logischer, geduldiger Ansatz

---

## 3. Methodisches Vorgehen

### 3.1 6-Schritte-Modell

1. **Problem identifizieren**: Symptome genau beschreiben
2. **Informationen sammeln**: Logs, Konfiguration, Status
3. **Hypothesen aufstellen**: Mögliche Ursachen
4. **Hypothesen testen**: Eingrenzen durch Tests
5. **Ursache identifizieren**: Root Cause finden
6. **Lösung implementieren**: Fix anwenden, dokumentieren

### 3.2 Top-Down vs. Bottom-Up

- **Top-Down**: vom Gesamtsystem zu Komponenten
- **Bottom-Up**: von Komponenten zum Gesamtsystem
- **Divide-and-Conquer**: System in der Mitte beginnen

### 3.3 Ausschlussverfahren

- Eine Komponente nach der anderen prüfen
- "Was hat sich geändert?" (Last Recent Change)
- Bekannte Fehler prüfen

### 3.4 Beispiel: Webseite nicht erreichbar

1. **DNS prüfen**: `nslookup`, `dig`
2. **Erreichbarkeit**: `ping`
3. **Routen**: `traceroute`
4. **Firewall**: Pakete erlaubt?
5. **Webserver**: läuft? Logs?
6. **Anwendung**: funktioniert Backend?

---

## 4. Werkzeuge

### 4.1 Netzwerk-Tools

| Tool | Zweck |
|---|---|
| `ping` | Erreichbarkeit prüfen |
| `traceroute` / `tracert` | Routenverfolgung |
| `nslookup` / `dig` | DNS-Abfragen |
| `mtr` | Kombination ping+traceroute |
| `tcpdump` / Wireshark | Paketanalyse |
| `netstat` / `ss` | Netzwerkverbindungen |
| `nmap` | Portscan |
| `iperf3` | Bandbreitenmessung |

### 4.2 System-Tools

| Tool | Zweck |
|---|---|
| `top` / `htop` | Prozesse, Auslastung |
| `df` / `du` | Speicherplatz |
| `free` | RAM |
| `iostat` / `vmstat` | I/O-Performance |
| `dmesg` | Kernel-Logs |
| `journalctl` | systemd-Logs |

### 4.3 Anwendungs-Diagnose

- **Anwendungs-Logs**: meist in `/var/log/`
- **Debug-Modus** aktivieren
- **Profiler**: Java Flight Recorder, Python cProfile
- **APM-Tools**: Dynatrace, New Relic, Grafana
- **Database-Tracing**: SQL-Traces, Slow Query Log

### 4.4 Netzwerk-Analyse

- **Wireshark**: detaillierte Paketanalyse
- **tcpdump**: CLI-Paketanalyse
- **NetFlow**: Verkehrsfluss-Analyse
- **Nmap**: Netzwerk-Scanning

---

## 5. Häufige Fehlerbilder

### 5.1 Netzwerk-Fehler

- DNS-Auflösung funktioniert nicht
- Firewall blockiert Ports
- IP-Adressen-Konflikt
- Routing-Tabelle falsch
- MTU-Inkompatibilität (PMTUD)
- DHCP-Server ausgefallen

### 5.2 Hardware-Fehler

- Festplatte voll / defekt (SMART-Werte prüfen)
- RAM-Fehler (Memtest86)
- Netzwerk-Karte defekt (LEDs, ethtool)
- CPU überhitzt

### 5.3 Software-Fehler

- Anwendungsabsturz (Stacktrace in Logs)
- Speicherleck (Heap Dump)
- Thread-Deadlock
- Falsche Konfiguration

### 5.4 Performance-Probleme

- Hohe CPU-Last
- Speichermangel
- Disk-IO hoch (iostat)
- Netzwerk-Sättigung
- Datenbank langsam (fehlende Indizes)

---

## 6. Dokumentation

### 6.1 Was dokumentieren?

- Symptome und Fehlermeldungen
- Untersuchte Hypothesen
- Verworfene Lösungswege
- Finale Lösung
- Verifizierung der Lösung

### 6.2 Ticket-Dokumentation

- Vollständige Beschreibung
- Lösungsweg mit Screenshots
- Lessons Learned

### 6.3 Runbook

- Schritt-für-Schritt-Anleitungen
- Für Standard-Probleme
- Mit Befehlen und erwarteten Ausgaben

---

## 7. Übungen

### Übung 1 — ping

Erklären Sie die Ausgabe von `ping`.

### Übung 2 — traceroute

Welche Rückschlüsse erlaubt `traceroute`?

### Übung 3 — DNS-Probleme

Wie lösen Sie DNS-Probleme?

### Übung 4 — Speicheranalyse

Wie analysieren Sie einen Speicherengpass?

### Übung 5 — Vollständige Diagnose

Eine Webseite ist langsam. Welche Schritte führen Sie durch?

### Übung 6 — Runbook

Erstellen Sie ein Runbook für die Diagnose "Datenbankserver nicht erreichbar".

---

## 8. Zusammenfassung

**Troubleshooting** ist systematische Fehlersuche:

**6-Schritte-Modell:**

1. Problem identifizieren
2. Informationen sammeln
3. Hypothesen aufstellen
4. Hypothesen testen
5. Ursache identifizieren
6. Lösung implementieren und dokumentieren

**Werkzeuge:**

- Netzwerk: ping, traceroute, nslookup, Wireshark, tcpdump, nmap
- System: top, df, iostat, dmesg
- Anwendung: Logs, Debugger, Profiler, APM
- Datenbank: SQL-Traces, Slow Query Log

**Häufige Fehlerquellen:**

- Netzwerk: DNS, Firewall, Routing, DHCP
- Hardware: Disk, RAM, CPU
- Software: Crashes, Memory Leaks, Konfiguration
- Performance: CPU, RAM, I/O, Netzwerk

### Selbsttest-Checkliste

- [ ] Ich nutze methodisches Vorgehen.
- [ ] Ich setze Diagnose-Tools gezielt ein.
- [ ] Ich grenze Fehler systematisch ein.
- [ ] Ich dokumentiere Lösungen.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3567 — Recherche 2026*
