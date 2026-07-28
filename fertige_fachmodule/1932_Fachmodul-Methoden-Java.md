# Fachmodul: Methoden (Java)

**Kurs-ID:** 1932
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1932
**Bezugsstand:** Java 21 LTS

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist eine Methode?](#2-was-ist-eine-methode)
3. [Methodensignatur](#3-methodensignatur)
4. [Parameterübergabe: Call by Value](#4-parameterübergabe-call-by-value)
5. [Methodenüberladung (Overloading)](#5-methodenüberladung-overloading)
6. [Variable Argumentlisten: varargs](#6-variable-argumentlisten-varargs)
7. [Rekursion und Iteration](#7-rekursion-und-iteration)
8. [Statische Methoden und Instanzmethoden](#8-statische-methoden-und-instanzmethoden)
9. [Getter, Setter und Kapselung](#9-getter-setter-und-kapselung)
10. [Konstruktoren](#10-konstruktoren)
11. [this und super](#11-this-und-super)
12. [toString, equals, hashCode](#12-tostring-equals-hashcode)
13. [Die main-Methode und Kommandozeilenargumente](#13-die-main-methode-und-kommandozeilenargumente)
14. [Methoden im UML-Klassendiagramm](#14-methoden-im-uml-klassendiagramm)
15. [Vollständiges Beispiel](#15-vollständiges-beispiel)
16. [Lernaufgaben und Übungen](#16-lernaufgaben-und-übungen)
17. [Quellen und Bildnachweise](#17-quellen-und-bildnachweise)
18. [Zusammenfassung](#18-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Java-Methoden definieren, aufrufen und mit Javadoc dokumentieren,
- Methodensignaturen korrekt bestimmen und vom Rückgabetyp abgrenzen,
- Parameter und Rückgabewerte einsetzen,
- die Java-Parameterübergabe als **Call by Value** erklären und an Beispielen demonstrieren,
- Methoden überladen (Overloading) und von überschriebenen Methoden (Overriding) unterscheiden,
- variable Argumentlisten mit `varargs` einsetzen,
- rekursive und iterative Lösungen vergleichen,
- statische Methoden und Instanzmethoden unterscheiden,
- Klassen über Getter, Setter und Konstruktoren kapseln,
- die Verträge von `equals()`, `hashCode()` und `toString()` einhalten,
- die `main`-Methode und Kommandozeilenargumente verwenden,
- Methoden in UML-Klassendiagrammen darstellen und beurteilen.

---

## 2. Was ist eine Methode?

Eine Methode ist ein benannter, wiederverwendbarer Programmabschnitt innerhalb einer Klasse. Sie beschreibt in der Regel ein Verhalten oder eine Operation. In anderen Sprachen wird oft der Begriff „Funktion“ verwendet – in Java spricht man von **Methoden**, weil jede Methode zu einer Klasse gehört. Eine vollständig unabhängige Funktion außerhalb einer Klasse existiert in Java nicht.

Eine Methode kann:

- Eingabewerte über Parameter erhalten,
- Anweisungen ausführen,
- einen Wert zurückgeben,
- den Zustand eines Objekts verändern,
- andere Methoden aufrufen,
- Ausnahmen auslösen.

### 2.1 Grundaufbau

```java
[ Sichtbarkeit ] [ weitere Modifikatoren ]
Rückgabetyp methodenName(Parameterliste) {
    // Methodenrumpf
}
```

```java
public int addiere(int a, int b) {
    return a + b;
}
```

| Bestandteil | Beispiel | Bedeutung |
|---|---|---|
| Sichtbarkeit | `public` | legt fest, von wo aus die Methode zugreifbar ist |
| Modifikator | `static` | Methode gehört zur Klasse statt zu einem Objekt |
| Rückgabetyp | `int` | Datentyp des Ergebnisses |
| Methodenname | `addiere` | Bezeichner der Methode |
| Parameter | `int a, int b` | Eingaben der Methode |
| Methodenrumpf | `{ return a + b; }` | auszuführende Anweisungen |

Eine Methode ohne Rückgabewert verwendet den Rückgabetyp `void`:

```java
public void begruesse(String name) {
    System.out.println("Hallo " + name);
}
```

Eine `void`-Methode kann mit `return;` vorzeitig beendet werden:

```java
public void pruefeAlter(int alter) {
    if (alter < 0) {
        return;
    }
    System.out.println("Alter: " + alter);
}
```

### 2.2 Parameter und Argumente

Ein **Parameter** ist die Variable in der Methodendefinition, ein **Argument** der konkrete Wert beim Aufruf.

```java
public int quadriere(int zahl) { // zahl = Parameter
    return zahl * zahl;
}

int ergebnis = quadriere(7);     // 7 = Argument
```

### 2.3 EVA-Prinzip

Methoden spiegeln das EVA-Prinzip (**E**ingabe – **V**erarbeitung – **A**usgabe) wider:

```java
public class Addition {
    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        // 1. Eingabe
        System.out.print("1. Zahl: ");
        double zahl1 = sc.nextDouble();
        System.out.print("2. Zahl: ");
        double zahl2 = sc.nextDouble();

        // 2. Verarbeitung
        double erg = addiere(zahl1, zahl2);

        // 3. Ausgabe
        System.out.printf("%.2f + %.2f = %.2f%n", zahl1, zahl2, erg);
    }

    public static double addiere(double a, double b) {
        return a + b;
    }
}
```

---

## 3. Methodensignatur

Die Java-Methodensignatur besteht aus:

1. dem Namen der Methode,
2. der Anzahl,
3. den Typen,
4. der Reihenfolge der Parameter.

Der Rückgabetyp gehört in Java **nicht** zur Signatur. Auch Parameternamen sind nicht Bestandteil der Signatur.

```java
public double berechne(double breite, int faktor) {
    return breite * faktor;
}
// Signatur: berechne(double, int)
```

Diese beiden Deklarationen sind daher nicht erlaubt:

```java
public int    wert() { return 1; }
public double wert() { return 1.0; }  // Fehler: gleiche Signatur
```

Auch `public`/`private` und `static` unterscheiden die Signatur beim Überladen nicht.

### 3.1 Sichtbarkeiten

| Modifikator | Zugriff |
|---|---|
| `public` | aus allen Klassen |
| `protected` | innerhalb desselben Pakets **und** in Unterklassen |
| kein Modifikator | nur innerhalb desselben Pakets (Package-Private) |
| `private` | nur innerhalb der deklarierenden Klasse |

```java
public class Konto {
    private double kontostand;

    public double getKontostand() { return kontostand; }

    protected void interneBuchung(double betrag) {
        kontostand += betrag;
    }

    void pruefeKonto() {
        System.out.println("Paketinterne Prüfung");
    }

    private void protokolliere() {
        System.out.println("Interne Protokollierung");
    }
}
```

> **Grundregel:** Attribute möglichst `private`. Methoden nur so sichtbar, wie es die öffentliche Schnittstelle tatsächlich erfordert.

### 3.2 Methodennamen

Java verwendet **lowerCamelCase**:

```java
berechnePreis()
leseDatei()
pruefeEingabe()
```

Methoden sollten Verben oder Verbgruppen verwenden, weil sie Aktionen beschreiben: `speichern()`, `loeschen()`, `isAktiv()`, `hatBerechtigung()`, `getName()`, `setName(String)`.

---

## 4. Parameterübergabe: Call by Value

Java verwendet ausschließlich **Call by Value**: Beim Aufruf wird der Wert eines Arguments in den Methodenparameter kopiert – sowohl bei primitiven Datentypen als auch bei Referenztypen.

### 4.1 Primitive Datentypen

```java
public static void erhoehe(int wert) {
    wert++;
}

public static void main(String[] args) {
    int zahl = 10;
    erhoehe(zahl);
    System.out.println(zahl); // 10 – Wert wurde kopiert
}
```

### 4.2 Referenztypen

```java
class Person {
    String name;
}

public class Beispiel {
    public static void aendereName(Person person) {
        person.name = "Maria";
    }

    public static void main(String[] args) {
        Person p = new Person();
        p.name = "Anna";
        aendereName(p);
        System.out.println(p.name); // Maria
    }
}
```

Die Referenz wurde kopiert, aber beide Referenzen zeigen auf dasselbe Objekt. Eine Neuzuweisung des Parameters verändert jedoch nicht die Variable beim Aufrufer:

```java
public static void ersetzePerson(Person person) {
    person = new Person();      // nur lokale Kopie zeigt nun auf neu
    person.name = "Neu";
}

public static void main(String[] args) {
    Person p = new Person();
    p.name = "Alt";
    ersetzePerson(p);
    System.out.println(p.name); // Alt
}
```

### 4.3 Austausch zweier Variablen

```java
public static int[] tausche(int a, int b) {
    return new int[] { b, a };
}
```

Call by Reference gibt es in Java **nicht**.

---

## 5. Methodenüberladung (Overloading)

Beim **Overloading** besitzen mehrere Methoden denselben Namen, aber unterschiedliche Parameterlisten.

```java
public class Rechner {
    public int    addiere(int a, int b)         { return a + b; }
    public double addiere(double a, double b)   { return a + b; }
    public int    addiere(int a, int b, int c)  { return a + b + c; }
}
```

Der Compiler entscheidet anhand der Argumente, welche Methode aufgerufen wird.

### 5.1 Zulässige Unterschiede

Methoden dürfen sich unterscheiden durch:

- Anzahl der Parameter,
- Typen der Parameter,
- Reihenfolge der Parametertypen.

**Nicht** ausreichend sind:

- nur unterschiedliche Parameternamen,
- nur unterschiedliche Rückgabetypen,
- nur unterschiedliche Sichtbarkeit,
- nur Hinzufügen oder Entfernen von `static`.

### 5.2 Overloading vs. Overriding

| Merkmal | Overloading | Overriding |
|---|---|---|
| Deutsch | Überladen | Überschreiben |
| Klassen | meist gleiche Klasse | Unterklasse erbt Methode |
| Signatur | muss unterschiedlich sein | bleibt gleich |
| Entscheidung | Compile-Zeit | Laufzeit |
| Zweck | mehrere Eingabevarianten | polymorphes Verhalten |

```java
class Tier {
    public void lautGeben() {
        System.out.println("Geräusch");
    }
}

class Hund extends Tier {
    @Override
    public void lautGeben() {
        System.out.println("Wuff");
    }
}
```

---

## 6. Variable Argumentlisten: varargs

Mit `varargs` kann eine Methode eine beliebige Anzahl von Argumenten desselben Typs akzeptieren:

```java
public static int summe(int... zahlen) {
    int ergebnis = 0;
    for (int zahl : zahlen) {
        ergebnis += zahl;
    }
    return ergebnis;
}

summe();             // 0
summe(1);            // 1
summe(1, 2, 3);      // 6
```

Intern behandelt Java `int... zahlen` wie ein `int[]`.

### 6.1 Regeln

1. Pro Methode höchstens **ein** `varargs`-Parameter.
2. Der `varargs`-Parameter muss der letzte Parameter sein.
3. Null Argumente sind zulässig.
4. Ein Array kann direkt übergeben werden.

```java
public static void protokolliere(String titel, String... nachrichten) {
    System.out.println(titel);
    for (String n : nachrichten) {
        System.out.println("- " + n);
    }
}
```

### 6.2 varargs und Überladung

`varargs` sollte nicht mit ähnlichen Überladungen kombiniert werden:

```java
void ausgabe(int wert) { System.out.println("Ein Wert"); }
void ausgabe(int... werte) { System.out.println("Mehrere Werte"); }
```

Bei `ausgabe(5)` wird die exakte Methode bevorzugt.

---

## 7. Rekursion und Iteration

### 7.1 Iteration

Iteration wiederholt Anweisungen per Schleife (`for`, `while`, `do-while`):

```java
public static int fakultaetIterativ(int n) {
    int ergebnis = 1;
    for (int i = 2; i <= n; i++) {
        ergebnis *= i;
    }
    return ergebnis;
}
```

### 7.2 Rekursion

Eine Methode ruft sich selbst auf – mit Basisfall und rekursivem Fall:

```java
public static int fakultaetRekursiv(int n) {
    if (n <= 1) return 1;       // Basisfall
    return n * fakultaetRekursiv(n - 1);
}
```

Aufrufablauf für `fakultaetRekursiv(4)`:

```text
4 * fakultaet(3)
4 * 3 * fakultaet(2)
4 * 3 * 2 * fakultaet(1)
4 * 3 * 2 * 1
24
```

### 7.3 Vergleich

| Kriterium | Rekursion | Iteration |
|---|---|---|
| Wiederholung | Selbstaufruf | Schleife |
| Speicherbedarf | zusätzlicher Stack | meist gering |
| Verständlichkeit | bei Bäumen oft sehr gut | bei einfachen Zählproblemen gut |
| Geschwindigkeit | oft etwas langsamer | meist effizienter |
| Risiko | `StackOverflowError` | Endlosschleife |
| Geeignet für | Bäume, Verzeichnisse, Divide-and-Conquer | Zählen, Suchen, lineare Verarbeitung |

Fibonacci – naiv rekursiv vs. iterativ:

```java
// Naive Rekursion: viele Mehrfachberechnungen
public static int fib(int n) {
    if (n <= 1) return n;
    return fib(n - 1) + fib(n - 2);
}

// Iterativ: deutlich effizienter
public static int fibIterativ(int n) {
    if (n <= 1) return n;
    int a = 0, b = 1;
    for (int i = 2; i <= n; i++) {
        int temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}
```

---

## 8. Statische Methoden und Instanzmethoden

### 8.1 Statische Methoden

```java
public class Mathematik {
    public static int maximum(int a, int b) {
        return a > b ? a : b;
    }
}

int groesser = Mathematik.maximum(8, 13);
```

Statische Methoden können direkt aufrufen:

- andere statische Methoden,
- statische Attribute,
- lokale Variablen und Parameter.

Sie können **nicht** ohne Objekt direkt auf Instanzattribute oder Instanzmethoden zugreifen:

```java
class Beispiel {
    private int wert;
    public static void anzeigen() {
        // System.out.println(wert); // Fehler
    }
}
```

### 8.2 Instanzmethoden

```java
public class Konto {
    private double kontostand;

    public void einzahlen(double betrag) {
        kontostand += betrag;
    }

    public double getKontostand() {
        return kontostand;
    }
}

Konto konto = new Konto();
konto.einzahlen(100.0);
System.out.println(konto.getKontostand());
```

### 8.3 Vergleich

| Aspekt | `static` | Instanzmethode |
|---|---|---|
| Zugehörigkeit | Klasse | Objekt |
| Objekt nötig? | Nein | Ja |
| Zugriff auf `this` | Nein | Ja |
| Zugriff auf Instanzfelder | nicht direkt | Ja |
| Typische Nutzung | Hilfsfunktionen, Fabrikmethoden | Objektverhalten |
| Aufruf | `Klasse.methode()` | `objekt.methode()` |

> Eine Methode sollte nicht nur deshalb statisch sein, weil sie momentan kein Instanzfeld nutzt. Die Entscheidung sollte das fachliche Modell berücksichtigen.

---

## 9. Getter, Setter und Kapselung

Kapselung schützt den internen Zustand einer Klasse:

```java
// Schlechtes Design
public class Mitarbeiter {
    public String name;
    public double gehalt;
}

// Besser
public class Mitarbeiter {
    private String name;
    private double gehalt;

    public Mitarbeiter(String name, double gehalt) {
        setName(name);
        setGehalt(gehalt);
    }

    public String getName() { return name; }

    public void setName(String name) {
        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException("Name darf nicht leer sein");
        }
        this.name = name;
    }

    public double getGehalt() { return gehalt; }

    public void setGehalt(double gehalt) {
        if (gehalt < 0) {
            throw new IllegalArgumentException("Gehalt darf nicht negativ sein");
        }
        this.gehalt = gehalt;
    }
}
```

Bei Listen ist eine **Kopie** oder **unveränderliche Sicht** sinnvoll:

```java
public List<String> getNamen() {
    return List.copyOf(namen);
}
```

---

## 10. Konstruktoren

Ein Konstruktor initialisiert ein neues Objekt. Er hat:

- denselben Namen wie die Klasse,
- keinen Rückgabetyp (auch nicht `void`),
- eine Parameterliste,
- einen Methodenrumpf.

```java
public class Rechteck {
    private double breite;
    private double hoehe;

    public Rechteck(double breite, double hoehe) {
        this.breite = breite;
        this.hoehe = hoehe;
    }
}

Rechteck r = new Rechteck(4.0, 5.0);
```

### 10.1 Parameterloser Konstruktor

```java
public Rechteck() {
    this(1.0, 1.0);
}
```

Wenn eine Klasse **keinen** Konstruktor definiert, erzeugt der Compiler automatisch einen parameterlosen Standardkonstruktor. Sobald ein eigener Konstruktor definiert wird, entfällt der automatische Konstruktor.

### 10.2 Konstruktorverkettung mit `this()`

`this(...)` ruft einen anderen Konstruktor derselben Klasse auf:

```java
public class Benutzer {
    private String name;
    private String rolle;

    public Benutzer()                { this("Unbekannt", "Gast"); }
    public Benutzer(String name)     { this(name, "Gast"); }
    public Benutzer(String name, String rolle) {
        this.name  = name;
        this.rolle = rolle;
    }
}
```

`this(...)` muss **erste** Anweisung des Konstruktors sein.

### 10.3 Oberklassenkonstruktor mit `super()`

```java
class Fahrzeug {
    protected String marke;
    public Fahrzeug(String marke) {
        this.marke = marke;
    }
}

class Auto extends Fahrzeug {
    private int tueren;
    public Auto(String marke, int tueren) {
        super(marke);
        this.tueren = tueren;
    }
}
```

Wenn kein expliziter `super(...)`-Aufruf erfolgt, fügt der Compiler `super()` als erste Anweisung ein – sofern die Oberklasse einen parameterlosen Konstruktor besitzt.

---

## 11. this und super

`this` bezeichnet das aktuelle Objekt:

```java
public class Punkt {
    private int x;
    public Punkt(int x) {
        this.x = x; // Attribut = Parameter
    }
}
```

`this` kann außerdem verwendet werden für:

```java
this.methode();
this(); // Konstruktorverkettung
```

`super` verweist auf die Oberklasse:

```java
class Tier {
    public void lautGeben() {
        System.out.println("Tiergeräusch");
    }
}

class Katze extends Tier {
    @Override
    public void lautGeben() {
        super.lautGeben();
        System.out.println("Miau");
    }
}
```

---

## 12. toString, equals, hashCode

Alle drei Methoden stammen aus `java.lang.Object`.

### 12.1 toString

Liefert eine textuelle Darstellung. Ohne Überschreibung erscheint etwas wie:

```text
Person@5e2de80c
```

Eine sinnvolle Implementierung:

```java
@Override
public String toString() {
    return "Person{name='" + name + "', alter=" + alter + "}";
}
```

> **Hinweis:** Keine sensiblen Informationen wie Passwörter oder Tokens ausgeben!

### 12.2 equals

Beschreibt inhaltliche Gleichheit. `==` vergleicht bei Objekten Referenzen.

```java
String a = new String("Java");
String b = new String("Java");

System.out.println(a == b);       // false
System.out.println(a.equals(b));  // true
```

Ein robustes Muster mit `instanceof` Pattern Matching (ab Java 16):

```java
import java.util.Objects;

public class Person {
    private final String id;
    private final String name;

    public Person(String id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Person other)) return false;
        return Objects.equals(id, other.id)
            && Objects.equals(name, other.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }

    @Override
    public String toString() {
        return "Person{id='%s', name='%s'}".formatted(id, name);
    }
}
```

### 12.3 equals-Vertrag

`equals()` muss:

- **reflexiv** sein: `x.equals(x)` ist wahr,
- **symmetrisch** sein: `x.equals(y)` gdw. `y.equals(x)`,
- **transitiv** sein: aus `x.equals(y)` und `y.equals(z)` folgt `x.equals(z)`,
- **konsistent** sein: wiederholte Aufrufe liefern dasselbe Ergebnis,
- für `null`: `x.equals(null)` ist falsch.

### 12.4 hashCode-Vertrag

> Wenn `a.equals(b)` wahr ist, muss `a.hashCode() == b.hashCode()` gelten.

Wer `equals()` überschreibt, muss auch `hashCode()` überschreiben – sonst funktionieren Objekte in `HashSet` und `HashMap` möglicherweise nicht korrekt.

---

## 13. Die main-Methode und Kommandozeilenargumente

Die typische Einstiegsmethode:

```java
public static void main(String[] args) {
    System.out.println("Programmstart");
}
```

| Bestandteil | Bedeutung |
|---|---|
| `public` | JVM muss die Methode aufrufen können |
| `static` | kein Objekt zur Ausführung erforderlich |
| `void` | kein Rückgabewert |
| `main` | reservierter Einstiegspunkt |
| `String[] args` | Array für Kommandozeilenargumente |

Auch folgende Schreibweise ist zulässig:

```java
public static void main(String... args) { }
```

### 13.1 Kommandozeilenargumente

```java
public class Begruessung {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Kein Name angegeben.");
            return;
        }
        System.out.println("Hallo, " + args[0] + "!");
    }
}
```

```bash
javac Begruessung.java
java Begruessung Alice
# Hallo, Alice!
```

Robuste Programme prüfen:

- Anzahl der Argumente,
- erlaubte Wertebereiche,
- Datentypen (Parsing),
- fehlende oder leere Eingaben,
- mögliche `NumberFormatException`.

---

## 14. Methoden im UML-Klassendiagramm

Eine Methode wird in UML so notiert:

```text
sichtbarkeit methodenname(parameter: Typ): Rückgabetyp
```

Beispiele:

```text
+ addiere(a: int, b: int): int
- validiere(): boolean
# interneBuchung(betrag: double): void
```

| UML-Symbol | Java |
|---|---|
| `+` | `public` |
| `-` | `private` |
| `#` | `protected` |
| `~` | package-private |

Statische Methoden werden häufig **unterstrichen** dargestellt:

```text
+ maximum(a: int, b: int): int
```

Beispiel als vereinfachte Darstellung:

```text
+----------------------------+
| Rechner                    |
+----------------------------+
|                            |
+----------------------------+
| + addiere(a: int, b: int): int |
| + maximum(a: int, b: int): int |
+----------------------------+
```

![UML Klassendiagramm Beispiel](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/UML_klassendiagramm.png/640px-UML_klassendiagramm.png)

---

## 15. Vollständiges Beispiel

```java
import java.util.Objects;

public class Produkt {
    private final String artikelnummer;
    private String name;
    private double preis;

    public Produkt(String artikelnummer, String name, double preis) {
        if (artikelnummer == null || artikelnummer.isBlank()) {
            throw new IllegalArgumentException(
                "Artikelnummer darf nicht leer sein");
        }
        this.artikelnummer = artikelnummer;
        setName(name);
        setPreis(preis);
    }

    public String getArtikelnummer() { return artikelnummer; }
    public String getName()          { return name; }

    public void setName(String name) {
        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException(
                "Name darf nicht leer sein");
        }
        this.name = name;
    }

    public double getPreis() { return preis; }

    public void setPreis(double preis) {
        if (preis < 0) {
            throw new IllegalArgumentException(
                "Preis darf nicht negativ sein");
        }
        this.preis = preis;
    }

    public double preisFuerMenge(int menge) {
        if (menge < 0) {
            throw new IllegalArgumentException(
                "Menge darf nicht negativ sein");
        }
        return preis * menge;
    }

    public static double addierePreise(Produkt... produkte) {
        double summe = 0;
        for (Produkt produkt : produkte) {
            if (produkt != null) {
                summe += produkt.preis;
            }
        }
        return summe;
    }

    @Override
    public String toString() {
        return "Produkt{artikelnummer='%s', name='%s', preis=%.2f}"
            .formatted(artikelnummer, name, preis);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Produkt other)) return false;
        return Objects.equals(artikelnummer, other.artikelnummer);
    }

    @Override
    public int hashCode() {
        return Objects.hash(artikelnummer);
    }

    public static void main(String[] args) {
        Produkt tastatur = new Produkt("T-100", "Tastatur", 49.99);
        Produkt maus     = new Produkt("M-200", "Maus",     29.99);

        System.out.println(tastatur);
        System.out.println(tastatur.preisFuerMenge(3));
        System.out.println(addierePreise(tastatur, maus));
    }
}
```

---

## 16. Lernaufgaben und Übungen

### Übung 1 – Mittelwert

Erstellen Sie eine Klasse `Mittelwert` mit einer Methode `public static double mittelwert(int... werte)`, die das arithmetische Mittel berechnet. Behandeln Sie den leeren Fall mit einer `IllegalArgumentException`.

### Übung 2 – Quadrieren

Schreiben Sie eine Methode `quadriere(int x)` und ein Hauptprogramm, das für alle Zahlen von 1 bis 10 das Quadrat ausgibt.

### Übung 3 – PC-Händler

Ein PC-Händler verkauft Rechner zum Stückpreis von 899 €. Erstellen Sie eine Klasse `PCHaendler` mit einer Methode `gesamtPreis(int anzahl)`, die den Gesamtpreis abhängig von der Anzahl berechnet – mit Mengenrabatt (z. B. ab 5 Stück 5 %, ab 10 Stück 10 %).

### Übung 4 – Methodendefinitionen erkennen

Markieren Sie in folgendem Code:

```java
public static int addiere(int a, int b) { return a + b; }
```

alle Bestandteile: Methodenaufruf, Methodenbezeichner, Methodenkopf, Methodenrumpf, Argument, Parameter, Rückgabetyp, Rückgabewert, Zugriffsmodifizierer.

### Übung 5 – Tausch mit Rückgabe

Schreiben Sie eine Methode `public static int[] tausche(int a, int b)`, die zwei Werte als Array zurückgibt. Schreiben Sie ein Hauptprogramm, das damit zwei Variablen tauscht.

### Übung 6 – Konstruktorverkettung

Erstellen Sie eine Klasse `Rechteck` mit drei Konstruktoren: ohne Parameter (1.0/1.0), mit `breite` (quadratisch) und mit `breite`/`hoehe`. Verwenden Sie `this(...)`.

### Übung 7 – equals und hashCode

Schreiben Sie eine Klasse `Student` mit Attributen `matrikelnummer` und `name`. Implementieren Sie `equals()`, `hashCode()` und `toString()`. Testen Sie mit einem `HashSet<Student>`.

### Übung 8 – Rekursion vs. Iteration

Vergleichen Sie `fib(n)` rekursiv und iterativ bezüglich Laufzeit für `n = 35`.

### Übung 9 – varargs

Erstellen Sie eine Methode `public static double mittelwert(double... werte)`. Testen Sie sie mit 0, 1, 5 und 10 Argumenten.

### Übung 10 – main mit Argumenten

Schreiben Sie ein Programm `Taschenrechner`, das per Kommandozeilenargumente zwei Zahlen und einen Operator (+, −, *, /) verarbeitet.

---

## 17. Quellen und Bildnachweise

### Bildnachweise

- UML-Klassendiagramm: <https://commons.wikimedia.org/wiki/Category:Class_diagrams>
- UML-Sammlung: <https://commons.wikimedia.org/wiki/Category:UML>

### Deutsche Lehrquellen

- Java ist auch eine Insel – Methoden: <https://www.javatutorial.org/> (Überblick)
- Javabeginners – Call by Value: <https://javabeginners.de/Grundlagen/Call_by_Value.php>
- Javabeginners – Konstruktoren: <https://javabeginners.de/Grundlagen/Konstruktor.php>
- Javabeginners – Accessor-Methoden: <https://javabeginners.de/Grundlagen/Accessor-Methoden.php>
- Informatikzentrale – Getter/Setter: <https://www.informatikzentrale.de/_files/16java/java13_getter_setter.pdf>
- Gailer-Net – Signaturen: <https://www.gailer-net.de/tutorials/java/Notes/chap52/ch52_2.html/>
- ScalingBits – Rekursion: <http://www.scalingbits.com/java/javakurs1/methoden/rekursion>
- Java-Tutorial – Iteration/Rekursion: <https://www.java-tutorial.org/iteration_und_rekursion.html>
- DHBW Köln – Objekte: <https://dh-cologne.github.io/java-wegweiser/articles/Objekte-II-Repraesentation-Identitaet-Gleichheit.html>

### Englische Originalquellen

- Oracle Java API – `Object`: <https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html>
- Baeldung – `equals()`/`hashCode()`: <https://www.baeldung.com/java-equals-hashcode-contracts>
- IBM – UML Class Diagram: <https://developer.ibm.com/articles/the-class-diagram/>
- W3Schools – Command-Line Arguments: <https://w3schools.tech/de/tutorial/java/java-command-line-args>

---

## 18. Zusammenfassung

Methoden sind das zentrale Mittel zur Strukturierung von Java-Programmen. Sie kapseln Verhalten, fördern Wiederverwendung und bilden die Grundlage objektorientierter Modellierung.

### 15 zentrale Merksätze

1. Eine Java-Methode besteht aus Modifikatoren, Rückgabetyp, Namen, Parametern und Methodenrumpf.
2. Die Signatur umfasst Methodenname und Parametertypen – **nicht** den Rückgabetyp.
3. Java verwendet **immer** Call by Value.
4. Bei Objekten wird der Wert der Referenz kopiert.
5. **Overloading** = gleicher Name, unterschiedliche Parameterliste.
6. Der Rückgabetyp allein reicht nicht zum Überladen.
7. `varargs` wird intern als Array behandelt und muss am Ende der Parameterliste stehen.
8. Rekursion benötigt zwingend einen Basisfall.
9. Statische Methoden gehören zur Klasse; Instanzmethoden zu Objekten.
10. Getter und Setter ermöglichen kontrollierten Zugriff auf private Attribute.
11. `this()` ruft einen Konstruktor derselben Klasse auf.
12. `super()` ruft einen Konstruktor der Oberklasse auf.
13. Wer `equals()` überschreibt, **muss** auch `hashCode()` überschreiben.
14. `toString()` sollte eine kurze, nützliche und sichere Textdarstellung liefern.
15. `main(String[] args)` ist der klassische Einstiegspunkt einer Java-Anwendung.

### Selbsttest-Checkliste

- [ ] Ich kann eine Methode definieren und aufrufen.
- [ ] Ich kenne den Unterschied zwischen Parameter und Argument.
- [ ] Ich verstehe, warum Java Call by Value verwendet.
- [ ] Ich kann Methoden überladen und weiß, wann es erlaubt ist.
- [ ] Ich kann `varargs` einsetzen und die Regeln benennen.
- [ ] Ich kenne die Verträge von `equals()`, `hashCode()`, `toString()`.
- [ ] Ich kann Getter/Setter und Konstruktoren korrekt einsetzen.
- [ ] Ich kann die `main`-Methode und Kommandozeilenargumente erklären.
- [ ] Ich kann Methoden in UML-Klassendiagrammen darstellen.

---

*Stand: Java 21 LTS — Quelle: https://moodle.oszimt.de/course/view.php?id=1932 — Recherche 2026*
