# Fachmodul: Dateiformate – CSV

**Kurs-ID:** 2718
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2718

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist CSV?](#2-was-ist-csv)
3. [RFC 4180](#3-rfc-4180)
4. [CSV-Syntax](#4-csv-syntax)
5. [CSV-Parsing in Java](#5-csv-parsing-in-java)
6. [Probleme beim CSV-Parsing](#6-probleme-beim-csv-parsing)
7. [Übungen](#7-übungen)
8. [Zusammenfassung](#8-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- CSV-Daten korrekt parsen und erzeugen,
- die RFC-4180-Spezifikation anwenden,
- häufige Fehler beim Parsing vermeiden,
- Java-Bibliotheken für CSV nutzen.

---

## 2. Was ist CSV?

**CSV (Comma-Separated Values)** ist ein **textbasiertes Dateiformat** für tabellarische Daten. Werte werden durch ein **Trennzeichen** (Komma, Semikolon oder Tab) getrennt.

**Eigenschaften:**

- Einfach, menschenlesbar
- Schlank
- Tabellenkalkulationen-Import möglich
- Datenaustausch

**Verbreitete Dateiendungen:** `.csv`, `.txt`, `.tsv` (Tab-Separated)

---

## 3. RFC 4180

Die **RFC 4180** ist die offizielle Spezifikation für CSV:

- **Zeilenende**: CRLF (`\r\n`)
- **Feldtrenner**: Komma
- **Erste Zeile optional Header**
- Felder mit Sonderzeichen (Komma, Newline, Anführungszeichen) müssen in doppelte Anführungszeichen eingeschlossen werden
- Innerhalb von Anführungszeichen werden doppelte Anführungszeichen verdoppelt (`""` für `"`)

---

## 4. CSV-Syntax

### 4.1 Beispiel

```csv
Name,Alter,Stadt
"Anna Müller",30,"Berlin, Mitte"
"Bernd Schmidt",25,München
"Clara Weber",35,"Köln"
```

### 4.2 Beispiel: Semikolon-getrennt (deutsche Variante)

```csv
Name;Alter;Stadt
Anna Müller;30;Berlin
Bernd Schmidt;25;München
```

### 4.3 Escape-Regeln

- **Komma im Wert**: `"Wert, mit Komma"`
- **Newline im Wert**: `"Wert mit\nNewline"` (in Anführungszeichen)
- **Anführungszeichen im Wert**: `"Wert mit ""Quotes"""`
- **Führender Whitespace**: Geschützt in Anführungszeichen

### 4.4 Sonderfälle

| Sonderzeichen | Behandlung |
|---|---|
| Komma im Wert | in Anführungszeichen |
| Newline im Wert | in Anführungszeichen |
| Doppelte Anführungszeichen | verdoppelt `""` |
| BOM (Byte Order Mark) | am Anfang ignorieren |

---

## 5. CSV-Parsing in Java

### 5.1 OpenCSV

```java
import com.opencsv.CSVReader;

CSVReader reader = new CSVReader(new FileReader("datei.csv"));
String[] zeile;
while ((zeile = reader.readNext()) != null) {
    System.out.println(String.join(" ", zeile));
}
reader.close();
```

### 5.2 Apache Commons CSV

```java
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

try (CSVParser parser = CSVParser.parse(
        Paths.get("datei.csv"), StandardCharsets.UTF_8, CSVFormat.DEFAULT)) {
    for (CSVRecord record : parser) {
        System.out.println(record.get("Name"));
    }
}
```

### 5.3 Manuell

```java
List<String[]> parseCsv(String content) {
    List<String[]> result = new ArrayList<>();
    boolean inQuotes = false;
    StringBuilder field = new StringBuilder();
    List<String> row = new ArrayList<>();

    for (char c : content.toCharArray()) {
        if (c == '"') {
            inQuotes = !inQuotes;
        } else if (c == ',' && !inQuotes) {
            row.add(field.toString());
            field.setLength(0);
        } else if (c == '\n' && !inQuotes) {
            row.add(field.toString());
            result.add(row.toArray(new String[0]));
            field.setLength(0);
            row.clear();
        } else {
            field.append(c);
        }
    }
    if (field.length() > 0) {
        row.add(field.toString());
        result.add(row.toArray(new String[0]));
    }
    return result;
}
```

### 5.4 Jackson CSV

```java
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;

CsvMapper mapper = new CsvMapper();
CsvSchema schema = CsvSchema.emptySchema().withHeader();
MappingIterator<Map<String, String>> it = mapper
    .readerForMapOf(String.class)
    .with(schema)
    .readValues(new File("datei.csv"));

while (it.hasNext()) {
    Map<String, String> row = it.next();
    System.out.println(row);
}
```

---

## 6. Probleme beim CSV-Parsing

### 6.1 Häufige Probleme

| Problem | Lösung |
|---|---|
| **BOM am Anfang** | Mit UTF-8-BOM-Erkennung parsen |
| **Unterschiedliche Delimiter** | Konfiguration erlauben (Komma, Semikolon, Tab) |
| **Anführungszeichen in Werten** | Korrekte Escaping beachten |
| **Newlines in Werten** | Nur innerhalb von Quotes interpretieren |
| **Whitespace am Anfang/Ende** | Trim oder beibehalten je nach Anforderung |
| **Leere Werte** | NULL oder leeren String unterscheiden |
| **Encoding** | UTF-8 bevorzugt, aber auch ISO-8859-1 möglich |

### 6.2 Deutsche Besonderheiten

- **Komma als Dezimaltrenner**: Vorsicht beim Parsing
- **Semikolon als Delimiter** (Excel-Deutschland)
- **Anführungszeichen “ ”** statt `"` (typografisch)

---

## 7. Übungen

### Übung 1 — CSV erstellen

Erstellen Sie eine CSV-Datei mit Mitarbeiterdaten.

### Übung 2 — CSV parsen

Nutzen Sie OpenCSV, um eine CSV-Datei in Java zu lesen.

### Übung 3 — CSV schreiben

Schreiben Sie CSV mit Apache Commons CSV.

### Übung 4 — Sonderzeichen

Wie behandeln Sie Kommas und Newlines in Werten?

### Übung 5 — Jackson CSV

Nutzen Sie Jackson, um CSV in Objekte zu mappen.

### Übung 6 — Excel-Import

Erzeugen Sie eine CSV-Datei für Excel-Import.

---

## 8. Zusammenfassung

**CSV** ist ein einfaches Format für tabellarische Daten:

**RFC 4180:**

- Komma als Trenner
- CRLF als Zeilenende
- Anführungszeichen für Sonderzeichen

**Java-Parser:**

- **OpenCSV**: einfach, weit verbreitet
- **Apache Commons CSV**: Standard
- **Jackson CSV**: Object-Mapping
- Manuell: nur für einfache Fälle

**Häufige Probleme:**

- BOM, Encoding, Delimiter
- Anführungszeichen, Newlines in Werten

### Selbsttest-Checkliste

- [ ] Ich erstelle korrekte CSV-Dokumente.
- [ ] Ich parse CSV mit Standard-Bibliotheken.
- [ ] Ich behandle Sonderzeichen korrekt.
- [ ] Ich kenne die RFC-4180-Spezifikation.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2718 — Recherche 2026*
