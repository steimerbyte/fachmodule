# Fachmodul: Relationales Modell (LF08)

**Kurs-ID:** 6721
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS / LF08
**Quelle:** https://moodle.oszimt.de/course/view.php?id=6721

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Kontext LF08 — Projekt eGame](#2-kontext-lf08--projekt-egame)
3. [Relationales Datenmodell: Wiederholung](#3-relationales-datenmodell-wiederholung)
4. [Abbildungsregeln ERM → RM](#4-abbildungsregeln-erm--rm)
5. [Tupel-Darstellung](#5-tupel-darstellung)
6. [Transformation in der Praxis](#6-transformation-in-der-praxis)
7. [Benennungskonventionen (OSZ-IMT)](#7-benennungskonventionen-osz-imt)
8. [Praxisbeispiele](#8-praxisbeispiele)
9. [Übungen](#9-übungen)
10. [Quellen](#10-quellen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- ein ER-Diagramm in ein relationales Datenmodell überführen,
- die OSZ-IMT-Benennungskonventionen anwenden,
- Datenbankschemata für die eGame-Plattform entwerfen,
- typische Praxisbeispiele (Forenverwaltung, Segeltörn, Zwerge) modellieren.

---

## 2. Kontext LF08 — Projekt eGame

Im Projekt **eGame** entwickelt die Future Technology Consulting GmbH für die Plattform eGame eine neue Funktionalität. Als Projektteam-Mitglied erwerben Sie hier die nötigen Fachkenntnisse über relationale Datenbanksysteme.

**Bezug zu LF08-Inhalten:**

- Lernfeld 8: Datenbankmodellierung und -implementierung
- Schwerpunkte: ERM, Relationales Modell, Transformation, SQL

---

## 3. Relationales Datenmodell: Wiederholung

(Siehe auch Fachmodul 2600 Relationales Modell.)

- **Relation** = Tabelle
- **Tupel** = Zeile
- **Attribut** = Spalte
- **Domäne** = Wertebereich

```sql
Mitarbeiter(MitarbeiterID: INT, Name: VARCHAR, Gehalt: DECIMAL)
```

| MitarbeiterID | Name | Gehalt |
|---|---|---|
| 1001 | Anna | 55000 |
| 1002 | Bernd | 48000 |

---

## 4. Abbildungsregeln ERM → RM

| ERM-Konstrukt | Relationale Repräsentation |
|---|---|
| Starke Entität | Eigene Tabelle mit PK |
| Schwache Entität | Eigene Tabelle mit zusammengesetztem PK |
| Mehrwertiges Attribut | Eigene Tabelle mit FK zur Entität |
| 1:1-Beziehung | FK mit UNIQUE-Constraint |
| 1:N-Beziehung | FK auf N-Seite |
| N:M-Beziehung | Zwischentabelle mit zusammengesetztem PK |
| ISA-Beziehung | Drei Optionen (Tabelle pro Subtyp / pro Supertyp / pro konkretem Subtyp) |

### 4.1 Schritt-für-Schritt

1. **Entitätstypen** identifizieren → jede Entität wird Tabelle
2. **Attribute** den Entitäten zuordnen
3. **Primärschlüssel** wählen
4. **Beziehungen** in FKs umsetzen
5. **Schwache Entitäten** korrekt abbilden
6. **Normalisierung** durchführen (3NF)

---

## 5. Tupel-Darstellung

**Tupel-Notation:** `(MitarbeiterID, Name, Gehalt) = (1001, "Anna", 55000)`

**Mengen-Darstellung:**

```
Mitarbeiter = {
    (1001, "Anna", 55000),
    (1002, "Bernd", 48000),
    (1003, "Clara", 62000)
}
```

In SQL als Tabelle mit eingefügten Zeilen.

---

## 6. Transformation in der Praxis

### 6.1 Beispiel: Forenverwaltung

**Entitäten:**

- `Benutzer` (BenutzerID, Username, Email, Registrierungsdatum)
- `Forum` (ForumID, Name, Beschreibung)
- `Thread` (ThreadID, Titel, Erstellungsdatum, ForumID, BenutzerID)
- `Beitrag` (BeitragID, Inhalt, Erstellungsdatum, ThreadID, BenutzerID)

**Beziehungen:**

- Benutzer ↔ Forum (über Moderation) → N:M
- Forum ↔ Thread (1:N)
- Benutzer ↔ Thread (1:N, Ersteller)
- Thread ↔ Beitrag (1:N)
- Benutzer ↔ Beitrag (1:N, Autor)

**SQL:**

```sql
CREATE TABLE Benutzer (
    BenutzerID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Registrierungsdatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Forum (
    ForumID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Beschreibung TEXT
);

CREATE TABLE Thread (
    ThreadID INT PRIMARY KEY AUTO_INCREMENT,
    Titel VARCHAR(200) NOT NULL,
    Erstellungsdatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ForumID INT NOT NULL,
    BenutzerID INT NOT NULL,
    FOREIGN KEY (ForumID) REFERENCES Forum(ForumID),
    FOREIGN KEY (BenutzerID) REFERENCES Benutzer(BenutzerID)
);

CREATE TABLE Beitrag (
    BeitragID INT PRIMARY KEY AUTO_INCREMENT,
    Inhalt TEXT NOT NULL,
    Erstellungsdatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ThreadID INT NOT NULL,
    BenutzerID INT NOT NULL,
    FOREIGN KEY (ThreadID) REFERENCES Thread(ThreadID),
    FOREIGN KEY (BenutzerID) REFERENCES Benutzer(BenutzerID)
);
```

### 6.2 Beispiel: Segeltörn

**Entitäten:** Segler, Boot, Törn, Reservierung, Crew-Mitglied.

```sql
CREATE TABLE Segler (
    SeglerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Erfahrung INT
);

CREATE TABLE Boot (
    BootID INT PRIMARY KEY,
    Name VARCHAR(100),
    Typ VARCHAR(50),
    Laenge DECIMAL(5,2)
);

CREATE TABLE Toern (
    ToernID INT PRIMARY KEY,
    Startdatum DATE,
    Enddatum DATE,
    BootID INT NOT NULL,
    FOREIGN KEY (BootID) REFERENCES Boot(BootID)
);

CREATE TABLE Crew (
    ToernID INT,
    SeglerID INT,
    Rolle VARCHAR(50),
    PRIMARY KEY (ToernID, SeglerID),
    FOREIGN KEY (ToernID) REFERENCES Toern(ToernID),
    FOREIGN KEY (SeglerID) REFERENCES Segler(SeglerID)
);
```

### 6.3 Beispiel: Zwerge

Eine vereinfachte Fantasy-Datenbank mit Zwergen, Waffen, Aufgaben.

---

## 7. Benennungskonventionen (OSZ-IMT)

| Element | Konvention | Beispiel |
|---|---|---|
| Tabellenname | Singular, PascalCase | `Mitarbeiter`, `BestellPosition` |
| Spaltenname | PascalCase | `MitarbeiterID`, `Eintrittsdatum` |
| Primärschlüssel | Tabellennamen + `ID` | `MitarbeiterID` |
| Fremdschlüssel | Referenzierte Tabelle + `ID` | `AbteilungID` |
| Index | `idx_` + Tabelle + Spalten | `idx_mitarbeiter_name` |
| Constraint | `pk_` / `fk_` / `chk_` + Tabelle | `pk_mitarbeiter`, `fk_abt`, `chk_gehalt` |
| View | `v_` + beschreibender Name | `v_aktive_mitarbeiter` |

---

## 8. Praxisbeispiele

### 8.1 A3.1: Transformation Übungen

Gegeben ist ein ER-Diagramm für eine kleine Bibliothek. Überführen Sie es in ein relationales Schema.

### 8.2 A3.2: Forenverwaltung

Modellieren Sie ein Forumssystem mit Benutzern, Foren, Threads und Beiträgen.

### 8.3 Segeltörn-Variante

Modellieren Sie ein Segeltörn-Buchungssystem mit Booten, Seglern und Crew-Mitgliedschaft.

---

## 9. Übungen

### Übung 1 — Transformation

Gegeben: ER-Diagramm mit `Bestellung`, `Kunde`, `Produkt`, `Bestellposition`.

Aufgaben:

1. Leiten Sie das relationale Schema ab
2. Wählen Sie passende Datentypen
3. Bestimmen Sie Primär- und Fremdschlüssel
4. Erstellen Sie das SQL-DDL

### Übung 2 — Segeltörn

Gegeben: Segler, Boot, Törn, Crew.

Aufgaben:

1. Zeichnen Sie das ER-Diagramm
2. Überführen Sie es in ein relationales Schema
3. Erstellen Sie DDL mit passenden Constraints

### Übung 3 — Zwerge

Gegeben: Zwerge, Waffen, Aufgaben, Beute.

Aufgaben:

1. Modellieren Sie N:M-Beziehungen
2. Wählen Sie sinnvolle Datentypen
3. Erstellen Sie DDL

---

## 10. Quellen

- Oracle – ER to Relational: <https://docs.oracle.com/en/database/>
- C. Date: *An Introduction to Database Systems*
- R. Elmasri, S. Navathe: *Grundlagen von Datenbanksystemen*
- A. Kemper, A. Eickler: *Datenbanksysteme: Eine Einführung*
- LF08-Infoblätter des OSZ-IMT

---

## 11. Zusammenfassung

Die **Transformation vom ERM ins relationale Modell** folgt klaren Regeln:

- **Starke Entität** → Tabelle mit PK
- **Schwache Entität** → Tabelle mit zusammengesetztem PK
- **1:N** → FK auf N-Seite
- **N:M** → Zwischentabelle

**Benennungskonventionen** sind wichtig für Wartbarkeit und Lesbarkeit. Im OSZ-IMT-Kontext werden Singular-PascalCase-Tabellennamen und `TabellennameID` als PK verwendet.

### Selbsttest-Checkliste

- [ ] Ich transformiere ein ERD in ein relationales Schema.
- [ ] Ich wende die OSZ-IMT-Konventionen an.
- [ ] Ich wähle passende Datentypen und Constraints.
- [ ] Ich erstelle DDL mit Primär- und Fremdschlüsseln.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=6721 — Recherche 2026*
