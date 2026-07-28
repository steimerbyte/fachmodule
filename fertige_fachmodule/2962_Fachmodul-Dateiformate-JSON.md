# Fachmodul: Dateiformate – JSON

**Kurs-ID:** 2962
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2962

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist JSON?](#2-was-ist-json)
3. [RFC 8259](#3-rfc-8259)
4. [JSON-Syntax](#4-json-syntax)
5. [Datentypen](#5-datentypen)
6. [JSON in der Praxis](#6-json-in-der-praxis)
7. [JSON-Parser: Jackson, Gson, org.json](#7-json-parser-jackson-gson-orgjson)
8. [JSON Pointer und JSON Schema](#8-json-pointer-und-json-schema)
9. [JSON5, JSONC, NDJSON](#9-json5-jsonc-ndjson)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- JSON-Dokumente erstellen und validieren,
- JSON in Java verarbeiten,
- JSON Pointer und JSON Schema nutzen,
- JSON in modernen Standards (REST APIs, NoSQL) einsetzen.

---

## 2. Was ist JSON?

**JSON (JavaScript Object Notation)** ist ein **textbasiertes, schlankes Datenformat** für den Austausch strukturierter Daten.

**Eigenschaften:**

- Schlank, menschenlesbar
- Sprache-unabhängig
- Ableitung aus JavaScript Object Literal
- Unicode
- Self-Describing (durch Schlüsselnamen)

**Anwendungen:**

- REST APIs
- Single Page Applications (React, Angular, Vue)
- Konfigurationsdateien (z. B. `package.json`)
- NoSQL-Datenbanken (MongoDB, CouchDB)
- Datenaustausch

---

## 3. RFC 8259

- **JSON-Spezifikation**: RFC 8259 (2017)
- **Vorgänger**: RFC 4627 (Douglas Crockford, 2006)
- **MIME-Type**: `application/json`
- **Encoding**: UTF-8 (empfohlen)
- **Offizielle Medientypen**: `application/ld+json` (JSON-LD), `application/hal+json` (HAL+JSON)

---

## 4. JSON-Syntax

### 4.1 Beispiel

```json
{
  "name": "Anna Müller",
  "alter": 30,
  "verheiratet": false,
  "kinder": null,
  "adresse": {
    "straße": "Hauptstraße 1",
    "stadt": "Berlin",
    "plz": "10115"
  },
  "hobbies": ["Lesen", "Wandern", "Programmieren"],
  "kontakt": {
    "email": "anna@example.com",
    "telefon": "+49 30 1234567"
  }
}
```

### 4.2 Grundregeln

- Schlüssel in **doppelten Anführungszeichen**
- Werte nach Schlüssel-Wert-Schema
- Listen in eckigen Klammern `[]`
- Objekte in geschweiften Klammern `{}`
- Komma zwischen Einträgen
- **Keine Kommentare**, keine Tabs (empfohlen), keine Single-Quotes
- **Keine trailing Commas**

### 4.3 JSON-Dokument

- Beginnt mit `{` (Objekt) oder `[` (Array)
- Ein gültiges JSON ist immer ein gültiges JavaScript-Ausdruck
- Bemerkung: nicht jeder JS-Ausdruck ist gültiges JSON (Single-Quotes, Kommentare, Funktionen)

---

## 5. Datentypen

| Typ | JSON | Beispiel |
|---|---|---|
| **String** | in Anführungszeichen | `"Hallo"` |
| **Number** | ohne Anführungszeichen | `42`, `3.14`, `-7.5` |
| **Boolean** | true/false | `true`, `false` |
| **null** | null | `null` |
| **Array** | eckige Klammern | `[1, 2, 3]` |
| **Object** | geschweifte Klammern | `{"key": "value"}` |

### 5.1 Strings

- Unicode (UTF-8)
- Backslash-Escape: `\"`, `\\`, `\/`, `\n`, `\t`, `\b`, `\f`, `\r`
- Unicode-Escape: `\u00E4` (ä)
- Keine Single-Quotes, keine Double-Quotes innerhalb ohne Escape

### 5.2 Numbers

- Ganze Zahlen: `42`, `-7`
- Gleitkommazahlen: `3.14`, `-1.5e10`
- Keine Trenner (`1_000_000` ungültig)
- IEEE 754 double precision
- Keine Infinity, NaN (in Standard-JSON nicht erlaubt)

### 5.3 Arrays

```json
[1, 2, 3, "vier", true, null]
```

### 5.4 Objects

```json
{
  "schlüssel1": "wert1",
  "schlüssel2": "wert2"
}
```

---

## 6. JSON in der Praxis

### 6.1 REST APIs

- JSON ist heute das **Standardformat** für REST APIs
- Content-Type: `application/json`
- HTTP-Methoden: GET, POST, PUT, DELETE, PATCH

### 6.2 Beispiel

**GET /api/users/1001:**

```json
{
  "id": 1001,
  "name": "Anna Müller",
  "email": "anna@example.com",
  "roles": ["admin", "editor"]
}
```

**POST /api/users:**

```json
{
  "name": "Bernd Schmidt",
  "email": "bernd@example.com"
}
```

### 6.3 Konfigurationsdateien

- `package.json` (npm)
- `tsconfig.json` (TypeScript)
- `composer.json` (PHP)
- `settings.json` (VS Code)

### 6.4 NoSQL-Datenbanken

- MongoDB (BSON)
- CouchDB
- Firebase Firestore
- DocumentDB

### 6.5 Logging

- **JSON Lines** (`.jsonl`): ein JSON-Objekt pro Zeile
- Strukturierte Logs
- Tools: Loki, ELK Stack

---

## 7. JSON-Parser: Jackson, Gson, org.json

### 7.1 Jackson (Standard für Spring)

```java
import com.fasterxml.jackson.databind.ObjectMapper;

ObjectMapper mapper = new ObjectMapper();

// Objekt → JSON
String json = mapper.writeValueAsString(person);

// JSON → Objekt
Person person = mapper.readValue(json, Person.class);
```

### 7.2 Gson (Google)

```java
import com.google.gson.Gson;

Gson gson = new Gson();

String json = gson.toJson(person);
Person person = gson.fromJson(json, Person.class);
```

### 7.3 org.json (Lightweight)

```java
import org.json.JSONObject;

JSONObject obj = new JSONObject()
    .put("name", "Anna")
    .put("alter", 30);

String json = obj.toString();
JSONObject parsed = new JSONObject(json);
```

### 7.4 Vergleich

| Aspekt | Jackson | Gson | org.json |
|---|---|---|---|
| Performance | hoch | mittel | mittel |
| Features | umfangreich | einfach | minimal |
| Größe | größer | klein | klein |
| Spring-Integration | ja | nein | nein |

### 7.5 Beispiel: Records in Java 16+

```java
public record Person(String name, int alter) {}

Person p = new Person("Anna", 30);
String json = mapper.writeValueAsString(p);
// {"name":"Anna","alter":30}
```

---

## 8. JSON Pointer und JSON Schema

### 8.1 JSON Pointer (RFC 6901)

Pfad-Ausdruck für JSON:

```
/kinder/0/name    → erstes Element im Array "kinder", Schlüssel "name"
```

### 8.2 JSON Patch (RFC 6902)

Beschreibt Änderungen an JSON-Dokumenten:

```json
[
  { "op": "replace", "path": "/name", "value": "Bernd" },
  { "op": "add", "path": "/alter", "value": 25 },
  { "op": "remove", "path": "/kinder" }
]
```

Operationen: add, remove, replace, move, copy, test

### 8.3 JSON Schema

Validierungsschema für JSON-Daten (analog XSD für XML):

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "type": "object",
  "properties": {
    "name": { "type": "string" },
    "alter": { "type": "integer", "minimum": 0 },
    "email": { "type": "string", "format": "email" }
  },
  "required": ["name", "alter"]
}
```

### 8.4 JSON-LD (Linked Data)

JSON-Erweiterung für verknüpfte Daten (Semantic Web):

```json
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Anna Müller",
  "jobTitle": "Softwareentwicklerin"
}
```

---

## 9. JSON5, JSONC, NDJSON

### 9.1 JSON5

- Erweiterung von JSON (nicht Standard)
- Erlaubt: Kommentare, Single-Quotes, trailing commas, Hexadezimal, etc.
- Tools: Webpack, VS Code

### 9.2 JSONC (JSON mit Kommentaren)

- VS Code verwendet JSONC für `settings.json`
- Erlaubt `//`-Kommentare und trailing commas
- Erweiterung von JSON

### 9.3 NDJSON (Newline-Delimited JSON)

- Ein JSON-Objekt pro Zeile
- Auch JSON Lines (JSONL) genannt
- Vorteil: Stream-fähig, kein Parsen der gesamten Datei nötig

```jsonl
{"name": "Anna", "age": 30}
{"name": "Bernd", "age": 25}
{"name": "Clara", "age": 35}
```

---

## 10. Übungen

### Übung 1 — JSON erstellen

Erstellen Sie ein JSON-Objekt für eine Person mit Name, Alter, Adresse, Hobbies.

### Übung 2 — JSON parsen

Nutzen Sie Jackson, Gson oder org.json zum Parsen.

### Übung 3 — JSON Schema

Erstellen Sie ein JSON Schema für ein Produktobjekt.

### Übung 4 — JSON Patch

Erstellen Sie einen JSON Patch für eine Aktualisierung.

### Übung 5 — REST simulieren

Simulieren Sie eine REST-API-Antwort mit curl und JSON.

### Übung 6 — Jackson

Nutzen Sie Jackson, um Java Records in JSON zu konvertieren.

---

## 11. Zusammenfassung

**JSON** ist das Standard-Datenaustauschformat für moderne Web-APIs:

**Eckpfeiler:**

- Schlank, lesbar, Unicode
- Sprach-unabhängig
- RFC 8259 Standard
- MIME-Type `application/json`

**Datentypen:**

- String, Number, Boolean, null
- Array, Object

**Java-Parser:**

- **Jackson**: Standard, schnell
- **Gson**: Google, einfach
- **org.json**: minimalistisch

**Erweiterungen:**

- **JSON Pointer** (RFC 6901)
- **JSON Patch** (RFC 6902)
- **JSON Schema**: Validierung
- **JSON-LD**: Linked Data

**JSON vs. XML:** JSON heute für Web, XML für Bürokommunikation

### Selbsttest-Checkliste

- [ ] Ich erstelle gültige JSON-Dokumente.
- [ ] Ich nutze JSON in Java.
- [ ] Ich erstelle JSON Schemata.
- [ ] Ich nutze JSON Patch und Pointer.
- [ ] Ich kenne NDJSON und JSONL.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2962 — Recherche 2026*
