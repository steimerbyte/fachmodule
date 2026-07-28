# Fachmodul: Dateien lesen/schreiben

**Kurs-ID:** 2715
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2715

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Dateien lesen und schreiben – Überblick](#2-dateien-lesen-und-schreiben--überblick)
3. [Java I/O – Klassiker](#3-java-io--klassiker)
4. [Java NIO (java.nio)](#4-java-nio-javanio)
5. [try-with-resources](#5-try-with-resources)
6. [Zeichenkodierung](#6-zeichenkodierung)
7. [Beispiel: CSV einlesen, JSON schreiben](#7-beispiel-csv-einlesen-json-schreiben)
8. [Übungen](#8-übungen)
9. [Zusammenfassung](#9-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Dateien in Java lesen und schreiben,
- die verschiedenen I/O-Klassen anwenden,
- try-with-resources für sicheres Schließen nutzen,
- Zeichencodierungen richtig einsetzen.

---

## 2. Dateien lesen und schreiben – Überblick

Java bietet mehrere I/O-APIs:

| API | Paket | Eigenschaft |
|---|---|---|
| **Java I/O (klassisches)** | `java.io` | stream-basiert, blockierend |
| **Java NIO** | `java.nio` | buffer-basiert, non-blocking möglich |
| **Java NIO.2** | `java.nio.file` | Path, Files, DirectoryStream |

---

## 3. Java I/O – Klassiker

### 3.1 Streams

- **Byte-Streams**: `InputStream`, `OutputStream`
- **Character-Streams**: `Reader`, `Writer`

### 3.2 Häufige Klassen

| Klasse | Beschreibung |
|---|---|
| `FileInputStream` | Bytes aus Datei lesen |
| `FileOutputStream` | Bytes in Datei schreiben |
| `FileReader` | Zeichen aus Datei lesen |
| `FileWriter` | Zeichen in Datei schreiben |
| `BufferedReader` | gepuffertes Lesen |
| `BufferedWriter` | gepuffertes Schreiben |
| `PrintWriter` | komfortables Schreiben mit `println` |

### 3.3 Beispiel

```java
import java.io.*;

try (BufferedReader reader = new BufferedReader(
        new FileReader("input.txt"));
     PrintWriter writer = new PrintWriter(
        new FileWriter("output.txt"))) {

    String line;
    while ((line = reader.readLine()) != null) {
        writer.println(line.toUpperCase());
    }
}
```

---

## 4. Java NIO (java.nio)

### 4.1 Path und Files

```java
import java.nio.file.*;

Path path = Paths.get("datei.txt");

// Datei lesen
List<String> lines = Files.readAllLines(path, StandardCharsets.UTF_8);

// Datei schreiben
Files.write(path, "Hallo".getBytes(StandardCharsets.UTF_8));

// Attribute
boolean exists = Files.exists(path);
long size = Files.size(path);
FileTime modified = Files.getLastModifiedTime(path);
```

### 4.2 Stream-basierte Methoden

```java
// Zeilen-Stream
try (Stream<String> lines = Files.lines(path)) {
    lines.filter(l -> l.length() > 5).forEach(System.out::println);
}

// Bytes lesen
byte[] data = Files.readAllBytes(path);

// Schreiben mit Append
Files.write(path, "Anhang".getBytes(), StandardOpenOption.APPEND);
```

### 4.3 Verzeichnisse

```java
Path dir = Paths.get("ordner");

// Verzeichnis anlegen
Files.createDirectories(dir);

// Inhalt auflisten
try (DirectoryStream<Path> stream = Files.newDirectoryStream(dir)) {
    for (Path entry : stream) {
        System.out.println(entry.getFileName());
    }
}

// Mit Stream
try (Stream<Path> stream = Files.list(dir)) {
    stream.forEach(System.out::println);
}
```

---

## 5. try-with-resources

### 5.1 AutoCloseable

Ressourcen, die `AutoCloseable` implementieren, werden automatisch geschlossen:

```java
try (BufferedReader r = new BufferedReader(new FileReader("in.txt"));
     PrintWriter w = new PrintWriter(new FileWriter("out.txt"))) {
    // ...
}  // r.close() und w.close() automatisch
```

### 5.2 Mehrere Ressourcen

```java
try (Connection c = ds.getConnection();
     PreparedStatement ps = c.prepareStatement("SELECT * FROM x");
     ResultSet rs = ps.executeQuery()) {
    while (rs.next()) {
        // ...
    }
}
```

### 5.3 suppress vs. close

Bei Exception in `try` und `close`:

- Exception aus `close` wird unterdrückt
- Exception aus `try` wird geworfen
- Mit `addSuppressed` kann die suppressed-Exception abgefragt werden

---

## 6. Zeichenkodierung

### 6.1 Unicode-Standards

- **ASCII**: 7-Bit, 128 Zeichen (nur englisch)
- **Latin-1 (ISO-8859-1)**: 8-Bit, westeuropäisch
- **UTF-8**: variabel 1-4 Byte, universell
- **UTF-16**: 2 oder 4 Byte, Java-Standard

### 6.2 Encoding in Java

```java
String text = "Hallo ÜÖÄ";

// Konvertierung
byte[] utf8 = text.getBytes(StandardCharsets.UTF_8);
String back = new String(utf8, StandardCharsets.UTF_8);

// Default-Encoding (pro Plattform unterschiedlich!)
byte[] def = text.getBytes();
```

### 6.3 BOM (Byte Order Mark)

- UTF-8-Datei kann mit BOM beginnen (`EF BB BF`)
- Manche Tools (Windows Notepad) fügen BOM hinzu
- Beim Parsen ggf. überspringen

### 6.4 Streams und Encoding

```java
BufferedReader reader = new BufferedReader(
    new InputStreamReader(
        new FileInputStream("file.txt"),
        StandardCharsets.UTF_8));

BufferedWriter writer = new BufferedWriter(
    new OutputStreamWriter(
        new FileOutputStream("out.txt"),
        StandardCharsets.UTF_8));
```

---

## 7. Beispiel: CSV einlesen, JSON schreiben

### 7.1 CSV-Datei einlesen

```java
Path csvPath = Paths.get("mitarbeiter.csv");
List<String[]> daten = new ArrayList<>();

try (BufferedReader reader = Files.newBufferedReader(csvPath, StandardCharsets.UTF_8)) {
    String line;
    boolean ersteZeile = true;
    String[] header = null;
    while ((line = reader.readLine()) != null) {
        String[] felder = line.split(",");
        if (ersteZeile) {
            header = felder;
            ersteZeile = false;
        } else {
            daten.add(felder);
        }
    }
}
```

### 7.2 In JSON konvertieren

```java
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

ObjectMapper mapper = new ObjectMapper();
mapper.enable(SerializationFeature.INDENT_OUTPUT);

List<Map<String, Object>> mitarbeiter = new ArrayList<>();

for (String[] felder : daten) {
    Map<String, Object> person = new LinkedHashMap<>();
    for (int i = 0; i < header.length; i++) {
        person.put(header[i], felder[i]);
    }
    mitarbeiter.add(person);
}

Path jsonPath = Paths.get("mitarbeiter.json");
mapper.writeValue(jsonPath.toFile(), mitarbeiter);
```

---

## 8. Übungen

### Übung 1 — Datei lesen

Lesen Sie eine Textdatei Zeile für Zeile und geben Sie sie aus.

### Übung 2 — Datei schreiben

Schreiben Sie 100 Zeilen in eine Datei.

### Übung 3 — Verzeichnis auflisten

Listen Sie alle Dateien in einem Verzeichnis auf.

### Übung 4 — Encoding

Was passiert beim Lesen einer UTF-8-Datei mit Latin-1-Encoding?

### Übung 5 — try-with-resources

Schreiben Sie eine Methode, die eine Datei liest und schreibt.

### Übung 6 — JSON-Ausgabe

Konvertieren Sie eine CSV-Datei in JSON.

---

## 9. Zusammenfassung

**Java I/O-APIs:**

| API | Nutzen |
|---|---|
| `java.io` | klassisch, stream-basiert |
| `java.nio.file` | Path, Files (moderner) |
| `try-with-resources` | automatisches Schließen |

**Best Practices:**

- Immer try-with-resources
- Immer UTF-8 (oder explizites Encoding)
- Große Dateien: Stream statt List
- BufferedReader/Writer für Performance

### Selbsttest-Checkliste

- [ ] Ich lese und schreibe Dateien in Java.
- [ ] Ich nutze try-with-resources.
- [ ] Ich beachte Zeichencodierungen.
- [ ] Ich nutze Java NIO.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2715 — Recherche 2026*
