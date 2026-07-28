# Fachmodul: DB Einführung

**Kurs-ID:** 3464
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3464

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist eine Datenbank?](#2-was-ist-eine-datenbank)
3. [Geschichte der Datenbanken](#3-geschichte-der-datenbanken)
4. [Datenbankmanagementsysteme (DBMS)](#4-datenbankmanagementsysteme-dbms)
5. [Datenbankarchitektur](#5-datenbankarchitektur)
6. [Datenmodelle im Überblick](#6-datenmodelle-im-überblick)
7. [Tabellen, Zeilen, Spalten](#7-tabellen-zeilen-spalten)
8. [Datentypen](#8-datentypen)
9. [Primärschlüssel und Fremdschlüssel](#9-primärschlüssel-und-fremdschlüssel)
10. [Beziehungen zwischen Tabellen](#10-beziehungen-zwischen-tabellen)
11. [SQL-Grundlagen (DDL/DML)](#11-sql-grundlagen-ddldml)
12. [ACID-Prinzip](#12-acid-prinzip)
13. [Datenbankbenutzer](#13-datenbankbenutzer)
14. [Werkzeuge und Schnittstellen](#14-werkzeuge-und-schnittstellen)
15. [Bild- und Quellenverweise](#15-bild-und-quellenverweise)
16. [Lernaufgaben](#16-lernaufgaben)
17. [Zusammenfassung](#17-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- den Begriff "Datenbank" und "DBMS" klar definieren,
- die historische Entwicklung von Dateisystemen zu modernen RDBMS einordnen,
- wichtige Architekturmodelle (1-Schicht, 2-Schicht, 3-Schicht) unterscheiden,
- wichtige Datenmodelle (hierarchisch, netzwerkartig, relational, objektorientiert, dokumentenorientiert) vergleichen,
- Tabellen, Zeilen, Spalten und Datentypen beschreiben,
- Primärschlüssel, Fremdschlüssel und Beziehungen erklären,
- einfache SQL-Anweisungen (SELECT, INSERT, UPDATE, DELETE) verstehen,
- das ACID-Prinzip erläutern.

---

## 2. Was ist eine Datenbank?

Eine **Datenbank** ist eine **strukturierte, dauerhaft gespeicherte und langfristig verfügbare Sammlung von Daten**, die mit einem Datenbankmanagementsystem (DBMS) verwaltet wird.

**Merkmale einer Datenbank:**

- **Strukturiertheit**: Daten sind nach einem definierten Schema organisiert
- **Persistenz**: Daten überdauern Prozesse und Systemabstürze
- **Konsistenz**: Daten halten Integritätsregeln ein
- **Mehrbenutzerfähigkeit**: paralleler Zugriff durch mehrere Nutzer
- **Abfragesprache**: deklarative Sprache (z. B. SQL)
- **Transaktionsschutz**: ACID-Eigenschaften

> Im Unterschied zu einer einfachen **Datei** ist eine Datenbank ein **Datenbanksystem** aus Datenbasis + DBMS.

---

## 3. Geschichte der Datenbanken

| Zeitraum | Entwicklung |
|---|---|
| 1960er | Dateisysteme, hierarchische DB (IMS von IBM) |
| 1969 | Netzwerk-Datenmodell (CODASYL) |
| 1970 | **Relationales Modell** durch Edgar F. Codd |
| 1970er | Prototyp-Systeme (System R, INGRES), SQL entsteht |
| 1980er | Kommerzielle RDBMS (Oracle, DB2, SQL Server) |
| 1990er | Data Warehousing, OLAP |
| 2000er | NoSQL, MapReduce, Cloud-Datenbanken |
| 2010er | NewSQL, HTAP, Multi-Model-DB |
| 2020er | Cloud-native, Serverless, KI-Integration |

![Datenbank Geschichte](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Edgar_F._Codd.jpg/240px-Edgar_F._Codd.jpg)
*Edgar F. Codd — Vater des relationalen Modells (Quelle: Wikimedia Commons)*

---

## 4. Datenbankmanagementsysteme (DBMS)

Ein **DBMS** ist die Software zur Verwaltung der Datenbank. Es bietet Schnittstellen für Datendefinition (DDL), Datenmanipulation (DML), Datensicherung und Mehrbenutzersynchronisation.

**Wichtige relationale DBMS:**

| DBMS | Hersteller | Lizenz |
|---|---|---|
| MySQL / MariaDB | Oracle / Community | GPL / kommerzielle Variante |
| PostgreSQL | Community | BSD-Lizenz |
| Oracle Database | Oracle | kommerziell |
| Microsoft SQL Server | Microsoft | kommerziell |
| IBM Db2 | IBM | kommerziell |
| SQLite | D. Richard Hipp | Public Domain |
| SAP HANA | SAP | kommerziell |

**NoSQL-DBMS:**

| Kategorie | Beispiele |
|---|---|
| Key-Value | Redis, DynamoDB, etcd |
| Dokument | MongoDB, CouchDB, Couchbase |
| Spaltenorientiert | Cassandra, HBase |
| Graphdatenbank | Neo4j, JanusGraph |

---

## 5. Datenbankarchitektur

### 5.1 1-Schicht-Architektur

Datenbank und Anwendung laufen auf demselben System. Frühe Mainframe-Systeme.

### 5.2 2-Schicht-Architektur (Client-Server)

Klassische Aufteilung: Client (Anwendung) ↔ DBMS-Server. Beispiel: Desktop-App mit MySQL.

### 5.3 3-Schicht-Architektur

| Schicht | Funktion |
|---|---|
| Präsentationsschicht | GUI / Web-Frontend |
| Logikschicht | Anwendungslogik (z. B. Java/Python) |
| Datenhaltungsschicht | DBMS |

Vorteile: Skalierbarkeit, Sicherheit, Mehrbenutzerfähigkeit.

### 5.4 ANSI/SPARC-Architektur

Drei Abstraktionsebenen:

- **Externes Schema** – Sicht einzelner Anwender
- **Konzeptionelles Schema** – globale Sicht der gesamten Datenbank
- **Internes Schema** – physikalische Speicherung

---

## 6. Datenmodelle im Überblick

| Modell | Beschreibung | Beispiel |
|---|---|---|
| **Hierarchisch** | Baumstruktur (Parent-Child) | IBM IMS, Windows Registry |
| **Netzwerkartig** | Graph mit Many-to-Many | CODASYL |
| **Relational** | Tabellen mit Beziehungen | MySQL, PostgreSQL, Oracle |
| **Objektorientiert** | Objekte mit Klassen, Vererbung | db4o, ObjectDB |
| **Objektrelational** | Erweiterung des relationalen Modells | PostgreSQL, Oracle |
| **Dokumentenorientiert** | JSON/BSON-Dokumente | MongoDB, CouchDB |
| **Spaltenorientiert** | Wide-Column-Stores | Cassandra, HBase |
| **Graphdatenbank** | Knoten + Kanten | Neo4j |

---

## 7. Tabellen, Zeilen, Spalten

Eine **Tabelle** (Relation) besteht aus:

- **Spalten** (Attribute, Felder): beschreiben die Eigenschaften
- **Zeilen** (Tupel, Datensätze): enthalten die konkreten Daten
- **Zellen**: einzelne Datenwerte an der Schnittstelle von Zeile und Spalte

Beispiel `Mitarbeiter`:

| MitarbeiterID | Name | Abteilung | Eintrittsdatum |
|---|---|---|---|
| 1001 | Anna Müller | IT | 2020-03-15 |
| 1002 | Bernd Schmitt | Vertrieb | 2019-07-01 |
| 1003 | Clara Weiß | IT | 2021-09-12 |

---

## 8. Datentypen

Die meisten SQL-Datenbanken verwenden ähnliche Datentypen:

| Kategorie | Beispiele |
|---|---|
| **Ganze Zahlen** | `INT`, `INTEGER`, `SMALLINT`, `BIGINT`, `TINYINT` |
| **Dezimalzahlen** | `DECIMAL(p,s)`, `NUMERIC(p,s)`, `FLOAT`, `DOUBLE`, `REAL` |
| **Zeichenketten** | `CHAR(n)`, `VARCHAR(n)`, `TEXT`, `CLOB` |
| **Datum/Zeit** | `DATE`, `TIME`, `DATETIME`, `TIMESTAMP`, `INTERVAL` |
| **Binär** | `BINARY`, `VARBINARY`, `BLOB` |
| **Boolesch** | `BOOLEAN`, `BIT` |
| **Sonstige** | `UUID`, `JSON`, `XML`, `ENUM`, `ARRAY`, `UUID` |

**Wahl des Datentyps:**

- Minimal, aber ausreichend dimensionieren
- Speicherbedarf beachten
- Performance: `INT` schneller als `VARCHAR`
- Semantik: `BOOLEAN` statt `CHAR(1)` für Ja/Nein

---

## 9. Primärschlüssel und Fremdschlüssel

### 9.1 Primärschlüssel (Primary Key)

Ein Primärschlüssel identifiziert jede Zeile einer Tabelle eindeutig.

**Eigenschaften:**

- Eindeutigkeit
- Minimalität
- Nicht-NULL
- Stabil

```sql
CREATE TABLE Mitarbeiter (
   MitarbeiterID INT PRIMARY KEY AUTO_INCREMENT,
   Name VARCHAR(100) NOT NULL,
   ...
);
```

**Surrogate vs. Natural Key:**

- **Surrogate Key**: künstlich vergebene ID (z. B. AUTO_INCREMENT)
- **Natural Key**: fachliche Eigenschaft (z. B. SVNR)

### 9.2 Fremdschlüssel (Foreign Key)

Ein Fremdschlüssel verweist auf den Primärschlüssel einer anderen Tabelle.

```sql
CREATE TABLE Bestellung (
   BestellID INT PRIMARY KEY AUTO_INCREMENT,
   KundeID INT NOT NULL,
   Datum DATE,
   FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
);
```

**Referenzielle Integrität:** Jeder Fremdschlüssel muss auf einen existierenden Primärschlüssel verweisen oder NULL sein.

---

## 10. Beziehungen zwischen Tabellen

| Typ | Symbol | Beispiel |
|---|---|---|
| **1:1** | `1:1` | Person ↔ Ausweis |
| **1:N** | `1:N` | Kunde → Bestellungen |
| **N:M** | `N:M` | Student ↔ Kurse |

**Umsetzung in SQL:**

- **1:1**: Fremdschlüssel mit UNIQUE-Constraint auf einer Seite
- **1:N**: Fremdschlüssel auf der N-Seite
- **N:M**: Zwischentabelle mit zusammengesetztem Primärschlüssel

---

## 11. SQL-Grundlagen (DDL/DML)

### 11.1 DDL — Data Definition Language

```sql
-- Tabelle anlegen
CREATE TABLE Kunde (
   KundeID INT PRIMARY KEY AUTO_INCREMENT,
   Name VARCHAR(100) NOT NULL,
   Email VARCHAR(100) UNIQUE,
   Registrierungsdatum DATE DEFAULT CURRENT_DATE
);

-- Tabelle ändern
ALTER TABLE Kunde ADD Telefon VARCHAR(20);

-- Tabelle löschen
DROP TABLE Kunde;
```

### 11.2 DML — Data Manipulation Language

```sql
-- Einfügen
INSERT INTO Kunde (Name, Email) VALUES ('Anna', 'anna@example.com');

-- Abfragen
SELECT KundeID, Name FROM Kunde WHERE Email LIKE '%@example.com';

-- Aktualisieren
UPDATE Kunde SET Email = 'neu@example.com' WHERE KundeID = 1001;

-- Löschen
DELETE FROM Kunde WHERE KundeID = 1001;
```

### 11.3 Aggregatfunktionen

```sql
SELECT Abteilung, COUNT(*) AS Anzahl, AVG(Gehalt) AS Durchschnitt
FROM Mitarbeiter
GROUP BY Abteilung
HAVING COUNT(*) > 5
ORDER BY Durchschnitt DESC;
```

---

## 12. ACID-Prinzip

Transaktionen in relationalen Datenbanken erfüllen vier Eigenschaften:

| Eigenschaft | Bedeutung |
|---|---|
| **Atomicity** | Alles oder nichts: Transaktion wird komplett oder gar nicht ausgeführt |
| **Consistency** | Vor und nach der Transaktion sind alle Integritätsregeln erfüllt |
| **Isolation** | Transaktionen beeinflussen sich nicht gegenseitig |
| **Durability** | Nach Commit sind Daten dauerhaft gespeichert |

**Beispiel:** Banküberweisung: Abbuchen und Überweisung müssen beide gelingen oder beide rückgängig gemacht werden.

---

## 13. Datenbankbenutzer

| Rolle | Aufgaben |
|---|---|
| **DBA** (Database Administrator) | Installation, Konfiguration, Backup, Recovery |
| **Datenbankdesigner** | ER-Modell, Schema, Normalisierung |
| **Anwendungsentwickler** | Implementiert Datenbankzugriffe |
| **Endbenutzer** | Führt Abfragen aus |
| **Datenscientist** | Analysen, Data Mining |

---

## 14. Werkzeuge und Schnittstellen

- **CLI-Clients**: `mysql`, `psql`, `sqlcmd`
- **GUI-Clients**: MySQL Workbench, pgAdmin, DBeaver, HeidiSQL
- **Programmiersprachen**: JDBC (Java), psycopg2 (Python), node-postgres
- **ORM**: Hibernate (Java), SQLAlchemy (Python), Entity Framework (.NET)
- **Webframeworks**: Spring Data (Java), Django ORM (Python)

---

## 15. Bild- und Quellenverweise

### Bildverweise

- Edgar F. Codd: <https://commons.wikimedia.org/wiki/File:Edgar_F._Codd.jpg>
- RDBMS-Übersicht: <https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Postgresql_elephant.svg/200px-Postgresql_elephant.svg.png>
- MySQL Dolphin: <https://commons.wikimedia.org/wiki/Category:Screenshots_of_MySQL>
- ANSI/SPARC-Architektur: <https://commons.wikimedia.org/wiki/Category:Database_models>

### Quellen

- Oracle – Database Concepts: <https://docs.oracle.com/en/database/>
- PostgreSQL Documentation: <https://www.postgresql.org/docs/>
- MySQL Documentation: <https://dev.mysql.com/doc/>
- H. Garcia-Molina, J. Ullman, J. Widom – *Database Systems: The Complete Book*
- A. Kemper, A. Eickler – *Datenbanksysteme: Eine Einführung*
- R. Elmasri, S. Navathe – *Fundamentals of Database Systems*
- C. Date – *An Introduction to Database Systems*
- de.wikipedia.org/wiki/Datenbank
- de.wikipedia.org/wiki/Datenbankmanagementsystem
- oer-informatik.de/datenbanken

---

## 16. Lernaufgaben

### Übung 1 — Kleine Bibliothek

Erstellen Sie ein ERD und SQL-Schema für eine Mini-Bibliothek:

- Bücher mit Titel, ISBN, Erscheinungsjahr
- Mitglieder mit Name, Email
- Verleihhistorie

Schreiben Sie SQL-Statements für:

- Neue Bücher einfügen
- Alle Bücher eines Mitglieds abfragen
- Bücher mit Erscheinungsjahr > 2010

### Übung 2 — SQL-Abfragen

Gegeben sei:

```sql
CREATE TABLE Produkt (
   ProduktID INT PRIMARY KEY,
   Name VARCHAR(100),
   Preis DECIMAL(10,2),
   Kategorie VARCHAR(50)
);
```

Schreiben Sie Abfragen für:

1. Alle Produkte mit Preis < 10 €
2. Alle Kategorien ohne Duplikate
3. Durchschnittspreis pro Kategorie
4. Top 5 teuerste Produkte
5. Anzahl Produkte pro Kategorie mit mehr als 3 Artikeln

### Übung 3 — ACID in Aktion

Beschreiben Sie an einem konkreten Beispiel (z. B. Flugbuchung) die Bedeutung der vier ACID-Eigenschaften.

---

## 17. Zusammenfassung

Eine **Datenbank** ist eine strukturierte, dauerhafte Sammlung von Daten, die durch ein **DBMS** verwaltet wird. Das **relationale Modell** von Edgar F. Codd (1970) ist heute dominant, aber NoSQL-Datenbanken gewinnen für spezifische Anwendungsfälle an Bedeutung.

**Schlüsselbegriffe:**

- **DBMS**: MySQL, PostgreSQL, Oracle, SQL Server
- **Datenmodelle**: relational, dokumentenorientiert, graph
- **Architektur**: 1-Schicht, 2-Schicht, 3-Schicht
- **Schlüssel**: Primärschlüssel, Fremdschlüssel
- **Beziehungen**: 1:1, 1:N, N:M
- **SQL**: DDL (CREATE, ALTER, DROP), DML (INSERT, SELECT, UPDATE, DELETE)
- **ACID**: Atomicity, Consistency, Isolation, Durability

### Selbsttest-Checkliste

- [ ] Ich erkläre den Unterschied zwischen Datenbank und DBMS.
- [ ] Ich nenne wichtige Datenmodelle.
- [ ] Ich wähle passende Datentypen.
- [ ] Ich definiere Primärschlüssel und Fremdschlüssel.
- [ ] Ich erkläre das ACID-Prinzip.
- [ ] Ich nutze SQL-DDL und DML.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3464 — Recherche 2026*
