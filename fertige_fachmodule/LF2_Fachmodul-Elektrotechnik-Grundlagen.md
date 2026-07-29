# Fachmodul: ETK – Grundlagen Elektrotechnik

**Kurs-ID:** 1929
**Kategorie:** Kursbibliothek / Fachmodule / Elektrotechnik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1929

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Elektrische Grundgrößen](#2-elektrische-grundgrößen)
3. [Ohmsches Gesetz](#3-ohmsches-gesetz)
4. [Reihen- und Parallelschaltung](#4-reihen--und-parallelschaltung)
5. [Kirchhoffsche Gesetze](#5-kirchhoffsche-gesetze)
6. [Wechselstrom](#6-wechselstrom)
7. [Bauelemente](#7-bauelemente)
8. [Schaltpläne lesen](#8-schaltpläne-lesen)
9. [Messen mit Multimeter und Oszilloskop](#9-messen-mit-multimeter-und-oszilloskop)
10. [Sicherheitsregeln (VDE)](#10-sicherheitsregeln-vde)
11. [Übungen](#11-übungen)
12. [Zusammenfassung](#12-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die elektrischen Grundgrößen Spannung, Strom und Widerstand erklären,
- das Ohmsche Gesetz anwenden,
- Schaltungen mit Reihen- und Parallelschaltung berechnen,
- die Kirchhoffschen Gesetze anwenden,
- Wechselstrom-Grundlagen verstehen,
- Bauelemente identifizieren,
- Schaltpläne lesen und Sicherheitsregeln beachten.

---

## 2. Elektrische Grundgrößen

### 2.1 Spannung (U)

- Einheit: Volt (V)
- Definition: Potenzialdifferenz zwischen zwei Punkten
- Formelzeichen: U
- 1 V = 1 J/C (Joule pro Coulomb)

### 2.2 Stromstärke (I)

- Einheit: Ampere (A)
- Definition: Ladungsmenge pro Zeit
- 1 A = 1 C/s

### 2.3 Widerstand (R)

- Einheit: Ohm (Ω)
- Definition: Hemmung des Stromflusses
- 1 Ω = 1 V/A

### 2.4 Leistung (P)

- Einheit: Watt (W)
- P = U × I
- Auch: P = I² × R oder P = U²/R

### 2.5 Energie (W)

- Einheit: Wattsekunde (Ws) oder Kilowattstunde (kWh)
- W = P × t

---

## 3. Ohmsches Gesetz

**Formel:** U = R × I

Auch: I = U/R oder R = U/I

**Beispiel:**

Gegeben: U = 12 V, R = 4 Ω

Gesucht: I

I = U/R = 12/4 = **3 A**

**Beispiel 2:**

P = U × I = 12 V × 3 A = **36 W**

---

## 4. Reihen- und Parallelschaltung

### 4.1 Reihenschaltung

```
R₁ ─ R₂ ─ R₃ ─ R₄
```

- Gleicher Strom durch alle Widerstände
- Spannungen addieren sich
- **Gesamtwiderstand:** R_ges = R₁ + R₂ + R₃ + R₄

### 4.2 Parallelschaltung

```
   ┌─ R₁ ─┐
───┼─ R₂ ─┼───
   └─ R₃ ─┘
```

- Gleiche Spannung an allen Widerständen
- Ströme addieren sich
- **Gesamtwiderstand:** 1/R_ges = 1/R₁ + 1/R₂ + 1/R₃

**Beispiel:** Zwei 100 Ω parallel:
1/R = 1/100 + 1/100 = 2/100 → R = **50 Ω**

### 4.3 Gruppenschaltung

Kombination aus Reihen- und Parallelschaltung.

---

## 5. Kirchhoffsche Gesetze

### 5.1 Knotenregel (1. Kirchhoffsches Gesetz)

**Σ I_in = Σ I_out**

In einem Knoten ist die Summe der zufließenden Ströme gleich der Summe der abfließenden Ströme.

### 5.2 Maschenregel (2. Kirchhoffsches Gesetz)

**Σ U = 0**

In einer Masche (geschlossener Stromkreis) ist die Summe aller Spannungen gleich null.

---

## 6. Wechselstrom

### 6.1 Kenngrößen

| Größe | Symbol | Einheit |
|---|---|---|
| Frequenz | f | Hertz (Hz) |
| Periodendauer | T | Sekunden (s) |
| Scheitelwert | Û | Volt (V) |
| Effektivwert | U_eff | Volt (V) |
| Frequenz | f = 1/T | Hz |

### 6.2 Sinusförmiger Wechselstrom

U(t) = Û · sin(2π · f · t)

- **Effektivwert**: U_eff = Û / √2 ≈ 0,707 · Û
- Netzspannung: 230 V Effektivwert ≈ 325 V Scheitelwert

### 6.3 Frequenz

- Netzstrom (Europa): 50 Hz
- Netzstrom (USA): 60 Hz

### 6.4 Dreiphasenwechselstrom (Drehstrom)

- 3 Phasen um 120° versetzt
- 400 V (verkettet, zwischen Phasen) bzw. 230 V (gegen Neutralleiter)

---

## 7. Bauelemente

### 7.1 Passive Bauelemente

| Bauelement | Symbol | Funktion |
|---|---|---|
| **Widerstand (R)** | R | Strombegrenzung |
| **Kondensator (C)** | ⊥ | speichert Ladung |
| **Spule (L)** | ⟐ | speichert Energie im Magnetfeld |
| **Diode** | ▷\| | Gleichrichter |
| **Transistor** | unterschiedlich | Verstärker, Schalter |
| **LED** | ▷\|(mit Pfeilen) | Leuchtdiode |
| **Transformer** | ⋈⊓ | Spannungsumspannung |

### 7.2 Aktive Bauelemente

- Operationsverstärker (OpAmp)
- Spezielle ICs (555-Timer, 7400-Logikfamilie)
- Mikrocontroller

### 7.3 Spule und Kondensator im Wechselstrom

- **Induktiver Blindwiderstand**: X_L = 2π · f · L
- **Kapazitiver Blindwiderstand**: X_C = 1/(2π · f · C)

**Beispiel:**

Spule: 100 mH bei 50 Hz
X_L = 2π · 50 · 0,1 = **31,4 Ω**

---

## 8. Schaltpläne lesen

### 8.1 Schaltzeichen (DIN EN 60617)

- **Widerstand**: Rechteck (alt) oder Rechteck mit Anschlüssen (neu)
- **Kondensator**: zwei parallele Striche
- **Spule**: vier Halbkreise
- **Diode**: Dreieck mit Strich
- **Masse**: drei Striche abnehmender Länge
- **Spannungsquelle**: lange/kurze Striche

### 8.2 Schaltplan-Beispiel

```
 +U ──[R1]──┬──[R2]── GND
            │
            └──[LED]── GND
```

Vorwiderstand R1 schützt LED.

---

## 9. Messen mit Multimeter und Oszilloskop

### 9.1 Multimeter

- **Spannungsmessung**: parallel zum Bauteil
- **Strommessung**: in Serie zum Stromkreis
- **Widerstandsmessung**: ohne Spannung im Stromkreis

### 9.2 Oszilloskop

- Visualisierung zeitlicher Signalverläufe
- Frequenz-, Amplitudenmessung
- Trigger für stabile Anzeige
- Heute meist digital (DSO)

---

## 10. Sicherheitsregeln (VDE)

### 10.1 Die 5 Sicherheitsregeln

1. **Freischalten**: Spannung abschalten
2. **Sichern**: gegen Wiedereinschalten sichern
3. **Spannungsfreiheit feststellen**: mit geeignetem Messgerät prüfen
4. **Erden und Kurzschließen**: Potentialausgleich
5. **Abdecken und Abschranken**: benachbarte Teile abdecken

### 10.2 Personenschutz

- Isolierte Werkzeuge
- Schutzhandschuhe bei Arbeiten unter Spannung
- Sicherheitsschuhe
- Nicht alleinarbeiten an Hochspannungsanlagen

### 10.3 Anlagenschutz

- Absicherungen (Leitungsschutzschalter)
- FI-Schutzschalter (RCD) in Wohnräumen
- Überspannungsschutz

---

## 11. Übungen

### Übung 1 — Ohmsches Gesetz

Eine 12-V-Lampe hat 24 Ω. Berechnen Sie Strom und Leistung.

### Übung 2 — Reihenschaltung

Drei Widerstände 100 Ω, 200 Ω, 300 Ω in Reihe. Gesamtwiderstand?

### Übung 3 — Parallelschaltung

Drei Widerstände 100 Ω parallel. Gesamtwiderstand?

### Übung 4 — Leistung

Eine Heizplatte 230 V / 2000 W. Berechnen Sie Strom und Widerstand.

### Übung 5 — Wechselstrom

Netzspannung 230 V, 50 Hz. Scheitelwert?

### Übung 6 — Schaltplan

Zeichnen Sie einen Schaltplan mit Batterie, Schalter, Widerstand und LED.

---

## 12. Zusammenfassung

| Größe | Formel | Einheit |
|---|---|---|
| Spannung | U | Volt (V) |
| Strom | I | Ampere (A) |
| Widerstand | R = U/I | Ohm (Ω) |
| Leistung | P = U · I | Watt (W) |
| Energie | W = P · t | kWh |

**Ohmsches Gesetz:** U = R · I

**Kirchhoffsche Gesetze:**

- Knotenregel: Σ I_in = Σ I_out
- Maschenregel: Σ U = 0

**Wechselstrom:**

- 230 V / 50 Hz in Europa
- Dreiphasenwechselstrom (Drehstrom) mit 400 V

**Bauelemente:** R, C, L, Diode, Transistor, IC

**Sicherheit:**

- 5 Sicherheitsregeln (VDE)
- FI-Schutzschalter
- Isolierte Werkzeuge

### Selbsttest-Checkliste

- [ ] Ich wende das Ohmsche Gesetz an.
- [ ] Ich berechne Reihen- und Parallelschaltungen.
- [ ] Ich erkläre die Kirchhoffschen Gesetze.
- [ ] Ich identifiziere Bauelemente.
- [ ] Ich beachte die 5 Sicherheitsregeln.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=1929 — Recherche 2026*
