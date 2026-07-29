# Fachmodul: SQL-DDL (Data Definition Language)

**Kurs-ID:** 3614
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3614

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist DDL?](#2-was-ist-ddl)
3. [Datenbanken anlegen und verwalten](#3-datenbanken-anlegen-und-verwalten)
4. [Tabellen anlegen: CREATE TABLE](#4-tabellen-anlegen-create-table)
5. [Datentypen](#5-datentypen)
6. [Constraints (Einschränkungen)](#6-constraints-einschränkungen)
7. [ALTER TABLE – Schema ändern](#7-alter-table--schema-ändern)
8. [DROP und TRUNCATE](#8-drop-und-truncate)
9. [Indizes](#9-indizes)
10. [Views](#10-views)
11. [Auto-Increment und Sequenzen](#11-auto-increment-und-sequenzen)
12. [CREATE SCHEMA / CREATE DOMAIN](#12-create-schema--create-domain)
13. [Beispieldatenbank](#13-beispieldatenbank)
14. [Bild- und Quellenverweise](#14-bild-und-quellenverweise)
15. [Lernaufgaben](#15-lernaufgaben)
16. [Zusammenfassung](#16-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Datenbanken und Schemata anlegen,
- Tabellen mit passenden Datentypen und Constraints erstellen,
- Tabellenstrukturen ändern und löschen,
- Indizes für Performance anlegen,
- Views definieren und nutzen,
- Auto-Increment für Surrogate Keys einsetzen.

---

## 2. Was ist DDL?

**DDL (Data Definition Language)** ist der Teil von SQL, der das **Schema** der Datenbank definiert.

**DDL-Anweisungen:**

- `CREATE`: Objekte anlegen (DATABASE, TABLE, INDEX, VIEW)
- `ALTER`: Objekte ändern
- `DROP`: Objekte löschen
- `TRUNCATE`: Tabelleninhalt löschen

**Unterschied DDL vs DML:**

| | DDL | DML |
|---|---|---|
| Aufgabenbereich | Schema | Daten |
| Beispiele | CREATE TABLE, ALTER TABLE | INSERT, UPDATE, DELETE |
| Transaktion | meist implizit (Auto-Commit) | explizit (BEGIN/COMMIT) |

---

## 3. Datenbanken anlegen und verwalten

### 3.1 Datenbank erstellen

```sql
-- Standard
CREATE DATABASE Buchhaltung;

-- Mit Zeichensatz
CREATE DATABASE Buchhaltung
   CHARACTER SET utf8mb4
   COLLATE utf8mb4_unicode_ci;

-- PostgreSQL
CREATE DATABASE Buchhaltung
   WITH ENCODING 'UTF8'
   LC_COLLATE 'de_DE.UTF-8'
   LC_CTYPE 'de_DE.UTF-8';
```

### 3.2 Datenbank auswählen

```sql
-- MySQL
USE Buchhaltung;

-- PostgreSQL
\c Buchhaltung

-- SQL Server
USE Buchhaltung;
```

### 3.3 Datenbanken anzeigen

```sql
SHOW DATABASES;        -- MySQL
SELECT datname FROM pg_database;  -- PostgreSQL
```

### 3.4 Datenbank löschen

```sql
DROP DATABASE Buchhaltung;
DROP DATABASE IF EXISTS Buchhaltung;  -- sicher
```

> **Achtung:** DROP DATABASE löscht alle Tabellen und Daten unwiderruflich!

---

## 4. Tabellen anlegen: CREATE TABLE

### 4.1 Syntax

```sql
CREATE TABLE [IF NOT EXISTS] tabellenname (
    spalte1 datentyp [constraints],
    spalte2 datentyp [constraints],
    ...
    [tabellenconstraints]
);
```

### 4.2 Einfaches Beispiel

```sql
CREATE TABLE Mitarbeiter (
    MitarbeiterID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Eintrittsdatum DATE,
    Gehalt DECIMAL(10,2) CHECK (Gehalt >= 0),
    AbtID INT,
    FOREIGN KEY (AbtID) REFERENCES Abteilung(AbtID)
);
```

### 4.3 Temporäre Tabelle

```sql
-- Session-Tabelle
CREATE TEMPORARY TABLE TempErgebnis (
    Name VARCHAR(100),
    Wert DECIMAL(10,2)
);
```

### 4.4 CREATE TABLE LIKE / AS SELECT

```sql
-- Struktur kopieren
CREATE TABLE MitarbeiterBackup LIKE Mitarbeiter;

-- Struktur und Daten kopieren
CREATE TABLE MitarbeiterBackup AS
SELECT * FROM Mitarbeiter WHERE Jahr = 2023;
```

---

## 5. Datentypen

### 5.1 Numerische Typen

| Typ | Beschreibung | Speicher |
|---|---|---|
| `TINYINT` | -128 bis 127 | 1 Byte |
| `SMALLINT` | -32 768 bis 32 767 | 2 Byte |
| `INT` / `INTEGER` | -2,1 Mrd. bis 2,1 Mrd. | 4 Byte |
| `BIGINT` | sehr großer Bereich | 8 Byte |
| `DECIMAL(p,s)` | exakte Dezimalzahl | variabel |
| `FLOAT(p)` | Gleitkommazahl | 4 Byte |
| `DOUBLE` | doppelte Genauigkeit | 8 Byte |
| `BOOLEAN` / `BIT` | wahr/falsch | 1 Byte |

### 5.2 Zeichenketten

| Typ | Beschreibung | Maximale Länge |
|---|---|---|
| `CHAR(n)` | feste Länge | 255 |
| `VARCHAR(n)` | variable Länge | 65535 (MySQL) |
| `TEXT` | langer Text | 65 535 Zeichen |
| `MEDIUMTEXT` | mittel | 16 MB |
| `LONGTEXT` | sehr lang | 4 GB |

### 5.3 Datum und Zeit

| Typ | Format |
|---|---|
| `DATE` | YYYY-MM-DD |
| `TIME` | HH:MM:SS |
| `DATETIME` | YYYY-MM-DD HH:MM:SS |
| `TIMESTAMP` | YYYY-MM-DD HH:MM:SS (mit Zeitzone) |
| `YEAR` | YYYY |

### 5.4 Binäre und sonstige Typen

| Typ | Beschreibung |
|---|---|
| `BLOB` | Binary Large Object |
| `ENUM` | Aufzählung |
| `JSON` / `JSONB` | JSON-Daten |
| `UUID` | 16-Byte-UUID |
| `XML` | XML-Daten |

---

## 6. Constraints (Einschränkungen)

### 6.1 NOT NULL

```sql
CREATE TABLE Benutzer (
    BenutzerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);
```

### 6.2 UNIQUE

```sql
CREATE TABLE Kunde (
    KundeID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,
    Steuernummer VARCHAR(20) UNIQUE
);
```

### 6.3 PRIMARY KEY

```sql
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY
);

-- Zusammengesetzter Primärschlüssel
CREATE TABLE Bestellposition (
    BestellID INT,
    PositionsNr INT,
    Menge INT,
    PRIMARY KEY (BestellID, PositionsNr)
);

-- Benannt
CREATE TABLE Produkt (
    ProduktID INT,
    Name VARCHAR(100),
    CONSTRAINT pk_produkt PRIMARY KEY (ProduktID)
);
```

### 6.4 FOREIGN KEY

```sql
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,
    KundeID INT,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
```

**Referenzielle Aktionen:**

- `RESTRICT` / `NO ACTION`: Standard, verhindert
- `CASCADE`: Weitergabe
- `SET NULL`: auf NULL setzen
- `SET DEFAULT`: auf Default setzen

### 6.5 CHECK

```sql
CREATE TABLE Mitarbeiter (
    Gehalt DECIMAL(10,2) CHECK (Gehalt >= 0),
    Eintrittsdatum DATE CHECK (Eintrittsdatum >= '2000-01-01'),
    Abteilung VARCHAR(50) CHECK (Abteilung IN ('IT', 'HR', 'Sales'))
);
```

### 6.6 DEFAULT

```sql
CREATE TABLE Bestellung (
    Status VARCHAR(20) DEFAULT 'Neu',
    ErstelltAm TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 6.7 Constraints nachträglich hinzufügen

```sql
ALTER TABLE Mitarbeiter
ADD CONSTRAINT fk_abt FOREIGN KEY (AbtID) REFERENCES Abteilung(AbtID);

ALTER TABLE Mitarbeiter
ADD CONSTRAINT chk_gehalt CHECK (Gehalt >= 0);
```

### 6.8 Constraints entfernen

```sql
-- MySQL
ALTER TABLE Mitarbeiter DROP CONSTRAINT fk_abt;

-- PostgreSQL
ALTER TABLE Mitarbeiter DROP CONSTRAINT fk_abt;
```

### 6.9 Constraints benennen

```sql
CONSTRAINT pk_mitarbeiter PRIMARY KEY (MitarbeiterID)
CONSTRAINT uq_email UNIQUE (Email)
CONSTRAINT fk_abt FOREIGN KEY (AbtID) REFERENCES Abteilung(AbtID)
CONSTRAINT chk_gehalt CHECK (Gehalt >= 0)
```

---

## 7. ALTER TABLE – Schema ändern

### 7.1 Spalten hinzufügen

```sql
ALTER TABLE Mitarbeiter ADD Telefon VARCHAR(20);
ALTER TABLE Mitarbeiter ADD (Telefon VARCHAR(20), Fax VARCHAR(20));  -- Oracle
```

### 7.2 Spalten ändern

```sql
-- MySQL
ALTER TABLE Mitarbeiter MODIFY Gehalt DECIMAL(12,2);
ALTER TABLE Mitarbeiter CHANGE Telefon Mobil VARCHAR(20);

-- PostgreSQL
ALTER TABLE Mitarbeiter ALTER COLUMN Gehalt TYPE DECIMAL(12,2);

-- SQL Server
ALTER TABLE Mitarbeiter ALTER COLUMN Gehalt DECIMAL(12,2);
```

### 7.3 Spalten umbenennen

```sql
-- MySQL
ALTER TABLE Mitarbeiter RENAME COLUMN Telefon TO Mobil;

-- PostgreSQL
ALTER TABLE Mitarbeiter RENAME COLUMN Telefon TO Mobil;

-- SQL Server
EXEC sp_rename 'Mitarbeiter.Telefon', 'Mobil', 'COLUMN';
```

### 7.4 Spalten löschen

```sql
-- MySQL / PostgreSQL / SQL Server
ALTER TABLE Mitarbeiter DROP COLUMN Telefon;
```

### 7.5 Constraints hinzufügen / löschen

```sql
ALTER TABLE Mitarbeiter ADD CONSTRAINT fk_abt FOREIGN KEY (AbtID) REFERENCES Abteilung(AbtID);
ALTER TABLE Mitarbeiter DROP CONSTRAINT fk_abt;
```

### 7.6 Tabelle umbenennen

```sql
-- MySQL
RENAME TABLE Mitarbeiter TO Angestellte;

-- PostgreSQL
ALTER TABLE Mitarbeiter RENAME TO Angestellte;

-- SQL Server
EXEC sp_rename 'Mitarbeiter', 'Angestellte';
```

### 7.7 Kommentare an Tabellen/Spalten

```sql
-- PostgreSQL
COMMENT ON TABLE Mitarbeiter IS 'Tabelle aller Mitarbeiter';
COMMENT ON COLUMN Mitarbeiter.Gehalt IS 'Bruttogehalt in EUR';

-- MySQL
ALTER TABLE Mitarbeiter COMMENT = 'Tabelle aller Mitarbeiter';
ALTER TABLE Mitarbeiter MODIFY Gehalt DECIMAL(10,2) COMMENT 'Bruttogehalt in EUR';
```

---

## 8. DROP und TRUNCATE

### 8.1 DROP TABLE

```sql
DROP TABLE Mitarbeiter;
DROP TABLE IF EXISTS Mitarbeiter;
DROP TABLE Mitarbeiter CASCADE;  -- PostgreSQL
```

### 8.2 TRUNCATE TABLE

```sql
TRUNCATE TABLE Mitarbeiter;
TRUNCATE TABLE Mitarbeiter RESTART IDENTITY;  -- PostgreSQL, setzt AUTO_INCREMENT zurück
```

### 8.3 DROP DATABASE

```sql
DROP DATABASE Buchhaltung;
DROP DATABASE IF EXISTS Buchhaltung;
```

### 8.4 DROP SCHEMA

```sql
DROP SCHEMA Berichtswesen;
DROP SCHEMA Berichtswesen CASCADE;
```

### 8.5 Vergleich

| Anweisung | Wirkung | Auto-Commit | Rollback |
|---|---|---|---|
| DROP DATABASE | Löscht gesamte DB | ja | nein |
| DROP TABLE | Löscht Tabelle | ja | nein (DDL) |
| DROP SCHEMA | Löscht Schema | ja | nein |
| TRUNCATE TABLE | Leert Tabelle | meistens ja | eingeschränkt |
| DELETE | Löscht Zeilen | nein (DML) | ja |

---

## 9. Indizes

### 9.1 CREATE INDEX

```sql
-- Einfacher Index
CREATE INDEX idx_name ON Mitarbeiter(Name);

-- Composite Index (mehrere Spalten)
CREATE INDEX idx_abt_geh ON Mitarbeiter(AbtID, Gehalt DESC);

-- Eindeutiger Index
CREATE UNIQUE INDEX idx_email ON Kunde(Email);

-- Funktionaler Index
CREATE INDEX idx_lower_email ON Kunde(LOWER(Email));

-- Partielle Index (PostgreSQL)
CREATE INDEX idx_aktiv ON Kunde(Name) WHERE Aktiv = TRUE;
```

### 9.2 DROP INDEX

```sql
DROP INDEX idx_name;        -- PostgreSQL/SQL Server
DROP INDEX idx_name ON Mitarbeiter;  -- MySQL
```

### 9.3 Implizite Indizes

PRIMARY KEY und UNIQUE erzeugen automatisch Indizes:

```sql
CREATE TABLE Mitarbeiter (
    MitarbeiterID INT PRIMARY KEY,           -- impliziter Index
    Email VARCHAR(100) UNIQUE               -- impliziter Index
);
```

### 9.4 INDEX-Optionen

| Typ | Verwendung |
|---|---|
| **B-Tree** (Default) | Vergleich, Bereich, ORDER BY |
| **Hash** | Exakte Gleichheit (=, IN) |
| **Bitmap** | Data Warehouse, niedrige Kardinalität |
| **GIN** | JSONB, Arrays, Volltextsuche (PostgreSQL) |
| **GiST** | Geodaten, Volltextsuche (PostgreSQL) |
| **BRIN** | Sehr große Tabellen mit sortierter Einfügereihenfolge |

```sql
-- PostgreSQL
CREATE INDEX idx_gin ON Produkt USING GIN (Tags);
CREATE INDEX idx_brin ON Logs USING BRIN (ErstelltAm);

-- Oracle
CREATE INDEX idx_bitmap ON Produkt(Status);
```

---

## 10. Views

### 10.1 Einfache View

```sql
CREATE VIEW v_aktive_mitarbeiter AS
SELECT MitarbeiterID, Name, Email
FROM Mitarbeiter
WHERE Aktiv = TRUE;
```

### 10.2 View mit JOIN

```sql
CREATE VIEW v_mitarbeiter_abteilung AS
SELECT m.MitarbeiterID, m.Name, a.AbtName, m.Gehalt
FROM Mitarbeiter m
JOIN Abteilung a ON m.AbtID = a.AbtID;
```

### 10.3 Updatable View

Einfache Views ohne JOIN, GROUP BY oder Aggregat sind updatebar:

```sql
UPDATE v_aktive_mitarbeiter SET Name = 'Anna S.' WHERE MitarbeiterID = 1001;
```

### 10.4 WITH CHECK OPTION

```sql
CREATE VIEW v_aktive_mitarbeiter AS
SELECT MitarbeiterID, Name, Email
FROM Mitarbeiter
WHERE Aktiv = TRUE
WITH CHECK OPTION;
```

### 10.5 Materialized View (PostgreSQL/Oracle)

```sql
CREATE MATERIALIZED VIEW mv_vertrieb AS
SELECT Jahr, Monat, SUM(Umsatz) AS Umsatz
FROM Bestellung
GROUP BY Jahr, Monat;

REFRESH MATERIALIZED VIEW mv_vertrieb;
```

### 10.6 DROP VIEW

```sql
DROP VIEW v_aktive_mitarbeiter;
DROP VIEW IF EXISTS v_aktive_mitarbeiter;
```

---

## 11. Auto-Increment und Sequenzen

### 11.1 MySQL / MariaDB

```sql
CREATE TABLE Mitarbeiter (
    MitarbeiterID INT PRIMARY KEY AUTO_INCREMENT
);
```

Startwert und Schrittweite:

```sql
ALTER TABLE Mitarbeiter AUTO_INCREMENT = 1000;
```

### 11.2 SQL Server

```sql
CREATE TABLE Mitarbeiter (
    MitarbeiterID INT IDENTITY(1,1) PRIMARY KEY
);
```

### 11.3 PostgreSQL – Sequenzen

```sql
CREATE SEQUENCE seq_mitarbeiter START 1000 INCREMENT 1;

CREATE TABLE Mitarbeiter (
    MitarbeiterID INT PRIMARY KEY DEFAULT NEXTVAL('seq_mitarbeiter')
);

-- Manuell
INSERT INTO Mitarbeiter (MitarbeiterID, Name) VALUES (NEXTVAL('seq_mitarbeiter'), 'Anna');
```

### 11.4 Oracle – Sequenzen

```sql
CREATE SEQUENCE seq_mitarbeiter START WITH 1000 INCREMENT BY 1;

INSERT INTO Mitarbeiter (MitarbeiterID, Name)
VALUES (seq_mitarbeiter.NEXTVAL, 'Anna');
```

### 11.5 Aktuellen Wert abfragen

```sql
SELECT LAST_INSERT_ID();         -- MySQL
SELECT SCOPE_IDENTITY();         -- SQL Server
SELECT currval('seq_mitarbeiter');  -- PostgreSQL/Oracle
```

---

## 12. CREATE SCHEMA / CREATE DOMAIN

### 12.1 CREATE SCHEMA

```sql
-- PostgreSQL / SQL Server
CREATE SCHEMA Berichtswesen;

CREATE TABLE Berichtswesen.Umsatz (
    Jahr INT,
    Betrag DECIMAL(10,2)
);
```

### 12.2 CREATE DOMAIN (PostgreSQL)

```sql
CREATE DOMAIN email_adresse AS VARCHAR(255)
   CHECK (VALUE ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

CREATE TABLE Benutzer (
    ID INT PRIMARY KEY,
    Email email_adresse NOT NULL
);
```

### 12.3 CREATE TYPE (PostgreSQL)

```sql
CREATE TYPE adresse AS (
    strasse VARCHAR(100),
    plz VARCHAR(10),
    ort VARCHAR(50)
);

CREATE TABLE kunde (
    id INT PRIMARY KEY,
    wohnadresse adresse
);
```

---

## 13. Beispieldatenbank

Eine vollständige Beispiel-Datenbank:

```sql
-- Datenbank anlegen
CREATE DATABASE Buchladen
   CHARACTER SET utf8mb4
   COLLATE utf8mb4_unicode_ci;

USE Buchladen;

-- Tabelle Autor
CREATE TABLE Autor (
    AutorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Geburtsdatum DATE,
    Nationalitaet VARCHAR(50)
);

-- Tabelle Verlag
CREATE TABLE Verlag (
    VerlagID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Ort VARCHAR(50),
    Gründungsjahr INT CHECK (Gründungsjahr > 1450)
);

-- Tabelle Buch
CREATE TABLE Buch (
    ISBN VARCHAR(20) PRIMARY KEY,
    Titel VARCHAR(200) NOT NULL,
    Erscheinungsjahr INT CHECK (Erscheinungsjahr > 0),
    Preis DECIMAL(10,2) CHECK (Preis > 0),
    VerlagID INT NOT NULL,
    FOREIGN KEY (VerlagID) REFERENCES Verlag(VerlagID)
);

-- Tabelle Buch_Autor (N:M)
CREATE TABLE Buch_Autor (
    ISBN VARCHAR(20),
    AutorID INT,
    PRIMARY KEY (ISBN, AutorID),
    FOREIGN KEY (ISBN) REFERENCES Buch(ISBN),
    FOREIGN KEY (AutorID) REFERENCES Autor(AutorID)
);

-- Tabelle Kunde
CREATE TABLE Kunde (
    KundeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    RegistriertAm TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabelle Bestellung
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY AUTO_INCREMENT,
    KundeID INT NOT NULL,
    Datum DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Neu',
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
);

-- Tabelle Bestellposition
CREATE TABLE Bestellposition (
    BestellID INT,
    PositionsNr INT,
    ISBN VARCHAR(20),
    Menge INT CHECK (Menge > 0),
    Einzelpreis DECIMAL(10,2),
    PRIMARY KEY (BestellID, PositionsNr),
    FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID),
    FOREIGN KEY (ISBN) REFERENCES Buch(ISBN)
);

-- Indizes
CREATE INDEX idx_buch_titel ON Buch(Titel);
CREATE INDEX idx_bestellung_datum ON Bestellung(Datum);

-- View
CREATE VIEW v_buchliste AS
SELECT b.ISBN, b.Titel, a.Name AS Autor, v.Name AS Verlag, b.Preis
FROM Buch b
LEFT JOIN Buch_Autor ba ON b.ISBN = ba.ISBN
LEFT JOIN Autor a ON ba.AutorID = a.AutorID
LEFT JOIN Verlag v ON b.VerlagID = v.VerlagID;
```

---

## 14. Bild- und Quellenverweise

- SQL Standard: <https://www.iso.org/standard/63555.html>
- MySQL CREATE TABLE: <https://dev.mysql.com/doc/refman/8.0/en/create-table.html>
- PostgreSQL DDL: <https://www.postgresql.org/docs/current/ddl.html>
- SQL Server DDL: <https://learn.microsoft.com/de-de/sql/t-sql/statements/create-table-transact-sql>
- Oracle DDL: <https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/CREATE-TABLE.html>

---

## 15. Lernaufgaben

### Übung 1 — Datenbank anlegen

Erstellen Sie die Datenbank `Bibliothek` mit Zeichensatz UTF-8.

### Übung 2 — Tabelle mit Constraints

Erstellen Sie eine Tabelle `Buch` mit PK, NOT NULL, UNIQUE, CHECK, FK.

### Übung 3 — ALTER TABLE

Erweitern Sie eine Tabelle um mehrere Spalten, Constraints und ändern Sie Datentypen.

### Übung 4 — Indizes

Erstellen Sie einen Composite-Index und einen Unique-Index. Testen Sie die Wirkung mit `EXPLAIN`.

### Übung 5 — Views

Erstellen Sie eine View, die mehrere Tabellen verknüpft, und testen Sie Abfragen darauf.

---

## 16. Zusammenfassung

DDL definiert das Schema einer Datenbank:

- **CREATE DATABASE / SCHEMA**: Datenbank anlegen
- **CREATE TABLE**: Tabelle mit Spalten und Constraints
- **ALTER TABLE**: Schema ändern
- **DROP TABLE / DATABASE**: Objekte löschen
- **TRUNCATE**: Tabelleninhalt leeren
- **CREATE INDEX / VIEW**: Performance- und Sicht-Objekte
- **Sequenzen / AUTO_INCREMENT**: Surrogate Keys

**Wichtigste Constraints:**

- **PRIMARY KEY**: eindeutige Identifikation
- **FOREIGN KEY**: referenzielle Integrität
- **UNIQUE**: keine Duplikate
- **NOT NULL**: Pflichtfeld
- **CHECK**: Wertebereich
- **DEFAULT**: Vorgabewert

### Selbsttest-Checkliste

- [ ] Ich lege Datenbanken und Tabellen an.
- [ ] Ich wähle passende Datentypen.
- [ ] Ich nutze alle wichtigen Constraints.
- [ ] Ich modifiziere Schemata mit ALTER TABLE.
- [ ] Ich nutze Indizes strategisch.
- [ ] Ich erstelle Views.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3614 — Recherche 2026*
