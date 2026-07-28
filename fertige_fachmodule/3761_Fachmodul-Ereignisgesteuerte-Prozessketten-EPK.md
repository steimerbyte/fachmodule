# Fachmodul: Ereignisgesteuerte Prozessketten (EPK)

**Kurs-ID:** 3761
**Kategorie:** Kursbibliothek / Fachmodule / Wirtschaft
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3761

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [EPK – Überblick](#2-epk--überblick)
3. [Notation](#3-notation)
4. [Beispiel](#4-beispiel)
5. [EPK vs. BPMN](#5-epk-vs-bpmn)
6. [Werkzeuge](#6-werkzeuge)
7. [Übungen](#7-übungen)
8. [Zusammenfassung](#8-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- EPK-Diagramme erstellen und lesen,
- Geschäftsprozesse in EPK-Notation modellieren,
- EPK mit BPMN vergleichen.

---

## 2. EPK – Überblick

**Ereignisgesteuerte Prozessketten (EPK)** sind eine **deutsche Methode** der Geschäftsprozessmodellierung.

**Geschichte:**

- Entwickelt von **Wilhelm Augsburger, Peter Mertens, Jörg Becker** an der Uni Erlangen-Nürnberg (1992)
- Verbreitung durch **SAP R/3 Workflow** und **ARIS**
- Konkurrenz zu BPMN

**Werkzeuge:**

- ARIS (Architektur integrierter Informationssysteme)
- ADONIS
- Signavio

---

## 3. Notation

### 3.1 Grundsymbole

| Symbol | Bedeutung |
|---|---|
| **Ereignis** (Sechseck) | ein Vorfall, der passiert ist oder passieren soll |
| **Funktion** (Rechteck, abgerundet) | eine aktive Tätigkeit |
| **Konnektor** | Verknüpfungs-Operator |

### 3.2 Konnektoren

| Symbol | Typ | Bedeutung |
|---|---|---|
| **∧** (gehört zu) | UND-Konnektor | mehrere Bedingungen müssen eintreffen |
| **∨** (oder) | ODER-Konnektor | mindestens eine Bedingung muss eintreffen |
| **⊕** (XOR) | Exklusiv-ODER | genau eine Bedingung muss eintreffen |

### 3.3 Beispiel-Notation

```
[Ereignis 1] → (∧) → [Funktion 1] → [Ereignis 2] → (∨) → [Funktion 2]
                                        → [Funktion 3]
```

---

## 4. Beispiel

### 4.1 Bestellprozess als EPK

```
Bestellung eingegangen → (∧) → Bestellung prüfen → geprüfte Bestellung →
                                                          │
                                                          (∨)
                                                          │
                                                          ├─ → Verfügbar → liefern → geliefert
                                                          │
                                                          └─ → Nachbestellung → Wareneingang → liefern
```

### 4.2 BPMN-Äquivalent

Die EPK entspricht weitgehend der BPMN-Notation:

- Ereignis ≈ Start/End-Event
- Funktion ≈ Task
- Konnektor ≈ Gateway (AND/OR/XOR)

---

## 5. EPK vs. BPMN

| Aspekt | EPK | BPMN |
|---|---|---|
| Herkunft | Deutschland | International (OMG) |
| Notation | Ereignis + Funktion + Konnektor | Events + Activities + Gateways |
| Verbreitung | stark in DE (SAP) | weltweit |
| Standard | ARIS-spezifisch | ISO-Standard |
| Detailtiefe | mittel | sehr hoch |

**Fazit:** Heute gewinnt BPMN an Bedeutung, EPK bleibt in ARIS-Umgebungen verbreitet.

---

## 6. Werkzeuge

### 6.1 ARIS

- Software AG (jetzt Business Transformation Suite)
- Marktstandard in DE für Prozessmodellierung
- Verschiedene Sichten: Funktion, Organisation, Daten, Steuerung

### 6.2 ADONIS

- BOC Group
- BPMN 2.0 und EPK
- Modellierung mit Repository

### 6.3 Signavio

- Cloud-basiert
- BPMN 2.0
- Kollaborativ

### 6.4 Bizagi Modeler

- BPMN-Modellierung
- Kostenlose Community Edition

---

## 7. Übungen

### Übung 1 — Prozess modellieren

Modellieren Sie einen Geschäftsprozess als EPK.

### Übung 2 — Bestellprozess

Erstellen Sie eine EPK für einen Bestellprozess.

### Übung 3 — Konnektoren

Welche Konnektoren brauchen Sie für verschiedene Verzweigungen?

### Übung 4 — Tool

Welches Tool nutzen Sie für die Prozessmodellierung?

### Übung 5 — EPK vs. BPMN

Erstellen Sie einen Prozess in beiden Notationen.

### Übung 6 — ARIS-Sichten

Welche Sichten bietet ARIS?

---

## 8. Zusammenfassung

**EPK (Ereignisgesteuerte Prozessketten)** sind eine **deutsche Methode** der Prozessmodellierung:

**Elemente:**

- Ereignis (Sechseck)
- Funktion (Rechteck)
- Konnektor (∧, ∨, ⊕)

**Werkzeuge:**

- **ARIS**: SAP-Umfeld, Standard in DE
- **ADONIS**: mit BPMN 2.0
- **Signavio, Bizagi**: BPMN-basiert

**Heute:** BPMN 2.0 hat sich international durchgesetzt, EPK bleibt in DACH verbreitet.

### Selbsttest-Checkliste

- [ ] Ich modelliere Prozesse als EPK.
- [ ] Ich nutze Konnektoren korrekt.
- [ ] Ich vergleiche EPK und BPMN.
- [ ] Ich wähle das passende Tool.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3761 — Recherche 2026*
