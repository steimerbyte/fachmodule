# Fachmodul: Konsolen-Ein- und -Ausgaben (Java)

**Kurs-ID:** 1948
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1948
**Bezugsstand:** Java 21 LTS

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Das Konsolenmodell von Java](#2-das-konsolenmodell-von-java)
3. [print, println und printf](#3-print-println-und-printf)
4. [Format-Strings](#4-format-strings)
5. [Scanner für Benutzereingaben](#5-scanner-für-benutzereingaben)
6. [BufferedReader für zeilenorientierte Eingabe](#6-bufferedreader-für-zeilenorientierte-eingabe)
7. [NumberFormatException und Eingabevalidierung](#7-numberformatexception-und-eingabevalidierung)
8. [String.format und Formatter](#8-stringformat-und-formatter)
9. [ANSI-Escape-Sequenzen](#9-ansi-escape-sequenzen)
10. [Das Eingabeaufforderungs-Pattern](#10-das-eingabeaufforderungs-pattern)
11. [Vollständiges Beispielprogramm](#11-vollständiges-beispielprogramm)
12. [Typische Fehler und Lösungen](#12-typische-fehler-und-lösungen)
13. [Didaktische Übungen](#13-didaktische-übungen)
14. [Bild- und Visualisierungsverweise](#14-bild-und-visualisierungsverweise)
15. [Quellen](#15-quellen)
16. [Zusammenfassung](#16-zusammenfassung)

---

## 1. Lernziele

Nach diesem Fachmodul können Sie:

- Text und Werte mit `System.out.print`, `println` und `printf` ausgeben,
- Format-Strings mit Platzhaltern wie `%d`, `%s` und `%f` schreiben,
- Benutzereingaben mit `Scanner` und `BufferedReader` lesen,
- Eingaben sicher validieren und `NumberFormatException` behandeln,
- `String.format` und `Formatter` passend einsetzen,
- ANSI-Escape-Sequenzen für farbige und formatierte Ausgaben nutzen,
- robuste Eingabeaufforderungen und Wiederholungsschleifen entwerfen,
- typische Probleme beim Wechsel zwischen `nextInt()` und `nextLine()` vermeiden.

---

## 2. Das Konsolenmodell von Java

Eine Konsolenanwendung kommuniziert über drei Standardkanäle:

| Kanal | Java-Objekt | Zweck |
|---|---|---|
| Standardeingabe | `System.in` | Tastatureingaben |
| Standardausgabe | `System.out` | Normale Programmausgaben |
| Fehlerausgabe | `System.err` | Fehlermeldungen und Diagnose |

`System.out` ist ein Objekt der Klasse `PrintStream`. Deshalb stehen dort Methoden wie `print`, `println` und `printf` zur Verfügung. `System.in` ist dagegen ein byteorientierter Eingabestrom. Für die praktische Verarbeitung wird er meist durch `Scanner` oder `BufferedReader` umschlossen.

```java
public class EinfacheKonsole {
    public static void main(String[] args) {
        System.out.println("Programm gestartet.");
        System.out.print("Diese Ausgabe endet nicht mit einem Zeilenumbruch.");
        System.err.println("Eine Fehlermeldung.");
    }
}
```

> `System.err` kann vom Betriebssystem und von Entwicklungsumgebungen getrennt von `System.out` behandelt werden.

---

## 3. print, println und printf

### 3.1 System.out.print

`print` gibt einen Wert aus, fügt aber keinen Zeilenumbruch hinzu:

```java
System.out.print("Hallo ");
System.out.print("Welt");
```

```text
Hallo Welt
```

Das ist besonders nützlich für Eingabeaufforderungen:

```java
System.out.print("Bitte geben Sie Ihren Namen ein: ");
```

### 3.2 System.out.println

`println` beendet die Ausgabe mit einem Zeilenumbruch:

```java
System.out.println("Erste Zeile");
System.out.println("Zweite Zeile");
```

Für plattformgerechte Zeilenumbrüche innerhalb eines `printf`-Formats sollte man **`%n`** statt eines fest kodierten `\n` verwenden.

### 3.3 System.out.printf

`printf` steht für "print formatted". Die Methode verarbeitet einen Format-String und die übergebenen Werte:

```java
String name  = "Mira";
int    alter = 19;

System.out.printf("Name: %s, Alter: %d%n", name, alter);
```

```text
Name: Mira, Alter: 19
```

Ein vertauschtes oder inkompatibles Argument führt häufig zu einer `IllegalFormatConversionException`.

---

## 4. Format-Strings

### 4.1 Wichtige Platzhalter

| Platzhalter | Erwarteter Wert | Beispiel |
|---|---|---|
| `%s` | String oder beliebiges Objekt | `"Berlin"` |
| `%d` | Ganzzahl (`byte`, `short`, `int`, `long`) | `42` |
| `%f` | Gleitkommazahl | `3.14159` |
| `%e` | Wissenschaftliche Schreibweise | `1.23e+04` |
| `%c` | Einzelnes Zeichen | `'A'` |
| `%b` | Boolean-Ausgabe | `true` |
| `%x` | Hexadezimalzahl | `ff` |
| `%o` | Oktalzahl | `17` |
| `%n` | Plattformgerechter Zeilenumbruch | – |
| `%%` | Prozentzeichen | `%` |

### 4.2 Nachkommastellen

Mit `.2f` wird eine Gleitkommazahl mit zwei Nachkommastellen ausgegeben:

```java
double pi = 3.141592653589793;

System.out.printf("Standard: %f%n",      pi);
System.out.printf("Zwei Stellen: %.2f%n", pi);
System.out.printf("Vier Stellen: %.4f%n", pi);
```

```text
Standard: 3.141593
Zwei Stellen: 3.14
Vier Stellen: 3.1416
```

### 4.3 Feldbreite und Ausrichtung

```java
System.out.printf("|%10s|%n",  "Java");
System.out.printf("|%-10s|%n", "Java");
System.out.printf("|%05d|%n",  42);
```

```text
|      Java|
|Java      |
|00042|
```

Beispieltabelle:

```java
System.out.printf("%-15s %8s %10s%n",   "Artikel", "Menge", "Preis");
System.out.printf("%-15s %8d %10.2f%n", "Tastatur", 3,      49.99);
System.out.printf("%-15s %8d %10.2f%n", "Maus",     8,      19.50);
```

### 4.4 Argumentpositionen

```java
System.out.printf("%2$s lernt %1$s.%n", "Java", "Alex");
// Alex lernt Java.

System.out.printf("%1$d + %1$d = %2$d%n", 5, 10);
// 5 + 5 = 10
```

---

## 5. Scanner für Benutzereingaben

`Scanner` ist die einfachste Standardlösung für interaktive Eingaben. Sie liest Tokens oder Zeilen aus einem Eingabestrom und kann primitive Datentypen direkt konvertieren:

```java
import java.util.Scanner;

public class ScannerBeispiel {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Wie heißen Sie? ");
        String name = scanner.nextLine();

        System.out.print("Wie alt sind Sie? ");
        int alter = scanner.nextInt();

        System.out.printf("Hallo %s, Sie sind %d Jahre alt.%n", name, alter);
        scanner.close();
    }
}
```

### 5.1 Wichtige Methoden

| Methode | Bedeutung |
|---|---|
| `next()` | nächstes Token bis zum Leerzeichen |
| `nextLine()` | komplette Eingabezeile |
| `nextInt()` | liest eine Ganzzahl |
| `nextLong()` | liest einen `long` |
| `nextDouble()` | liest eine Gleitkommazahl |
| `nextBoolean()` | liest `true` oder `false` |
| `hasNextInt()` | prüft, ob das nächste Token eine Ganzzahl ist |
| `hasNextDouble()` | prüft, ob das nächste Token eine Gleitkommazahl ist |
| `hasNextLine()` | prüft, ob noch eine Zeile vorhanden ist |

### 5.2 next() versus nextLine()

```java
System.out.print("Vorname: ");
String vorname = scanner.next();        // liest nur bis Leerzeichen

System.out.print("Vollständiger Name: ");
String vollerName = scanner.nextLine(); // liest gesamte Zeile
```

Bei einer Eingabe wie `Anna Schmidt` liest `next()` nur `Anna`.

### 5.3 Das Restzeilenproblem

Nach `nextInt()` bleibt der Zeilenumbruch im Eingabepuffer. Ein direkt anschließendes `nextLine()` liest deshalb häufig nur diese leere Restzeile:

```java
int alter = scanner.nextInt();
scanner.nextLine();                     // Restumbruch verbrauchen

System.out.print("Name: ");
String name = scanner.nextLine();
```

Noch robuster ist es, alles als Text zu lesen und selbst zu konvertieren:

```java
System.out.print("Alter: ");
int alter = Integer.parseInt(scanner.nextLine());
```

### 5.4 Validierung mit hasNextInt

```java
Scanner scanner = new Scanner(System.in);
int alter;

while (true) {
    System.out.print("Alter: ");
    if (scanner.hasNextInt()) {
        alter = scanner.nextInt();
        scanner.nextLine();
        if (alter >= 0 && alter <= 130) {
            break;
        }
        System.out.println("Das Alter muss zwischen 0 und 130 liegen.");
    } else {
        System.out.println("Bitte geben Sie eine Ganzzahl ein.");
        scanner.nextLine();             // ungültiges Token verwerfen
    }
}
```

---

## 6. BufferedReader für zeilenorientierte Eingabe

`BufferedReader` liest Zeichen effizient aus einem `Reader`. Für die Konsole wird `System.in` zunächst mit `InputStreamReader` von Bytes in Zeichen umgewandelt:

```java
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BufferedReaderBeispiel {
    public static void main(String[] args) throws IOException {
        BufferedReader reader =
            new BufferedReader(new InputStreamReader(System.in));

        System.out.print("Name: ");
        String name = reader.readLine();

        System.out.printf("Hallo %s!%n", name);
    }
}
```

`readLine()` liest bis zum Zeilenende, entfernt den Zeilenumbruch und gibt den Text als `String` zurück. Bei Ende des Datenstroms liefert die Methode `null`.

### 6.1 Fehlerbehandlung

```java
try {
    BufferedReader reader =
        new BufferedReader(new InputStreamReader(System.in));

    System.out.print("Eingabe: ");
    String eingabe = reader.readLine();

    if (eingabe != null) {
        System.out.println("Sie eingegeben: " + eingabe);
    }
} catch (IOException e) {
    System.err.println("Fehler beim Lesen: " + e.getMessage());
}
```

### 6.2 Zahlen mit BufferedReader

```java
System.out.print("Menge: ");
int menge = Integer.parseInt(reader.readLine());

System.out.print("Preis: ");
double preis = Double.parseDouble(reader.readLine());
```

`NumberFormatException` muss zusätzlich berücksichtigt werden.

### 6.3 Vergleich Scanner und BufferedReader

| Kriterium | `Scanner` | `BufferedReader` |
|---|---|---|
| Einstieg | sehr einfach | etwas mehr Boilerplate |
| Zahlenkonvertierung | direkte Methoden | manuelle Konvertierung |
| Zeilenlesen | `nextLine()` | `readLine()` |
| Tokenverarbeitung | sehr komfortabel | muss selbst erfolgen |
| Geschwindigkeit | meist langsamer | meist effizienter |
| Ausnahmen | Parsing oft intern | `IOException` |
| Geeignet für | Lernprogramme, kleine Tools | große Eingabemengen, Zeilenverarbeitung |

---

## 7. NumberFormatException und Eingabevalidierung

Eine `NumberFormatException` entsteht, wenn ein String nicht in die gewünschte Zahl umgewandelt werden kann:

```java
int zahl = Integer.parseInt("abc");
// → Exception in thread "main" java.lang.NumberFormatException
```

Typische Ursachen:

- Buchstaben statt Ziffern
- leere Eingabe
- falsches Dezimaltrennzeichen
- übergroße Zahl
- zusätzliche Zeichen wie `12€`
- Leerzeichen oder unerwartete Formatierung

### 7.1 Sicheres Parsen

```java
public static int leseGanzzahl(Scanner scanner) {
    while (true) {
        System.out.print("Ganzzahl: ");
        String text = scanner.nextLine().trim();

        try {
            return Integer.parseInt(text);
        } catch (NumberFormatException e) {
            System.out.println("Ungültige Eingabe. Beispiel: 42");
        }
    }
}
```

### 7.2 Bereichsprüfung

Syntaxprüfung und fachliche Prüfung sind zwei verschiedene Schritte:

```java
public static int leseAlter(Scanner scanner) {
    while (true) {
        System.out.print("Alter [0–130]: ");
        String text = scanner.nextLine().trim();

        try {
            int alter = Integer.parseInt(text);
            if (alter >= 0 && alter <= 130) {
                return alter;
            }
            System.out.println("Der Wert liegt außerhalb des Bereichs.");
        } catch (NumberFormatException e) {
            System.out.println("Bitte nur ganze Zahlen eingeben.");
        }
    }
}
```

### 7.3 Dezimalzahlen und deutsches Dezimaltrennzeichen

```java
String text = scanner.nextLine().trim().replace(',', '.');

try {
    double wert = Double.parseDouble(text);
    System.out.println(wert);
} catch (NumberFormatException e) {
    System.out.println("Keine gültige Dezimalzahl.");
}
```

Bei Geldbeträgen sollte `BigDecimal` verwendet werden:

```java
import java.math.BigDecimal;

BigDecimal preis = new BigDecimal("19.99");
```

---

## 8. String.format und Formatter

### 8.1 String.format

`String.format` erzeugt einen neuen formatierten String, ohne ihn direkt auszugeben:

```java
String name   = "Lea";
int    punkte = 95;

String meldung = String.format(
    "Teilnehmerin %s hat %d Punkte erreicht.",
    name,
    punkte);

System.out.println(meldung);
```

Mit Locale:

```java
import java.util.Locale;

double preis = 1234.56;

String deutsch  = String.format(Locale.GERMANY, "%,.2f", preis);
String standard = String.format(Locale.US,       "%,.2f", preis);

System.out.println(deutsch);  // 1.234,56
System.out.println(standard); // 1,234.56
```

### 8.2 Formatter

`Formatter` ist die zugrunde liegende, wiederverwendbare Formatierungsmaschine:

```java
import java.util.Formatter;

public class FormatterBeispiel {
    public static void main(String[] args) {
        StringBuilder ziel = new StringBuilder();

        try (Formatter formatter = new Formatter(ziel)) {
            formatter.format("Name: %s, Wert: %.2f%n", "Sensor A", 23.456);
        }

        System.out.print(ziel);
    }
}
```

---

## 9. ANSI-Escape-Sequenzen

Viele moderne Terminals verstehen ANSI-Steuersequenzen. Eine Sequenz beginnt mit dem Escape-Zeichen:

```java
"\u001B["
```

### 9.1 Grundfarben

| Code | Farbe |
|---|---|
| `30` | Schwarz |
| `31` | Rot |
| `32` | Grün |
| `33` | Gelb |
| `34` | Blau |
| `35` | Magenta |
| `36` | Cyan |
| `37` | Weiß |
| `0`  | Reset |

```java
public class Farben {
    static final String RESET = "\u001B[0m";
    static final String ROT   = "\u001B[31m";
    static final String GRUEN = "\u001B[32m";
    static final String GELB  = "\u001B[33m";

    public static void main(String[] args) {
        System.out.println(GRUEN + "OK" + RESET);
        System.out.println(ROT + "Fehler" + RESET);
        System.out.println(GELB + "Warnung" + RESET);
    }
}
```

> Ohne `RESET` kann die Farbe auch nach dem Programmende für nachfolgende Ausgaben aktiv bleiben.

### 9.2 Formatierung kombinieren

```java
String BOLD  = "\u001B[1m";
String CYAN  = "\u001B[36m";
String RESET = "\u001B[0m";

System.out.printf("%s%sSystemstatus%s%n", BOLD, CYAN, RESET);
```

### 9.3 Kompatibilität

ANSI-Unterstützung hängt vom Terminal ab:

- Linux-/macOS-Terminals unterstützen ANSI gewöhnlich
- Moderne Windows-Terminals und PowerShell unterstützen ANSI meist
- Ältere Eingabeaufforderungen, manche IDE-Konsolen zeigen die Sequenzen wörtlich
- Eclipse bietet eine eigene Einstellung zur ANSI-Unterstützung
- Die Bibliothek Jansi kann plattformübergreifend helfen

> **Faustregel:** Farben sollten niemals die einzige Information sein.

---

## 10. Das Eingabeaufforderungs-Pattern

Eine gute Konsolenanwendung folgt diesem Muster:

1. Klare Eingabeaufforderung anzeigen
2. Komplette Eingabe lesen
3. Eingabe trimmen
4. Syntax prüfen
5. Fachbereich prüfen
6. Bei Fehler verständliche Meldung ausgeben
7. Eingabe wiederholen
8. Bei Erfolg weiterarbeiten

### 10.1 Wiederverwendbare Hilfsmethoden

```java
import java.util.Scanner;

public class Eingabe {
    public static String leseNichtLeerenText(Scanner scanner, String prompt) {
        while (true) {
            System.out.print(prompt);
            String text = scanner.nextLine().trim();

            if (!text.isEmpty()) {
                return text;
            }
            System.out.println("Die Eingabe darf nicht leer sein.");
        }
    }

    public static int leseInt(Scanner scanner, String prompt, int min, int max) {
        while (true) {
            System.out.print(prompt);
            String text = scanner.nextLine().trim();

            try {
                int wert = Integer.parseInt(text);
                if (wert >= min && wert <= max) {
                    return wert;
                }
                System.out.printf(
                    "Bitte eine Zahl zwischen %d und %d eingeben.%n",
                    min, max);
            } catch (NumberFormatException e) {
                System.out.println("Bitte eine gültige Ganzzahl eingeben.");
            }
        }
    }

    public static boolean leseJaNein(Scanner scanner, String prompt) {
        while (true) {
            System.out.print(prompt + " [j/n]: ");
            String text = scanner.nextLine().trim().toLowerCase();

            switch (text) {
                case "j": case "ja":  return true;
                case "n": case "nein": return false;
                default:
                    System.out.println("Bitte mit j/ja oder n/nein antworten.");
            }
        }
    }
}
```

Verwendung:

```java
import java.util.Scanner;

public class Anwendung {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String name        = Eingabe.leseNichtLeerenText(scanner, "Name: ");
        int    alter       = Eingabe.leseInt(scanner, "Alter [0–130]: ", 0, 130);
        boolean zustimmung = Eingabe.leseJaNein(scanner, "Daten speichern?");

        System.out.printf("%nName: %s%nAlter: %d%nSpeichern: %s%n",
            name, alter, zustimmung ? "ja" : "nein");
    }
}
```

### 10.2 Konsolenbeispiel als Text

```text
Name:
Die Eingabe darf nicht leer sein.
Name: Robin
Alter [0–130]: abc
Bitte eine gültige Ganzzahl eingeben.
Alter [0–130]: 250
Bitte eine Zahl zwischen 0 und 130 eingeben.
Alter [0–130]: 22
Daten speichern? [j/n]: vielleicht
Bitte mit j/ja oder n/nein antworten.
Daten speichern? [j/n]: j

Name: Robin
Alter: 22
Speichern: ja
```

---

## 11. Vollständiges Beispielprogramm

```java
import java.util.Locale;
import java.util.Scanner;

public class Konsolenformular {
    private static final String RESET = "\u001B[0m";
    private static final String GRUEN = "\u001B[32m";
    private static final String ROT   = "\u001B[31m";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("=== Kundendatenerfassung ===");

        String name    = leseText(scanner, "Name: ");
        int    alter   = leseGanzzahl(scanner, "Alter: ", 0, 130);
        double groesse = leseDezimalzahl(scanner, "Größe in Metern: ", 0.3, 2.5);

        System.out.println();
        System.out.printf("Datensatz: %s, %d Jahre, %.2f m%n",
            name, alter, groesse);

        System.out.print("Sind die Angaben korrekt? [j/n]: ");
        String bestaetigung = scanner.nextLine()
            .trim().toLowerCase(Locale.ROOT);

        if (bestaetigung.equals("j") || bestaetigung.equals("ja")) {
            System.out.println(GRUEN + "Gespeichert." + RESET);
        } else {
            System.out.println(ROT + "Verworfen." + RESET);
        }

        scanner.close();
    }

    private static String leseText(Scanner scanner, String prompt) {
        while (true) {
            System.out.print(prompt);
            String text = scanner.nextLine().trim();
            if (!text.isEmpty()) {
                return text;
            }
            System.out.println("Bitte Text eingeben.");
        }
    }

    private static int leseGanzzahl(Scanner scanner, String prompt,
                                    int min, int max) {
        while (true) {
            System.out.print(prompt);
            String text = scanner.nextLine().trim();

            try {
                int wert = Integer.parseInt(text);
                if (wert >= min && wert <= max) {
                    return wert;
                }
                System.out.printf("Erlaubt sind Werte von %d bis %d.%n",
                    min, max);
            } catch (NumberFormatException e) {
                System.out.println("Ungültige Ganzzahl.");
            }
        }
    }

    private static double leseDezimalzahl(Scanner scanner, String prompt,
                                          double min, double max) {
        while (true) {
            System.out.print(prompt);
            String text = scanner.nextLine().trim().replace(',', '.');

            try {
                double wert = Double.parseDouble(text);
                if (wert >= min && wert <= max) {
                    return wert;
                }
                System.out.printf(Locale.GERMANY,
                    "Wert muss zwischen %.2f und %.2f liegen.%n",
                    min, max);
            } catch (NumberFormatException e) {
                System.out.println(
                    "Bitte eine Dezimalzahl eingeben, z. B. 1,80.");
            }
        }
    }
}
```

---

## 12. Typische Fehler und Lösungen

| Fehler | Ursache | Lösung |
|---|---|---|
| `nextLine()` liefert leere Zeichenkette | Restzeilenumbruch nach `nextInt()` | `nextLine()` einmal zusätzlich aufrufen oder zeilenorientiert lesen |
| Endlosschleife bei falscher Zahl | Ungültiges Token wird nicht verworfen | `scanner.nextLine()` im Fehlerzweig |
| `NumberFormatException` | Text ist keine gültige Zahl | `try-catch`, vorherige Prüfung |
| Prozentzeichen wird falsch interpretiert | `%` beginnt Formatangabe | `%%` verwenden |
| Falsche Nachkommastellen | `%f` zeigt standardmäßig 6 Stellen | `%.2f`, `%.3f` |
| ANSI-Codes werden sichtbar | Terminal unterstützt ANSI nicht | Terminal wechseln oder Jansi |
| Dezimalzahl mit Komma schlägt fehl | Parser erwartet Punkt | Eingabe normalisieren oder `NumberFormat` |
| Ressourcen mehrfach geschlossen | mehrere Scanner auf `System.in` | einen zentralen Scanner verwenden |
| Prompt erscheint nicht sofort | Ausgabe wurde gepuffert | `System.out.flush()` |

---

## 13. Didaktische Übungen

### Übung 1 – Begrüßung

Lesen Sie Name und Wohnort ein und geben Sie aus:

```text
Hallo Lara aus Potsdam!
```

### Übung 2 – Rechteck

Lesen Sie Länge und Breite ein. Geben Sie Fläche und Umfang mit zwei Nachkommastellen aus.

```text
Fläche = Länge × Breite
Umfang = 2 × (Länge + Breite)
```

### Übung 3 – Tabellenformat

Geben Sie fünf Produkte mit Name, Menge und Preis in ausgerichteten Spalten aus.

### Übung 4 – Robuste Altersabfrage

Akzeptieren Sie nur Werte zwischen 0 und 130. Bei falschen Eingaben darf das Programm nicht abstürzen.

### Übung 5 – Farbiges Menü

Erstellen Sie ein Menü mit ANSI-Farben:

```text
[1] Benutzer anlegen
[2] Benutzer anzeigen
[3] Programm beenden
```

Bei unbekannten Eingaben soll eine rote Fehlermeldung erscheinen.

### Übung 6 – BufferedReader

Implementieren Sie die Rechteckaufgabe zusätzlich mit `BufferedReader`. Vergleichen Sie Quelltext und Fehlerbehandlung mit der `Scanner`-Version.

---

## 14. Bild- und Visualisierungsverweise

- Oracle – `PrintStream`-API: <https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/io/PrintStream.html>
- Oracle – `Formatter`-API: <https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/Formatter.html>
- Oracle – `BufferedReader`-API: <https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/io/BufferedReader.html>
- Oracle – `Scanner`-API: <https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/Scanner.html>
- Baeldung – Console Input/Output in Java: <https://www.baeldung.com/java-console-input-output>
- Jansi-Projekt: <https://github.com/fusesource/jansi>
- Eclipse – ANSI-Konsolenunterstützung: <https://help.eclipse.org/latest/topic/org.eclipse.jdt.doc.user/reference/run-debug/ref-console_ansi.htm>
- Li Haoyi – ANSI Escape Codes: <https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html>

---

## 15. Quellen

- Oracle Java API – `PrintStream`, `Scanner`, `BufferedReader`, `Formatter`
- Baeldung – Java Console Input/Output, `String.format`, `NumberFormatException`
- Java Practices – Console Input
- Jansi GitHub-Projekt
- Eclipse – ANSI Console Documentation
- Pressbooks – Reprompting Pattern
- Li Haoyi – ANSI Escape Codes

---

## 16. Zusammenfassung

Für einfache Ausgaben reichen `print` und `println`. Sobald Werte ausgerichtet, gerundet oder in Tabellen dargestellt werden sollen, ist `printf` mit Formatangaben die passende Lösung. `%s` steht für Text, `%d` für Ganzzahlen, `%f` für Gleitkommazahlen und `%n` für einen plattformgerechten Zeilenumbruch.

`Scanner` bietet einen komfortablen Einstieg in interaktive Programme. Die Kombination aus `nextInt()` und `nextLine()` ist fehleranfällig, weil numerische Methoden den Zeilenumbruch nicht vollständig verbrauchen. Eine robuste Alternative ist, jede Zeile mit `nextLine()` einzulesen und anschließend explizit zu parsen.

`BufferedReader` ist zeilenorientiert und effizient, benötigt aber zusätzliche Konvertierung und Fehlerbehandlung. `String.format` erzeugt formatierte Texte, während `Formatter` die zugrunde liegende wiederverwendbare Formatierungsinstanz darstellt.

`NumberFormatException` darf bei Benutzereingaben nicht unkontrolliert bis zum Programmabbruch gelangen. Gute Programme validieren zunächst die Eingabe, behandeln Konvertierungsfehler, prüfen fachliche Wertebereiche und fragen bei Fehlern erneut.

ANSI-Escape-Sequenzen können Konsolenausgaben verständlicher machen, sind aber terminalabhängig. Farben sollten daher nur ergänzend eingesetzt werden. Das zentrale Qualitätsmerkmal jeder Konsolenanwendung ist ein klares, wiederverwendbares Eingabeaufforderungs-Pattern mit verständlichen Fehlermeldungen und stabilen Validierungsschleifen.

### Selbsttest-Checkliste

- [ ] Ich kann `print`, `println` und `printf` sicher einsetzen.
- [ ] Ich kenne die wichtigsten Format-Platzhalter.
- [ ] Ich verstehe das Restzeilenproblem bei `nextInt()`/`nextLine()`.
- [ ] Ich kann Eingaben robust validieren.
- [ ] Ich kenne den Unterschied zwischen `Scanner` und `BufferedReader`.
- [ ] Ich kann ANSI-Sequenzen sicher einsetzen.
- [ ] Ich nutze das Eingabeaufforderungs-Pattern.

---

*Stand: Java 21 LTS — Quelle: https://moodle.oszimt.de/course/view.php?id=1948 — Recherche 2026*
