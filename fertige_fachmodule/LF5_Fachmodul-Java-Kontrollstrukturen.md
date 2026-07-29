# Fachmodul: Kontrollstrukturen (Java)

**Kurs-ID:** 1933
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1933
**Bezugsstand:** Java 21 LTS

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Grundidee von Kontrollstrukturen](#2-grundidee-von-kontrollstrukturen)
3. [if, else if und else](#3-if-else-if-und-else)
4. [switch und case](#4-switch-und-case)
5. [for-Schleife](#5-for-schleife)
6. [Enhanced for / For-each-Schleife](#6-enhanced-for--for-each-schleife)
7. [while-Schleife](#7-while-schleife)
8. [do-while-Schleife](#8-do-while-schleife)
9. [break, continue und Labels](#9-break-continue-und-labels)
10. [Verschachtelte Schleifen und Komplexität](#10-verschachtelte-schleifen-und-komplexität)
11. [Endlosschleifen](#11-endlosschleifen)
12. [Zentrale Programmiermuster](#12-zentrale-programmiermuster)
13. [Kommandozeilenmenü als Beispiel](#13-kommandozeilenmenü-als-beispiel)
14. [Flussdiagramme und Struktogramme](#14-flussdiagramme-und-strukturgramme)
15. [Typische Fehler und Prüfregeln](#15-typische-fehler-und-prüfregeln)
16. [Lern- und Übungsaufgaben](#16-lern-und-übungsaufgaben)
17. [Quellen und Bildnachweise](#17-quellen-und-bildnachweise)
18. [Zusammenfassung](#18-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die drei Grundmuster Sequenz, Selektion und Iteration unterscheiden,
- `if`, `else if`, `else` korrekt einsetzen, auch in verschachtelter Form,
- das Dangling-Else-Problem vermeiden,
- `switch` klassisch und in der Pfeil-Syntax (Switch Expressions) anwenden,
- die klassische `for`, die enhanced `for`, `while` und `do-while` situationsgerecht auswählen,
- `break`, `continue` und Labels gezielt nutzen,
- Zeitkomplexitäten verschachtelter Schleifen bestimmen,
- Standard-Programmiermuster wie Akkumulator, Counter und Validierung umsetzen,
- Kontrollstrukturen mit PAP und Struktogrammen planen und dokumentieren.

---

## 2. Grundidee von Kontrollstrukturen

Java-Anweisungen werden grundsätzlich von oben nach unten ausgeführt. Kontrollstrukturen verändern diesen linearen Ablauf:

| Muster | Bedeutung |
|---|---|
| **Sequenz** | Anweisungen werden nacheinander ausgeführt |
| **Selektion/Verzweigung** | Nur einer oder mehrere von mehreren Zweigen werden ausgeführt |
| **Iteration/Schleife** | Ein Anweisungsblock wird wiederholt |
| **Sprungsteuerung** | Der normale Ablauf wird vorzeitig beendet oder übersprungen |

### 2.1 Anweisung und Block

Eine einzelne Anweisung kann direkt hinter einer Kontrollstruktur stehen:

```java
if (temperatur > 30)
    System.out.println("Es ist heiß.");
```

Mehrere Anweisungen werden in einem **Block** zusammengefasst:

```java
if (temperatur > 30) {
    System.out.println("Es ist heiß.");
    System.out.println("Trinken Sie ausreichend Wasser.");
}
```

> **Faustregel:** Verwenden Sie immer geschweifte Klammern, selbst wenn der Block nur eine Anweisung enthält. Das schützt vor späteren Erweiterungsfehlern.

### 2.2 Bedingungen in Java

Die Bedingung einer Verzweigung oder Schleife muss einen `boolean` liefern:

```java
boolean volljaehrig = alter >= 18;

if (volljaehrig) {
    System.out.println("Zutritt erlaubt.");
}
```

Java interpretiert Ganzzahlen **nicht** automatisch als Wahrheitswerte:

```java
int zahl = 1;
// if (zahl) { ... } // Compilerfehler
```

Vergleichs- und logische Operatoren:

| Vergleich | Logik |
|---|---|
| `==`, `!=`, `<`, `>`, `<=`, `>=` | `&&`, `\|\|`, `!`, `^` |

Bei Zeichenketten immer `equals()` statt `==`:

```java
if ("admin".equals(rolle)) {           // null-sicher
    System.out.println("Administratorrechte");
}
```

---

## 3. if, else if und else

### 3.1 Einfache if-Anweisung

```java
if (punkte >= 50) {
    System.out.println("Prüfung bestanden.");
}
```

### 3.2 Zwei-Wege-Verzweigung mit else

```java
if (punkte >= 50) {
    System.out.println("Bestanden");
} else {
    System.out.println("Nicht bestanden");
}
```

### 3.3 Mehrere Fälle mit else if

```java
int punkte = 83;

if (punkte >= 90)       System.out.println("Note 1");
else if (punkte >= 80)  System.out.println("Note 2");
else if (punkte >= 65)  System.out.println("Note 3");
else if (punkte >= 50)  System.out.println("Note 4");
else                    System.out.println("Note 5");
```

> **Achtung:** Die Bedingungen werden von oben nach unten geprüft. Sobald eine Bedingung wahr ist, werden alle nachfolgenden übersprungen. Die Reihenfolge ist entscheidend.

### 3.4 Verschachtelte if-Anweisungen

```java
if (angemeldet) {
    if (administrator) {
        System.out.println("Administrationsbereich");
    } else {
        System.out.println("Standardbereich");
    }
} else {
    System.out.println("Bitte anmelden.");
}
```

**Guard-Clauses** verbessern die Lesbarkeit bei tiefen Verschachtelungen:

```java
if (!angemeldet) {
    System.out.println("Bitte anmelden.");
    return;
}

if (administrator) {
    System.out.println("Administrationsbereich");
} else {
    System.out.println("Standardbereich");
}
```

### 3.5 Das Dangling-Else-Problem

Das **Dangling Else** entsteht bei verschachtelten `if`-Anweisungen ohne geschweifte Klammern. In Java gehört ein `else` grundsätzlich zum **nächstliegenden noch nicht abgeschlossenen `if`**:

```java
if (a)
    if (b)
        aktion1();
    else
        aktion2();
```

Tatsächliche Zuordnung:

```java
if (a) {
    if (b) {
        aktion1();
    } else {
        aktion2();
    }
}
```

Das `else` gehört also zum **inneren** `if (b)`. Einrückung verändert die Bedeutung nicht – nur die Grammatik und die Klammern bestimmen die Zuordnung.

Lösung mit Klammern:

```java
if (a) {
    if (b) {
        aktion1();
    }
} else {
    aktion2();
}
```

### 3.6 Flussdiagramm für if/else

![Flussdiagramm If Then Else](https://commons.wikimedia.org/wiki/Special:FilePath/Flowchart-If%20Then%20Else.svg)

---

## 4. switch und case

`switch` ist für die Auswahl zwischen mehreren **diskreten** Fällen gedacht – ideal für Menüoptionen, Statuscodes, Wochentage oder Enum-Konstanten.

### 4.1 Klassische switch-Anweisung

```java
int auswahl = 2;

switch (auswahl) {
    case 1:
        System.out.println("Neues Dokument");
        break;
    case 2:
        System.out.println("Dokument öffnen");
        break;
    case 3:
        System.out.println("Dokument speichern");
        break;
    default:
        System.out.println("Unbekannte Auswahl");
        break;
}
```

### 4.2 Fall-through

Bei der klassischen Doppelpunkt-Syntax (`case ...:`) läuft die Ausführung nach einem Treffer automatisch in den nächsten `case` hinein, sofern kein `break`, `return` oder `throw` erreicht wird:

```java
switch (monat) {
    case 12:
    case 1:
    case 2:
        jahreszeit = 1; // Winter
        break;
    case 3: case 4: case 5:
        jahreszeit = 2; // Frühling
        break;
    default:
        jahreszeit = 0;
}
```

Das gemeinsame Ausführen mehrerer Fälle ist ein legitimer Einsatz von Fall-through. Unbeabsichtigtes Fall-through ist dagegen eine häufige Fehlerquelle.

### 4.3 Zulässige Selektortypen

Bei klassischen `switch`-Anweisungen sind folgende Typen zulässig:

- `byte`, `short`, `char`, `int` und deren Wrapper
- `String`
- Aufzählungstypen (`enum`)

`long`, `float`, `double` und `boolean` sind **nicht** zulässig.

### 4.4 Arrow-Syntax ab Java 14

Mit Java 14 wurden Switch Expressions dauerhaft standardisiert:

```java
switch (auswahl) {
    case 1 -> System.out.println("Neu");
    case 2 -> System.out.println("Öffnen");
    case 3 -> System.out.println("Speichern");
    default -> System.out.println("Beenden");
}
```

Bei `case ... ->` gibt es **kein automatisches Fall-through**. Mehrere Werte können zusammengefasst werden:

```java
String quartal = switch (monat) {
    case 1, 2, 3 -> "1. Quartal";
    case 4, 5, 6 -> "2. Quartal";
    case 7, 8, 9 -> "3. Quartal";
    case 10, 11, 12 -> "4. Quartal";
    default -> throw new IllegalArgumentException(
        "Ungültiger Monat: " + monat);
};
```

### 4.5 Switch Expression und yield

```java
String bewertung = switch (note) {
    case 1 -> "sehr gut";
    case 2 -> "gut";
    case 3 -> "befriedigend";
    case 4 -> "ausreichend";
    case 5, 6 -> "nicht ausreichend";
    default -> "ungültige Note";
};
```

Wenn ein Fall mehrere Anweisungen benötigt, wird ein Block verwendet und mit `yield` der Ergebniswert geliefert:

```java
String klasse = switch (punktzahl / 10) {
    case 10, 9 -> "A";
    case 8 -> {
        String hinweis = "gute Leistung";
        System.out.println(hinweis);
        yield "B";
    }
    case 7, 6 -> "C";
    default -> "D";
};
```

> `yield` beendet nur den Switch-Ausdruck. `return` würde die gesamte Methode verlassen.

### 4.6 Wann if, wann switch?

| Situation | Struktur |
|---|---|
| Bereichsprüfung (`punkte >= 80`) | `if`/`else if` |
| Komplexe logische Bedingungen | `if` |
| Feste diskrete Werte | `switch` |
| Enum-Zustände | `switch` |
| Rückgabe eines Wertes aus mehreren Fällen | Switch Expression |
| Mehrere Fälle mit identischem Verhalten | `case a, b ->` |

---

## 5. for-Schleife

Die klassische `for`-Schleife eignet sich besonders, wenn die Anzahl der Durchläufe oder ein Zähler bekannt ist.

### 5.1 Syntax

```java
for (Initialisierung; Bedingung; Aktualisierung) {
    Anweisungen;
}
```

```java
for (int i = 0; i < 5; i++) {
    System.out.println("Durchlauf " + i);
}
```

Ablauf:

1. `int i = 0` wird einmal ausgeführt.
2. `i < 5` wird geprüft.
3. Schleifenkörper wird ausgeführt.
4. `i++` wird ausgeführt.
5. Zurück zu Schritt 2.

### 5.2 Mehrere Zähler

```java
for (int links = 0, rechts = 10;
     links < rechts;
     links++, rechts--) {
    System.out.println(links + " / " + rechts);
}
```

### 5.3 Rückwärts zählen

```java
for (int i = 10; i >= 0; i--) {
    System.out.println(i);
}
```

### 5.4 Off-by-one-Fehler

```java
// Falsch: letzter Index wird überschritten
for (int i = 0; i <= array.length; i++) {
    System.out.println(array[i]); // Fehler beim letzten Durchlauf
}

// Korrekt: halb-offenes Intervall [0, length)
for (int i = 0; i < array.length; i++) {
    System.out.println(array[i]);
}
```

**Faustregel:** Indexbereiche beginnen bei `0`. Für Arrays verwendet man `i < array.length`. Halb-offene Intervalle `[start, end)` reduzieren Grenzfehler.

---

## 6. Enhanced for / For-each-Schleife

Seit Java 5 verfügbar – ideal zum Durchlaufen von Arrays und `Iterable`-Objekten:

```java
int[] werte = { 4, 8, 15, 16, 23, 42 };

for (int wert : werte) {
    System.out.println(wert);
}
```

### 6.1 Listen

```java
List<String> namen = List.of("Ada", "Grace", "Katherine");

for (String name : namen) {
    System.out.println(name);
}
```

Seit Java 10:

```java
for (var name : namen) {
    System.out.println(name);
}
```

### 6.2 Keine Indexvariable

Die enhanced `for`-Schleife stellt **keinen Index** bereit. Wenn Index und Element benötigt werden, ist eine klassische Schleife besser geeignet:

```java
for (int i = 0; i < namen.size(); i++) {
    System.out.println(i + ": " + namen.get(i));
}
```

### 6.3 Änderungen an Elementen

Bei primitiven Werten verändert eine Zuweisung an die Schleifenvariable nicht das Array:

```java
int[] zahlen = {1, 2, 3};

for (int zahl : zahlen) {
    zahl = zahl * 2;
}

// zahlen enthält weiterhin {1, 2, 3}
```

Für eine Array-Änderung braucht man den Index:

```java
for (int i = 0; i < zahlen.length; i++) {
    zahlen[i] *= 2;
}
```

Bei Objekten kann die Eigenschaft verändert werden, nicht aber die Referenz in der Liste:

```java
for (Benutzer benutzer : benutzerListe) {
    benutzer.setAktiv(true);     // Eigenschaft ändern: wirkt
    benutzer = new Benutzer();   // nur lokale Variable
}
```

### 6.4 Maps

Eine `Map` ist nicht direkt `Iterable`:

```java
Map<String, Integer> punkte = Map.of(
    "Ada", 95,
    "Grace", 88);

for (Map.Entry<String, Integer> eintrag : punkte.entrySet()) {
    System.out.println(eintrag.getKey() + ": " + eintrag.getValue());
}
```

---

## 7. while-Schleife

Eine `while`-Schleife ist **kopfgesteuert**: Die Bedingung wird vor jedem Durchlauf geprüft.

```java
int rest = 5;

while (rest > 0) {
    System.out.println(rest);
    rest--;
}
```

Wenn die Bedingung bereits zu Beginn `false` ist, wird der Körper kein einziges Mal ausgeführt.

Jede endliche `while`-Schleife benötigt:

1. eine Initialisierung,
2. eine Abbruchbedingung,
3. eine Fortschrittsänderung.

Endlos (fehlende Fortschrittsänderung):

```java
int i = 0;

while (i < 10) {
    System.out.println(i);
    // i wird nie verändert → Endlosschleife
}
```

---

## 8. do-while-Schleife

Die `do-while`-Schleife ist **fußgesteuert**: Der Körper wird mindestens einmal ausgeführt; erst danach erfolgt die Bedingungsprüfung.

```java
int zahl = 0;

do {
    System.out.println("Wird mindestens einmal ausgeführt.");
    zahl++;
} while (zahl < 0);    // Semikolon ist Pflicht!
```

### 8.1 Typische Anwendung: Eingabeprüfung

```java
Scanner scanner = new Scanner(System.in);
int alter;

do {
    System.out.print("Alter zwischen 0 und 120: ");
    alter = scanner.nextInt();
} while (alter < 0 || alter > 120);
```

### 8.2 Robuster mit Eingabevalidierung

```java
int alter;

while (true) {
    System.out.print("Alter: ");

    if (!scanner.hasNextInt()) {
        System.out.println("Bitte eine ganze Zahl eingeben.");
        scanner.next();
        continue;
    }

    alter = scanner.nextInt();

    if (alter >= 0 && alter <= 120) {
        break;
    }

    System.out.println("Der Wert liegt außerhalb des Bereichs.");
}
```

### 8.3 Vergleich der drei Schleifenformen

| Schleife | Bedingungsprüfung | Mindestdurchläufe | Typischer Einsatz |
|---|---|---:|---|
| `for` | am Anfang | 0 | Zähler, bekannte Anzahl |
| `while` | am Anfang | 0 | unbekannte Anzahl, Vorbedingung |
| `do-while` | am Ende | 1 | Menü, Eingabe, Nachbedingung |
| enhanced `for` | intern pro Element | 0 | Array/Iterable durchlaufen |

---

## 9. break, continue und Labels

### 9.1 break

Ein nicht beschriftetes `break` beendet die nächstgelegene Schleife oder den nächstgelegenen `switch`:

```java
for (int i = 0; i < 100; i++) {
    if (i == 7) break;
    System.out.println(i);
}
```

### 9.2 continue

`continue` überspringt den Rest des aktuellen Schleifenkörpers und beginnt mit dem nächsten Durchlauf:

```java
for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) continue;
    System.out.println(i);
}
```

Die Sprungstelle hängt von der Schleifenform ab:

- `for`: zuerst Aktualisierung, dann Bedingung
- `while`: direkt zur Bedingung
- `do-while`: zur Bedingung am Ende

### 9.3 Labels

Ein Label steht vor einer Schleife und erlaubt es, diese **von innen** zu beeinflussen:

```java
außen:
for (int zeile = 0; zeile < 3; zeile++) {
    for (int spalte = 0; spalte < 3; spalte++) {
        if (zeile == 1 && spalte == 1) {
            break außen;          // beendet die äußere Schleife
        }
        System.out.println(zeile + "/" + spalte);
    }
}
```

`continue außen` startet die nächste Iteration der äußeren Schleife. Java besitzt **kein `goto`** – Labels sind kein allgemeiner Goto-Mechanismus.

### 9.4 Vergleich der Sprunganweisungen

| Anweisung | Wirkung |
|---|---|
| `continue` | aktuelle Iteration überspringen |
| `break` | nächstgelegene Schleife verlassen |
| `break label` | beschriftete äußere Schleife verlassen |
| `return` | gesamte Methode verlassen |
| `throw` | Ausnahme auslösen |

> **Faustregel:** `break` und `continue` sparsam einsetzen. Eine frühzeitige Rückgabe aus einer kleinen Hilfsmethode ist oft klarer.

---

## 10. Verschachtelte Schleifen und Komplexität

### 10.1 Zeitkomplexität

```java
for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
        // konstante Arbeit
    }
}
```

→ **O(n²)**.

### 10.2 Dreieckige Schleifen

```java
for (int i = 0; i < n; i++) {
    for (int j = 0; j <= i; j++) {
        // ...
    }
}
```

Durchläufe: `1 + 2 + … + n = n(n+1)/2` → **O(n²)**.

### 10.3 Logarithmischer Zähler

```java
for (long faktor = 1; faktor < n; faktor *= 2) {
    System.out.println(faktor);
}
```

→ ungefähr `log₂(n)` Durchläufe, **O(log n)**.

### 10.4 Verschachtelung mit abhängigen Grenzen

```java
for (int i = 1; i < n; i *= 2) {
    for (int j = 0; j < i; j++) {
        // ...
    }
}
```

Die Summe ist `1 + 2 + 4 + … ≈ 2n` → **O(n)**.

### 10.5 Suche in einer Matrix

```java
int gefundeneZeile = -1, gefundeneSpalte = -1;

suche:
for (int zeile = 0; zeile < matrix.length; zeile++) {
    for (int spalte = 0; spalte < matrix[zeile].length; spalte++) {
        if (matrix[zeile][spalte] == ziel) {
            gefundeneZeile = zeile;
            gefundeneSpalte = spalte;
            break suche;
        }
    }
}
```

---

## 11. Endlosschleifen

### 11.1 Absichtliche Endlosschleifen

```java
while (true) {
    String befehl = leseBefehl();
    if ("ende".equalsIgnoreCase(befehl)) break;
    verarbeite(befehl);
}
```

Alternative:

```java
for (;;) {
    // wiederholter Programmablauf
}
```

### 11.2 Sinnvolle Anwendungen

- Kommandozeilenmenüs
- Server- oder Netzwerkprozesse
- Ereignisschleifen
- Worker-Threads
- Nachrichtenverarbeitung

Worker mit kontrollierter Beendigung:

```java
while (!Thread.currentThread().isInterrupted()) {
    try {
        Aufgabe aufgabe = warteschlange.take();
        bearbeite(aufgabe);
    } catch (InterruptedException e) {
        Thread.currentThread().interrupt();
        break;
    }
}
```

### 11.3 Fehlerhafte Endlosschleife

```java
int versuche = 0;

while (versuche < 3) {
    System.out.println("Versuch " + versuche);
    // versuche++ fehlt → Endlosschleife
}
```

Weitere Ursachen:

- Falsches Vorzeichen bei `i++`/`i--`
- Bedingung verwendet die falsche Variable
- Ganzzahlüberlauf
- Eingabe wird nie verändert
- `continue` überspringt die Aktualisierung
- Abbruchpfad ist logisch nicht erreichbar

### 11.4 Busy Waiting vermeiden

Problematisch:

```java
while (!bereit) {
    // nichts → verbraucht dauerhaft CPU
}
```

Besser:

- `BlockingQueue`
- `wait`/`notify`
- `Lock` und `Condition`
- `CountDownLatch`
- `CompletableFuture`
- Interrupt- oder Cancellation-Mechanismen

---

## 12. Zentrale Programmiermuster

### 12.1 Akkumulator

Summe:

```java
static long summe(int[] werte) {
    long summe = 0L;
    for (int wert : werte) {
        summe += wert;
    }
    return summe;
}
```

**Neutrale Elemente:** Addition → `0`, Multiplikation → `1`, String-Verkettung → `""`, UND → `true`.

Durchschnitt:

```java
static double durchschnitt(int[] werte) {
    if (werte.length == 0) {
        throw new IllegalArgumentException("Leeres Array besitzt keinen Durchschnitt.");
    }
    long summe = 0L;
    for (int wert : werte) {
        summe += wert;
    }
    return (double) summe / werte.length;
}
```

Maximum:

```java
static int maximum(int[] werte) {
    if (werte.length == 0) {
        throw new IllegalArgumentException("Maximum eines leeren Arrays ist nicht definiert.");
    }
    int max = werte[0];
    for (int i = 1; i < werte.length; i++) {
        if (werte[i] > max) max = werte[i];
    }
    return max;
}
```

### 12.2 Counter

```java
static int anzahlGerader(int[] werte) {
    int counter = 0;
    for (int wert : werte) {
        if (wert % 2 == 0) counter++;
    }
    return counter;
}
```

### 12.3 Search Pattern

```java
static int indexOf(int[] werte, int gesucht) {
    for (int i = 0; i < werte.length; i++) {
        if (werte[i] == gesucht) return i;
    }
    return -1;
}
```

Bei Objekten:

```java
if (Objects.equals(gesuchterName, aktuellerName)) {
    // null-sicher
}
```

### 12.4 Validation Pattern

```java
static int leseAlter(Scanner scanner) {
    while (true) {
        System.out.print("Alter zwischen 0 und 120: ");
        if (!scanner.hasNextInt()) {
            System.out.println("Keine gültige Ganzzahl.");
            scanner.next();
            continue;
        }
        int alter = scanner.nextInt();
        if (alter >= 0 && alter <= 120) return alter;
        System.out.println("Wert außerhalb des Bereichs.");
    }
}
```

### 12.5 Sentinel Pattern

```java
int eingabe;
long summe = 0;

do {
    System.out.print("Zahl eingeben, -1 beendet: ");
    eingabe = scanner.nextInt();
    if (eingabe != -1) summe += eingabe;
} while (eingabe != -1);
```

### 12.6 Musterübersicht

| Muster | Initialisierung | Aktion | Ende |
|---|---|---|---|
| Akkumulator | neutraler Startwert | Wert einbeziehen | alle Elemente |
| Counter | `0` | bei Treffer erhöhen | alle Elemente geprüft |
| Suche | `-1` oder `false` | Treffer speichern, abbrechen | Treffer oder Ende |
| Validierung | kein gültiger Wert | Eingabe prüfen | gültige Eingabe |
| Sentinel | Startwert | Eingabe verarbeiten | spezieller Endwert |

---

## 13. Kommandozeilenmenü als Beispiel

```java
import java.util.Scanner;

public class MenueProgramm {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean laeuft = true;

        while (laeuft) {
            System.out.println();
            System.out.println("1 - Begrüßung");
            System.out.println("2 - Summe berechnen");
            System.out.println("0 - Beenden");
            System.out.print("Auswahl: ");

            if (!scanner.hasNextInt()) {
                System.out.println("Bitte eine Zahl eingeben.");
                scanner.next();
                continue;
            }

            int auswahl = scanner.nextInt();

            switch (auswahl) {
                case 1:
                    System.out.println("Willkommen im Java-Programm.");
                    break;
                case 2:
                    System.out.print("Erste Zahl: ");
                    int a = scanner.nextInt();
                    System.out.print("Zweite Zahl: ");
                    int b = scanner.nextInt();
                    System.out.println("Summe: " + (a + b));
                    break;
                case 0:
                    laeuft = false;
                    break;
                default:
                    System.out.println("Unbekannte Auswahl.");
            }
        }

        System.out.println("Programm beendet.");
    }
}
```

Mit moderner Arrow-Syntax:

```java
switch (auswahl) {
    case 1 -> System.out.println("Willkommen.");
    case 2 -> {
        int a = scanner.nextInt();
        int b = scanner.nextInt();
        System.out.println(a + b);
    }
    case 0 -> laeuft = false;
    default -> System.out.println("Unbekannte Auswahl.");
}
```

---

## 14. Flussdiagramme und Struktogramme

### 14.1 Symbole

| Symbol | Bedeutung |
|---|---|
| Oval | Start oder Ende |
| Rechteck | Verarbeitung/Anweisung |
| Raute | Entscheidung |
| Parallelogramm | Ein- oder Ausgabe |
| Pfeil | Kontrollfluss |

### 14.2 While-Fluss

![While-Schleife](https://commons.wikimedia.org/wiki/Special:FilePath/While-loop-diagram.svg)

### 14.3 Do-while-Fluss

![Do-while-Schleife](https://commons.wikimedia.org/wiki/Special:FilePath/Do-while-loop-diagram.svg)

### 14.4 For-Fluss

![For-Schleife](https://commons.wikimedia.org/wiki/Special:FilePath/For-loop-diagram.png)

### 14.5 Struktogramm

Ein **Nassi-Shneiderman-Diagramm** stellt den Ablauf **ohne frei verzweigte Pfeile** dar. Sequenzen werden untereinander, Alternativen nebeneinander und Schleifen als umschließende Blöcke dargestellt.

![Nassi-Shneiderman-Diagramm](https://commons.wikimedia.org/wiki/Special:FilePath/Nassi-Shneiderman%20diagram%20-%20InsertionSort.svg)

---

## 15. Typische Fehler und Prüfregeln

### 15.1 Bedingungen

- `=` und `==` nicht verwechseln.
- Bei Strings `equals` statt `==` verwenden.
- Nullwerte vor Methodenaufrufen prüfen.
- Bei `&&` und `||` die Kurzschlussauswertung bewusst nutzen.

```java
boolean registriert = benutzer != null && benutzer.isRegistriert();
if (registriert) {
    // ...
}
```

### 15.2 Schleifen

- Initialwert prüfen.
- Abbruchbedingung in Alltagssprache formulieren.
- Fortschrittsvariable identifizieren.
- Grenzwerte mit kleinen Beispielen testen: 0, 1, letzter gültiger Wert.
- Bei Arrays `i < array.length` verwenden.
- Bei `continue` prüfen, ob die Aktualisierung noch ausgeführt wird.
- Integer-Überläufe bei Zählern beachten.

### 15.3 switch

- Bei klassischer Syntax jeden Fall auf fehlendes `break` prüfen.
- Fall-through nur absichtlich einsetzen und kommentieren.
- `default` vorsehen.
- Bei Switch Expressions alle Fälle abdecken.
- `yield` nicht mit `return` verwechseln.

### 15.4 Verschachtelung

- Verschachtelte Ebenen reduzieren.
- Komplexe Teilaufgaben in Methoden auslagern.
- Labels nur einsetzen, wenn sie die Absicht klarer machen.
- Bei O(n²)-Schleifen prüfen, ob `Set`, `Map` oder Sortierung helfen.

---

## 16. Lern- und Übungsaufgaben

### Aufgabe 1 – Notenvergabe

Schreiben Sie eine `else-if`-Kette:

- ab 90: Note 1
- ab 80: Note 2
- ab 65: Note 3
- ab 50: Note 4
- darunter: Note 5

### Aufgabe 2 – Fall-through erklären

Welche Ausgabe erzeugt folgender Code?

```java
int x = 1;

switch (x) {
    case 1:
        System.out.println("A");
    case 2:
        System.out.println("B");
        break;
    default:
        System.out.println("C");
}
```

### Aufgabe 3 – Schleifen umformen

Formen Sie diese `while`-Schleife in eine `for`-Schleife um:

```java
int i = 0;
while (i < 10) {
    System.out.println(i);
    i++;
}
```

### Aufgabe 4 – Suche in einer Matrix

Suchen Sie eine Zahl in einer 2D-Matrix. Beenden Sie beide Schleifen beim ersten Treffer.

### Aufgabe 5 – Komplexität

Bestimmen Sie die asymptotische Laufzeit:

```java
for (int i = 1; i < n; i *= 2) {
    for (int j = 0; j < i; j++) {
        System.out.println(j);
    }
}
```

(Antwort: **O(n)**)

### Aufgabe 6 – Endlosschleife finden

Warum terminiert der folgende Code nicht?

```java
int wert = 10;
while (wert > 0) {
    System.out.println(wert);
    wert++;
}
```

### Aufgabe 7 – PAP/Struktogramm zeichnen

Zeichnen Sie ein Struktogramm für den Algorithmus "größter gemeinsamer Teiler" (Euklid).

### Aufgabe 8 – Dijkstra lesen

Lesen Sie den berühmten Aufsatz *"Go To Statement Considered Harmful"* (1968) und fassen Sie die Kernargumente zusammen.

---

## 17. Quellen und Bildnachweise

### Bildnachweise

- Flussdiagramm `if then else`: <https://commons.wikimedia.org/wiki/File:Flowchart-If_Then_Else.svg>
- Verschachtelte Entscheidung: <https://commons.wikimedia.org/wiki/File:Nested_if-else_flowchart_example-ar.svg>
- `switch`-Fluss: <https://commons.wikimedia.org/wiki/File:Switch_Flowchart.png>
- For-Schleife: <https://commons.wikimedia.org/wiki/File:For-loop-diagram.png>
- While-Schleife: <https://commons.wikimedia.org/wiki/File:While-loop-diagram.svg>
- Do-while-Schleife: <https://commons.wikimedia.org/wiki/File:Do-while-loop-diagram.svg>
- Nassi-Shneiderman: <https://commons.wikimedia.org/wiki/File:Nassi-Shneiderman_diagram_-_InsertionSort.svg>

### Normative Quellen

- Java Language Specification, Kapitel 14: <https://docs.oracle.com/javase/specs/jls/se24/html/jls-14.html>
- Oracle Tutorials – Control Flow: <https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html>
- Oracle – Branching Statements: <https://docs.oracle.com/javase/tutorial/java/nutsandbolts/branch.html>
- Oracle – The `switch` Statement: <https://docs.oracle.com/javase/tutorial/java/nutsandbolts/switch.html>
- Oracle – Switch Expressions: <https://docs.oracle.com/en/java/javase/24/language/switch-expressions-and-statements.html>
- OpenJDK JEP 361: <https://openjdk.org/jeps/361>

### Deutschsprachige Lehrquellen

- Wikibooks Java Standard – Kontrollstrukturen: <https://de.wikibooks.org/wiki/Java_Standard:_Kontrollstrukturen>
- Informatikzentrale – Kontrollstrukturen: <https://www.informatikzentrale.de/kontrollstrukturen-einfuehrung-ablaufdiagramm-struktogramm.html>
- Java-Technologie – Nassi-Shneiderman: <http://java.tsmit.de/nassischneidermanndiagramm.html>
- LMU München – Java-Kurs: <https://www.mobile.ifi.lmu.de/wp-content/uploads/lehrveranstaltungen/java-fuer-anfaenger-ws1819/07_Kontrollstrukturen2.pdf>

---

## 18. Zusammenfassung

Kontrollstrukturen bestimmen, in welcher Reihenfolge, unter welchen Bedingungen und wie oft Anweisungen ausgeführt werden. Java stellt dafür `if`/`else`, `switch`, `for`, enhanced `for`, `while`, `do-while`, `break` und `continue` bereit.

### 10 zentrale Merksätze

1. Sequenz, Selektion und Iteration sind die drei Grundmuster.
2. Bedingungen müssen in Java `boolean` sein.
3. Bei Strings immer `equals()` verwenden.
4. Das `else` gehört immer zum nächstliegenden offenen `if`.
5. `switch` eignet sich für diskrete Werte, nicht für Bereichsprüfungen.
6. Die Arrow-Syntax (`case ... ->`) ab Java 14 vermeidet Fall-through.
7. `for` für bekannte Anzahlen, `while` für Vorbedingungen, `do-while` für Nachbedingungen.
8. Labels sind kein `goto`, sondern erlauben kontrolliertes Verlassen benannter Schleifen.
9. Verschachtelte Schleifen verursachen O(n²) – oft durch Datenstrukturen ersetzbar.
10. Endlosschleifen sind erlaubt, müssen aber kontrolliert beendet werden.

### Selbsttest-Checkliste

- [ ] Ich kenne die drei Grundmuster der Kontrollstrukturen.
- [ ] Ich kann `if`/`else if`/`else` korrekt verschachteln.
- [ ] Ich verstehe das Dangling-Else-Problem.
- [ ] Ich kenne klassische und moderne `switch`-Syntax.
- [ ] Ich wähle für jede Aufgabe die passende Schleife.
- [ ] Ich setze `break`, `continue` und Labels gezielt ein.
- [ ] Ich bestimme die Zeitkomplexität verschachtelter Schleifen.
- [ ] Ich erkenne und korrigiere typische Endlosschleifen-Fehler.

---

*Stand: Java 21 LTS — Quelle: https://moodle.oszimt.de/course/view.php?id=1933 — Recherche 2026*
