# Fachmodul: Relationales Datenbanksystem (LF08)

**Kurs-ID:** 6735
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS / LF08
**Quelle:** https://moodle.oszimt.de/course/view.php?id=6735

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Relationales Datenbanksystem (RDBS) im Überblick](#2-relationales-datenbanksystem-rdbs-im-überblick)
3. [Aufbau eines RDBS](#3-aufbau-eines-rdbs)
4. [SQL im Überblick](#4-sql-im-überblick)
5. [Transaktionen und ACID](#5-transaktionen-und-acid)
6. [Indizes zur Performance-Steigerung](#6-indizes-zur-performance-steigerung)
7. [Werkzeuge für RDBS im OSZ-IMT-Kontext](#7-werkzeuge-für-rdbs-im-osz-imt-kontext)
8. [Referenzielle Integrität in der Praxis](#8-referenzielle-integrität-in-der-praxis)
9. [Übungen](#9-übungen)
10. [Quellen](#10-quellen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- den Aufbau eines relationalen Datenbanksystems beschreiben,
- SQL-DDL, DML und DCL einsetzen,
- Indizes strategisch anlegen,
- Transaktionen mit ACID-Eigenschaften implementieren,
- Werkzeuge für RDBS bedienen.

---

## 2. Relationales Datenbanksystem (RDBS) im Überblick

Ein **RDBS** verwaltet Daten nach dem relationalen Modell und nutzt SQL als Anfragesprache.

**Hauptkomponenten:**

- **Datenbank-Engine**: Speicherung, Indizierung, Verarbeitung
- **Anfragesprache**: SQL
- **Systemkatalog (Data Dictionary)**: Metadaten
- **Transaktionsverwaltung**: ACID-Eigenschaften
- **Recovery-Mechanismen**: Backup, Recovery, Logging
- **Sicherheitsverwaltung**: Benutzer, Rollen, Berechtigungen

**Bekannte RDBS:**

- **MySQL / MariaDB**: beliebt für Webanwendungen
- **PostgreSQL**: fortschrittlich, SQL-konform
- **Oracle Database**: Enterprise
- **Microsoft SQL Server**: Windows-Ökosystem
- **SQLite**: eingebettet, mobil
- **IBM Db2**: Mainframe

---

## 3. Aufbau eines RDBS

### 3.1 Drei-Schichten-Architektur

```
┌─────────────────────────────────┐
│ Externe Schicht (Views)          │  Sicht einzelner Anwender
├─────────────────────────────────┤
│ Konzeptionelle Schicht (Schema)  │  Globale Sicht der DB
├─────────────────────────────────┤
│ Interne Schicht (Speicherung)    │  Physische Speicherung, Indizes
└─────────────────────────────────┘
```

### 3.2 Komponenten

- **Parser**: Syntax- und Semantikprüfung
- **Optimizer**: Erstellt optimalen Ausführungsplan
- **Executor**: Führt Abfragen aus
- **Buffer Manager**: Verwaltet Hauptspeicher-Cache
- **File Manager**: Physische Speicherung
- **Log Manager**: Write-Ahead-Log für Recovery
- **Lock Manager**: Synchronisation

---

## 4. SQL im Überblick

| Kategorie | Anweisungen | Beispiel |
|---|---|---|
| **DDL** | CREATE, ALTER, DROP | `CREATE TABLE Mitarbeiter (...)` |
| **DML** | INSERT, UPDATE, DELETE | `INSERT INTO Mitarbeiter ...` |
| **DQL** | SELECT | `SELECT * FROM Mitarbeiter` |
| **DCL** | GRANT, REVOKE | `GRANT SELECT ON Mitarbeiter TO anna` |
| **TCL** | COMMIT, ROLLBACK | `COMMIT;` |

(Siehe Fachmodul 3614/3615/3616 für Details.)

---

## 5. Transaktionen und ACID

### 5.1 ACID-Eigenschaften

| Eigenschaft | Bedeutung |
|---|---|
| **Atomicity** | Alles oder nichts |
| **Consistency** | Vor/Nach Transaktion konsistent |
| **Isolation** | Transaktionen unabhängig |
| **Durability** | Nach Commit dauerhaft |

### 5.2 SQL-Transaktionen

```sql
START TRANSACTION;
UPDATE Konto SET Saldo = Saldo - 100 WHERE KontoID = 1;
UPDATE Konto SET Saldo = Saldo + 100 WHERE KontoID = 2;
COMMIT;  -- oder ROLLBACK bei Fehler
```

### 5.3 Isolation-Levels

| Level | Dirty Reads | Non-Repeatable Reads | Phantom Reads |
|---|---|---|---|
| READ UNCOMMITTED | ja | ja | ja |
| READ COMMITTED | nein | ja | ja |
| REPEATABLE READ | nein | nein | ja |
| SERIALIZABLE | nein | nein | nein |

```sql
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
```

---

## 6. Indizes zur Performance-Steigerung

(Siehe Fachmodul 3614 DDL.)

**Index-Typen:**

| Typ | Verwendung |
|---|---|
| **B-Tree** (Default) | Vergleich, Bereich, ORDER BY |
| **Hash** | Exakte Gleichheit |
| **Bitmap** | Data Warehouse, niedrige Kardinalität |
| **GIN** | JSONB, Arrays, Volltextsuche (PostgreSQL) |
| **GiST** | Geodaten, Volltextsuche |
| **BRIN** | Sehr große Tabellen, sortierte Daten |

**Best Practices:**

- Indizes auf Spalten mit `WHERE`, `JOIN ON`, `ORDER BY`
- Nicht zu viele Indizes (verlangsamen INSERT/UPDATE/DELETE)
- Composite-Index: Spaltenreihenfolge wichtig (selektivste zuerst)
- EXPLAIN/EXPLAIN ANALYZE zur Analyse nutzen

```sql
EXPLAIN SELECT * FROM Mitarbeiter WHERE AbtID = 10;
```

---

## 7. Werkzeuge für RDBS im OSZ-IMT-Kontext

| Tool | Einsatz |
|---|---|
| **MySQL Workbench** | Modellierung, SQL, Administration |
| **HeidiSQL** | Windows-Client, komfortabel |
| **phpMyAdmin** | Web-basiert, MySQL |
| **DBeaver** | Multi-DB, open source |
| **pgAdmin** | PostgreSQL-Web-Tool |
| **DataGrip** | IntelliJ-DB-Tool |
| **VS Code + Extension** | Leichtgewichtiger Editor |

---

## 8. Referenzielle Integrität in der Praxis

### 8.1 Definition

Jeder Fremdschlüssel muss auf einen existierenden Primärschlüssel verweisen oder NULL sein.

### 8.2 Implementierung

```sql
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,
    KundeID INT NOT NULL,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
```

### 8.3 Aktionen

| Aktion | Bedeutung |
|---|---|
| `RESTRICT` / `NO ACTION` | Standard; verhindert Löschen/Update |
| `CASCADE` | Weitergabe an abhängige Zeilen |
| `SET NULL` | Auf NULL setzen |
| `SET DEFAULT` | Auf Default setzen |

---

## 9. Übungen

### Übung 1 — Indizes analysieren

Erklären Sie EXPLAIN ANALYZE an einem Beispiel mit und ohne Index.

### Übung 2 — Transaktionen

Schreiben Sie ein Beispiel mit Transaktion, COMMIT und ROLLBACK.

### Übung 3 — Isolation-Levels

Demonstrieren Sie Dirty Reads und ihre Vermeidung.

### Übung 4 — Werkzeuge

Installieren Sie MySQL Workbench und führen Sie ein ERD-Modell in eine Datenbank über.

---

## 10. Quellen

- Oracle – Database Concepts: <https://docs.oracle.com/en/database/>
- PostgreSQL Documentation: <https://www.postgresql.org/docs/>
- MySQL Documentation: <https://dev.mysql.com/doc/>
- C. Date: *An Introduction to Database Systems*
- A. Kemper, A. Eickler: *Datenbanksysteme: Eine Einführung*
- LF08-Infoblätter des OSZ-IMT

---

## 11. Zusammenfassung

Ein **relationales Datenbanksystem** verwaltet Daten nach dem relationalen Modell:

- **Aufbau**: Externe, konzeptionelle, interne Schicht
- **SQL**: DDL, DML, DQL, DCL, TCL
- **Transaktionen**: ACID-Eigenschaften, Isolation-Levels
- **Performance**: Indizes, EXPLAIN, Optimierung
- **Integrität**: Fremdschlüssel, Constraints

### Selbsttest-Checkliste

- [ ] Ich beschreibe den Aufbau eines RDBS.
- [ ] Ich nutze alle SQL-Kategorien.
- [ ] Ich implementiere ACID-Transaktionen.
- [ ] Ich setze Indizes strategisch ein.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=6735 — Recherche 2026*
