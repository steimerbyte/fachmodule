# Fachmodul: Datentypen (Java)

**Kurs-ID:** 1922
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1922
**Bezugsstand:** Java 21 LTS

---

## Inhaltsverzeichnis

1. [Bedeutung von Datentypen in Java](#1-bedeutung-von-datentypen-in-java)
2. [Die acht primitiven Datentypen](#2-die-acht-primitive-datentypen)
3. [Ganzzahltypen: byte, short, int, long](#3-ganzzahltypen-byte-short-int-long)
4. [char und Unicode (UTF-16)](#4-char-und-unicode-utf-16)
5. [boolean – Wahrheitswerte](#5-boolean--wahrheitswerte)
6. [Gleitkommatypen float und double (IEEE 754)](#6-gleitkommatypen-float-und-double-ieee-754)
7. [Variablen: Deklaration, Initialisierung, Konstanten](#7-variablen-deklaration-initialisierung-konstanten)
8. [Gültigkeitsbereich (Scope) und Lebensdauer](#8-gültigkeitsbereich-scope-und-lebensdauer)
9. [Arithmetische Operatoren](#9-arithmetische-operatoren)
10. [Vergleichs- und logische Operatoren](#10-vergleichs-und-logische-operatoren)
11. [Bit- und Zuweisungsoperatoren](#11-bit-und-zuweisungsoperatoren)
12. [Typumwandlung (Widening / Narrowing)](#12-typumwandlung-widening--narrowing)
13. [Wrapper-Klassen, Auto-Boxing und Unboxing](#13-wrapper-klassen-auto-boxing-und-unboxing)
14. [Konvertierung zwischen Strings und Zahlen](#14-konvertierung-zwischen-strings-und-zahlen)
15. [Referenztypen: Strings, Arrays, Objekte](#15-referenztypen-strings-arrays-objekte)
16. [Lernaufgaben und Übungen](#16-lernaufgaben-und-übungen)
17. [Quellen, Bildnachweise und Vertiefung](#17-quellen-bildnachweise-und-vertiefung)
18. [Zusammenfassung und Checkliste](#18-zusammenfassung-und-checkliste)

---

## Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die acht primitiven Datentypen sicher unterscheiden und einsetzen,
- Variablen deklarieren, initialisieren und ihren Gültigkeitsbereich bestimmen,
- arithmetische, vergleichende, logische und bitweise Operatoren korrekt anwenden,
- implizite und explizite Typumwandlungen bewusst einsetzen,
- mit Wrapper-Klassen, Auto-Boxing und Unboxing sicher umgehen,
- Strings und Zahlen gezielt konvertieren und Eingabefehler behandeln.

---

## 1. Bedeutung von Datentypen in Java

Ein Datentyp legt fest,

- welche Werte eine Variable speichern darf,
- wie diese Werte interpretiert werden,
- welche Operationen zulässig sind,
- welche Standardwerte gelten,
- und welche Typumwandlungen möglich sind.

Java ist **statisch typisiert**. Der Datentyp einer Variablen wird grundsätzlich bereits beim Übersetzen des Programms überprüft. Dadurch erkennt der Compiler viele Fehler, bevor das Programm ausgeführt wird.

```java
int    alter  = 17;
String name   = "Mia";
boolean volljaehrig = false;
```

Die Variable `alter` kann nur Ganzzahlen des Typs `int` aufnehmen. Die Variable `name` referenziert ein `String`-Objekt, während `volljaehrig` ausschließlich `true` oder `false` speichern kann.

Java unterscheidet zwei grundlegende Kategorien:

1. **Primitive Datentypen** – speichern einen einfachen Wert direkt.
2. **Referenztypen** – verweisen auf Objekte oder Arrays.

![Übersicht: Primitive Datentypen vs. Referenztypen](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Data_types.svg/600px-Data_types.svg.png)

`void` ist kein Datentyp zum Speichern von Werten, sondern kennzeichnet Methoden ohne Rückgabewert.

---

## 2. Die acht primitiven Datentypen

| Typ | Kategorie | Größe | Wertebereich / Werte | Standardwert | Wrapper |
|---|---|---:|---|---|---|
| `byte`   | Ganzzahl       | 8 Bit  | −128 … 127                                              | `0`        | `Byte`      |
| `short`  | Ganzzahl       | 16 Bit | −32 768 … 32 767                                        | `0`        | `Short`     |
| `int`    | Ganzzahl       | 32 Bit | −2 147 483 648 … 2 147 483 647                          | `0`        | `Integer`   |
| `long`   | Ganzzahl       | 64 Bit | −9,22 · 10¹⁸ … 9,22 · 10¹⁸                              | `0L`       | `Long`      |
| `float`  | Gleitkommazahl | 32 Bit | IEEE-754, ≈ 6–7 Dezimalstellen                          | `0.0f`     | `Float`     |
| `double` | Gleitkommazahl | 64 Bit | IEEE-754, ≈ 15–16 Dezimalstellen                        | `0.0d`     | `Double`    |
| `boolean`| Wahrheitswert  | undef. | `true`, `false`                                          | `false`    | `Boolean`   |
| `char`   | Unicode        | 16 Bit | `'\u0000'` … `'\uFFFF'`                                 | `'\u0000'` | `Character` |

> **Wichtig:** Die Größe von `boolean` ist **nicht** normativ festgelegt. Die JVM darf intern eine plattformabhängige Darstellung wählen.

![Primitive Java Datatypes](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Java_primitive_types.svg/640px-Java_primitive_types.svg.png)

### 2.1 Wahl des richtigen Datentyps

| Anwendungsfall | Empfehlung |
|---|---|
| Alter, Anzahl, Zähler                  | `int`         |
| Große Ganzzahlen (z. B. Zeit in ms)    | `long`        |
| Binärdaten, Datei-IO                   | `byte`        |
| Fließkommaberechnungen                 | `double`      |
| Geld- und Dezimalrechnungen            | `BigDecimal`  |
| Einzelnes Zeichen                      | `char`        |
| Wahrheitswert                          | `boolean`     |

---

## 3. Ganzzahltypen: byte, short, int, long

### 3.1 `byte` (8 Bit, −128 … 127)

```java
byte temperatur = 25;
byte min = Byte.MIN_VALUE;  // -128
byte max = Byte.MAX_VALUE;  //  127
```

Verwendung: Binärdaten, Netzwerkdaten, Datei-IO.

**Achtung:** Bei `byte + byte` liefert Java `int` und kein `byte`:

```java
byte a = 10, b = 20;
// byte summe = a + b;          // Compilerfehler
byte summe = (byte) (a + b);    // erlaubt
```

### 3.2 `short` (16 Bit, −32 768 … 32 767)

```java
short entfernung = 12_000;
```

`short` wird in modernem Code selten benutzt – `int` ist effizienter, weil 32-Bit-Operationen von der CPU bevorzugt werden.

### 3.3 `int` (32 Bit, Standardtyp)

```java
int alter     = 18;
int anzahl    = 2_500;
int maske     = 0b1010_1100;  // binär
int hexWert   = 0xFF;         // hex
int oktal     = 077;          // oktal
int unterstrich = 1_000_000;  // Tausender-Trenner
```

`int` ist der **Standardtyp für Ganzzahlen** in Java. Ganzzahlige Literale ohne Suffix sind implizit `int`.

### 3.4 `long` (64 Bit)

```java
long bevoelkerung      = 8_500_000_000L;   // Suffix L!
long max               = Long.MAX_VALUE;
long zeitstempelMillis = System.currentTimeMillis();
```

> **Empfehlung:** Schreiben Sie das `L` groß, weil das kleine `l` mit der Ziffer `1` verwechselt wird.

### 3.5 Überlauf und `Math.addExact`

```java
int x = Integer.MAX_VALUE;
x++;
System.out.println(x);   // -2147483648 (Überlauf im Zweierkomplement)

int sicher = Math.addExact(Integer.MAX_VALUE, 1);   // ArithmeticException
```

![Zweierkomplement-Darstellung](https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/8-bit-signed-integer-wrap-around.png/640px-8-bit-signed-integer-wrap-around.png)

---

## 4. `char` und Unicode (UTF-16)

`char` ist **kein** klassisches 1-Byte-Zeichen wie in C, sondern eine 16-Bit-UTF-16-Codeeinheit.

```java
char buchstabe   = 'A';
char umlaut      = 'ä';
char euro        = '\u20AC';
```

Bereich: `'\u0000'` … `'\uFFFF'` (65 536 Werte).

Weil `char` ein numerischer Typ ist, kann damit gerechnet werden:

```java
char start = 'A';
System.out.println((int) start);              // 65
System.out.println((char) (start + 1));       // 'B'
```

### 4.1 Surrogatpaare

Zeichen außerhalb der Basic Multilingual Plane (z. B. viele Emojis) werden in Java durch **zwei** `char`-Werte (Surrogatpaar) repräsentiert:

```java
String emoji = "😀";
System.out.println(emoji.length());                    // 2
System.out.println(emoji.codePointCount(0, emoji.length())); // 1
```

![UTF-16 Codierung](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/UTF-16_U%2B10000.svg/640px-UTF-16_U%2B10000.svg.png)

Für Unicode-fähige Verarbeitung:

```java
int code = emoji.codePointAt(0);
String zeichen = new String(Character.toChars(code));
```

---

## 5. `boolean` – Wahrheitswerte

```java
boolean aktiv       = true;
boolean abgeschlossen = false;
```

Verwendung: Bedingungen und Zustände.

```java
if (aktiv) {
    System.out.println("Das System ist aktiv.");
}
```

**In Java ist `boolean` nicht implizit in eine Zahl umwandelbar:**

```java
boolean status = true;
// int zahl = status;          // nicht erlaubt

int wert = 1;
// if (wert) { … }             // nicht erlaubt
if (wert != 0) { … }           // korrekt
```

---

## 6. Gleitkommatypen float und double (IEEE 754)

### 6.1 Grundlagen

```java
float  temperatur = 21.5f;     // Suffix f!
double pi         = 3.141592653589793;
```

Ein Literal ohne Suffix ist standardmäßig `double`. Ohne `f` ist folgende Zuweisung ungültig:

```java
// float wert = 1.5;   // Fehler: 1.5 ist double
float wert = 1.5f;     // korrekt
```

### 6.2 Vergleich float / double

| Merkmal | `float` | `double` |
|---|---:|---:|
| Größe | 32 Bit | 64 Bit |
| Signifikand | 24 Bit | 53 Bit |
| Dezimalgenauigkeit | ≈ 6–7 Stellen | ≈ 15–16 Stellen |
| Suffix | `f` / `F` | optional `d` / `D` |
| Standardwahl | Spezialsituationen | Normalfall |

### 6.3 IEEE-754-Aufbau

![IEEE 754 Single](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Float_example.svg/640px-Float_example.svg.png)

`float` (32 Bit):

```
1 Bit Vorzeichen | 8 Bit Exponent | 23 Bit Mantisse
```

`double` (64 Bit):

```
1 Bit Vorzeichen | 11 Bit Exponent | 52 Bit Mantisse
```

### 6.4 Rundungsfehler

Weil viele Dezimalbrüche binär nicht exakt darstellbar sind:

```java
System.out.println(0.1 + 0.2);                 // 0.30000000000000004
System.out.println(0.1 + 0.2 == 0.3);           // false
```

**Robuster Vergleich** mit Epsilon:

```java
final double EPS = 1e-12;
boolean gleich = Math.abs(0.1 + 0.2 - 0.3) < EPS;  // true
```

Bei sehr großen/kleinen Zahlen besser **relativ**:

```java
boolean nahe(double a, double b, double rel) {
    return Math.abs(a - b) <= rel * Math.max(Math.abs(a), Math.abs(b));
}
```

### 6.5 Sonderwerte

```java
double posInf =  1.0 / 0.0;   // Infinity
double negInf = -1.0 / 0.0;   // -Infinity
double nan    =  0.0 / 0.0;   // NaN
```

```java
double x = Double.NaN;
System.out.println(x == Double.NaN);   // false
System.out.println(Double.isNaN(x));   // true
```

### 6.6 Geld und Dezimalrechnung

**Verwenden Sie niemals `float` oder `double` für Geld:**

```java
import java.math.BigDecimal;

BigDecimal preis = new BigDecimal("0.10");
BigDecimal steuer = new BigDecimal("0.20");
System.out.println(preis.add(steuer));   // 0.30
```

> **Hinweis:** `new BigDecimal(0.1)` würde bereits die ungenaue `double`-Näherung übernehmen – daher immer den **String-Konstruktor** nutzen.

---

## 7. Variablen: Deklaration, Initialisierung, Konstanten

### 7.1 Deklaration und Initialisierung

```java
int alter;             // nur Deklaration
alter = 17;            // Zuweisung
int punkte = 95;       // Deklaration + Initialisierung
int x = 1, y = 2, z = 3;
```

### 7.2 Konstanten (`final`)

```java
final double MWST    = 0.19;
final int   MAX_USER = 100;
```

Konstanten werden per Konvention **komplett großgeschrieben** mit `_` als Trennzeichen.

```java
final int anzahl;

if (args.length > 0) {
    anzahl = 1;
} else {
    anzahl = 0;
}
```

> `final` heißt nur: nach der ersten Zuweisung unveränderlich. Es ist **nicht zwingend** zur Initialisierungszeit erforderlich, sofern der Compiler eindeutig sieht, dass genau einmal zugewiesen wird.

---

## 8. Gültigkeitsbereich (Scope) und Lebensdauer

### 8.1 Lokale Variablen

```java
public void berechne() {
    int ergebnis = 42;

    if (ergebnis > 0) {
        String meldung = "positiv";
        System.out.println(meldung);
    }
    // meldung ist hier nicht mehr sichtbar
}
```

- Lokale Variablen haben **keinen** automatischen Standardwert.
- Sie müssen vor der ersten Verwendung definitiv initialisiert sein.

```java
public void fehler() {
    int zahl;
    // System.out.println(zahl);   // Compilerfehler
}
```

### 8.2 Instanzvariablen

```java
class Konto {
    private String inhaber;
    private double kontostand;

    public Konto(String inhaber) {
        this.inhaber = inhaber;
    }
}
```

- Pro Objekt eine eigene Kopie.
- Automatische Standardwerte: `0`, `false`, `null`, `'\u0000'`.

### 8.3 Klassenvariablen (`static`)

```java
class Benutzer {
    private static int anzahlBenutzer = 0;

    public Benutzer() { anzahlBenutzer++; }

    public static int getAnzahlBenutzer() { return anzahlBenutzer; }
}
```

- Existiert **einmal pro Klasse**, wird von allen Instanzen geteilt.
- Zugriff über `Klasse.name` empfohlen.

### 8.4 Übersicht

| Variablenart | Wo deklariert? | Anzahl | Standardwert? | Zugriff |
|---|---|---|---|---|
| Lokal       | Methode, Block            | pro Aufruf     | nein | direkt im Scope |
| Instanz     | Klasse außerhalb Methoden | pro Objekt     | ja   | `this.name`, `objekt.name` |
| Klasse      | Klasse + `static`         | einmal/Klasse  | ja   | `Klasse.name` |

---

## 9. Arithmetische Operatoren

| Operator | Bedeutung | Beispiel |
|---|---|---|
| `+`  | Addition                  | `a + b` |
| `-`  | Subtraktion               | `a - b` |
| `*`  | Multiplikation            | `a * b` |
| `/`  | Division                  | `a / b` |
| `%`  | Modulo / Rest             | `a % b` |
| `++` | Erhöhung um 1             | `a++`   |
| `--` | Verringerung um 1         | `a--`   |

```java
int a = 17, b = 5;
System.out.println(a + b);  // 22
System.out.println(a - b);  // 12
System.out.println(a * b);  // 85
System.out.println(a / b);  // 3   (Ganzzahldivision)
System.out.println(a % b);  // 2
```

### 9.1 Ganzzahldivision

```java
System.out.println(5 / 2);     // 2
System.out.println(5.0 / 2);   // 2.5
System.out.println(-5 / 2);    // -2 (Rundung Richtung 0)
```

Division durch 0:

- `int`/`long` durch 0 → `ArithmeticException`
- `float`/`double` durch 0 → `Infinity` oder `NaN`

### 9.2 Vorzeichen des Restwerts

```java
System.out.println( 7 % 3);   //  1
System.out.println(-7 % 3);   // -1
System.out.println( 7 % -3);  //  1
```

Der Rest hat das Vorzeichen des **linken** Operanden.

### 9.3 Präfix- und Postfix-Inkrement

```java
int x = 5;
int a = x++;   // a = 5,  danach x = 6
int b = ++x;   // x = 7,  b = 7
```

In komplexen Ausdrücken schnell unleserlich – vermeiden.

### 9.4 Operator-Rangfolge (vereinfacht)

1. Klammern
2. unäre Operatoren (`!`, `++`, `--`, `+`, `-`)
3. `*`, `/`, `%`
4. `+`, `-`
5. Vergleiche
6. `&&`
7. `||`
8. Zuweisungen

---

## 10. Vergleichs- und logische Operatoren

### 10.1 Vergleichsoperatoren

```java
int alter = 18;
boolean volljaehrig = alter >= 18;
```

| Operator | Bedeutung |
|---|---|
| `==` | gleich |
| `!=` | ungleich |
| `<`  | kleiner |
| `>`  | größer |
| `<=` | kleiner oder gleich |
| `>=` | größer oder gleich |

> **Achtung:** Bei Objekten vergleicht `==` **Referenzen**, nicht den Inhalt! Für Inhaltsvergleiche `equals()` benutzen.

```java
String a = new String("Java");
String b = new String("Java");
System.out.println(a == b);       // false
System.out.println(a.equals(b));  // true
```

### 10.2 Logische Operatoren

| Operator | Bedeutung | Kurzschluss? |
|---|---|---|
| `&&` | logisches UND   | ja |
| `\|\|` | logisches ODER | ja |
| `!`  | Negation          | —  |
| `^`  | XOR (exklusiv)   | nein |
| `&`  | UND              | nein |
| `\|` | ODER             | nein |

**Wahrheitstafeln:**

| A | B | A && B | A \|\| B | A ^ B |
|---|---|---|---|---|
| false | false | false | false | false |
| false | true  | false | true  | true  |
| true  | false | false | true  | true  |
| true  | true  | true  | true  | false |

**Kurzschlussauswertung:**

```java
if (divisor != 0 && 100 / divisor > 2) { … }
//                                ^ wird nicht ausgewertet, wenn divisor==0
```

Wichtig bei Nullprüfungen:

```java
if (text != null && !text.isEmpty()) { … }
```

---

## 11. Bit- und Zuweisungsoperatoren

### 11.1 Bit-Operatoren

| Operator | Bezeichnung |
|---|---|
| `&`  | bitweises UND |
| `\|` | bitweises ODER |
| `^`  | bitweises XOR |
| `~`  | bitweise Negation |
| `<<` | Linksverschiebung |
| `>>` | arithmetische Rechtsverschiebung |
| `>>>`| logische Rechtsverschiebung (mit 0 aufgefüllt) |

```java
int a = 0b1100;   // 12
int b = 0b1010;   // 10

System.out.println(Integer.toBinaryString(a & b));   // 1000
System.out.println(Integer.toBinaryString(a | b));   // 1110
System.out.println(Integer.toBinaryString(a ^ b));   // 0110
System.out.println(Integer.toBinaryString(~a));      // ...11110011
```

### 11.2 Verschiebungen

```java
int z = 8;
System.out.println(z << 1);    // 16  (Multiplikation mit 2)
System.out.println(z >> 1);    //  4  (Division durch 2)
```

> Bei `>>` bleibt das Vorzeichen erhalten. Bei `>>>` wird links mit Nullen aufgefüllt.

Einsatzbereiche: Bitmasken, Flags, Hardwareprogrammierung, Netzwerkprotokolle.

### 11.3 Zusammengesetzte Zuweisungen

| Operator | Wirkung |
|---|---|
| `+=` | `a = a + b` |
| `-=` | `a = a - b` |
| `*=` | `a = a * b` |
| `/=` | `a = a / b` |
| `%=` | `a = a % b` |
| `&=`, `\|=`, `^=` | bitweise |
| `<<=`, `>>=`, `>>>=` | verschiebend |

```java
int wert = 10;
wert += 5;   // 15
wert *= 2;   // 30
```

**Wichtig:** Eine zusammengesetzte Zuweisung enthält eine implizite Typumwandlung.

```java
byte wert = 10;
wert += 20;      // erlaubt (Cast implizit)
wert = wert + 20;// Compilerfehler ohne Cast
```

---

## 12. Typumwandlung (Widening / Narrowing)

### 12.1 Implizite Erweiterung (Widening)

```java
byte  b = 10;
int   i = b;
long  l = i;
double d = l;
```

```text
byte → short → int → long → float → double
              ↑
            char
```

> **Achtung:** `long → float` oder `long → double` kann Präzision verlieren, obwohl der Zieltyp größer ist.

### 12.2 Explizite Verengung (Narrowing)

```java
double temperatur = 21.75;
int    ganzzahl   = (int) temperatur;   // 21 (Rundung Richtung 0)

int    zahl       = 130;
byte   b          = (byte) zahl;        // -126 (nur 8 Bits)
```

Rundung in Richtung null:

```java
System.out.println((int) 3.99);   // 3
System.out.println((int) -3.99);  // -3
```

### 12.3 Binary Numeric Promotion

```java
byte a = 5, b = 6;
int ergebnis = a + b;          // byte + byte → int
short c = 10, d = 20;
short e = (short) (c + d);     // Cast nötig
```

### 12.4 Konstante Ausdrücke

```java
final int KONST = 100;
byte b = KONST;   // erlaubt, weil Wert in byte passt

int variable = 100;
// byte b = variable;  // nicht erlaubt, weil nicht konstant
```

---

## 13. Wrapper-Klassen, Auto-Boxing und Unboxing

### 13.1 Überblick

| Primitiv | Wrapper |
|---|---|
| `byte` | `Byte` |
| `short`| `Short` |
| `int`  | `Integer` |
| `long` | `Long` |
| `float`| `Float` |
| `double`| `Double` |
| `boolean`| `Boolean` |
| `char` | `Character` |

Wrapper sind **unveränderlich (immutable)**.

### 13.2 Erzeugung

```java
Integer i1 = Integer.valueOf(42);           // bevorzugt
Integer i2 = Integer.valueOf("1234");      // String → Integer
Integer i3 = 42;                            // Auto-Boxing
int     i4 = i3;                            // Unboxing
```

Vermeiden Sie `new Integer(...)` – der direkte Konstruktor ist veraltet.

### 13.3 Auto-Boxing und Unboxing

```java
List<Integer> zahlen = new ArrayList<>();
zahlen.add(5);                 // Auto-Boxing
int ersterWert = zahlen.get(0);// Unboxing
```

### 13.4 Fallstricke

**NullPointerException beim Unboxing:**

```java
Integer wert = null;
int x = wert;   // NPE!
```

**`==` mit Wrappern:**

```java
Integer a = 1000;
Integer b = 1000;
System.out.println(a == b);       // oft false (Referenzen)
System.out.println(a.equals(b));  // true (Inhalt)
```

> Kleine Werte (-128 … 127) werden aus einem Cache geliefert – das macht `==` manchmal scheinbar korrekt, ist aber **nicht portierbar**. Immer `equals()` benutzen.

### 13.5 Performance

In heißen Schleifen können durch Auto-Boxing viele temporäre Objekte entstehen. Faustregel: Primitive in numerischen Berechnungen, Wrapper in APIs/Collections.

---

## 14. Konvertierung zwischen Strings und Zahlen

### 14.1 Zahl → String

```java
int    alter = 17;
String s1   = String.valueOf(alter);
String s2   = Integer.toString(alter);
String s3   = "" + alter;                  // funktioniert, gilt aber als unsauber
```

Vorsicht bei möglicher `null`-Referenz:

```java
Integer zahl = null;
String s = String.valueOf(zahl);   // liefert "null"
// String s = zahl.toString();     // NullPointerException
```

### 14.2 String → primitive Zahl

```java
int    i  = Integer.parseInt("123");
Integer o = Integer.valueOf("123");
int    b  = Integer.parseInt("101", 2);   // Basis 2 → 5
long   l  = Long.parseLong("9000000000");
double d  = Double.parseDouble("3.14");
```

> **Hinweis:** `Double.parseDouble("3,14")` löst eine `NumberFormatException` aus – Java akzeptiert kein deutsches Komma.

### 14.3 Fehlerbehandlung

```java
try {
    int zahl = Integer.parseInt("abc");
} catch (NumberFormatException e) {
    System.out.println("Ungültige Eingabe.");
}
```

Auch Bereichsüberschreitungen lösen `NumberFormatException` aus.

### 14.4 Boolean-Konvertierung

```java
boolean aktiv = Boolean.parseBoolean("true");   // true
boolean sonst = Boolean.parseBoolean("yes");   // false (kein Fehler!)
```

### 14.5 Lokalisierung

```java
NumberFormat nf = NumberFormat.getInstance(Locale.GERMAN);
double d = nf.parse("3,14").doubleValue();   // deutsches Komma
```

---

## 15. Referenztypen: Strings, Arrays, Objekte

Referenztypen speichern **Verweise** auf Objekte.

```java
String   text    = "Hallo";
int[]    zahlen  = {1, 2, 3};
Scanner  scanner = new Scanner(System.in);
```

**Vergleich:**

```java
String a = "Java";
String b = "Java";
System.out.println(a == b);       // meist true (String-Pool), nicht garantiert
System.out.println(a.equals(b));  // true (sicherer Inhaltsvergleich)
```

**Null:**

```java
String text = null;
// text.length();   // NullPointerException
```

---

## 16. Lernaufgaben und Übungen

### Übung 1 – Primitive Größen merken

Erstellen Sie eine Klasse `DatentypTabelle` mit `main`, die alle acht primitiven Datentypen, ihre Größe in Bit und ihren Wertebereich in einer Tabelle ausgibt. Verwenden Sie `System.out.printf("%-8s %3d Bit %25s%n", …)`.

### Übung 2 – Temperaturumrechner

Schreiben Sie ein Programm, das Celsius in Fahrenheit umrechnet und das Ergebnis mit **zwei Nachkommastellen** formatiert ausgibt.

```java
double celsius = 25.0;
double fahrenheit = celsius * 9.0 / 5.0 + 32.0;
System.out.printf("%.2f °C = %.2f °F%n", celsius, fahrenheit);
```

### Übung 3 – Restwert-Spielerei

Berechnen Sie mit `int` die Reste von `7 % 3`, `-7 % 3`, `7 % -3`, `-7 % -3` und erklären Sie die Vorzeichenregel.

### Übung 4 – Gleitkomma-Vergleich

Vergleichen Sie `0.1 + 0.2 == 0.3` exakt und mit einem Epsilon `1e-12`. Erklären Sie das Verhalten.

### Übung 5 – Type-Casting

```java
int   i  = 130;
byte  b  = (byte) i;
char  c  = (char) i;
System.out.println(b);   // ?
System.out.println(c);   // ?
```

Welche Werte erscheinen auf der Konsole? Warum?

### Übung 6 – Wrapper-Fallstricke

```java
Integer a = 200;
Integer b = 200;

if (a == b) System.out.println("gleich");
else        System.out.println("ungleich");

a = 100; b = 100;
if (a == b) System.out.println("gleich");
else        System.out.println("ungleich");
```

Welche Ausgabe entsteht? Warum unterscheiden sich die Ergebnisse?

### Übung 7 – Logische Kurzschlussauswertung

```java
int[] arr = null;
if (arr != null && arr.length > 0) { … }
```

Erklären Sie, warum ohne Kurzschlussauswertung eine `NullPointerException` auftreten würde.

### Übung 8 – Eingabevalidierung

Lesen Sie über `Scanner` eine ganze Zahl ein und geben Sie eine sprechende Fehlermeldung aus, wenn die Eingabe kein gültiger Integer ist.

```java
try {
    int n = Integer.parseInt(scanner.nextLine().trim());
    System.out.println("Eingegeben: " + n);
} catch (NumberFormatException e) {
    System.out.println("Bitte eine gültige Ganzzahl eingeben.");
}
```

### Übung 9 – BigDecimal-Geld

Berechnen Sie die Mehrwertsteuer und den Bruttobetrag für einen Nettobetrag von `19.99 €` mit `BigDecimal`. Vergleichen Sie das Ergebnis mit der `double`-Variante.

### Übung 10 – Bitmasken

Setzen Sie in einem `int status` mit Bitmasken (`0x01`, `0x02`, `0x04`) die Flags *aktiv*, *sichtbar*, *admin*. Prüfen Sie anschließend, ob *admin* gesetzt ist.

---

## 17. Quellen, Bildnachweise und Vertiefung

### Bildnachweise

- IEEE-754-Single-Diagramm: <https://commons.wikimedia.org/wiki/File:IEEE_754_Single_Floating_Point_Format.svg>
- UTF-16-Kodierung: <https://commons.wikimedia.org/wiki/File:UTF-16_encoding.svg>
- Zweierkomplement-Wrap-Around: <https://commons.wikimedia.org/wiki/File:8-bit-signed-integer-wrap-around.png>
- Java Development Path: <https://commons.wikimedia.org/wiki/File:Java_Development_Path.svg>
- OpenJDK-Logo: <https://commons.wikimedia.org/wiki/File:OpenJDK_logo.svg>

### Deutsche Lehrquellen

- Java ist auch eine Insel – Datentypen: <http://dev.cs.ovgu.de/java/Books/javainsel3/javainsel_020003.htm>
- Java ist auch eine Insel – Operatoren: <http://dev.usw.at/manual/java/javainsel/javainsel_02_003.htm>
- Wikibooks Java Standard – Primitive Datentypen: <https://de.wikibooks.org/wiki/Java_Standard:_Primitive_Datentypen>

### Englische Originalquellen

- Java Language Specification, Java SE 21: <https://docs.oracle.com/javase/specs/jls/se21/html/>
- Oracle Tutorial – Primitive Data Types: <https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html>
- Oracle Tutorial – Operators: <https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html>
- Oracle Tutorial – Autoboxing/Unboxing: <https://docs.oracle.com/javase/tutorial/java/data/autoboxing.html>

### Vertiefung

- IEEE 754 auf Wikipedia: <https://de.wikipedia.org/wiki/IEEE_754>
- Unicode-Standard: <https://home.unicode.org/>
- Princeton – Floating Point in Java: <https://introcs.cs.princeton.edu/java/91float/>

---

## 18. Zusammenfassung und Checkliste

### Die acht primitiven Typen

- Ganzzahl: `byte`, `short`, `int`, `long`
- Gleitkomma: `float`, `double`
- Sonstige: `boolean`, `char`

### Zentrale Regeln

1. Verwenden Sie `int` für normale Ganzzahlen, `long` für große Werte.
2. Verwenden Sie `double` für allgemeine Gleitkommarechnungen, `BigDecimal` für Geld.
3. Initialisieren Sie lokale Variablen immer bewusst.
4. Vergleichen Sie Inhalte von Objekten (auch Strings) immer mit `equals()`.
5. Vermeiden Sie Auto-Boxing in heißen Schleifen.
6. Verwenden Sie `BigDecimal` für exakte Dezimalrechnungen.
7. Achten Sie auf Bereichsüberschreitungen – `Math.addExact` etc. helfen.
8. Behandeln Sie `NumberFormatException` bei Benutzereingaben.
9. Verwenden Sie für Wahrheitswerte ausschließlich `boolean`, nie Zahlen.
10. Schreiben Sie `long`-Literale mit großem `L`-Suffix.

### Selbsttest – Checkliste

- [ ] Ich kann alle acht primitiven Typen mit Größe und Bereich benennen.
- [ ] Ich weiß, wann `int` zu `long` erweitert wird.
- [ ] Ich kenne den Unterschied zwischen `==` und `equals()`.
- [ ] Ich kann IEEE-754-Rundungsfehler erklären und mit Epsilon vergleichen.
- [ ] Ich verstehe Auto-Boxing, Unboxing und ihre Fallstricke.
- [ ] Ich kann sichere Konvertierungen zwischen Strings und Zahlen durchführen.

---

*Stand: Java 21 LTS — Quelle: https://moodle.oszimt.de/course/view.php?id=1922 — Recherche 2026*
