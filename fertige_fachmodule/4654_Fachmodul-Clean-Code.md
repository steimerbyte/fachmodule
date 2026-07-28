# Fachmodul: Clean Code

**Kurs-ID:** 4654
**Kategorie:** Kursbibliothek / Fachmodule / Software-Engineering
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4654

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Clean Code?](#2-was-ist-clean-code)
3. [Benennung](#3-benennung)
4. [Funktionen](#4-funktionen)
5. [Kommentare](#5-kommentare)
6. [Formatierung](#6-formatierung)
7. [Error Handling](#7-error-handling)
8. [SOLID-Prinzipien](#8-solid-prinzipien)
9. [Code Smells und Refactoring](#9-code-smells-und-refactoring)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die Prinzipien von Clean Code anwenden,
- aussagekräftige Namen vergeben,
- Funktionen und Klassen sauber strukturieren,
- SOLID-Prinzipien in der Praxis umsetzen.

---

## 2. Was ist Clean Code?

**Clean Code** (Robert C. Martin, 2008) ist die **Kunst, Code so zu schreiben**, dass er **für Menschen leicht lesbar und verständlich** ist.

**Warum Clean Code?**

- Höhere **Wartbarkeit**
- Geringere **Fehlerquote**
- Schnellere **Einarbeitungszeit**
- Niedrigere **Kosten**

**Grundregel:** Code wird häufiger gelesen als geschrieben. Investition in Lesbarkeit zahlt sich aus.

---

## 3. Benennung

### 3.1 Aussagekräftige Namen

**Schlecht:**

```java
int d;   // Verstrichene Tage
```

**Gut:**

```java
int elapsedTimeInDays;
```

### 3.2 Regeln

- **Intention verraten**: Was bedeutet die Variable?
- **Keine Abkürzungen**: `tmp` → `temporaryFile`
- **Aussprechbar**: `genymdhms` → `generationTimestamp`
- **Kontext geben**: bei Klassen genauer als bei Methoden
- **Magic Numbers vermeiden**: `86400` → `SECONDS_PER_DAY`

### 3.3 Beispiel-Klassen

```java
class Customer // gut
class OrderProcessor // gut (Verantwortung klar)
class Data // schlecht (zu generisch)
class ObjectManager // schlecht (zu generisch)
```

### 3.4 Methodennamen

- Verben: `calculate`, `get`, `set`
- Keine Zahlwörter: `process1`, `process2`

---

## 4. Funktionen

### 4.1 Klein und fokussiert

**Regel:** Funktionen sollten **eine Aufgabe** tun und **kurz** sein (max. 20 Zeilen).

### 4.2 Eine Funktion, eine Aufgabe

```java
// Schlecht
void processAndSaveUser(User user) {
    validate(user);
    save(user);
    notify(user);
}

// Gut: Drei kleine Funktionen
void processUser(User user) {
    validate(user);
    save(user);
    notify(user);
}
```

### 4.3 Parameter

- Maximal 3 Parameter empfohlen
- Keine "boolean traps" (Methoden mit booleschen Parametern)
- Bei vielen Parametern: Parameter-Objekt einführen

### 4.4 Keine Side Effects

```java
// Schlecht: versteckte Nebenwirkung
boolean checkPassword(String password) {
    if (Session.loginAttempts > 5) {
        Session.reset(); // Side effect!
        return false;
    }
    // ...
}
```

### 7.5 Command-Query-Trennung

- Methoden entweder **Command** (verändern) oder **Query** (liefern)
- Nicht beides gleichzeitig

```java
// Schlecht
if (user.setPassword("new")) { ... }

// Gut
if (user.checkPassword("new")) { ... }
```

---

## 5. Kommentare

### 5.1 Gute Kommentare

- **Was** (nicht Wie)
- **Warum**, nicht Was
- Lizenzhinweise
- Warnungen vor Konsequenzen
- TODO-Kommentare

### 5.2 Schlechte Kommentare

- Wiederholen, was der Code sagt
- Veraltete Kommentare
- Lärm-Kommentare

### 5.3 JavaDoc

- **Public-API** dokumentieren
- `@param`, `@return`, `@throws`

---

## 6. Formatierung

### 6.1 Regeln

- **Vertikal**: Konzept → leerzeile → Konzept
- **Horizontal**: maximal 100-120 Zeichen pro Zeile
- **Einrückung**: 4 Spaces (Java)
- **Teams einheitlich**

### 6.2 Team-Regeln definieren

- Coding-Style-Guide
- Formatter (Prettier, Spotless)
- Linting (Checkstyle, PMD)

---

## 7. Error Handling

### 7.1 Exceptions statt Fehlercodes

```java
// Schlecht
if (save() != SUCCESS) {
    // ...
}

// Gut
try {
    save();
} catch (SaveException e) {
    log.error(e);
}
```

### 7.2 Checked vs. Unchecked

- **Checked Exception**: muss gefangen oder deklariert werden (z. B. IOException)
- **Unchecked Exception**: RuntimeException (z. B. NullPointerException)
- Faustregel: Unchecked für Programmierfehler, Checked für erwartbare Fehler

### 7.3 Eigene Exceptions

- Spezifische Exception-Klassen für Fachlichkeit
- Klare Namen: `UserNotFoundException`

### 7.4 NullPointerException vermeiden

- Optional nutzen
- Null-Objects
- Validation

---

## 8. SOLID-Prinzipien

### 8.1 Single Responsibility Principle

**Eine Klasse hat nur einen Grund zur Änderung.**

```java
// Schlecht
class User {
    void saveToDatabase() {}
    void sendEmail() {}
    void generateReport() {}
}

// Gut
class User { /* Daten */ }
class UserRepository { /* DB-Zugriff */ }
class UserMailer { /* E-Mail */ }
class UserReportGenerator { /* Report */ }
```

### 8.2 Open-Closed Principle

**Offen für Erweiterung, geschlossen für Modifikation.**

```java
// Schlecht: Wenn neue Form, ändern
double area(Shape shape) {
    if (shape.type == "circle") return Math.PI * shape.r * shape.r;
    if (shape.type == "rect") return shape.w * shape.h;
}

// Gut: Erweitern ohne Ändern
abstract class Shape {
    abstract double area();
}
class Circle extends Shape { /* ... */ }
```

### 8.3 Liskov Substitution Principle

**Subtyp muss überall dort verwendbar sein, wo Suptyp erwartet wird.**

### 8.4 Interface Segregation Principle

**Viele spezifische Interfaces statt einem generellen.**

```java
// Schlecht: Ein großes Interface
interface Worker {
    void work();
    void eat();
}

// Gut: Aufgeteilt
interface Workable { void work(); }
interface Eatable { void eat(); }
```

### 8.5 Dependency Inversion Principle

**Höhe Module sollen nicht von niedrigen abhängen. Beide sollen von Abstraktionen abhängen.**

```java
// Schlecht: Direkte Abhängigkeit
class OrderService {
    private MySQLDatabase db = new MySQLDatabase();
}

// Gut: Abhängigkeit injizieren
class OrderService {
    private final Database db;
    OrderService(Database db) { this.db = db; }
}
```

---

## 9. Code Smells und Refactoring

### 9.1 Code Smells (Symptome)

- **Duplicated Code**: gleicher Code mehrfach
- **Long Method**: zu lange Methode
- **Large Class**: zu viele Verantwortlichkeiten
- **Long Parameter List**: zu viele Parameter
- **Divergent Change**: viele Änderungen pro Klasse
- **Shotgun Surgery**: eine Änderung an mehreren Stellen
- **Feature Envy**: Methode nutzt mehr eine andere Klasse
- **Data Clumps**: Daten immer zusammen
- **Primitive Obsession**: Primitive statt Objekten
- **Switch Statements**: oft Vererbung besser
- **Refused Bequest**: Subklasse nutzt nicht alle Methoden
- **Comments**: erklären schlechten Code

### 9.2 Refactoring

- **Extract Method**: lange Methode aufteilen
- **Rename**: bessere Namen
- **Move Method/Field**: an bessere Stelle
- **Extract Class**: Klasse aus Klasse extrahieren
- **Inline**: unnötige Indirektion entfernen
- **Replace Conditional with Polymorphism**

---

## 10. Übungen

### Übung 1 — Namen verbessern

Schlechte Namen identifizieren und verbessern.

### Übung 2 — Funktion extrahieren

Lange Funktion in kleine Methoden zerlegen.

### Übung 3 — SOLID anwenden

Eine Klasse identifizieren, die mehrere Verantwortlichkeiten hat, und aufteilen.

### Übung 4 — Code Smells

In einem Code-Beispiel Code Smells identifizieren.

### Übung 5 — Exception-Handling

Robust gegen NullPointerException machen.

### Übung 6 — Refactoring

Eine Klasse refactoren mit Extract Class.

---

## 11. Zusammenfassung

**Clean Code** ist die Grundlage **professioneller Software-Entwicklung**:

**Prinzipien:**

- Aussagekräftige Namen
- Kleine Funktionen, eine Aufgabe
- Keine Kommentare, die Code wiederholen
- SOLID-Prinzipien
- Test-Driven Development

**Code Smells erkennen und refactoren.**

### Selbsttest-Checkliste

- [ ] Ich vergebe aussagekräftige Namen.
- [ ] Ich halte Funktionen klein und fokussiert.
- [ ] Ich nutze SOLID-Prinzipien.
- [ ] Ich erkenne Code Smells.
- [ ] Ich refactoren Code systematisch.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4654 — Recherche 2026*
