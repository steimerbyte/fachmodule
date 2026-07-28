# Fachmodul: Digitaltechnik

**Kurs-ID:** 3320
**Kategorie:** Kursbibliothek / Fachmodule / Elektrotechnik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3320

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Zahlensysteme](#2-zahlensysteme)
3. [Boolesche Algebra](#3-boolesche-algebra)
4. [Logikgatter](#4-logikgatter)
5. [KV-Diagramme](#5-kv-diagramme)
6. [Schaltnetze (kombinatorisch)](#6-schaltnetze-kombinatorisch)
7. [Flip-Flops und Schaltwerke (sequentiell)](#7-flip-flops-und-schaltwerke-sequentiell)
8. [Hardware-Beschreibungssprachen](#8-hardware-beschreibungssprachen)
9. [Moore/Mealy-Automaten](#9-mooremaly-automaten)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Zahlensysteme (Binär, Hex, Oktal) konvertieren,
- Boolesche Algebra anwenden,
- Logikgatter kennen und verschalten,
- KV-Diagramme nutzen,
- Schaltnetze und Schaltwerke unterscheiden,
- Moore- und Mealy-Automaten unterscheiden.

---

## 2. Zahlensysteme

### 2.1 Dezimal (Basis 10)

Ziffern: 0-9. Jede Stelle hat Gewicht 10^i.

### 2.2 Binär (Basis 2)

Ziffern: 0, 1. Gewicht 2^i.

| Binär | Dezimal |
|---|---|
| 0000 | 0 |
| 0001 | 1 |
| 0010 | 2 |
| 0100 | 4 |
| 1000 | 8 |
| 1010 | 10 |
| 1111 | 15 |

### 2.3 Hexadezimal (Basis 16)

Ziffern: 0-9, A-F. Gewicht 16^i.

| Hex | Binär | Dezimal |
|---|---|---|
| 0 | 0000 | 0 |
| 1 | 0001 | 1 |
| 9 | 1001 | 9 |
| A | 1010 | 10 |
| F | 1111 | 15 |
| 10 | 00010000 | 16 |
| FF | 11111111 | 255 |

### 2.4 Umrechnung

**Dezimal → Binär:** Division durch 2, Reste sammeln

Beispiel: 13
13 / 2 = 6 R 1
6 / 2 = 3 R 0
3 / 2 = 1 R 1
1 / 2 = 0 R 1
→ **1101**

---

## 3. Boolesche Algebra

### 3.1 Operatoren

| Operator | Bedeutung |
|---|---|
| **AND** (∧) | UND |
| **OR** (∨) | ODER |
| **NOT** (¬) | NICHT |
| **XOR** (⊕) | Exklusiv-ODER |
| **NAND** | NOT AND |
| **NOR** | NOT OR |

### 3.2 Gesetze

| Gesetz | Formel |
|---|---|
| Kommutativgesetz | A ∧ B = B ∧ A |
| Assoziativgesetz | (A ∧ B) ∧ C = A ∧ (B ∧ C) |
| Distributivgesetz | A ∧ (B ∨ C) = (A ∧ B) ∨ (A ∧ C) |
| De Morgan | ¬(A ∧ B) = ¬A ∨ ¬B |
| De Morgan | ¬(A ∨ B) = ¬A ∧ ¬B |
| Idempotenz | A ∧ A = A |
| Komplement | A ∧ ¬A = 0 |
| Identität | A ∧ 1 = A |
| Null | A ∧ 0 = 0 |

---

## 4. Logikgatter

### 4.1 Grundgatter

| Gatter | Symbol (DIN) | Symbol (US) | Funktion |
|---|---|---|---|
| AND | & | D-Form | Y = A ∧ B |
| OR | ≥1 | D-Form | Y = A ∨ B |
| NOT | 1 mit Kreis | Dreieck mit Kreis | Y = ¬A |
| NAND | & mit Kreis | D-Form mit Kreis | Y = ¬(A ∧ B) |
| NOR | ≥1 mit Kreis | D-Form mit Kreis | Y = ¬(A ∨ B) |
| XOR | =1 | Bogen | Y = A ⊕ B |

### 4.2 Wahrheitstabellen

**AND:**

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

**OR:**

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

**XOR:**

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

---

## 5. KV-Diagramme (Karnaugh-Veitch)

### 5.1 Zweck

KV-Diagramme vereinfachen Boolesche Funktionen durch grafische Nachbarschaftserkennung.

### 5.2 KV-Diagramm für 2 Variablen

```
       B=0  B=1
   ┌─────┬─────┐
A=0│  0  │  1  │
   ├─────┼─────┤
A=1│  2  │  3  │
   └─────┴─────┘
```

### 5.3 Beispiel

Y = Σ(1, 2)

Y = A ∧ ¬B ∨ ¬A ∧ B

KV-Diagramm:

```
       B=0  B=1
   ┌─────┬─────┐
A=0│  0  │  1  │
   ├─────┼─────┤
A=1│  1  │  0  │
   └─────┴─────┘
```

Keine zusammenfassbaren Einsen — Funktion bleibt: **Y = A⊕B**

### 5.4 Gruppierungsregeln

- Einsen in 2er-Potenzen gruppieren (1, 2, 4, 8, ...)
- Gruppe darf sich "um die Ecke wickeln" (oben mit unten, links mit rechts)
- Gruppe so groß wie möglich

---

## 6. Schaltnetze (kombinatorisch)

### 6.1 Definition

Schaltnetze sind Logikschaltungen **ohne Speicher**. Der Ausgang hängt nur von den aktuellen Eingängen ab.

### 6.2 Beispiele

- **Multiplexer**: wählt zwischen mehreren Eingängen
- **Demultiplexer**: verteilt einen Eingang auf mehrere Ausgänge
- **Addierer**: Volladdierer (Summe + Carry)
- **Encoder/Decoder**: 7-Segment-Anzeige
- **Komparator**: vergleicht Binärzahlen

### 6.3 Volladdierer

```
A, B, Cin → S, Cout
S = A ⊕ B ⊕ Cin
Cout = (A ∧ B) ∨ (A ∧ Cin) ∨ (B ∧ Cin)
```

---

## 7. Flip-Flops und Schaltwerke (sequentiell)

### 7.1 Flip-Flop-Arten

| Typ | Symbol | Funktion |
|---|---|---|
| **RS-Flipflop** | R, S | Reset, Set |
| **D-Flipflop** | D | Daten speichern |
| **JK-Flipflop** | J, K | Toggle, Set, Reset |
| **T-Flipflop** | T | Toggle bei Takt |

### 7.2 RS-Flipflop

| R | S | Q(n+1) |
|---|---|---|
| 0 | 0 | Q(n) (halten) |
| 0 | 1 | 1 (setzen) |
| 1 | 0 | 0 (rücksetzen) |
| 1 | 1 | undefiniert |

### 7.3 D-Flipflop

- Eingang D wird bei Taktflanke gespeichert
- Q(n+1) = D

### 7.4 JK-Flipflop

| J | K | Q(n+1) |
|---|---|---|
| 0 | 0 | Q(n) |
| 0 | 1 | 0 |
| 1 | 0 | 1 |
| 1 | 1 | ¬Q(n) (toggle) |

---

## 8. Hardware-Beschreibungssprachen

### 8.1 VHDL

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_GATE is
    port (A, B: in std_logic;
          Y: out std_logic);
end AND_GATE;

architecture behavioral of AND_GATE is
begin
    Y <= A and B;
end behavioral;
```

### 8.2 Verilog

```verilog
module and_gate (
    input A, B,
    output Y
);
    assign Y = A & B;
endmodule
```

---

## 9. Moore/Mealy-Automaten

### 9.1 Definition

Endliche Automaten (FSM) modellieren zustandsbehaftete Systeme.

### 9.2 Moore-Automat

- Ausgang hängt **nur vom Zustand** ab
- Ausgangsfunktion: Y = λ(Q)

### 9.3 Mealy-Automat

- Ausgang hängt vom **Zustand UND von Eingaben** ab
- Ausgangsfunktion: Y = λ(Q, X)

### 9.4 Vergleich

| Aspekt | Moore | Mealy |
|---|---|---|
| Ausgang | nur Zustand | Zustand + Eingabe |
| Reaktion | eine Taktverzögerung | sofort |
| Zustandsanzahl | meist mehr | oft weniger |
| Stabilität | stabiler | anfälliger für Glitches |

### 9.5 Beispiel: Ampel

Moore:

```
Zustände: Rot, Rot-Gelb, Grün, Gelb
Übergänge: nur zeitabhängig
Ausgänge: leuchten je Zustand
```

Mealy:

```
Zustände: Rot, Grün, Gelb
Übergänge: zeit- und sensorabhängig
Ausgänge: ändern sich bei Sensor-Eingabe
```

---

## 10. Übungen

### Übung 1 — Zahlensysteme

Wandle 42 dezimal in binär um.

### Übung 2 — Boolesche Algebra

Vereinfache: Y = (A ∧ B) ∨ (A ∧ ¬B)

### Übung 3 — KV-Diagramm

Vereinfache Y = Σ(0, 1, 2, 3) mit KV-Diagramm.

### Übung 4 — Volladdierer

Zeichne den Schaltplan eines Volladdierers.

### Übung 5 — Flip-Flop

Welcher Flip-Flop-Typ eignet sich für einen Zähler?

### Übung 6 — Mealy/Moore

Wann ist Moore, wann Mealy besser?

---

## 11. Zusammenfassung

| Thema | Kernaussage |
|---|---|
| **Zahlensysteme** | Binär ist Grundlage, Hexadezimal kompakte Darstellung |
| **Boolesche Algebra** | UND, ODER, NICHT, De Morgan |
| **Logikgatter** | AND, OR, NOT, NAND, NOR, XOR |
| **KV-Diagramm** | grafische Vereinfachung Boolescher Funktionen |
| **Schaltnetze** | kombinatorisch (ohne Speicher) |
| **Schaltwerke** | sequentiell (mit Speicher/Flipflops) |
| **Moore vs. Mealy** | Ausgang abhängig von Zustand (Moore) oder Zustand+Eingabe (Mealy) |

### Selbsttest-Checkliste

- [ ] Ich rechne zwischen Binär/Hex/Dezimal um.
- [ ] Ich vereinfache Boolesche Funktionen.
- [ ] Ich nutze KV-Diagramme.
- [ ] Ich unterscheide kombinatorische und sequentielle Schaltungen.
- [ ] Ich erkläre Moore- und Mealy-Automaten.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3320 — Recherche 2026*
