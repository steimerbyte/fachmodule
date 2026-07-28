# Fachmodul: Arrays (Java)

**Kurs-ID:** 1934
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1934
**Bezugsstand:** Java 21 LTS

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Eindimensionale Arrays – Grundlagen](#2-eindimensionale-arrays--grundlagen)
3. [Mehrdimensionale Arrays](#3-mehrdimensionale-arrays)
4. [Arrays und Schleifen](#4-arrays-und-schleifen)
5. [Die erweiterte for-Schleife (for-each)](#5-die-erweiterte-for-schleife-for-each)
6. [Die Klasse java.util.Arrays](#6-die-klasse-javautilarrays)
7. [args[] – Kommandozeilenargumente der main-Methode](#7-args--kommandozeilenargumente-der-main-methode)
8. [ArrayIndexOutOfBoundsException](#8-arrayindexoutofboundsexception)
9. [Vergleich: Arrays vs. ArrayList](#9-vergleich-arrays-vs-arraylist)
10. [Varargs und Arrays](#10-varargs-und-arrays)
11. [Häufige Fallen und Best Practices](#11-häufige-fallen-und-best-practices)
12. [Konvertierung zwischen Arrays und Listen](#12-konvertierung-zwischen-arrays-und-listen)
13. [Lernziele und Wiederholungsfragen](#13-lernziele-und-wiederholungsfragen)
14. [Quellen und Bildnachweise](#14-quellen-und-bildnachweise)
15. [Zusammenfassung](#15-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Arrays deklarieren, instanziieren und initialisieren (Primitive und Objekte),
- eindimensionale, rechteckige 2D- und Jagged-Arrays erzeugen und nutzen,
- die Wahl zwischen `for`, `for-each` und den Methoden der `Arrays`-Klasse situationsgerecht treffen,
- die `Arrays`-Klasse für Sortierung, Suche, Vergleich und Konvertierung anwenden,
- `ArrayIndexOutOfBoundsException` erkennen, vermeiden und behandeln,
- `args[]` der `main`-Methode parsen,
- den Unterschied zwischen Array und `ArrayList` erklären und performance-bewusste Entscheidungen treffen.

---

## 2. Eindimensionale Arrays – Grundlagen

Ein Array in Java ist ein **Objekt**, das eine festgelegte Anzahl von Werten eines einzelnen Typs speichert. Die Länge wird zur Erzeugungszeit festgelegt und ist danach unveränderlich. Arrays lassen sich in drei Dimensionen denken: **Deklaration**, **Instanziierung** und **Initialisierung**.

### 2.1 Deklaration

Es gibt zwei Schreibweisen, aber die `int[]`-Form ist idiomatisch:

```java
int[] zahlen;       // empfohlene Java-Konvention
int zahlen[];       // C-Stil, ebenfalls gültig
```

### 2.2 Instanziierung

Mit `new` wird Speicher auf dem **Heap** allokiert:

```java
int[]    zahlen = new int[5];        // Länge 5, mit 0 vorinitialisiert
String[] namen  = new String[3];     // Länge 3, mit null vorinitialisiert
boolean[] flags = new boolean[10];   // Länge 10, mit false vorinitialisiert
```

Numerische Arrays werden mit `0` initialisiert, `boolean` mit `false`, Objekt-Referenzen mit `null`.

### 2.3 Initialisierung mit Literalen

Beim Kombinieren von Deklaration und Initialisierung darf die Länge entfallen:

```java
int[]    primzahlen = {2, 3, 5, 7, 11, 13};
String[] obst       = {"Apfel", "Birne", "Kirsche"};

int[] winningNumbers = new int[]{14, 17, 29, 32, 45, 1, 2};
```

### 2.4 Zugriff auf Elemente

Indizes starten bei **`0`**, das letzte Element hat Index **`length − 1`**:

```java
int[] noten   = {1, 2, 3, 4, 5, 6};
int   erste   = noten[0];                  // 1
int   letzte  = noten[noten.length - 1];   // 6
```

### 2.5 Speicherdiagramm eines eindimensionalen Arrays

```
Stack                          Heap
+-------------+               +-------------------+
| ref_zahlen  |------+-------->|  Object-Header    |  ← 12-16 Bytes
+-------------+       |        |  length = 5       |  ← 4 Bytes
                      |        +-------------------+
                      |        |  [0]   = 10       |  ← 4 Bytes
                      |        |  [1]   = 20       |
                      |        |  [2]   = 30       |
                      |        |  [3]   = 40       |
                      |        |  [4]   = 50       |
                      |        +-------------------+
```

Werte liegen in aufeinanderfolgenden Speicherzellen, was wahlfreien Zugriff in **konstanter Zeit** ermöglicht.

---

## 3. Mehrdimensionale Arrays

Mehrdimensionale Arrays in Java sind **Arrays von Arrays**. Damit sind **Jagged Arrays** (verzahnte Arrays) möglich, deren Zeilen unterschiedliche Längen haben.

### 3.1 Rechteckige 2D-Arrays

```java
// 3x4-Matrix
int[][] matrix = new int[3][4];        // Alle mit 0 initialisiert
int[][] zahlen = {
    {1, 2, 3, 4},
    {5, 6, 7, 8},
    {9, 10, 11, 12}
};

int wert = zahlen[1][2];   // 7 (Zeile 1, Spalte 2)
```

### 3.2 Jagged Arrays (Verzahnte Arrays)

```java
int[][] jagged = new int[3][];       // Erste Dimension = 3 Zeilen
jagged[0] = new int[]{1, 2, 3};      // 3 Spalten
jagged[1] = new int[]{4, 5};         // 2 Spalten
jagged[2] = new int[]{6, 7, 8, 9};   // 4 Spalten

int[][] dreieck = {
    {1},
    {2, 3},
    {4, 5, 6},
    {7, 8, 9, 10}
};
```

### 3.3 3D-Arrays

```java
int[][][] wuerfel = new int[3][3][3];   // 3x3x3-Würfel
int[][][] block = {
    { {1, 2}, {3, 4} },
    { {5, 6}, {7, 8} }
};
```

### 3.4 Speicherdiagramm eines 2D-Arrays

```
Stack                              Heap
+-----------+      +-------------> +-------------------+
| ref_matrix|-----+                | 2D-Array-Header   | length = 3
+-----------+     |                +-------------------+
                  |                | [0] = ptr --------+--> {1, 2, 3}
                  |                +-------------------+     (length 3)
                  |                | [1] = ptr --------+--> {4, 5}
                  |                +-------------------+     (length 2)
                  |                | [2] = ptr --------+--> {6, 7, 8, 9}
                  |                +-------------------+     (length 4)
```

Jede Reihe ist ein eigenständiges `int[]`-Objekt. Damit verbraucht ein Jagged Array weniger Speicher als ein rechteckiges Array gleicher Maximalausdehnung.

### 3.5 Iteration über 2D-Arrays

```java
// Klassisch mit geschachtelten for-Schleifen
for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
        System.out.print(matrix[i][j] + " ");
    }
    System.out.println();
}

// Mit for-each (jagged-tauglich)
for (int[] zeile : matrix) {
    for (int wert : zeile) {
        System.out.print(wert + " ");
    }
    System.out.println();
}
```

---

## 4. Arrays und Schleifen

### 4.1 Klassische for-Schleife

```java
int[] noten = {1, 2, 3, 4, 5, 6};
for (int i = 0; i < noten.length; i++) {
    System.out.println("Note " + i + ": " + noten[i]);
}
```

Vorteile:

- Index ist verfügbar
- Richtung und Schrittweite frei wählbar
- Elemente können modifiziert werden

### 4.2 Lineare Suche

```java
int[] daten   = {4, 7, 1, 9, 3, 5};
int   gesucht = 9;
int   position = -1;

for (int i = 0; i < daten.length; i++) {
    if (daten[i] == gesucht) {
        position = i;
        break;                  // Frühzeitiges Beenden
    }
}

System.out.println(position >= 0
    ? "Gefunden bei Index " + position
    : "Nicht gefunden");
```

### 4.3 Binäre Suche (auf sortierten Arrays)

```java
import java.util.Arrays;

int[] sortiert = {1, 3, 5, 7, 9, 11, 13};
int   index    = Arrays.binarySearch(sortiert, 9);   // 4
int   nichtDa  = Arrays.binarySearch(sortiert, 6);   // -3 (Einfügepos.)
```

> **Wichtig:** Das Array muss sortiert sein, sonst ist das Ergebnis undefiniert.

### 4.4 Sortieren

Für primitive Typen verwendet `Arrays.sort()` **Dual-Pivot Quicksort**, für Objekt-Arrays **TimSort** (stabil, O(n log n)):

```java
int[] zahlen = {4, 2, 7, 1, 9, 3};
Arrays.sort(zahlen);
System.out.println(Arrays.toString(zahlen));   // [1, 2, 3, 4, 7, 9]

Integer[] nums = {5, 2, 8, 1, 9};
Arrays.sort(nums, Collections.reverseOrder());  // absteigend
```

### 4.5 Komplexität der Sortieralgorithmen

| Algorithmus | Best Case | Average | Worst Case | Stabil |
|---|---|---|---|---|
| Dual-Pivot Quicksort | O(n log n) | O(n log n) | O(n²) | nein |
| TimSort | O(n) | O(n log n) | O(n log n) | ja |
| MergeSort | O(n log n) | O(n log n) | O(n log n) | ja |
| BubbleSort | O(n) | O(n²) | O(n²) | ja |

---

## 5. Die erweiterte for-Schleife (for-each)

Seit Java 5 gibt es die erweiterte `for`-Schleife. Sie wird als "`for each`" gelesen, der Doppelpunkt bedeutet "in":

```java
for (Datentyp variable : array) {
    // Anweisungen mit variable
}

int[] punkte = {12, 8, 15, 20};
for (int p : punkte) {
    System.out.println(p);
}
```

### 5.1 Charakteristika

| Eigenschaft | Beschreibung |
|---|---|
| Lesart | "Für jedes Element in array …" |
| Index verfügbar? | Nein |
| Modifikation Wert? | Nein (Kopie, nicht Original) |
| Modifikation Struktur? | Nein |
| Anwendbar auf | Arrays und `Iterable` |
| Java-Version | Seit 1.5 verfügbar |

### 5.2 Warum keine Modifikation?

Laut JLS: *"Der Wert im Array wird in eine lokale Variable kopiert, und diese lokale Variable wird in der Schleife verwendet."*

```java
// Kompiliert, verändert aber NICHT das Array
for (int zahl : zahlen) {
    zahl = zahl * 2;     // nur lokale Variable
}

// So funktioniert es:
for (int i = 0; i < zahlen.length; i++) {
    zahlen[i] = zahlen[i] * 2;
}
```

**Ausnahme:** Wenn die Array-Elemente **Objekte** sind, kann man deren Felder modifizieren:

```java
Person[] team = {new Person("Anna"), new Person("Bob")};
for (Person p : team) {
    p.setName(p.getName().toUpperCase());   // erlaubt
}
```

### 5.3 Wann for-each NICHT verwenden

- Nur ein Teil des Arrays soll verarbeitet werden
- Die Richtung soll umgekehrt werden (rückwärts iterieren)
- Indizes werden für Berechnungen benötigt
- Die Struktur soll während der Iteration geändert werden

---

## 6. Die Klasse java.util.Arrays

Seit JDK 1.2 bietet die Klasse `Arrays` im Paket `java.util` umfangreiche Hilfsmethoden.

### 6.1 Methodenüberblick

| Methode | Zweck | Rückgabe |
|---|---|---|
| `Arrays.sort(arr)` | Sortiert aufsteigend | `void` (in-place) |
| `Arrays.parallelSort(arr)` | Parallelisiertes Sortieren | `void` |
| `Arrays.binarySearch(arr, key)` | Binäre Suche | `int` (Index) |
| `Arrays.fill(arr, wert)` | Füllt Array mit einem Wert | `void` |
| `Arrays.copyOf(arr, neueLaenge)` | Kopiert mit neuer Länge | `T[]` |
| `Arrays.copyOfRange(arr, von, bis)` | Teilbereich kopieren | `T[]` |
| `Arrays.equals(a, b)` | Inhaltsvergleich (1D) | `boolean` |
| `Arrays.deepEquals(a, b)` | Tiefenvergleich (auch 2D) | `boolean` |
| `Arrays.toString(arr)` | String-Darstellung | `String` |
| `Arrays.deepToString(arr)` | String verschachtelt | `String` |
| `Arrays.hashCode(arr)` | Hash basierend auf Inhalt | `int` |
| `Arrays.asList(arr...)` | Wandelt in fixe Liste | `List<T>` |
| `Arrays.stream(arr)` | Stream (Java 8+) | `IntStream`/`Stream` |
| `Arrays.mismatch(a, b)` | Erster Index der Differenz | `int` |

### 6.2 Ausführliche Beispiele

Sortieren mit eigenem Comparator:

```java
import java.util.Arrays;
import java.util.Comparator;

class Bier {
    String name;
    String stadt;
    public Bier(String name, String stadt) {
        this.name = name;
        this.stadt = stadt;
    }
}

Bier[] biere = {
    new Bier("Würzburger Hofbräu", "Würzburg"),
    new Bier("Becks", "Bremen"),
    new Bier("Paulaner", "München")
};

Arrays.sort(biere, Comparator.comparing(b -> b.name));
```

Kopieren mit Auffüllen:

```java
int[] original = {1, 2, 3};
int[] erweitert = Arrays.copyOf(original, 5);
// erweitert: [1, 2, 3, 0, 0]
```

Füllen:

```java
String[] protokoll = new String[100];
Arrays.fill(protokoll, "-");
```

Konvertierung zu String:

```java
int[] werte = {10, 20, 30};
System.out.println(Arrays.toString(werte));      // [10, 20, 30]

int[][] matrix = {{1, 2}, {3, 4}};
System.out.println(Arrays.deepToString(matrix)); // [[1, 2], [3, 4]]
```

### 6.3 Warum `equals()` von `Arrays`?

```java
int[] a = {1, 2, 3};
int[] b = {1, 2, 3};

System.out.println(a.equals(b));         // false! (Referenzvergleich)
System.out.println(Arrays.equals(a, b));  // true!  (Inhaltsvergleich)
```

Der `==`-Operator bzw. `Object.equals` vergleicht nur die Referenz.

---

## 7. args[] – Kommandozeilenargumente der main-Methode

### 7.1 Aufbau

```java
public static void main(String[] args) {
    System.out.println("Anzahl Argumente: " + args.length);
    for (String arg : args) {
        System.out.println("Argument: " + arg);
    }
}
```

Aufruf:

```bash
java MeinProgramm Hallo Welt 42
# args = {"Hallo", "Welt", "42"}
```

### 7.2 Warum diese Signatur?

Die JVM ruft **genau diese** Signatur als Einstiegspunkt auf:

- `public` – von außen aufrufbar
- `static` – ohne Instanziierung ausführbar
- `void` – kein Rückgabewert
- `main` – fester Name
- `String[] args` – Array für Kommandozeilenargumente

### 7.3 Argumente parsen

```java
public class Taschenrechner {
    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("Aufruf: java Taschenrechner <zahl1> <op> <zahl2>");
            return;
        }
        double a = Double.parseDouble(args[0]);
        String op = args[1];
        double b = Double.parseDouble(args[2]);
        double ergebnis = switch (op) {
            case "+" -> a + b;
            case "-" -> a - b;
            case "x" -> a * b;
            case "/" -> a / b;
            default -> Double.NaN;
        };
        System.out.println("Ergebnis: " + ergebnis);
    }
}
```

### 7.4 Alternative Schreibweisen für `args`

```java
public static void main(String[] args)    // Standard
public static void main(String args[])    // C-Stil
public static void main(String... args)   // Varargs (äquivalent)
```

Alle drei sind semantisch identisch.

---

## 8. ArrayIndexOutOfBoundsException

### 8.1 Wann tritt sie auf?

> Die untere Grenze eines Arrays ist immer 0, die obere Grenze ist `length − 1`. Der Zugriff außerhalb dieser Grenzen wirft eine `ArrayIndexOutOfBoundsException`.

| Auslöser | Beispiel | Folge |
|---|---|---|
| Index `>= length` | `arr[5]` bei `length=5` | Exception |
| Index `< 0` | `arr[-1]` | Exception |
| Off-by-one-Fehler | `i <= arr.length` | Exception bei letztem Durchlauf |

### 8.2 Klassische Beispiele

```java
int[] zahlen = new int[]{4, 1, 2, 6, 7};

// Negativer Index
System.out.println(zahlen[-1]);
// → ArrayIndexOutOfBoundsException: Index -1 out of bounds for length 5

// Index gleich length
System.out.println(zahlen[5]);
// → ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5

// Off-by-one-Fehler
for (int i = 0; i <= zahlen.length; i++) {  // ← Häufiger Fehler
    System.out.println(zahlen[i]);
}
```

### 8.3 Vermeidungsstrategien

**1. Immer `< length` statt `<= length`:**

```java
for (int i = 0; i < arr.length; i++) {   // sicher
    System.out.println(arr[i]);
}
```

**2. Erweiterte for-Schleife** (wenn kein Index nötig):

```java
for (String s : arr) {
    System.out.println(s);
}
```

**3. Try/Catch bei externen Datenquellen:**

```java
try {
    int wert = arr[index];
} catch (ArrayIndexOutOfBoundsException e) {
    System.err.println("Ungültiger Index: " + index);
}
```

### 8.4 Exception-Hierarchie

```
java.lang.Object
 └── java.lang.Throwable
      └── java.lang.Exception
           └── java.lang.RuntimeException
                └── java.lang.IndexOutOfBoundsException
                     └── java.lang.ArrayIndexOutOfBoundsException
```

---

## 9. Vergleich: Arrays vs. ArrayList

| Eigenschaft | Array | `ArrayList` |
|---|---|---|
| Größe | Fix bei Erstellung | Dynamisch |
| Elementtypen | Primitive + Objekte | Nur Objekte |
| Performance (Lesen) | Sehr schnell (O(1)) | ~1,5× langsamer |
| Speicherverbrauch | Effizient | Höher (Object-Header) |
| Mehrdimensional | Nativ (`int[][]`) | Verschachtelt |
| `length`/`size()` | `length` | `size()` |
| Default-Werte | `0`/`false`/`null` | leer |
| Methoden | nur `length` | reichhaltig |

### 9.1 Wie ArrayList intern funktioniert

`ArrayList` basiert auf einem internen `Object[] elementData`-Array:

- Initiale Kapazität: 10 (Java 8+)
- Wachstumsformel: `newCapacity = oldCapacity + (oldCapacity / 2)` → **1,5 × alt**
- Wachstumssequenz: 10 → 15 → 22 → 33 → 49 → ...

```java
ArrayList<Integer> list = new ArrayList<>();
for (int i = 1; i <= 16; i++) {
    list.add(i);
}
// Intern: elementData = [1..16, null, null, ..., null]  (Länge 22)
```

### 9.2 Wann was verwenden?

**Array bevorzugen bei:**

- Fester Größe (z. B. Wochentage)
- Performance-kritischen Operationen
- Niedrigem Speicherverbrauch (Primitive)
- Numerischen Berechnungen

**`ArrayList` bevorzugen bei:**

- Dynamischer Größe
- Häufigem Hinzufügen/Löschen
- Bedarf an reichhaltigen Methoden
- Generics für Typsicherheit

```java
String[]   wochentage = {"Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"}; // OK
List<String> eingeleseneZeilen = new ArrayList<>();                  // besser
double[]   temperaturen = new double[365];                            // OK
List<Mitarbeiter> mitarbeiter = new ArrayList<>();                    // besser
```

---

## 10. Varargs und Arrays

Variadische Argumente (seit Java 5) sind **syntaktischer Zucker** für Arrays:

```java
public static int summe(int... zahlen) {
    int sum = 0;
    for (int z : zahlen) sum += z;
    return sum;
}

summe(1, 2, 3, 4);              // Compiler erzeugt int[]{1,2,3,4}
summe(new int[]{5, 10});        // direkter Array-Aufruf
```

**Wichtige Regeln:**

- Varargs darf nur **einer** pro Methode sein
- Varargs muss **letzter** Parameter sein
- Der Compiler erzeugt ein neues Array, falls kein Array übergeben wurde

---

## 11. Häufige Fallen und Best Practices

### 11.1 Null-Array-Zugriff

```java
int[] arr = null;
System.out.println(arr[0]);              // NullPointerException
if (arr != null && arr.length > 0) {     // sicher
    System.out.println(arr[0]);
}
```

### 11.2 `length` vs. `length()` vs. `size()`

```java
int[] arr = new int[5];
arr.length;          // 5 (Feldzugriff, ohne Klammern)

String s = "Hallo";
s.length();          // 5 (Methode, mit Klammern)

List<Integer> list = new ArrayList<>();
list.size();         // Methode, mit Klammern
```

### 11.3 Arrays sind veränderbar über Methoden

```java
void verdoppeln(int[] zahlen) {
    for (int i = 0; i < zahlen.length; i++) {
        zahlen[i] *= 2;     // Original-Array wird verändert!
    }
}
```

### 11.4 `clone()` macht flache Kopien

```java
int[] original = {1, 2, 3};
int[] kopie = original.clone();   // tiefe Kopie für Primitive
```

Für tiefe Kopien verschachtelter Objekte: `Arrays.copyOf` oder eigene `deepCopy()`.

### 11.5 Vorinitialisierung mit `Arrays.fill`

```java
int[] werte = new int[1000];
Arrays.fill(werte, -1);

// Bereichsweise
Arrays.fill(werte, 0, 500, 0);
Arrays.fill(werte, 500, 1000, 100);
```

---

## 12. Konvertierung zwischen Arrays und Listen

| Ziel | Methode |
|---|---|
| Array → List (fix) | `Arrays.asList(arr)` |
| Array → List (änderbar) | `new ArrayList<>(Arrays.asList(arr))` |
| Array → Stream | `Arrays.stream(arr)` |
| List → Array | `list.toArray(new String[0])` |
| String → Char-Array | `s.toCharArray()` |

```java
String[] namenArr = {"Anna", "Bob", "Clara"};
List<String> namenListe = new ArrayList<>(Arrays.asList(namenArr));
namenListe.add("David");   // funktioniert

String[] zurueck = namenListe.toArray(new String[0]);
```

---

## 13. Lernziele und Wiederholungsfragen

### Wiederholungsfragen

1. Welche Indizes sind in einem Array der Länge `n` zulässig?
2. Was gibt `matrix[2].length` bei `int[][] matrix = new int[5][10]` zurück?
3. Warum kompiliert `for (String[] arr : matrix) {}` bei einem Jagged Array?
4. Welcher Sortier-Algorithmus wird seit Java 7 für `int[]` in `Arrays.sort()` verwendet?
5. Was ist der Unterschied zwischen `Arrays.equals(a, b)` und `a.equals(b)`?
6. Welche Wachstumsrate hat `ArrayList` bei `add()`?
7. Wie kann man ein `String[]` in eine veränderbare `List<String>` verwandeln?

---

## 14. Quellen und Bildnachweise

### Bildnachweise

- Memory Layout eines Java Arrays: <https://www.baeldung.com/java-memory-layout>
- Stack/Heap-Diagramm (Notionalmachines): <https://notionalmachines.github.io/nms/StackAndHeapDiagram-4.html>
- Jagged Array Memory Layout: <https://www.baeldung.com/java-jagged-arrays>

### Deutsche und englische Lehrquellen

- Handbuch der Java-Programmierung, Uni Düsseldorf: <https://dbs.cs.uni-duesseldorf.de/lehre/docs/java/javabuch/html/k100026.html>
- Codegree – Java Array Guide: <https://codegree.de/java-array-der-grosse-guide/>
- Happy Coders – Initialize Arrays: <https://www.happycoders.eu/java/initialize-array-java/>
- CompileNRUN – Multidimensional Arrays: <https://www.compilenrun.com/docs/language/java/java-arrays-and-strings/java-multidimensional-arrays/>
- GeeksforGeeks – Jagged Array: <https://www.geeksforgeeks.org/java/jagged-array-in-java/>
- Javabeginners – Erweiterte for-Schleife: <https://javabeginners.de/Schleifen_und_Verzweigungen/Erweiterte_for-Schleife.php>
- Baeldung – java.util.Arrays: <https://www.baeldung.com/java-util-arrays>
- Oracle JDK 8 – Arrays API: <https://docs.oracle.com/javase/8/docs/api/java/util/Arrays.html>
- GeeksforGeeks – ArrayIndexOutOfBoundsException: <https://www.geeksforgeeks.org/java/array-index-out-of-bounds-exception-in-java/>
- Baeldung – ArrayIndexOutOfBoundsException: <https://www.baeldung.com/java-arrayindexoutofboundsexception>
- Oracle Docs – Varargs: <https://docs.oracle.com/javase/8/docs/technotes/guides/language/varargs.html>
- HowToDoInJava – Array vs ArrayList: <https://howtodoinjava.com/java/array/array-vs-arraylist/>
- GeeksforGeeks – Internal Working of ArrayList: <https://www.geeksforgeeks.org/java/internal-working-of-arraylist-in-java/>
- Baeldung – Array vs List Performance: <https://www.baeldung.com/java-array-vs-list-performance>
- Baeldung – Quicksort in Java: <https://www.baeldung.com/java-quicksort>

---

## 15. Zusammenfassung

Arrays sind ein zentrales Strukturelement in Java. Sie bieten schnellen Direktzugriff, sind aber in ihrer Größe unveränderlich.

### 10 zentrale Merksätze

1. Arrays sind Objekte – auch Primitive-Arrays.
2. Indizes beginnen bei `0`, das letzte Element hat Index `length − 1`.
3. Mehrdimensionale Arrays sind Arrays von Arrays – Jagged Arrays erlaubt.
4. `for-each` ist read-only und erlaubt keine Strukturänderungen.
5. `Arrays.sort()` nutzt Dual-Pivot-Quicksort (Primitive) bzw. TimSort (Objekte).
6. `Arrays.binarySearch()` setzt ein sortiertes Array voraus.
7. `Arrays.equals()` vergleicht Inhalte; `==`/`equals()` vergleicht Referenzen.
8. `args[]` ist das Eingabe-Array der `main`-Methode.
9. `ArrayList` wächst um Faktor 1,5, Arrays sind statisch.
10. Varargs sind syntaktischer Zucker für Arrays.

### Selbsttest-Checkliste

- [ ] Ich kann Arrays deklarieren, instanziieren und initialisieren.
- [ ] Ich kenne die Grenzen des gültigen Indexbereichs.
- [ ] Ich kann Jagged Arrays und rechteckige Arrays unterscheiden.
- [ ] Ich wähle zwischen `for`, `for-each` und der `Arrays`-Klasse.
- [ ] Ich erkenne und vermeide `ArrayIndexOutOfBoundsException`.
- [ ] Ich kann `args[]` parsen.
- [ ] Ich erkläre den Unterschied zwischen Array und `ArrayList`.

---

*Stand: Java 21 LTS — Quelle: https://moodle.oszimt.de/course/view.php?id=1934 — Recherche 2026*
