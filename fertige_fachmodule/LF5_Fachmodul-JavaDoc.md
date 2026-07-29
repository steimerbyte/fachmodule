# Fachmodul: JavaDoc

**Kurs-ID:** 1918
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1918

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist JavaDoc?](#2-was-ist-javadoc)
3. [Geschichte und Zweck](#3-geschichte-und-zweck)
4. [JavaDoc-Kommentare](#4-javadoc-kommentare)
5. [Standard-Tags](#5-standard-tags)
6. [HTML und CSS in JavaDoc](#6-html-und-css-in-javadoc)
7. [javadoc-Tool](#7-javadoc-tool)
8. [Maven- und Gradle-Plugins](#8-maven-und-gradle-plugins)
9. [JavaDoc in IDEs](#9-javadoc-in-ides)
10. [Best Practices](#10-best-practices)
11. [Übungen](#11-übungen)
12. [Zusammenfassung](#12-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- JavaDoc-Kommentare schreiben,
- Standard-Tags nutzen,
- javadoc-Tool bedienen,
- Maven/Gradle-Plugins für JavaDoc einsetzen,
- Best Practices anwenden.

---

## 2. Was ist JavaDoc?

**JavaDoc** ist ein **Dokumentationsgenerator** für Java-Quellcode. Er erzeugt aus speziellen Kommentaren **HTML-basierte API-Dokumentation**.

**Merkmale:**

- Generierung aus Quellcode
- HTML-Output mit Navigation
- Paket-, Klassen-, Methoden-Hierarchien
- In IDEs integriert (IntelliJ, Eclipse, VS Code)

---

## 3. Geschichte und Zweck

- Eingeführt mit Java 1.0 (1996)
- De-facto-Standard für Java-API-Dokumentation
- Vorbild für viele andere Sprachen (JSDoc, phpDocumentor)

**Zweck:**

- API-Dokumentation direkt im Quellcode
- Immer aktuell (mit dem Code zusammen versioniert)
- Generierte HTML-Dokumentation
- Werkzeug-Unterstützung

---

## 4. JavaDoc-Kommentare

### 4.1 Syntax

```java
/**
 * Kurze Beschreibung in einer Zeile.
 *
 * Ausführlichere Beschreibung in mehreren Zeilen.
 * Hier können Absätze, Listen und HTML verwendet werden.
 *
 * @author Max Mustermann
 * @version 1.0
 * @since 2024-01-15
 */
public class MeineKlasse {
    /**
     * Methode, die etwas tut.
     *
     * @param eingabe der Eingabewert
     * @return der Rückgabewert
     * @throws IllegalArgumentException wenn ungültig
     */
    public int methode(int eingabe) throws IllegalArgumentException {
        return eingabe * 2;
    }
}
```

### 4.2 Position

- Direkt vor der dokumentierten Einheit (Klasse, Methode, Feld)
- Beginnt mit `/**` und endet mit `*/`
- Erste Zeile: Kurzbeschreibung
- Folgezeilen: ausführliche Beschreibung

---

## 5. Standard-Tags

### 5.1 Übersicht

| Tag | Bedeutung | Wo verwendet |
|---|---|---|
| `@author` | Autor | Klasse, Interface |
| `@version` | Version | Klasse, Interface |
| `@since` | seit wann | Klasse, Methode, Feld |
| `@param` | Parameter | Methode, Konstruktor |
| `@return` | Rückgabewert | Methode (nicht void) |
| `@throws` / `@exception` | Exception | Methode, Konstruktor |
| `@see` | Verweis | überall |
| `@deprecated` | Veraltet | überall |
| `@link` | Inline-Link | überall |
| `@code` | Code-Style | überall |
| `@literal` | Rohtext (kein HTML) | überall |

### 5.2 Beispiele

```java
/**
 * Berechnet die Fakultät einer Zahl.
 *
 * @param n nicht-negative Zahl
 * @return die Fakultät von n
 * @throws IllegalArgumentException wenn n negativ ist
 * @see java.math.BigInteger
 * @since 1.0
 */
public long factorial(int n) {
    if (n < 0) throw new IllegalArgumentException();
    long result = 1;
    for (int i = 2; i <= n; i++) result *= i;
    return result;
}
```

### 5.3 `@link` und `@see`

```java
/**
 * Verarbeitet die Daten.
 *
 * @see #process(Data)  // Methode in derselben Klasse
 * @see OtherClass      // andere Klasse
 * @see OtherClass#method
 */
```

Inline-Verweise:

```java
/**
 * Nutzt {@link #process} für die Verarbeitung.
 */
```

### 5.4 `@code` und `@literal`

```java
/**
 * Beispiel: {@code if (x > 0) { ... }} wird geprüft.
 *
 * Generischer Name: {@literal <T>} wird nicht als HTML interpretiert.
 */
```

---

## 6. HTML und CSS in JavaDoc

### 6.1 HTML-Tags erlaubt

- `<p>`, `<b>`, `<i>`, `<u>`
- `<code>`, `<pre>`
- `<ul>`, `<ol>`, `<li>`
- `<a href="...">`
- `<table>`, `<tr>`, `<td>`

### 6.2 Beispiel mit HTML

```java
/**
 * Berechnet die Quersumme einer Zahl.
 *
 * <p>Beispiel:</p>
 * <pre>{@code
 * int sum = quersumme(123); // = 1+2+3 = 6
 * }</pre>
 *
 * <ul>
 *   <li>Iterativ</li>
 *   <li>Rekursiv</li>
 * </ul>
 *
 * @param n Zahl
 * @return Quersumme
 */
public int quersumme(int n) {
    int sum = 0;
    while (n > 0) { sum += n % 10; n /= 10; }
    return sum;
}
```

---

## 7. javadoc-Tool

### 7.1 Aufruf

```bash
javadoc -d doc -sourcepath src \
    -subpackages de.oszimt \
    -author -version -use \
    -encoding UTF-8 \
    -charset UTF-8 \
    -link https://docs.oracle.com/javase/8/docs/api
```

### 7.2 Wichtige Optionen

| Option | Bedeutung |
|---|---|
| `-d doc` | Ausgabeverzeichnis |
| `-sourcepath src` | Verzeichnis mit Quellcode |
| `-subpackages de.oszimt` | Alle Unterpakete |
| `-author` | `@author` einbeziehen |
| `-version` | `@version` einbeziehen |
| `-use` | "Use"-Seiten (wer verwendet wen) |
| `-encoding UTF-8` | Quellcode-Encoding |
| `-private` | auch private Member |
| `-package` | nur protected/public |
| `-public` | nur public (Default) |

---

## 8. Maven- und Gradle-Plugins

### 8.1 Maven

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-javadoc-plugin</artifactId>
    <version>3.5.0</version>
    <executions>
        <execution>
            <phase>site</phase>
            <goals><goal>javadoc</goal></goals>
        </execution>
    </executions>
</plugin>
```

### 8.2 Gradle

```groovy
plugins {
    id 'java'
    id 'org.jetbrains.dokka' version '1.9.0'
}

tasks.dokkaHtml {
    outputDirectory.set("$buildDir/dokka")
}
```

---

## 9. JavaDoc in IDEs

### 9.1 IntelliJ IDEA

- Automatische Generierung der Tags
- Live-Vorschau
- Quick-Fix für fehlende Tags
- Statische Analyse für fehlende JavaDoc

### 9.2 Eclipse

- Automatische Generierung via `Shift+Alt+J`
- Javadoc-Vorschau
- Templates anpassbar

### 9.3 VS Code

- JavaDoc-Plugin verfügbar
- Vorschau
- Outline-Ansicht

---

## 10. Best Practices

### 10.1 Was dokumentieren?

- **Alle public-Klassen und -Methoden**
- Konstruktoren, falls mehr als ein Konstruktor oder Parametrierung
- Interfaces und Enum-Konstanten
- Ausnahmen, die geworfen werden

### 10.2 Was nicht dokumentieren?

- Trivial-Implementierungen (Getter/Setter)
- Offensichtliche Informationen
- Implementierungsdetails, die sich ändern können

### 10.3 Stilregeln

- Kurze erste Zeile (eine Zeile Zusammenfassung)
- Aktive Sprache: "Berechnet ..." statt "Es wird berechnet ..."
- Beispielcode in `@code`-Blöcken
- Konsistente Formatierung

### 10.4 Beispiel gut vs. schlecht

**Schlecht:**

```java
/**
 * Diese Methode verarbeitet Daten.
 */
public void processData() { ... }
```

**Gut:**

```java
/**
 * Verarbeitet die Kunden-Daten und gibt sie als Liste zurück.
 *
 * Verwendet die eingestellte Konfiguration.
 *
 * @param data die zu verarbeitenden Daten
 * @return verarbeitete Liste
 * @throws DataException bei ungültigen Daten
 */
public List<Customer> processData(byte[] data) throws DataException { ... }
```

---

## 11. Übungen

### Übung 1 — JavaDoc schreiben

Schreiben Sie JavaDoc für eine Methode `int summe(int[] zahlen)`.

### Übung 2 — javadoc-Tool

Erzeugen Sie JavaDoc für Ihr eigenes Projekt.

### Übung 3 — Maven-Plugin

Konfigurieren Sie das maven-javadoc-Plugin in einer POM.

### Übung 4 — Best Practices

Welche Methoden sollte man NICHT dokumentieren?

### Übung 5 — Vererbung

Was bedeutet `@inheritDoc`?

### Übung 6 — Inline-Links

Verwenden Sie `{@link}` für Verweise auf andere Methoden.

---

## 12. Zusammenfassung

**JavaDoc** generiert HTML-Dokumentation aus speziellen Kommentaren:

**Syntax:** `/** ... */` direkt vor der Einheit

**Wichtige Tags:**

- `@param`, `@return`, `@throws` für Methoden
- `@author`, `@version`, `@since` für Klassen
- `@link`, `@see`, `@code`, `@literal` für Verweise

**Tool:** `javadoc` mit Optionen wie `-d`, `-sourcepath`, `-subpackages`

**Build-Tools:** maven-javadoc-plugin, Gradle Dokka

**Best Practices:**

- Public-API immer dokumentieren
- Kurze aktive Beschreibungen
- Konsistente Formatierung
- Build-Time-Validierung aktivieren

### Selbsttest-Checkliste

- [ ] Ich schreibe JavaDoc-Kommentare.
- [ ] Ich nutze Standard-Tags.
- [ ] Ich generiere JavaDoc mit dem Tool.
- [ ] Ich konfiguriere Maven/Gradle.
- [ ] Ich beachte Best Practices.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=1918 — Recherche 2026*
