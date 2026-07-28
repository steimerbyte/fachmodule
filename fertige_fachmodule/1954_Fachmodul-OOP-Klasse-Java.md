# Fachmodul: OOP Klassen (Java)

**Kurs-ID:** 1954
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1954
**Bezugsstand:** Java 21 LTS

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Klasse vs. Objekt — Der Bauplan und die Instanzen](#2-klasse-vs-objekt--der-bauplan-und-die-instanzen)
3. [Attribute (Felder), Methoden, Konstruktoren](#3-attribute-felder-methoden-konstruktoren)
4. [Sichtbarkeit — public, private, protected, default](#4-sichtbarkeit--public-private-protected-default)
5. [Getter/Setter und Datenkapselung (Encapsulation)](#5-gettersetter-und-datenkapselung-encapsulation)
6. [Die this-Referenz](#6-die-this-referenz)
7. [Statische vs. Instanz-Member](#7-statische-vs-instanz-member)
8. [Beziehungen zwischen Klassen — UML und Java](#8-beziehungen-zwischen-klassen--uml-und-java)
9. [UML-Klassendiagramm ↔ Java-Code](#9-uml-klassendiagramm--java-code)
10. [Die main-Methode als Treiber](#10-die-main-methode-als-treiber)
11. [Verwaltungsmethoden: equals, hashCode, toString](#11-verwaltungsmethoden-equals-hashcode-tostring)
12. [Mehrere Klassen in einem Projekt](#12-mehrere-klassen-in-einem-projekt)
13. [Der new-Operator — Instanzerzeugung Schritt für Schritt](#13-der-new-operator--instanzerzeugung-schritt-für-schritt)
14. [Praxisbeispiel: Mini-Bibliothek](#14-praxisbeispiel-mini-bibliothek)
15. [Lernaufgaben](#15-lernaufgaben)
16. [Quellen und Bildnachweise](#16-quellen-und-bildnachweise)
17. [Zusammenfassung](#17-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

1. Den Unterschied zwischen **Klasse** und **Objekt** erklären und an Beispielen anwenden.
2. **Attribute**, **Methoden** und **Konstruktoren** sicher implementieren.
3. Mit **Sichtbarkeitsmodifizierern** (`public`, `private`, `protected`, default) korrekt umgehen.
4. **Datenkapselung** durch Getter/Setter umsetzen.
5. Die **`this`-Referenz** zielgerichtet einsetzen.
6. **Statische** und **Instanz**-Member unterscheiden.
7. Beziehungen zwischen Klassen (**Assoziation**, **Aggregation**, **Komposition**, **Dependency**) im UML zeichnen und in Java implementieren.
8. Java-Klassen-Code in **UML-Klassendiagramm** und umgekehrt überführen.
9. Die **`main`-Methode** verstehen und eigene kleine Treiber schreiben.
10. **`equals`**, **`hashCode`** und **`toString`** korrekt überschreiben.
11. Eine sinnvolle **Projekt-Verzeichnisstruktur** für mehrere Klassen anlegen.

---

## 2. Klasse vs. Objekt — Der Bauplan und die Instanzen

| Begriff | Bedeutung | Analogie |
|---|---|---|
| **Klasse** | Ein **Bauplan** / eine **Datenstrukturdefinition**. Beschreibt Attribute und Methoden, existiert nur im Code. | Bauplan eines Hauses |
| **Objekt** | Eine **konkrete Instanz** der Klasse, erzeugt zur Laufzeit im Heap. Hat eigene Attributwerte. | Das fertig gebaute Haus |
| **Instanz** | Synonym für „Objekt" | Ein konkret gebackener Kuchen |

> *"Die Klasse ist der Bauplan (die Definition), das Objekt ist die konkrete Instanz (die Umsetzung). Du hast eine Klasse `Hund`, aber viele Objekte: `Bello`, `Waldi`, `Hasso`."* (Study IT)

```java
public class Hund {
    String name;
    int    alter;

    void bellen() {
        System.out.println(name + " sagt: Wuff!");
    }
}

public class Main {
    public static void main(String[] args) {
        Hund bello = new Hund();
        bello.name = "Bello";
        bello.alter = 3;

        Hund waldi = new Hund();
        waldi.name = "Waldi";
        waldi.alter = 5;

        bello.bellen();   // "Bello sagt: Wuff!"
        waldi.bellen();   // "Waldi sagt: Wuff!"
    }
}
```

### 2.1 Was passiert im Speicher?

| Speicher | Inhalt |
|---|---|
| **Stack** | Referenzvariablen (`bello`, `waldi`) |
| **Heap** | Die tatsächlichen Objekte mit ihren Attributwerten |

> *"Die erzeugten Objekte liegen auf dem Heap, dem Freispeicher. Im Gegensatz zu Variablen können mehrere Referenzvariablen auf dasselbe Objekt verweisen."* (scalingbits.com)

---

## 3. Attribute (Felder), Methoden, Konstruktoren

### 3.1 Bestandteile einer Klasse

```java
public class Auto {
    // === Attribute ===
    private String marke;
    private int    baujahr;
    private double kilometerstand;

    // === Konstruktor ===
    public Auto(String marke, int baujahr) {
        this.marke = marke;
        this.baujahr = baujahr;
        this.kilometerstand = 0.0;
    }

    // === Methoden (Verhalten) ===
    public void fahren(double km) {
        this.kilometerstand += km;
    }

    public double getKilometerstand() {
        return kilometerstand;
    }
}
```

### 3.2 Attribute

Attribute speichern den **Zustand** eines Objekts.

- Werden **bei jeder Instanziierung** neu im Heap angelegt
- Existieren, solange das Objekt lebt (Garbage Collection)
- Können mit Anfangswerten vorbelegt werden

```java
public class Ampel {
    private String zustand = "rot";
    private int    phase;             // Default: 0
}
```

### 3.3 Methoden

Methoden definieren das **Verhalten** einer Klasse. Sie bestehen aus:

- **Modifier** (`public`, `private`, `static`, …)
- **Rückgabetyp** (oder `void`)
- **Methodenname** (Konvention: lowerCamelCase)
- **Parameterliste** (kann leer sein)
- **Methodenrumpf** (in geschweiften Klammern)

```java
public double berechneVerbrauch(double liter, double km) {
    return liter / km * 100;
}
```

### 3.4 Konstruktoren

**Konstruktoren** sind spezielle Methoden zum Initialisieren neuer Objekte. Sie tragen immer denselben Namen wie die Klasse und haben **keinen Rückgabetyp** (auch nicht `void`).

```java
public class Student {
    private String name;
    private int    matrikelnummer;

    public Student() {
        this.name = "unbekannt";
        this.matrikelnummer = 0;
    }

    public Student(String name, int matrikelnummer) {
        this.name = name;
        this.matrikelnummer = matrikelnummer;
    }
}
```

**Wichtige Regeln:**

- **Default-Konstruktor**: Existiert automatisch, wenn kein eigener Konstruktor definiert ist. Verschwindet, sobald ein eigener Konstruktor geschrieben wird.
- **Überladen**: Mehrere Konstruktoren mit unterschiedlichen Parameterlisten sind erlaubt.
- **`this()`-Aufruf**: Ein Konstruktor kann mit `this(...)` einen anderen Konstruktor der gleichen Klasse aufrufen (muss erste Anweisung sein).

**Konstruktor-Verkettung mit `this()`:**

```java
public class Kunde {
    private String  name;
    private String  email;
    private boolean newsletter;

    public Kunde() {
        this("unbekannt", "n/a", false);
    }

    public Kunde(String name) {
        this(name, "n/a", false);
    }

    public Kunde(String name, String email, boolean newsletter) {
        this.name = name;
        this.email = email;
        this.newsletter = newsletter;
    }
}
```

---

## 4. Sichtbarkeit — public, private, protected, default

### 4.1 Übersicht der Zugriffsmodifizierer

| Modifier | Gleiche Klasse | Gleiches Package | Subklasse (anderes Package) | Andere Packages |
|---|---|---|---|---|
| **`public`** | ja | ja | ja | ja |
| **`protected`** | ja | ja | ja | **nein** |
| **`default`** (package-private) | ja | ja | **nein** | **nein** |
| **`private`** | ja | **nein** | **nein** | **nein** |

### 4.2 Praxis-Empfehlungen

| Verwendung | Empfehlung |
|---|---|
| **Attribute** | immer `private` |
| **Konstruktoren** | `public`, wenn von außen instanziiert werden soll |
| **Getter/Setter** | `public` |
| **Hilfsmethoden** | `private` |
| **Methoden, die Subklassen benötigen** | `protected` |
| **Klassen auf oberster Ebene** | `public` |

```java
public class Konto {
    private double saldo;

    public double getSaldo() {
        return saldo;
    }

    protected void setSaldo(double saldo) {  // für Subklassen
        this.saldo = saldo;
    }

    void resetSaldo() {                      // nur für gleiches Package
        this.saldo = 0;
    }
}
```

### 4.3 UML-Notation der Sichtbarkeit

| UML-Symbol | Java-Modifier |
|---|---|
| `+` | `public` |
| `-` | `private` |
| `#` | `protected` |
| `~` (oder nichts) | default (package-private) |

---

## 5. Getter/Setter und Datenkapselung (Encapsulation)

### 5.1 Das Prinzip

**Datenkapselung** ist eine der vier Säulen der OOP:

1. Attribute werden `private` deklariert
2. Zugriff erfolgt ausschließlich über öffentliche Methoden (Getter/Setter)
3. So können Plausibilitätsprüfungen, Lazy Loading, Logging etc. zentral implementiert werden

```java
public class Person {
    private String name;
    private int    alter;

    public String getName() { return name; }
    public int    getAlter() { return alter; }

    public void setAlter(int alter) {
        if (alter < 0 || alter > 150) {
            throw new IllegalArgumentException("Ungültiges Alter: " + alter);
        }
        this.alter = alter;
    }

    public void setName(String name) {
        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException("Name darf nicht leer sein");
        }
        this.name = name;
    }
}
```

### 5.2 Vorteile

| Vorteil | Erklärung |
|---|---|
| **Data Hiding** | Direkter Zugriff von außen wird verhindert |
| **Validierung** | Ungültige Werte können abgefangen werden |
| **Read-only / Write-only** | Nur Getter oder nur Setter anbieten |
| **Erweiterbarkeit** | Interne Veränderungen ohne API-Bruch |
| **Invariantsschutz** | Konsistenzbedingungen zentral durchsetzbar |

### 5.3 Read-only-Klasse

```java
public class ImmutablePerson {
    private final String name;
    private final int    geburtsjahr;

    public ImmutablePerson(String name, int geburtsjahr) {
        this.name = name;
        this.geburtsjahr = geburtsjahr;
    }

    public String getName()       { return name; }
    public int    getGeburtsjahr(){ return geburtsjahr; }
}
```

---

## 6. Die this-Referenz

`this` ist eine **implizite Referenz** auf das **aktuelle Objekt**.

```java
public class Rechteck {
    private int breite;
    private int hoehe;

    public void setzeBreite(int breite) {
        this.breite = breite;  // this.breite = Attribut, breite = Parameter
    }
}
```

### 6.1 Anwendungsfälle

| Anwendungsfall | Beispiel |
|---|---|
| **Unterscheidung Attribut/Parameter** | `this.name = name;` |
| **Rückgabe der aktuellen Instanz** | `return this;` (Method Chaining) |
| **Aufruf einer anderen Methode** | `this.berechneFlaeche();` |
| **Konstruktor-Verkettung** | `this(...)` als erste Anweisung |
| **Weitergabe der eigenen Referenz** | `anderesObjekt.registriere(this);` |

### 6.2 Method Chaining mit `this`

```java
public class QueryBuilder {
    private StringBuilder sql = new StringBuilder();

    public QueryBuilder select(String spalten) {
        sql.append("SELECT ").append(spalten);
        return this;
    }

    public QueryBuilder from(String tabelle) {
        sql.append(" FROM ").append(tabelle);
        return this;
    }

    public QueryBuilder where(String bedingung) {
        sql.append(" WHERE ").append(bedingung);
        return this;
    }

    public String build() {
        return sql.toString();
    }
}

String query = new QueryBuilder()
    .select("*")
    .from("kunden")
    .where("stadt = 'Berlin'")
    .build();
```

> `this` ist `final` — es kann nicht neu zugewiesen werden.

---

## 7. Statische vs. Instanz-Member

| Eigenschaft | Instance (kein `static`) | Static (`static`) |
|---|---|---|
| **Gehört zu** | einem konkreten Objekt | der Klasse selbst |
| **Speicherort** | ein Exemplar pro Objekt im Heap | ein einziges Exemplar im Class-Method-Area |
| **Aufruf** | `objekt.methode()` | `Klasse.methode()` |
| **Zugriff auf `this`** | ja | **nein** |
| **Lebenszyklus** | lebt mit dem Objekt | lebt, solange die Klasse geladen ist |

```java
public class Mitarbeiter {
    private static int anzahlMitarbeiter = 0;  // Klassenattribut
    private String name;                       // Instanzattribut

    public Mitarbeiter(String name) {
        this.name = name;
        anzahlMitarbeiter++;
    }

    public String getName() { return name; }

    public static int getAnzahlMitarbeiter() {
        return anzahlMitarbeiter;
    }

    public static final int MAX_URLAUBSTAGE = 30;
}

Mitarbeiter m1 = new Mitarbeiter("Anna");
Mitarbeiter m2 = new Mitarbeiter("Ben");
System.out.println(Mitarbeiter.getAnzahlMitarbeiter());  // 2
System.out.println(Mitarbeiter.MAX_URLAUBSTAGE);         // 30
```

### 7.1 Wann was?

| Szenario | Verwende |
|---|---|
| Methoden, die Zugriff auf Objektzustand brauchen | Instanzmethoden |
| Utility-Funktionen (`Math.max`, `Integer.parseInt`) | `static` |
| Konstanten (`Math.PI`, `Integer.MAX_VALUE`) | `static final` |
| Factory-Methoden (alternative Konstruktoren) | `static` |
| Zähler, Cache, globale Registry | `static` |

---

## 8. Beziehungen zwischen Klassen — UML und Java

### 8.1 Überblick

| Beziehung | UML-Notation | Bedeutung |
|---|---|---|
| **Assoziation** | durchgezogene Linie | „Kennt-beziehung" |
| **Aggregation** | Linie mit **leerer Raute** | „Hat-beziehung" (Teil eigenständig) |
| **Komposition** | Linie mit **gefüllter Raute** | „Besteht-aus-Beziehung" (Teil stirbt mit dem Ganzen) |
| **Dependency** | **gestrichelte Linie** mit offenem Pfeil | „Benutzt-beziehung" (lokal, transient) |

### 8.2 Assoziation

**Beispiel:** Lehrer unterrichtet Schüler — beide existieren unabhängig.

```java
public class Lehrer {
    private String name;

    public Lehrer(String name) { this.name = name; }

    public void unterrichte(Schueler schueler) {
        System.out.println(this.name + " unterrichtet " + schueler.getName());
    }
}

public class Schueler {
    private String name;

    public Schueler(String name) { this.name = name; }
    public String getName() { return name; }
}
```

### 8.3 Aggregation

**Beispiel:** Mannschaft **hat** Spieler — Spieler können auch ohne Mannschaft existieren.

```java
import java.util.ArrayList;
import java.util.List;

public class Mannschaft {
    private String name;
    private List<Spieler> spieler;

    public Mannschaft(String name) {
        this.name = name;
        this.spieler = new ArrayList<>();
    }

    public void addSpieler(Spieler spieler) {
        this.spieler.add(spieler);
    }

    public void entferneSpieler(Spieler spieler) {
        this.spieler.remove(spieler);
        // Spieler lebt weiter!
    }
}
```

### 8.4 Komposition

**Beispiel:** Auto **besteht aus** Motor — ohne Auto kein Motor.

```java
public class Auto {
    private String marke;
    private Motor motor;  // existenzabhängig

    public Auto(String marke, int ps) {
        this.marke = marke;
        this.motor = new Motor(ps);  // Auto erzeugt seinen Motor
    }

    public void starten() {
        motor.starten();
    }
}

public class Motor {
    private int ps;

    public Motor(int ps) { this.ps = ps; }

    public void starten() {
        System.out.println("Motor mit " + ps + " PS startet");
    }
}
```

### 8.5 Dependency

```java
public class Rechnung {
    public double getBruttoPreis(Produkt produkt, double mwst) {
        return produkt.getNettopreis() * (1 + mwst);
    }
}
```

---

## 9. UML-Klassendiagramm ↔ Java-Code

```
┌──────────────────────────────┐
│        Klassenname           │
├──────────────────────────────┤
│ - attr1: Typ                 │
│ - attr2: Typ = defaultWert   │
├──────────────────────────────┤
│ + methode1(): void           │
│ - methode2(p: int): double   │
└──────────────────────────────┘
```

### 9.1 Beispiel Bankkonto

**UML:**

```
┌──────────────────────────────┐
│         Konto                │
├──────────────────────────────┤
│ - kontoNr: String            │
│ - saldo: double              │
├──────────────────────────────┤
│ + Konto(nr: String)          │
│ + einzahlen(betrag: double)  │
│ + auszahlen(betrag: double)  │
│ + getSaldo(): double         │
└──────────────────────────────┘
```

**Java:**

```java
public class Konto {
    private String kontoNr;
    private double saldo;

    public Konto(String kontoNr) {
        this.kontoNr = kontoNr;
        this.saldo = 0.0;
    }

    public void einzahlen(double betrag) {
        if (betrag > 0) this.saldo += betrag;
    }

    public void auszahlen(double betrag) {
        if (this.saldo - betrag >= -2000) this.saldo -= betrag;
    }

    public double getSaldo() {
        return this.saldo;
    }
}
```

### 9.2 Mapping-Regeln

| UML | Java |
|---|---|
| `+` | `public` |
| `-` | `private` |
| `#` | `protected` |
| `~` | (kein Modifier) |
| `unterstrichen` | `static` |
| `kursiv` | `abstract` |
| `<<interface>>` | `interface` |

### 9.3 Multiplizitäten

| Multiplizität | Bedeutung |
|---|---|
| `1` | genau eins |
| `0..1` | null oder eins |
| `*` oder `0..*` | beliebig viele |
| `1..*` | mindestens eins |

---

## 10. Die main-Methode als Treiber

```java
public class App {
    public static void main(String[] args) {
        System.out.println("Hallo Welt!");
    }
}
```

| Bestandteil | Bedeutung |
|---|---|
| **`public`** | JVM muss von außerhalb zugreifen können |
| **`static`** | Kein Objekt nötig |
| **`void`** | JVM erwartet keinen Rückgabewert |
| **`main`** | Konvention — fester Name |
| **`String[] args`** | Kommandozeilen-Args |

### 10.1 main als Treiber

```java
public class Bank {
    public static void main(String[] args) {
        Konto k1 = new Konto("DE001");
        Konto k2 = new Konto("DE002");

        k1.einzahlen(1000.0);
        k2.einzahlen(500.0);

        System.out.println("Konto 1: " + k1.getSaldo() + " EUR");
        System.out.println("Konto 2: " + k2.getSaldo() + " EUR");
    }
}
```

> **Faustregel:** `main` enthält **nur** Treiber-Code (Orchestrierung, keine Logik).

---

## 11. Verwaltungsmethoden: equals, hashCode, toString

### 11.1 toString — Repräsentation als Text

```java
@Override
public String toString() {
    return "Konto{kontoNr='" + kontoNr + "', saldo=" + saldo + "}";
}
```

### 11.2 equals — Wert-Gleichheit

```java
@Override
public boolean equals(Object o) {
    if (this == o) return true;
    if (!(o instanceof Konto)) return false;
    Konto other = (Konto) o;
    return Double.compare(other.saldo, saldo) == 0
        && Objects.equals(kontoNr, other.kontoNr);
}
```

**Regelwerk (Joshua Bloch, Effective Java):**

1. Reflexiv: `x.equals(x)` → true
2. Symmetrisch: `x.equals(y)` ↔ `y.equals(x)`
3. Transitiv: aus `x.equals(y)` und `y.equals(z)` folgt `x.equals(z)`
4. Konsistent: mehrfacher Aufruf liefert gleiches Ergebnis
5. Bei `null`: `x.equals(null)` → false

### 11.3 hashCode — Streuwert für Hash-Tabellen

```java
@Override
public int hashCode() {
    return Objects.hash(kontoNr, saldo);
}
```

**Vertrag:** `a.equals(b)` → `a.hashCode() == b.hashCode()`.

### 11.4 Records als Alternative (ab Java 16)

```java
public record Konto(String kontoNr, double saldo) {
    // Automatisch: Konstruktor, Getter, equals, hashCode, toString
}
```

---

## 12. Mehrere Klassen in einem Projekt

### 12.1 Maven-Standard-Layout

```
mein-projekt/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/                    ← Java-Quellcode
│   │   │   └── de/oszimt/bank/
│   │   │       ├── Bank.java
│   │   │       ├── Konto.java
│   │   │       └── Kunde.java
│   │   └── resources/               ← Nicht-Java-Ressourcen
│   └── test/
│       └── java/                    ← Test-Code
└── target/                          ← Compilate
```

### 12.2 Package-Struktur

```java
package de.oszimt.bank;

public class Konto { /* ... */ }
```

> **Empfehlung:** Top-Level-Packages rückwärts nach Domain-Namen: `de.oszimt.bank`, `com.example.app`.

### 12.3 Mehrere Klassen in einer Datei

Pro Datei **eine Top-Level-Klasse public** (die `public`-Klasse muss wie die Datei heißen). Weitere package-private Klassen dürfen in derselben Datei stehen:

```java
// Datei: Bank.java
public class Bank { /* ... */ }

class KontoComparator implements Comparator<Konto> { /* ... */ }
```

---

## 13. Der new-Operator — Instanzerzeugung Schritt für Schritt

```java
Konto k = new Konto("DE001");
```

| Schritt | Was passiert |
|---|---|
| 1 | **Deklaration**: `Konto k` — Referenzvariable `k` wird auf dem Stack angelegt |
| 2 | **Speicherreservierung**: `new` reserviert Platz im Heap |
| 3 | **Initialisierung**: Default-Werte für Attribute (0, false, null) |
| 4 | **Konstruktoraufruf**: `Konto("DE001")` ruft den entsprechenden Konstruktor auf |
| 5 | **Zuweisung**: Referenz auf das neue Objekt wird in `k` gespeichert |

### 13.1 Mehrere Referenzen

```java
Konto a = new Konto("DE001");
Konto b = a;            // b zeigt auf dasselbe Objekt

b.einzahlen(500);
System.out.println(a.getSaldo());  // 500.0
```

**Achtung:** Java verwendet für Objekte **immer Pass-by-Value**, aber der Wert ist die **Referenz**.

---

## 14. Praxisbeispiel: Mini-Bibliothek

### 14.1 Klasse Buch

```java
package de.oszimt.bibliothek;

import java.util.Objects;

public class Buch {
    private String titel;
    private String autor;
    private String isbn;
    private int    seitenanzahl;

    public Buch() {
        this("unbekannt", "unbekannt", "n/a", 0);
    }

    public Buch(String titel, String autor, String isbn, int seitenanzahl) {
        if (titel == null || titel.isBlank()) {
            throw new IllegalArgumentException("Titel darf nicht leer sein");
        }
        this.titel = titel;
        this.autor = autor;
        this.isbn = isbn;
        this.seitenanzahl = Math.max(0, seitenanzahl);
    }

    public String getTitel()       { return titel; }
    public String getAutor()       { return autor; }
    public String getIsbn()        { return isbn; }
    public int    getSeitenanzahl(){ return seitenanzahl; }

    public void setSeitenanzahl(int s) { this.seitenanzahl = Math.max(0, s); }

    @Override
    public String toString() {
        return String.format("Buch{%s von %s, ISBN=%s, %d S.}",
            titel, autor, isbn, seitenanzahl);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Buch b)) return false;
        return Objects.equals(isbn, b.isbn);
    }

    @Override
    public int hashCode() {
        return Objects.hash(isbn);
    }
}
```

### 14.2 Klasse Bibliothek (Aggregation)

```java
package de.oszimt.bibliothek;

import java.util.ArrayList;
import java.util.List;

public class Bibliothek {
    private String name;
    private List<Buch> bestand;

    public Bibliothek(String name) {
        this.name = name;
        this.bestand = new ArrayList<>();
    }

    public void fuegeBuchHinzu(Buch buch) {
        if (buch != null && !bestand.contains(buch)) {
            bestand.add(buch);
        }
    }

    public boolean entferneBuch(Buch buch) {
        return bestand.remove(buch);
    }

    public int getAnzahlBuecher() {
        return bestand.size();
    }

    public void druckeBestand() {
        System.out.println("Bibliothek: " + name);
        for (Buch b : bestand) {
            System.out.println("  - " + b);
        }
    }
}
```

### 14.3 Treiber Main

```java
package de.oszimt.bibliothek;

public class Main {
    public static void main(String[] args) {
        Buch b1 = new Buch("Java ist auch eine Insel", "Christian Ullenboom", "978-3-8362-9127-3", 1246);
        Buch b2 = new Buch("Clean Code", "Robert C. Martin", "978-0-13-235088-4", 464);
        Buch b3 = new Buch("Effective Java", "Joshua Bloch", "978-0-13-468599-1", 412);

        Bibliothek bib = new Bibliothek("OSZ-IMT Bibliothek");
        bib.fuegeBuchHinzu(b1);
        bib.fuegeBuchHinzu(b2);
        bib.fuegeBuchHinzu(b3);

        bib.druckeBestand();
        System.out.println("Anzahl Bücher: " + bib.getAnzahlBuecher());
    }
}
```

---

## 15. Lernaufgaben

### 15.1 Einstieg

1. **Klasse entwerfen:** Modelliere eine Klasse `Fahrrad` mit `marke`, `farbe`, `gangzahl` und Methoden `schalten(int gang)`, `bremsen()`.
2. **Objekte erzeugen:** Erzeuge im `main` drei Fahrräder mit unterschiedlichen Werten und rufe für jedes eine Methode auf.
3. **UML zeichnen:** Übertrage deine Klasse in ein UML-Klassendiagramm.

### 15.2 Fortgeschritten

4. **Aggregation:** Modelliere `Fahrrad` und `Fahrer` als Aggregation.
5. **equals/hashCode:** Überschreibe `equals` und `hashCode` für `Fahrrad` basierend auf `marke` + `gangzahl`.
6. **toString:** Überschreibe `toString` für eine sinnvolle Text-Repräsentation.

### 15.3 Projekt

7. **Bibliotheksverwaltung:** Erstelle ein kleines Programm mit Klassen `Buch`, `Leser`, `Bibliothek`. Ausleihe und Rückgabe sollen möglich sein.

---

## 16. Quellen und Bildnachweise

### Bildnachweise

- UML-Klassendiagramm Aufbau: <https://lucidchart.com/pages/de/tutorial/uml-klassendiagramme>
- UML-Beziehungen: <https://oer-informatik.de/uml-klassendiagramm-assoziation>
- Klassendiagramm Wikipedia: <https://de.wikipedia.org/wiki/Klassendiagramm>
- Stack-Heap-Diagramm: <https://sciodoo.de/java-objekte-heap-gespeichert-referenziert/>

### Deutsche und englische Lehrquellen

- scalingbits.com — Java-Kurs 1: <http://www.scalingbits.com>
- study-it.education — Java Klassen & Objekte
- dh-cologne — Java-Wegweiser: <https://dh-cologne.github.io/java-wegweiser/>
- OER Informatik — UML: <https://oer-informatik.de/uml-klassendiagramm>
- lernjava.de — Klassenmethoden
- javaseiten.de — Modifier
- W3Schools — Encapsulation: <https://www.w3schools.com>
- GeeksforGeeks — Access Modifiers: <https://www.geeksforgeeks.org>
- Baeldung — equals/hashCode: <https://www.baeldung.com/java-equals-hashcode-contracts>
- Oracle Java Tutorials: <https://docs.oracle.com/javase/tutorial/>

---

## 17. Zusammenfassung

| Konzept | Kerngedanke |
|---|---|
| **Klasse** | Bauplan, definiert Attribute + Methoden |
| **Objekt** | Instanz der Klasse, lebt im Heap |
| **Attribute private** | Datenkapselung |
| **Methoden** | Verhalten, Zugriff auf Objektzustand |
| **Konstruktor** | Spezielle Methode zur Initialisierung |
| **`this`** | Zeiger auf das aktuelle Objekt |
| **`static`** | Gehört der Klasse, nicht der Instanz |
| **`public`** | überall sichtbar |
| **`private`** | nur in der eigenen Klasse |
| **`protected`** | + Subklassen und Package |
| **default** | nur Package |
| **Assoziation** | „kennt" |
| **Aggregation** | „hat, Teil eigenständig" |
| **Komposition** | „besteht aus, Teil stirbt mit" |
| **Dependency** | „benutzt" (lokal, transient) |
| **`main`** | JVM-Einstiegspunkt, Treiber |
| **`equals`** | Wert-Gleichheit |
| **`hashCode`** | Streuwert für Hash-Tabellen |
| **`toString`** | Text-Repräsentation |

### Selbsttest-Checkliste

- [ ] Ich erkläre den Unterschied zwischen Klasse und Objekt.
- [ ] Ich wähle die richtige Sichtbarkeit für Attribute und Methoden.
- [ ] Ich nutze Getter/Setter zur Kapselung.
- [ ] Ich setze `this` korrekt ein.
- [ ] Ich unterscheide statische und Instanz-Member.
- [ ] Ich modelliere Assoziationen, Aggregationen, Kompositionen und Dependencies im UML.
- [ ] Ich übersetze UML-Klassendiagramme in Java-Code und umgekehrt.
- [ ] Ich schreibe `equals`, `hashCode` und `toString` korrekt.

---

*Stand: Java 21 LTS — Quelle: https://moodle.oszimt.de/course/view.php?id=1954 — Recherche 2026*
