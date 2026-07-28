# Fachmodul: Einführung in die OOP

**Kurs-ID:** 1953
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1953
**Bezugsstand:** Java 21 LTS

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Vom Algorithmus zum Softwaresystem](#2-vom-algorithmus-zum-softwaresystem)
3. [Prozedurale und objektorientierte Programmierung](#3-prozedurale-und-objektorientierte-programmierung)
4. [Die Kernbegriffe](#4-die-kernbegriffe)
5. [Vom Gegenstand zum Klassenmodell](#5-vom-gegenstand-zum-klassenmodell)
6. [Die vier Säulen der OOP](#6-die-vier-säulen-der-oop)
7. [Klassendeklaration in Java](#7-klassendeklaration-in-java)
8. [Objekterzeugung mit `new`](#8-objekterzeugung-mit-new)
9. [Warum OOP Wiederverwendbarkeit fördern kann](#9-warum-oop-wiederverwendbarkeit-fördern-kann)
10. [Grenzen und typische Missverständnisse](#10-grenzen-und-typische-missverständnisse)
11. [Vollständiges Einstiegsbeispiel](#11-vollständiges-einstiegsbeispiel)
12. [Übungen](#12-übungen)
13. [Bild- und Diagrammverweise](#13-bild-und-diagrammverweise)
14. [Fachlich belastbare Quellen](#14-fachlich-belastbare-quellen)
15. [Zusammenfassung](#15-zusammenfassung)

---

## 1. Lernziele

Nach der Bearbeitung dieses Fachmoduls können Sie:

- prozedurale und objektorientierte Programmierung unterscheiden,
- erklären, warum objektorientierte Modellierung bei komplexen Softwaresystemen hilfreich sein kann,
- die Begriffe **Klasse**, **Objekt**, **Instanz**, **Attribut**, **Methode**, **Konstruktor** und **Referenz** fachgerecht verwenden,
- reale Gegenstände und fachliche Konzepte in Klassenmodelle überführen,
- die vier Grundprinzipien **Abstraktion**, **Kapselung**, **Vererbung** und **Polymorphie** erläutern,
- einfache Java-Klassen deklarieren,
- Objekte mit `new` erzeugen und über Referenzen verwenden,
- zwischen dem deklarierten Typ einer Referenz und dem tatsächlichen Objekttyp unterscheiden,
- Nutzen und Grenzen objektorientierter Entwürfe kritisch beurteilen.

---

## 2. Vom Algorithmus zum Softwaresystem

Ein kleines Programm lässt sich häufig als Folge von Anweisungen verstehen:

1. Daten einlesen,
2. Daten verarbeiten,
3. Ergebnis ausgeben.

Bei einer Temperaturumrechnung oder einer einfachen mathematischen Berechnung genügt dieses Denkmodell oft. Umfangreiche Anwendungen enthalten jedoch zahlreiche fachliche Elemente: Kunden, Produkte, Konten, Fahrzeuge, Rechnungen, Buchungen oder Netzwerkgeräte. Diese Elemente besitzen jeweils eigene Daten, Regeln und Verhaltensweisen.

Bei der objektorientierten Programmierung wird deshalb nicht nur gefragt:

> Welche Verarbeitungsschritte muss das Programm ausführen?

Stattdessen lauten die zentralen Fragen:

> Welche Objekte gibt es im betrachteten Fachgebiet?  
> Welchen Zustand besitzen sie?  
> Für welches Verhalten sind sie verantwortlich?  
> Wie arbeiten sie miteinander?

OOP ist somit nicht bloß eine besondere Syntax. Sie ist zugleich ein **Modellierungs- und Strukturierungsansatz**.

---

## 3. Prozedurale und objektorientierte Programmierung

### 3.1 Prozedurales Denkmodell

In der prozeduralen Programmierung wird eine Aufgabe in Prozeduren beziehungsweise Funktionen zerlegt. Daten und Verarbeitung können dabei getrennt voneinander vorliegen:

```java
public class ProzeduralesKontoBeispiel {

    public static void einzahlen(double[] kontostaende,
                                 int kontoIndex,
                                 double betrag) {
        if (betrag <= 0) {
            throw new IllegalArgumentException(
                "Der Betrag muss positiv sein.");
        }
        kontostaende[kontoIndex] += betrag;
    }

    public static void main(String[] args) {
        double[] kontostaende = {1000.0, 500.0};
        einzahlen(kontostaende, 0, 250.0);
        System.out.println(kontostaende[0]);
    }
}
```

Die Funktion `einzahlen` erhält die zu bearbeitenden Daten als Parameter. In größeren Systemen müssten viele Funktionen dieselbe Datenstruktur korrekt interpretieren. Veränderungen an deren Aufbau könnten zahlreiche Funktionen betreffen.

Prozedurale Programmierung ist nicht grundsätzlich schlecht. Sie eignet sich für:

- kurze, lineare Berechnungen,
- überschaubare Skripte,
- Datenumwandlungen,
- mathematische Algorithmen,
- Aufgaben ohne langlebigen, komplexen Objektzustand.

### 3.2 Objektorientiertes Denkmodell

Im objektorientierten Entwurf werden Zustand und zugehöriges Verhalten zu einer Einheit zusammengefasst:

```java
public class Bankkonto {

    private double kontostand;

    public Bankkonto(double anfangsbestand) {
        if (anfangsbestand < 0) {
            throw new IllegalArgumentException(
                "Der Anfangsbestand darf nicht negativ sein.");
        }
        kontostand = anfangsbestand;
    }

    public void einzahlen(double betrag) {
        if (betrag <= 0) {
            throw new IllegalArgumentException(
                "Der Betrag muss positiv sein.");
        }
        kontostand += betrag;
    }

    public double getKontostand() {
        return kontostand;
    }
}
```

Verwendung:

```java
public class BankAnwendung {
    public static void main(String[] args) {
        Bankkonto konto = new Bankkonto(1000.0);
        konto.einzahlen(250.0);
        System.out.println(konto.getKontostand());
    }
}
```

Die Klasse `Bankkonto` übernimmt selbst die Verantwortung für die Gültigkeit ihres Zustands. Außenstehender Code kann den Kontostand nicht beliebig verändern, sondern muss die dafür vorgesehenen Methoden benutzen.

### 3.3 Vergleich

| Merkmal | Prozedural | Objektorientiert |
|---|---|---|
| Zentrale Struktur | Funktionen und Verarbeitungsschritte | Klassen und zusammenarbeitende Objekte |
| Hauptfrage | „Was muss nacheinander geschehen?" | „Wer ist wofür verantwortlich?" |
| Daten und Verhalten | häufig getrennt | in Klassen zusammengeführt |
| Zustand | wird oft an Funktionen übergeben | gehört zu einem Objekt |
| Zugriffskontrolle | abhängig von Sprache und Modulstruktur | gezielt über `private`, `protected` und `public` |
| Wiederverwendung | Funktionen und Module | Klassen, Komposition, Interfaces, Vererbung |
| Eignung | kleine, lineare oder algorithmische Aufgaben | komplexe, langlebige Fachanwendungen |
| Typisches Risiko | globaler oder unkontrollierter Zustand | unnötige Klassen und überkomplexe Hierarchien |

---

## 4. Die Kernbegriffe

### 4.1 Klasse

Eine **Klasse** ist eine programmatische Beschreibung gleichartiger Objekte. Sie legt fest:

- welche Attribute ihre Objekte besitzen,
- welche Methoden aufgerufen werden können,
- wie neue Objekte initialisiert werden,
- welche Bestandteile von außen sichtbar sind.

```java
public class Fahrrad {
    private String farbe;
    private int    aktuellerGang;
    private double geschwindigkeit;

    public Fahrrad(String farbe) {
        this.farbe = farbe;
        aktuellerGang = 1;
        geschwindigkeit = 0.0;
    }

    public void beschleunigen(double differenz) {
        if (differenz > 0) {
            geschwindigkeit += differenz;
        }
    }

    public void schalten(int neuerGang) {
        if (neuerGang >= 1 && neuerGang <= 12) {
            aktuellerGang = neuerGang;
        }
    }

    public double getGeschwindigkeit() {
        return geschwindigkeit;
    }
}
```

### 4.2 Objekt und Instanz

Ein **Objekt** ist eine konkrete Ausprägung einer Klasse. Man sagt auch: Das Objekt ist eine Instanz der Klasse.

```java
Fahrrad schulrad = new Fahrrad("blau");
Fahrrad rennrad  = new Fahrrad("rot");
```

Beide Objekte besitzen dieselbe grundsätzliche Struktur, aber jeweils einen eigenen Zustand:

```java
schulrad.beschleunigen(10.0);
rennrad.beschleunigen(25.0);
```

Ein Objekt lässt sich durch drei Aspekte beschreiben:

| Aspekt | Bedeutung | Beispiel |
|---|---|---|
| Identität | Das Objekt ist von anderen Objekten unterscheidbar | zwei rote Fahrräder sind dennoch zwei Objekte |
| Zustand | aktuelle Werte seiner Attribute | Farbe, Gang, Geschwindigkeit |
| Verhalten | angebotene Operationen | beschleunigen, bremsen, schalten |

### 4.3 Attribute

Attribute beschreiben den Zustand eines Objekts. In Java werden sie als **Felder** deklariert:

```java
private String farbe;
private int    aktuellerGang;
private double geschwindigkeit;
```

Jede Instanz erhält eigene Instanzfelder. Ein Feld sollte nicht automatisch öffentlich sein.

### 4.4 Methoden

Methoden beschreiben Verhalten oder liefern Informationen über den Zustand:

```java
public void beschleunigen(double differenz) {
    if (differenz <= 0) {
        throw new IllegalArgumentException(
            "Die Differenz muss positiv sein.");
    }
    geschwindigkeit += differenz;
}
```

### 4.5 Konstruktor

Ein Konstruktor initialisiert ein neues Objekt. Er trägt denselben Namen wie die Klasse und besitzt **keinen Rückgabetyp**, auch nicht `void`:

```java
public Fahrrad(String farbe) {
    this.farbe = farbe;
    this.aktuellerGang = 1;
    this.geschwindigkeit = 0.0;
}
```

`this.farbe` bezeichnet das Feld des aktuell bearbeiteten Objekts. `farbe` ohne `this` bezeichnet den Konstruktorparameter.

> *"The Java Language Specification beschreibt Konstruktoren als Sprachmittel zur Initialisierung neuer Klasseninstanzen."* (JLS §8)

---

## 5. Vom Gegenstand zum Klassenmodell

### 5.1 Schritt 1: Fachlichen Ausschnitt festlegen

Software bildet nie die gesamte reale Welt ab. Für ein Bibliothekssystem sind bei einem Buch Titel, ISBN und Ausleihstatus relevant. Papierqualität und Druckmaschinentyp sind möglicherweise unwichtig.

### 5.2 Schritt 2: Kandidaten für Klassen finden

Aus einer Anforderungsbeschreibung:

> Ein Mitglied kann Bücher ausleihen. Jedes Buch besitzt eine ISBN und einen Titel. Eine Ausleihe speichert Ausleih- und Rückgabedatum.

Mögliche Klassen: `Mitglied`, `Buch`, `Ausleihe`.

Mögliche reine Werte oder Attribute: ISBN, Titel, Mitgliedsnummer, Datum.

> Substantive sind nur erste Hinweise, keine automatische Modellierungsregel. Nicht jedes Substantiv muss eine Klasse werden.

### 5.3 Schritt 3: Verantwortlichkeiten zuordnen

| Klasse | Zustand | Verhalten |
|---|---|---|
| `Buch` | ISBN, Titel, verfügbar | ausleihbar prüfen |
| `Mitglied` | Nummer, Name | aktive Ausleihen verwalten |
| `Ausleihe` | Buch, Mitglied, Ausleihdatum, Rückgabedatum | zurückgeben, Überziehung prüfen |

### 5.4 Vereinfachtes UML-Klassendiagramm

```text
┌──────────────────────────────┐
│ Buch                          │
├──────────────────────────────┤
│ - isbn: String               │
│ - titel: String              │
│ - verfuegbar: boolean        │
├──────────────────────────────┤
│ + istVerfuegbar(): boolean   │
│ + ausleihen(): void          │
│ + zurueckgeben(): void       │
└──────────────────────────────┘

┌──────────────────────────────┐
│ Mitglied                     │
├──────────────────────────────┤
│ - mitgliedsnummer: int       │
│ - name: String               │
├──────────────────────────────┤
│ + getName(): String          │
└──────────────────────────────┘

Mitglied "1" --> "0..*" Ausleihe
Buch "1" --> "0..*" Ausleihe
```

---

## 6. Die vier Säulen der OOP

### 6.1 Abstraktion

**Abstraktion** bedeutet, die für einen Zweck wichtigen Eigenschaften hervorzuheben und unwichtige Details auszublenden.

```java
public interface Drucker {
    void drucken(Dokument dokument);
}
```

```java
public class Laserdrucker implements Drucker {
    @Override
    public void drucken(Dokument dokument) {
        System.out.println("Laserdruck: " + dokument.getTitel());
    }
}

public class PdfDrucker implements Drucker {
    @Override
    public void drucken(Dokument dokument) {
        System.out.println("PDF wird erzeugt: " + dokument.getTitel());
    }
}
```

### 6.2 Kapselung

**Kapselung** fasst Zustand und das ihn bearbeitende Verhalten zusammen und kontrolliert den Zugriff auf interne Details:

```java
public class Thermostat {
    private double sollTemperatur;

    public Thermostat(double sollTemperatur) {
        setSollTemperatur(sollTemperatur);
    }

    public void setSollTemperatur(double temperatur) {
        if (temperatur < 5.0 || temperatur > 30.0) {
            throw new IllegalArgumentException(
                "Zulässiger Bereich: 5 bis 30 Grad.");
        }
        sollTemperatur = temperatur;
    }

    public double getSollTemperatur() {
        return sollTemperatur;
    }
}
```

### 6.3 Vererbung

**Vererbung** beschreibt eine Spezialisierungsbeziehung. Eine Unterklasse übernimmt zugängliche Eigenschaften und kann Verhalten ergänzen oder überschreiben:

```java
public abstract class Fahrzeug {
    private final String kennzeichen;

    protected Fahrzeug(String kennzeichen) {
        this.kennzeichen = kennzeichen;
    }

    public String getKennzeichen() {
        return kennzeichen;
    }

    public abstract double berechneMaut();
}

public class Pkw extends Fahrzeug {
    public Pkw(String kennzeichen) {
        super(kennzeichen);
    }

    @Override
    public double berechneMaut() {
        return 0.0;
    }
}

public class Lkw extends Fahrzeug {
    private final int achsen;

    public Lkw(String kennzeichen, int achsen) {
        super(kennzeichen);
        this.achsen = achsen;
    }

    @Override
    public double berechneMaut() {
        return achsen * 2.50;
    }
}
```

Vererbung sollte nicht ausschließlich zur Einsparung einiger Codezeilen eingesetzt werden. Für reine Wiederverwendung ist häufig **Komposition** geeigneter:

```java
public class Auto {
    private final Motor motor;

    public Auto(Motor motor) {
        this.motor = motor;
    }
}
```

### 6.4 Polymorphie

Polymorphie bedeutet „Vielgestaltigkeit". Unterschiedliche Objekte können über einen gemeinsamen Obertyp verwendet werden:

```java
List<Fahrzeug> fahrzeuge = List.of(
    new Pkw("B-AB 123"),
    new Lkw("B-CD 456", 4),
    new Lkw("B-EF 789", 6)
);

for (Fahrzeug fahrzeug : fahrzeuge) {
    System.out.println(fahrzeug.berechneMaut());
}
```

Obwohl die Variable `fahrzeug` den deklarierten Typ `Fahrzeug` besitzt, wird zur Laufzeit die zum tatsächlichen Objekt passende Implementierung ausgeführt.

### 6.5 Überladen vs. Überschreiben

| Überladen | Überschreiben |
|---|---|
| gleicher Methodenname, unterschiedliche Parameterlisten | Unterklasse ersetzt geerbte Implementierung |
| Auswahl anhand der Argumenttypen beim Übersetzen | Auswahl anhand des tatsächlichen Objekttyps zur Laufzeit |
| keine Vererbung erforderlich | Vererbungs- oder Interfacebeziehung erforderlich |

---

## 7. Klassendeklaration in Java

```java
public class Produkt {

    private final String artikelnummer;
    private String bezeichnung;
    private int    lagerbestand;

    public Produkt(String artikelnummer,
                   String bezeichnung,
                   int anfangsbestand) {
        if (artikelnummer == null || artikelnummer.isBlank()) {
            throw new IllegalArgumentException(
                "Die Artikelnummer fehlt.");
        }
        if (bezeichnung == null || bezeichnung.isBlank()) {
            throw new IllegalArgumentException(
                "Die Bezeichnung fehlt.");
        }
        if (anfangsbestand < 0) {
            throw new IllegalArgumentException(
                "Der Bestand darf nicht negativ sein.");
        }

        this.artikelnummer = artikelnummer;
        this.bezeichnung = bezeichnung;
        this.lagerbestand = anfangsbestand;
    }

    public void einlagern(int anzahl) {
        if (anzahl <= 0) {
            throw new IllegalArgumentException(
                "Die Anzahl muss positiv sein.");
        }
        lagerbestand += anzahl;
    }

    public void auslagern(int anzahl) {
        if (anzahl <= 0) {
            throw new IllegalArgumentException(
                "Die Anzahl muss positiv sein.");
        }
        if (anzahl > lagerbestand) {
            throw new IllegalStateException(
                "Der Lagerbestand reicht nicht aus.");
        }
        lagerbestand -= anzahl;
    }

    public String getArtikelnummer() { return artikelnummer; }
    public String getBezeichnung()   { return bezeichnung; }
    public int    getLagerbestand()  { return lagerbestand; }
}
```

---

## 8. Objekterzeugung mit `new`

```java
Produkt monitor =
    new Produkt("M-100", "27-Zoll-Monitor", 12);
```

Diese Anweisung enthält mehrere unterschiedliche Vorgänge:

1. `Produkt` definiert den Typ der Referenzvariable.
2. `monitor` ist der Name der Referenzvariable.
3. `new Produkt(...)` ist ein Klasseninstanzerzeugungsausdruck.
4. Speicher für eine neue Instanz wird bereitgestellt.
5. Die Instanzfelder erhalten zunächst Standardwerte.
6. Der passende Konstruktor wird ausgeführt.
7. Der Ausdruck liefert eine Referenz auf das erzeugte Objekt.
8. Diese Referenz wird in `monitor` gespeichert.

> Die Java Language Specification definiert, dass die Auswertung eines Klasseninstanzerzeugungsausdrucks eine Referenz auf das neu erzeugte Objekt liefert (JLS §15.9).

### 8.1 Referenz und Objekt sind nicht dasselbe

```java
Produkt erstesProdukt = new Produkt("M-100", "Monitor", 12);
Produkt zweitesProdukt = erstesProdukt;
```

Beide Variablen verweisen auf dasselbe Objekt:

```text
erstesProdukt ─┐
                ├──→ Produkt-Objekt
zweitesProdukt ─┘
```

Daher wirkt eine Änderung über die eine Referenz auch bei einem Zugriff über die andere sichtbar:

```java
erstesProdukt.einlagern(3);
System.out.println(zweitesProdukt.getLagerbestand()); // 15
```

### 8.2 Zwei getrennte Objekte

```java
Produkt p1 = new Produkt("M-100", "Monitor", 12);
Produkt p2 = new Produkt("M-100", "Monitor", 12);

System.out.println(p1 == p2); // false
```

### 8.3 `null`

```java
Produkt produkt = null;
produkt.einlagern(5);    // NullPointerException
```

---

## 9. Warum OOP Wiederverwendbarkeit fördern kann

### 9.1 Wiederverwendung

```java
public interface Preisregel {
    double berechnePreis(double grundpreis);
}

public class Rabattregel implements Preisregel {
    private final double rabatt;

    public Rabattregel(double rabatt) {
        this.rabatt = rabatt;
    }

    @Override
    public double berechnePreis(double grundpreis) {
        return grundpreis * (1.0 - rabatt);
    }
}
```

### 9.2 Wartbarkeit

Kapselung kann Änderungen lokal halten. Wenn die interne Speicherung eines Kontostands von `double` zu `BigDecimal` geändert wird, müssen Nutzer der Klasse idealerweise nur dann angepasst werden, wenn sich die öffentliche Schnittstelle ändert.

### 9.3 Erweiterbarkeit

Polymorphie ermöglicht neue Implementierungen gemeinsamer Schnittstellen.

### 9.4 Testbarkeit

Klassen mit begrenzter Verantwortung lassen sich isoliert prüfen:

```java
@Test
void einlagernErhoehtDenBestand() {
    Produkt produkt = new Produkt("T-1", "Tastatur", 10);
    produkt.einlagern(5);
    assertEquals(15, produkt.getLagerbestand());
}
```

---

## 10. Grenzen und typische Missverständnisse

### „OOP bildet die reale Welt exakt ab."

Nein. Softwaremodelle sind zweckgebundene Abstraktionen. Eine Klasse `Kunde` enthält nur die Merkmale, die für das jeweilige System relevant sind.

### „Jedes Substantiv wird eine Klasse."

Nein. Substantive liefern Kandidaten. Einige werden Attribute, Werte, Aufzählungen oder überhaupt nicht modelliert.

### „Kapselung bedeutet Getter und Setter."

Nein. Kapselung bedeutet kontrollierten Zugriff und Schutz gültiger Zustände.

### „Vererbung ist die wichtigste Form der Wiederverwendung."

Nicht immer. Vererbung erzeugt enge Beziehungen. Komposition und Interfaces sind häufig flexibler.

### „OOP ist immer besser als prozedurale Programmierung."

Nein. Für kleine Berechnungen oder klar lineare Transformationen kann ein prozeduraler Ansatz einfacher sein.

### „Viele Klassen bedeuten gute Objektorientierung."

Nein. Zu viele sehr kleine Klassen, unnötige Abstraktionen und tiefe Vererbungshierarchien erschweren das Verständnis.

---

## 11. Vollständiges Einstiegsbeispiel

```java
public class Lampe {

    private final String bezeichnung;
    private boolean eingeschaltet;
    private int    helligkeit;

    public Lampe(String bezeichnung) {
        if (bezeichnung == null || bezeichnung.isBlank()) {
            throw new IllegalArgumentException(
                "Die Bezeichnung fehlt.");
        }
        this.bezeichnung = bezeichnung;
        this.eingeschaltet = false;
        this.helligkeit = 0;
    }

    public void einschalten() {
        eingeschaltet = true;
        if (helligkeit == 0) {
            helligkeit = 50;
        }
    }

    public void ausschalten() {
        eingeschaltet = false;
    }

    public void setHelligkeit(int helligkeit) {
        if (helligkeit < 0 || helligkeit > 100) {
            throw new IllegalArgumentException(
                "Die Helligkeit muss zwischen 0 und 100 liegen.");
        }
        this.helligkeit = helligkeit;
        this.eingeschaltet = helligkeit > 0;
    }

    public boolean istEingeschaltet() { return eingeschaltet; }
    public int     getHelligkeit()     { return helligkeit; }
    public String  getBezeichnung()    { return bezeichnung; }

    public void statusAusgeben() {
        System.out.printf("%s: %s, Helligkeit %d%%%n",
            bezeichnung,
            eingeschaltet ? "eingeschaltet" : "ausgeschaltet",
            helligkeit);
    }
}
```

```java
public class LampenDemo {
    public static void main(String[] args) {
        Lampe schreibtischlampe = new Lampe("Schreibtischlampe");
        Lampe deckenlampe       = new Lampe("Deckenlampe");

        schreibtischlampe.einschalten();
        schreibtischlampe.setHelligkeit(70);
        deckenlampe.einschalten();

        schreibtischlampe.statusAusgeben();
        deckenlampe.statusAusgeben();
    }
}
```

Ausgabe:

```text
Schreibtischlampe: eingeschaltet, Helligkeit 70%
Deckenlampe: eingeschaltet, Helligkeit 50%
```

---

## 12. Übungen

### Aufgabe 1 — Begriffe zuordnen

```java
Konto girokonto = new Konto("DE001");
girokonto.einzahlen(250.0);
```

Ordnen Sie zu: Klasse, Objekt, Attribut, Methode.

### Aufgabe 2 — Klasse modellieren

Entwerfen Sie eine Klasse `Temperatursensor` mit:

- unveränderlicher Sensor-ID,
- aktueller Temperatur,
- Methode zum Aktualisieren,
- Methode zur Abfrage,
- Prüfung eines sinnvollen Messbereichs.

### Aufgabe 3 — Fehler erkennen

```java
public class Person {
    public int alter;
}
```

Welches Problem hat dieses Design? Wie verbessern Sie es?

### Aufgabe 4 — Objektidentität

Erklären Sie die Ausgabe:

```java
Lampe a = new Lampe("A");
Lampe b = a;
Lampe c = new Lampe("A");

System.out.println(a == b);
System.out.println(a == c);
```

Antwort: `true` / `false`.

---

## 13. Bild- und Diagrammverweise

- UML-Klassendiagramme – Wikimedia Commons: <https://commons.wikimedia.org/wiki/Category:Class_diagrams>
- UML-Objektdiagramme: <https://commons.wikimedia.org/wiki/Category:UML_object_diagrams>
- OOP-Bilder: <https://commons.wikimedia.org/wiki/Category:Object-oriented_programming>
- UML-Diagramme: <https://commons.wikimedia.org/wiki/Category:UML_diagrams>
- Java-Logo: <https://commons.wikimedia.org/wiki/Category:Java_(programming_language)>
- Visual Paradigm – UML Class Diagram Basics: <https://skills.visual-paradigm.com/docs/uml-basics-diagrams-for-beginners/mastering-class-diagrams-beginner/uml-class-diagram-basics-beginners/>

> Für eine lizenzrechtlich robuste Buchproduktion sind selbst erzeugte Mermaid- oder PlantUML-Diagramme meist vorzuziehen.

---

## 14. Fachlich belastbare Quellen

### Primärquellen

- Oracle – JLS §8 Klassen: <https://docs.oracle.com/javase/specs/jls/se21/html/jls-8.html>
- Oracle – JLS §15.9 Klasseninstanzerzeugung: <https://docs.oracle.com/javase/specs/jls/se21/html/jls-15.html#jls-15.9>
- Oracle – Classes and Objects: <https://docs.oracle.com/javase/tutorial/java/javaOO/>
- Dev.java – Classes and Objects: <https://dev.java/learn/classes-objects/>

### Ergänzende Quellen

- Visual Paradigm – UML Class Diagram Basics: <https://skills.visual-paradigm.com/docs/uml-basics-diagrams-for-beginners/mastering-class-diagrams-beginner/uml-class-diagram-basics-beginners/>
- Wikimedia Commons – Class diagrams: <https://commons.wikimedia.org/wiki/Category:Class_diagrams>
- GeeksforGeeks – OOP Concepts: <https://www.geeksforgeeks.org/java/object-oriented-programming-oops-concept-in-java/>
- GeeksforGeeks – Classes and Objects: <https://www.geeksforgeeks.org/java/classes-objects-java/>

---

## 15. Zusammenfassung

- Eine **Klasse** beschreibt Struktur und Verhalten einer Gruppe gleichartiger Objekte.
- Ein **Objekt** ist eine konkrete Instanz einer Klasse mit eigener Identität und eigenem Zustand.
- **Attribute** speichern Zustand; **Methoden** beschreiben Verhalten.
- Ein **Konstruktor** initialisiert eine neue Instanz.
- Der Ausdruck `new Klassenname(...)` erzeugt ein Objekt und liefert eine Referenz darauf.
- **Abstraktion** reduziert ein Problem auf die relevanten Merkmale.
- **Kapselung** schützt interne Details und sichert gültige Objektzustände.
- **Vererbung** modelliert Spezialisierung, sollte aber bewusst eingesetzt werden.
- **Polymorphie** erlaubt die einheitliche Verwendung verschiedener Implementierungen über einen gemeinsamen Typ.
- OOP kann Wiederverwendbarkeit, Wartbarkeit, Testbarkeit und Erweiterbarkeit fördern.
- Diese Vorteile entstehen nicht automatisch: Entscheidend sind klare Verantwortlichkeiten, hohe Kohäsion, geringe Kopplung und eine angemessene Modellierung.

### Selbsttest-Checkliste

- [ ] Ich erkläre den Unterschied zwischen Klasse und Objekt.
- [ ] Ich nenne die vier Säulen der OOP.
- [ ] Ich deklariere eine einfache Java-Klasse mit Attributen und Methoden.
- [ ] Ich erzeuge ein Objekt mit `new` und nutze es über eine Referenz.
- [ ] Ich beschreibe die drei Aspekte eines Objekts (Identität, Zustand, Verhalten).
- [ ] Ich wähle zwischen Vererbung und Komposition bewusst.
- [ ] Ich erkenne typische Missverständnisse über OOP.

---

*Stand: Java 21 LTS — Quelle: https://moodle.oszimt.de/course/view.php?id=1953 — Recherche 2026*
