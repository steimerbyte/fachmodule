# Fachmodul: Relationales Modell

**Kurs-ID:** 2600
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2600

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Grundbegriffe des relationalen Modells](#2-grundbegriffe-des-relationalen-modells)
3. [Edgar F. Codds 12 Regeln](#3-edgar-f-codds-12-regeln)
4. [Schlüssel und Beziehungen](#4-schlüssel-und-beziehungen)
5. [Integritätsregeln](#5-integritätsregeln)
6. [Relationale Algebra](#6-relationale-algebra)
7. [Tupel-Kalkül](#7-tupel-kalkül)
8. [ERD → Relationales Schema](#8-erd--relationales-schema)
9. [Normalisierung](#9-normalisierung)
10. [Beispiel-Datenbank: Hochschule](#10-beispiel-datenbank-hochschule)
11. [Quellen und Bildverweise](#11-quellen-und-bildverweise)
12. [Lernaufgaben](#12-lernaufgaben)
13. [Zusammenfassung](#13-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die Grundbegriffe Relation, Tupel, Attribut, Domäne erklären,
- Codds 12 Regeln für relationale Datenbanksysteme erläutern,
- Schlüssel und Beziehungen identifizieren,
- Integritätsregeln anwenden,
- die relationale Algebra und das Tupel-Kalkül verstehen,
- ein ERD in ein relationales Schema überführen,
- Normalisierungsstufen anwenden.

---

## 2. Grundbegriffe des relationalen Modells

Das relationale Modell wurde 1970 von **Edgar F. Codd** in seinem Aufsatz *"A Relational Model of Data for Large Shared Data Banks"* vorgestellt.

### 2.1 Relation

Eine **Relation** ist eine zweidimensionale Tabelle mit folgender Eigenschaft:

- Alle Einträge sind atomar (1. Normalform)
- Alle Zeilen sind verschieden
- Die Reihenfolge der Zeilen ist irrelevant
- Die Reihenfolge der Spalten ist irrelevant
- Jeder Spalte ist ein eindeutiger Name zugeordnet

Formal: R ⊆ D₁ × D₂ × … × Dₙ (Teilmenge des kartesischen Produkts von Domänen)

### 2.2 Tupel

Ein **Tupel** ist eine einzelne Zeile der Relation. Beispiel: `(1001, "Anna", "Müller", 45000)` in der Mitarbeiter-Tabelle.

### 2.3 Attribut

Ein **Attribut** ist eine benannte Spalte der Relation. Jedes Attribut hat eine Domäne (Wertebereich).

### 2.4 Domäne

Die **Domäne** eines Attributs ist die Menge erlaubter Werte:

- `Personalnummer`: ganze Zahl zwischen 1000 und 99999
- `Name`: Zeichenkette
- `Gehalt`: Dezimalzahl ≥ 0

### 2.5 Schema und Ausprägung

- **Schema (Intension)**: Struktur der Relation (Tabellenname, Attribute, Domänen, Constraints)
- **Ausprägung (Extension)**: aktueller Datenbestand zu einem Zeitpunkt

Beispiel:

```sql
-- Schema
Mitarbeiter(MitarbeiterID: INT, Name: VARCHAR, Gehalt: DECIMAL)

-- Ausprägung (Beispiel)
{ (1001, "Anna", 4500.00),
  (1002, "Bernd", 5200.00) }
```

---

## 3. Edgar F. Codds 12 Regeln

Codd formulierte 12 Regeln, die ein relationales DBMS idealerweise erfüllen sollte. In der Praxis werden sie oft als "Nullregeln" zusammengefasst, da kein System alle vollständig erfüllt.

1. **Informationsregel**: Alle Informationen werden in Tabellen dargestellt.
2. **Zugangsregel**: Jeder Wert ist über Tabellennamen, Primärschlüssel und Spaltenname zugänglich.
3. **Systematische Behandlung null**: NULL wird einheitlich unterstützt.
4. **Aktive Online-Katalogtabelle**: Datenbankschema wird in Tabellen abgelegt (Data Dictionary).
5. **Umfassende Daten-Subsprache**: Mindestens eine Sprache mit Datendefinition, View-Definition, Datenmanipulation, Sicherheit, Integrität.
6. **View-Updates**: Alle Views, die theoretisch aktualisierbar sind, können vom System aktualisiert werden.
7. **High-Level-Insert/Update/Delete**: Mengenorientierte Operationen sind verfügbar.
8. **Physische Datenunabhängigkeit**: Anwendungen funktionieren unabhängig von Speichermechanismen.
9. **Logische Datenunabhängigkeit**: Schemaänderungen wirken sich minimal auf Anwendungen aus.
10. **Integritätsunabhängigkeit**: Integritätsregeln werden im System definiert, nicht in Anwendungen.
11. **Verteilungsunabhängigkeit**: Anwendungen funktionieren gleich bei verteilten Daten.
12. **Kein Unterlaufen der Schnittstelle**: SQL-Zugriffe sollten nicht durch andere Sprachen umgangen werden.

> **Nullregel (Rule 0)**: Das System muss ein **relationales DBMS** sein, das seine eigene Datenbank über seine relationalen Fähigkeiten verwalten kann.

---

## 4. Schlüssel und Beziehungen

### 4.1 Schlüsseltypen

| Schlüssel | Beschreibung |
|---|---|
| **Superschlüssel** | Attributmenge, die jede Zeile eindeutig identifiziert |
| **Schlüsselkandidat** | minimaler Superschlüssel |
| **Primärschlüssel** | ausgewählter Schlüsselkandidat |
| **Alternativschlüssel** | nicht ausgewählter Schlüsselkandidat |
| **Fremdschlüssel** | Attribut, das auf einen Primärschlüssel verweist |
| **Zusammengesetzter Schlüssel** | Schlüssel aus mehreren Attributen |

### 4.2 Beziehungen

| Typ | Bedeutung | Implementierung |
|---|---|---|
| 1:1 | Jede Entität genau einer anderen zugeordnet | FK mit UNIQUE |
| 1:N | Eine Entität beliebig vielen anderen zugeordnet | FK auf N-Seite |
| N:M | Beliebig viele ↔ beliebig viele | Zwischentabelle |

### 4.3 Beispiel

```sql
CREATE TABLE Abteilung (
   AbtID INT PRIMARY KEY,
   Name VARCHAR(50) NOT NULL
);

CREATE TABLE Mitarbeiter (
   MitarbeiterID INT PRIMARY KEY,
   Name VARCHAR(100),
   AbtID INT,
   FOREIGN KEY (AbtID) REFERENCES Abteilung(AbtID)
);

CREATE TABLE Projekt (
   ProjektID INT PRIMARY KEY,
   Name VARCHAR(100)
);

CREATE TABLE Mitarbeiter_Projekt (
   MitarbeiterID INT,
   ProjektID INT,
   PRIMARY KEY (MitarbeiterID, ProjektID),
   FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
   FOREIGN KEY (ProjektID) REFERENCES Projekt(ProjektID)
);
```

---

## 5. Integritätsregeln

### 5.1 Entity-Integrität

Der **Primärschlüssel** darf nie NULL sein und muss jeden Tupel eindeutig identifizieren.

```sql
ALTER TABLE Mitarbeiter
ADD CONSTRAINT pk_mitarbeiter PRIMARY KEY (MitarbeiterID);
```

### 5.2 Referenzielle Integrität

Jeder **Fremdschlüssel** muss auf einen existierenden Primärschlüssel zeigen oder NULL sein.

**Aktionen:**

- `RESTRICT` / `NO ACTION`: Aktion verhindern
- `CASCADE`: Änderung weitergeben
- `SET NULL`: auf NULL setzen
- `SET DEFAULT`: auf Default setzen

```sql
ALTER TABLE Mitarbeiter
ADD CONSTRAINT fk_abt
FOREIGN KEY (AbtID) REFERENCES Abteilung(AbtID)
ON DELETE CASCADE
ON UPDATE CASCADE;
```

### 5.3 Domain-Integrität

Werte müssen innerhalb ihrer Domäne liegen (CHECK-Constraints).

```sql
CREATE TABLE Mitarbeiter (
   Gehalt DECIMAL(10,2) CHECK (Gehalt >= 0),
   ...
);
```

### 5.4 Benutzerdefinierte Integrität

Komplexe Regeln mit Triggern oder stored procedures.

---

## 6. Relationale Algebra

Die relationale Algebra ist eine **prozedurale** Anfragesprache mit Operationen auf Relationen.

### 6.1 Grundoperationen

| Operation | Symbol | Beschreibung |
|---|---|---|
| Selektion | σ | Auswahl von Tupeln (WHERE) |
| Projektion | π | Auswahl von Attributen (SELECT) |
| Kartesisches Produkt | × | Kombination ohne Bedingung |
| Vereinigung | ∪ | Mengenvereinigung |
| Differenz | − | Mengendifferenz |
| Umbenennung | ρ | Umbenennung von Attributen |

### 6.2 Abgeleitete Operationen

| Operation | Definition | SQL |
|---|---|---|
| Join | σ_bedingung(R × S) | `SELECT ... FROM R JOIN S ON ...` |
| Natürlicher Join | R ⋈ S | `SELECT ... FROM R NATURAL JOIN S` |
| Theta-Join | R ⋈_θ S | `SELECT ... FROM R JOIN S ON θ` |
| Outer Join | R ⟕ S | `LEFT/RIGHT/FULL JOIN` |
| Schnitt | R ∩ S = R − (R − S) | `INTERSECT` |
| Division | R ÷ S | komplex, mit NOT EXISTS |

### 6.3 Beispiele

**Selektion:** `σ_Gehalt>5000(Mitarbeiter)` — alle Mitarbeiter mit Gehalt über 5000.

**Projektion:** `π_Name,Abteilung(Mitarbeiter)` — nur Name und Abteilung.

**Join:** `Mitarbeiter ⋈_(Mitarbeiter.AbtID = Abteilung.AbtID) Abteilung` — Mitarbeiter mit Abteilungsdaten.

**SQL-Umsetzung:**

```sql
SELECT m.Name, a.Name AS Abteilung
FROM Mitarbeiter m
JOIN Abteilung a ON m.AbtID = a.AbtID
WHERE m.Gehalt > 5000;
```

### 6.4 Erweiterte Operationen

- **Aggregation**: COUNT, SUM, AVG, MIN, MAX
- **Gruppierung**: GROUP BY
- **Sortierung**: ORDER BY
- **Duplikatelimination**: DISTINCT
- **Outer Join**: LEFT, RIGHT, FULL

---

## 7. Tupel-Kalkül

Das Tupel-Kalkül ist eine **deklarative** Anfragesprache auf Basis der Prädikatenlogik. Beispiel: `{t | Mitarbeiter(t) AND t.Gehalt > 5000}` — "alle Mitarbeiter mit Gehalt > 5000".

**Bausteine:**

- Variablen für Tupel
- Prädikate (Bedingungen)
- Quantoren: ∀ (für alle), ∃ (es gibt)

SQL basiert auf einer praktischen Variante des Tupel-Kalküls.

---

## 8. ERD → Relationales Schema

Mapping-Regeln:

1. **Starke Entität** → Eigene Tabelle mit PK
2. **Schwache Entität** → Eigene Tabelle mit zusammengesetztem PK (Owner-PK + Diskriminator)
3. **1:1-Beziehung** → FK mit UNIQUE auf einer Seite
4. **1:N-Beziehung** → FK auf N-Seite
5. **N:M-Beziehung** → Zwischentabelle mit zusammengesetztem PK
6. **Mehrwertiges Attribut** → Eigene Tabelle mit FK zur Entität
7. **Generalisierung** → 3 Optionen (siehe ERD-Fachmodul)
8. **Aggregation** → Eigene Tabelle mit FKs zu den beteiligten Entitäten

**Beispiel: 1:N-Beziehung**

```
KUNDE (1) ──── bestellt ──── (N) BESTELLUNG
```

```sql
CREATE TABLE Kunde (
   KundeID INT PRIMARY KEY,
   Name VARCHAR(100)
);
CREATE TABLE Bestellung (
   BestellID INT PRIMARY KEY,
   KundeID INT NOT NULL,
   FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
);
```

**Beispiel: N:M-Beziehung**

```
STUDENT (N) ──── besucht ──── (M) KURS
```

```sql
CREATE TABLE Student (
   StudentID INT PRIMARY KEY,
   Name VARCHAR(100)
);
CREATE TABLE Kurs (
   KursID INT PRIMARY KEY,
   Titel VARCHAR(100)
);
CREATE TABLE Teilnahme (
   StudentID INT,
   KursID INT,
   Note DECIMAL(2,1),
   PRIMARY KEY (StudentID, KursID),
   FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
   FOREIGN KEY (KursID) REFERENCES Kurs(KursID)
);
```

---

## 9. Normalisierung

Ziel: Vermeidung von Anomalien und Redundanzen.

### 9.1 Anomalien-Arten

| Anomalie | Beispiel |
|---|---|
| **Insertion** | Daten können nicht eingefügt werden, ohne andere einzufügen |
| **Update** | Änderung muss an vielen Stellen erfolgen, Inkonsistenzgefahr |
| **Deletion** | Löschen löscht ungewollt weitere Informationen |

### 9.2 Normalisierungsstufen

| Stufe | Anforderung |
|---|---|
| **1NF** | Atomare Werte, keine Wiederholgruppen |
| **2NF** | 1NF + keine partielle Abhängigkeit |
| **3NF** | 2NF + keine transitive Abhängigkeit |
| **BCNF** | 3NF + jede Determinante ist Schlüsselkandidat |
| **4NF** | BCNF + keine mehrwertigen Abhängigkeiten |

### 9.3 Normalisierung — Beispiel

**Original (unnormalisiert):**

| Mitarbeiter | Projekte |
|---|---|
| Müller | Alpha, Beta |
| Schmidt | Beta, Gamma |

**1NF (atomar):**

| Mitarbeiter | Projekt |
|---|---|
| Müller | Alpha |
| Müller | Beta |
| Schmidt | Beta |
| Schmidt | Gamma |

**2NF+:** Bei korrekter Wahl der Primärschlüssel werden die partiellen Abhängigkeiten aufgelöst.

```sql
CREATE TABLE Mitarbeiter (
   MitarbeiterID INT PRIMARY KEY,
   Name VARCHAR(100)
);
CREATE TABLE Projekt (
   ProjektID INT PRIMARY KEY,
   Name VARCHAR(100)
);
CREATE TABLE Mitarbeiter_Projekt (
   MitarbeiterID INT,
   ProjektID INT,
   PRIMARY KEY (MitarbeiterID, ProjektID),
   FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
   FOREIGN KEY (ProjektID) REFERENCES Projekt(ProjektID)
);
```

### 9.4 Wann nicht normalisieren?

- **Performance**: In Data Warehouses wird oft denormalisiert
- **Historische Daten**: Audit-Trails können bewusst denormalisiert sein
- **Star Schema**: im Data Warehouse häufig

---

## 10. Beispiel-Datenbank: Hochschule

```sql
CREATE TABLE Fakultaet (
   FakID INT PRIMARY KEY,
   Name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Studiengang (
   SGID INT PRIMARY KEY,
   Name VARCHAR(100) NOT NULL,
   FakID INT NOT NULL,
   FOREIGN KEY (FakID) REFERENCES Fakultaet(FakID)
);

CREATE TABLE Student (
   StudentID INT PRIMARY KEY,
   Matrikelnummer CHAR(8) NOT NULL UNIQUE,
   Name VARCHAR(100) NOT NULL,
   Geburtsdatum DATE,
   SGID INT,
   FOREIGN KEY (SGID) REFERENCES Studiengang(SGID)
);

CREATE TABLE Professor (
   ProfID INT PRIMARY KEY,
   Name VARCHAR(100) NOT NULL,
   FakID INT NOT NULL,
   FOREIGN KEY (FakID) REFERENCES Fakultaet(FakID)
);

CREATE TABLE Vorlesung (
   VorlesungID INT PRIMARY KEY,
   Titel VARCHAR(200) NOT NULL,
   ECTS INT CHECK (ECTS >= 0 AND ECTS <= 30),
   ProfID INT NOT NULL,
   FOREIGN KEY (ProfID) REFERENCES Professor(ProfID)
);

CREATE TABLE Student_Vorlesung (
   StudentID INT,
   VorlesungID INT,
   Semester VARCHAR(20),
   Note DECIMAL(2,1) CHECK (Note BETWEEN 1.0 AND 5.0),
   PRIMARY KEY (StudentID, VorlesungID, Semester),
   FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
   FOREIGN KEY (VorlesungID) REFERENCES Vorlesung(VorlesungID)
);
```

**Beispielabfrage:**

```sql
-- Welche Vorlesungen hört Anna Müller im aktuellen Semester?
SELECT v.Titel, sv.Note
FROM Student s
JOIN Student_Vorlesung sv ON s.StudentID = sv.StudentID
JOIN Vorlesung v ON sv.VorlesungID = v.VorlesungID
WHERE s.Name = 'Anna Müller'
ORDER BY v.Titel;
```

---

## 11. Quellen und Bildverweise

### Bildverweise

- ERM-Diagramm: <https://commons.wikimedia.org/wiki/Category:Entity%E2%80%93relationship_models>
- Codds 12 Regeln: <https://de.wikipedia.org/wiki/Edgar_F._Codd>
- Relationale Algebra: <https://de.wikipedia.org/wiki/Relationale_Algebra>

### Quellen

- E. F. Codd: *A Relational Model of Data for Large Shared Data Banks*, 1970
- C. Date: *An Introduction to Database Systems*, 8. Aufl., Addison-Wesley
- R. Elmasri, S. Navathe: *Grundlagen von Datenbanksystemen*, Pearson
- A. Kemper, A. Eickler: *Datenbanksysteme: Eine Einführung*, Oldenbourg
- H. Garcia-Molina, J. Ullman, J. Widom: *Database Systems: The Complete Book*, Pearson
- de.wikipedia.org/wiki/Relationale_Datenbank
- de.wikipedia.org/wiki/Relationale_Algebra
- oer-informatik.de/relationenmodell

---

## 12. Lernaufgaben

### Übung 1 — Codds Regeln

Erklären Sie anhand von drei Codds Regeln, warum diese für ein RDBMS wichtig sind.

### Übung 2 — Relationale Algebra

Formulieren Sie die folgende Anfrage in relationaler Algebra:

> "Name und Abteilung aller Mitarbeiter mit Gehalt > 5000 €"

### Übung 3 — SQL für Joins

Schreiben Sie SQL für:

1. Alle Bestellungen von Kunde Müller
2. Alle Produkte, die Müller bestellt hat
3. Anzahl Bestellungen pro Kunde

### Übung 4 — Normalisierung

Gegeben:

```
Bestellung(BestellID, Datum, KundeName, KundeStadt, Produkt, Preis)
```

Normalisieren Sie bis 3NF.

---

## 13. Zusammenfassung

Das **relationale Modell** von Edgar F. Codd (1970) bildet die Grundlage moderner Datenbanksysteme. Es basiert auf dem mathematischen Konzept der Relation und verwendet eine deklarative Anfragesprache (SQL).

**Schlüsselkonzepte:**

- **Relation**: Tabelle mit Tupeln und Attributen
- **Schlüssel**: Primär-, Fremd-, Alternativ-, Kandidatenschlüssel
- **Integrität**: Entity-, referenzielle, Domain-Integrität
- **Algebra**: Selektion, Projektion, Join, Vereinigung, Differenz
- **Kalkül**: deklarative, logikbasierte Anfragesprache
- **Normalisierung**: 1NF bis 4NF/BCNF
- **Mapping**: ERD → Relationen mit klaren Regeln

### Selbsttest-Checkliste

- [ ] Ich erkläre die Grundbegriffe des relationalen Modells.
- [ ] Ich nenne Codds 12 Regeln.
- [ ] Ich unterscheide die Schlüsseltypen.
- [ ] Ich wende die relationalen Algebra-Operatoren an.
- [ ] Ich überführe ein ERD in ein Schema.
- [ ] Ich normalisiere bis zur 3NF.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2600 — Recherche 2026*
