# Fachmodul: SQL-DML/DQL

**Kurs-ID:** 3615
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3615

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist DML/DQL?](#2-was-ist-dmldql)
3. [SELECT-Grundlagen](#3-select-grundlagen)
4. [WHERE-Klausel und Operatoren](#4-where-klausel-und-operatoren)
5. [ORDER BY und LIMIT](#5-order-by-und-limit)
6. [Aggregatfunktionen](#6-aggregatfunktionen)
7. [GROUP BY und HAVING](#7-group-by-und-having)
8. [JOIN-Operationen](#8-join-operationen)
9. [Subqueries](#9-subqueries)
10. [Mengenoperationen (UNION, INTERSECT, EXCEPT)](#10-mengenoperationen-union-intersect-except)
11. [Common Table Expressions (CTE)](#11-common-table-expressions-cte)
12. [CASE WHEN](#12-case-when)
13. [INSERT, UPDATE, DELETE](#13-insert-update-delete)
14. [Bild- und Quellenverweise](#14-bild-und-quellenverweise)
15. [Lernaufgaben](#15-lernaufgaben)
16. [Zusammenfassung](#16-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- SELECT-Abfragen mit Projektion, Selektion, Sortierung und Limits erstellen,
- WHERE-Bedingungen mit Vergleichs-, Logik- und Spezialoperatoren formulieren,
- Aggregatfunktionen einsetzen,
- GROUP BY und HAVING korrekt anwenden,
- Tabellen mit INNER, LEFT, RIGHT, FULL OUTER, CROSS JOIN verknüpfen,
- Subqueries (skalar, korreliert, IN, EXISTS) nutzen,
- Mengenoperationen UNION, INTERSECT, EXCEPT einsetzen,
- CTEs (WITH-Klausel) verstehen und anwenden,
- INSERT, UPDATE, DELETE sicher nutzen.

---

## 2. Was ist DML/DQL?

- **DML (Data Manipulation Language)**: Ändert Daten — INSERT, UPDATE, DELETE
- **DQL (Data Query Language)**: Liest Daten — SELECT

In der Praxis wird SQL zusammenfassend als DML/DQL bezeichnet. DDL (CREATE, ALTER, DROP) ist separates Fachmodul.

---

## 3. SELECT-Grundlagen

### 3.1 Syntax

```sql
SELECT [DISTINCT] spaltenliste
FROM tabelle
[WHERE bedingung]
[GROUP BY gruppierung]
[HAVING aggregat_filter]
[ORDER BY spalte [ASC | DESC]]
[LIMIT n OFFSET m];
```

### 3.2 Beispiele

```sql
-- Alle Spalten
SELECT * FROM Mitarbeiter;

-- Bestimmte Spalten
SELECT Name, AbtName FROM Mitarbeiter m JOIN Abteilung a ON m.AbtID = a.AbtID;

-- Eindeutige Werte
SELECT DISTINCT Abteilung FROM Mitarbeiter;
```

---

## 4. WHERE-Klausel und Operatoren

### 4.1 Vergleichsoperatoren

| Operator | Bedeutung |
|---|---|
| `=` | gleich |
| `<>` oder `!=` | ungleich |
| `<`, `>`, `<=`, `>=` | Vergleich |
| `BETWEEN x AND y` | im Bereich |
| `IN (liste)` | in Liste |
| `LIKE 'muster'` | Muster (mit `%`, `_`) |
| `IS NULL`, `IS NOT NULL` | NULL-Prüfung |

### 4.2 Logische Operatoren

```sql
SELECT * FROM Mitarbeiter
WHERE Gehalt > 50000 AND AbtID = 10
   OR Eintrittsdatum > '2020-01-01';

SELECT * FROM Produkt
WHERE Name LIKE '%Laptop%' AND Preis BETWEEN 500 AND 1500;

SELECT * FROM Kunde
WHERE Email IS NOT NULL AND Land IN ('DE', 'AT', 'CH');
```

### 4.3 LIKE-Muster

| Muster | Bedeutung |
|---|---|
| `%` | beliebig viele Zeichen |
| `_` | genau ein Zeichen |
| `LIKE 'A%'` | beginnt mit A |
| `LIKE '%en'` | endet mit "en" |
| `LIKE 'A_B'` | A, ein Zeichen, B |

### 4.4 NULL

```sql
SELECT * FROM Mitarbeiter WHERE Bonus IS NULL;
SELECT * FROM Mitarbeiter WHERE Bonus IS NOT NULL;

-- Achtung: = NULL funktioniert NICHT!
SELECT * FROM Mitarbeiter WHERE Bonus = NULL;  -- immer leer
```

---

## 5. ORDER BY und LIMIT

### 5.1 ORDER BY

```sql
SELECT * FROM Mitarbeiter ORDER BY Name ASC;          -- aufsteigend (Default)
SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC;       -- absteigend
SELECT * FROM Mitarbeiter ORDER BY AbtID, Gehalt DESC; -- mehrere Spalten
```

### 5.2 LIMIT / OFFSET

**MySQL, PostgreSQL, SQLite:**

```sql
SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC LIMIT 10;          -- Top 10
SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC LIMIT 10 OFFSET 20; -- Seite 3
```

**SQL Server / Oracle:**

```sql
-- SQL Server
SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC OFFSET 20 ROWS FETCH NEXT 10 ROWS ONLY;

-- Oracle
SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC OFFSET 20 ROWS FETCH NEXT 10 ROWS ONLY;
```

### 5.3 TOP

**SQL Server:**

```sql
SELECT TOP 10 * FROM Mitarbeiter ORDER BY Gehalt DESC;
```

---

## 6. Aggregatfunktionen

| Funktion | Beschreibung |
|---|---|
| `COUNT(*)` | Anzahl Zeilen |
| `COUNT(spalte)` | Anzahl Zeilen mit NOT NULL in Spalte |
| `COUNT(DISTINCT spalte)` | Anzahl unterschiedlicher Werte |
| `SUM(spalte)` | Summe (ignoriert NULL) |
| `AVG(spalte)` | Durchschnitt (ignoriert NULL) |
| `MIN(spalte)` | Minimum |
| `MAX(spalte)` | Maximum |

### 6.1 Beispiele

```sql
SELECT COUNT(*) AS Anzahl FROM Mitarbeiter;
SELECT AVG(Gehalt) AS Durchschnitt FROM Mitarbeiter;
SELECT MIN(Gehalt) AS Min, MAX(Gehalt) AS Max FROM Mitarbeiter;
```

### 6.2 NULL und Aggregate

Aggregatfunktionen ignorieren NULL-Werte (außer `COUNT(*)`).

```sql
-- Bei NULL-Boni: AVG ignoriert sie
SELECT AVG(Bonus) FROM Mitarbeiter;
```

---

## 7. GROUP BY und HAVING

### 7.1 GROUP BY

```sql
SELECT AbtID, COUNT(*) AS Anzahl, AVG(Gehalt) AS Durchschnitt
FROM Mitarbeiter
GROUP BY AbtID;
```

### 7.2 HAVING

Filter für **bereits aggregierte** Werte (im Gegensatz zu WHERE, das vor Aggregation filtert):

```sql
SELECT AbtID, COUNT(*) AS Anzahl
FROM Mitarbeiter
GROUP BY AbtID
HAVING COUNT(*) > 5
ORDER BY Anzahl DESC;
```

### 7.3 WHERE vs HAVING

- **WHERE**: filtert einzelne Zeilen vor Aggregation
- **HAVING**: filtert aggregierte Gruppen nach Aggregation

```sql
SELECT AbtID, COUNT(*) AS Anzahl, AVG(Gehalt) AS Avg
FROM Mitarbeiter
WHERE Eintrittsdatum > '2020-01-01'    -- filtert Zeilen
GROUP BY AbtID
HAVING AVG(Gehalt) > 60000;            -- filtert Gruppen
```

---

## 8. JOIN-Operationen

### 8.1 INNER JOIN

Liefert nur passende Paare:

```sql
SELECT m.Name, a.AbtName
FROM Mitarbeiter m
INNER JOIN Abteilung a ON m.AbtID = a.AbtID;
```

### 8.2 LEFT JOIN

Alle Zeilen der linken Tabelle, auch ohne Match:

```sql
SELECT m.Name, a.AbtName
FROM Mitarbeiter m
LEFT JOIN Abteilung a ON m.AbtID = a.AbtID;
```

### 8.3 RIGHT JOIN

Alle Zeilen der rechten Tabelle, auch ohne Match:

```sql
SELECT m.Name, a.AbtName
FROM Mitarbeiter m
RIGHT JOIN Abteilung a ON m.AbtID = a.AbtID;
```

### 8.4 FULL OUTER JOIN

Alle Zeilen beider Tabellen:

```sql
SELECT m.Name, a.AbtName
FROM Mitarbeiter m
FULL OUTER JOIN Abteilung a ON m.AbtID = a.AbtID;
```

### 8.5 CROSS JOIN

Kartesisches Produkt:

```sql
SELECT p.Name, l.Name
FROM Produkt p
CROSS JOIN Lieferant l;
```

### 8.6 SELF JOIN

Tabelle mit sich selbst:

```sql
SELECT a.Name AS Mitarbeiter, b.Name AS Vorgesetzter
FROM Mitarbeiter a
LEFT JOIN Mitarbeiter b ON a.VorgesetzterID = b.MitarbeiterID;
```

### 8.7 Mehrere JOINs

```sql
SELECT b.Name AS Buch, a.Name AS Autor, v.Name AS Verlag
FROM Buch b
JOIN Buch_Autor ba ON b.ISBN = ba.ISBN
JOIN Autor a ON ba.AutorID = a.AutorID
JOIN Verlag v ON b.VerlagID = v.VerlagID;
```

### 8.8 NATURAL JOIN und USING

```sql
-- NATURAL JOIN: gleichnamige Spalten automatisch verknüpft
SELECT * FROM Mitarbeiter NATURAL JOIN Abteilung;

-- USING für explizite Spaltenwahl
SELECT * FROM Mitarbeiter JOIN Abteilung USING (AbtID);
```

---

## 9. Subqueries

### 9.1 Skalare Subquery

```sql
SELECT Name, Gehalt
FROM Mitarbeiter
WHERE Gehalt > (SELECT AVG(Gehalt) FROM Mitarbeiter);
```

### 9.2 Subquery mit IN

```sql
SELECT Name FROM Mitarbeiter
WHERE AbtID IN (SELECT AbtID FROM Abteilung WHERE Standort = 'Berlin');
```

### 9.3 Subquery mit EXISTS

```sql
SELECT Name FROM Kunde k
WHERE EXISTS (SELECT 1 FROM Bestellung b WHERE b.KundeID = k.KundeID);
```

### 9.4 Korrelierte Subquery

Bezieht sich auf die äußere Abfrage:

```sql
SELECT Name FROM Mitarbeiter m
WHERE Gehalt > (SELECT AVG(Gehalt) FROM Mitarbeiter WHERE AbtID = m.AbtID);
```

### 9.5 Subquery in FROM (abgeleitete Tabelle)

```sql
SELECT AbtID, Durchschnitt
FROM (SELECT AbtID, AVG(Gehalt) AS Durchschnitt
      FROM Mitarbeiter GROUP BY AbtID) AS temp
WHERE Durchschnitt > 60000;
```

---

## 10. Mengenoperationen (UNION, INTERSECT, EXCEPT)

### 10.1 UNION

Vereinigung:

```sql
SELECT Name FROM Kunde
UNION
SELECT Name FROM Lieferant;
```

### 10.2 UNION ALL

Mit Duplikaten:

```sql
SELECT Name FROM Kunde
UNION ALL
SELECT Name FROM Lieferant;
```

### 10.3 INTERSECT

Schnittmenge:

```sql
SELECT Stadt FROM Kunde
INTERSECT
SELECT Stadt FROM Lieferant;
```

### 10.4 EXCEPT

Differenz (nicht in MySQL — stattdessen `NOT IN` oder `LEFT JOIN ... WHERE IS NULL`):

```sql
SELECT Stadt FROM Kunde
EXCEPT
SELECT Stadt FROM Lieferant;
```

---

## 11. Common Table Expressions (CTE)

### 11.1 Einfache CTE

```sql
WITH GuteGehalter AS (
    SELECT Name, Gehalt
    FROM Mitarbeiter
    WHERE Gehalt > 60000
)
SELECT * FROM GuteGehalter
ORDER BY Gehalt DESC;
```

### 11.2 Mehrere CTEs

```sql
WITH AbtStats AS (
    SELECT AbtID, COUNT(*) AS Anzahl, AVG(Gehalt) AS Avg
    FROM Mitarbeiter
    GROUP BY AbtID
),
GrosseAbt AS (
    SELECT AbtID FROM AbtStats WHERE Anzahl >= 10
)
SELECT m.Name, m.Gehalt, a.Avg
FROM Mitarbeiter m
JOIN AbtStats a ON m.AbtID = a.AbtID
WHERE m.AbtID IN (SELECT AbtID FROM GrosseAbt);
```

### 11.3 Rekursive CTE

```sql
WITH RECURSIVE OrgChart AS (
    SELECT MitarbeiterID, Name, VorgesetzterID
    FROM Mitarbeiter
    WHERE VorgesetzterID IS NULL
    UNION ALL
    SELECT m.MitarbeiterID, m.Name, m.VorgesetzterID
    FROM Mitarbeiter m
    JOIN OrgChart o ON m.VorgesetzterID = o.MitarbeiterID
)
SELECT * FROM OrgChart;
```

---

## 12. CASE WHEN

Bedingte Ausdrücke direkt im SELECT:

```sql
SELECT Name,
       CASE
           WHEN Gehalt > 80000 THEN 'Sehr hoch'
           WHEN Gehalt > 60000 THEN 'Hoch'
           WHEN Gehalt > 40000 THEN 'Mittel'
           ELSE 'Niedrig'
       END AS Gehaltsklasse
FROM Mitarbeiter;
```

Für Aggregation:

```sql
SELECT AbtID,
       SUM(CASE WHEN Geschlecht = 'M' THEN 1 ELSE 0 END) AS Maennlich,
       SUM(CASE WHEN Geschlecht = 'W' THEN 1 ELSE 0 END) AS Weiblich
FROM Mitarbeiter
GROUP BY AbtID;
```

---

## 13. INSERT, UPDATE, DELETE

### 13.1 INSERT

```sql
-- Einzelne Zeile
INSERT INTO Mitarbeiter (Name, AbtID, Gehalt)
VALUES ('Anna Müller', 10, 55000);

-- Mehrere Zeilen
INSERT INTO Mitarbeiter (Name, AbtID, Gehalt) VALUES
   ('Bernd', 10, 48000),
   ('Clara', 20, 62000),
   ('David', 30, 51000);

-- Aus SELECT
INSERT INTO NeueMitarbeiter
SELECT * FROM Mitarbeiter WHERE AbtID = 10;
```

### 13.2 UPDATE

```sql
-- Einzelne Spalte
UPDATE Mitarbeiter
SET Gehalt = Gehalt * 1.05
WHERE AbtID = 10;

-- Mehrere Spalten
UPDATE Mitarbeiter
SET Gehalt = Gehalt + 1000, Bonus = 5000
WHERE Jahr = 2024;

-- Mit Subquery
UPDATE Mitarbeiter
SET Gehalt = (SELECT AVG(Gehalt) FROM Mitarbeiter)
WHERE Name = 'Anna';
```

### 13.3 DELETE

```sql
DELETE FROM Mitarbeiter WHERE AbtID = 99;
```

### 13.4 DELETE vs TRUNCATE

| Merkmal | DELETE | TRUNCATE |
|---|---|---|
| DML/DDL | DML | DDL |
| WHERE-Klausel | ja | nein |
| Trigger ausgelöst | ja | nein (in den meisten DBMS) |
| Geschwindigkeit | langsamer | schneller |
| Logging | ja (jede Zeile) | minimal |
| Rollback möglich | ja | in den meisten DBMS nein |
| Zurücksetzen von AUTO_INCREMENT | nein | ja |

```sql
TRUNCATE TABLE Mitarbeiter;
```

### 13.5 UPSERT (PostgreSQL, MySQL)

```sql
-- MySQL: ON DUPLICATE KEY UPDATE
INSERT INTO Mitarbeiter (MitarbeiterID, Name, Gehalt)
VALUES (1001, 'Anna', 55000)
ON DUPLICATE KEY UPDATE Gehalt = 55000;

-- PostgreSQL: ON CONFLICT
INSERT INTO Mitarbeiter (MitarbeiterID, Name, Gehalt)
VALUES (1001, 'Anna', 55000)
ON CONFLICT (MitarbeiterID) DO UPDATE SET Gehalt = 55000;

-- SQL Server: MERGE
MERGE INTO Mitarbeiter AS target
USING (SELECT 1001 AS ID, 'Anna' AS Name, 55000 AS Gehalt) AS source
ON target.MitarbeiterID = source.ID
WHEN MATCHED THEN UPDATE SET Gehalt = source.Gehalt
WHEN NOT MATCHED THEN INSERT (MitarbeiterID, Name, Gehalt)
VALUES (source.ID, source.Name, source.Gehalt);
```

---

## 14. Bild- und Quellenverweise

- SQL JOIN Visualizer: <https://commons.wikimedia.org/wiki/File:SQL_Joins.svg>
- SQL Standard: <https://www.iso.org/standard/63555.html>
- PostgreSQL Documentation: <https://www.postgresql.org/docs/current/sql-select.html>
- MySQL Documentation: <https://dev.mysql.com/doc/refman/8.0/en/select.html>
- SQL Tutorial W3Schools: <https://www.w3schools.com/sql/>

---

## 15. Lernaufgaben

### Übung 1 — SELECT

Gegeben:

```sql
CREATE TABLE Produkt (
   ProduktID INT PRIMARY KEY,
   Name VARCHAR(100),
   Preis DECIMAL(10,2),
   Kategorie VARCHAR(50),
   Bestand INT
);
```

Formulieren Sie:

1. Alle Produkte mit Preis < 10 €
2. Alle Kategorien ohne Duplikate
3. Durchschnittspreis pro Kategorie
4. Top 5 teuerste Produkte
5. Anzahl Produkte pro Kategorie mit mehr als 3 Artikeln

### Übung 2 — JOIN

Gegeben Kunde und Bestellung. Schreiben Sie:

1. Alle Bestellungen mit Kundendaten
2. Alle Kunden, die noch nie bestellt haben
3. Anzahl Bestellungen pro Kunde

### Übung 3 — Subquery

Finden Sie alle Mitarbeiter, deren Gehalt über dem Durchschnitt ihrer Abteilung liegt.

### Übung 4 — GROUP BY + HAVING

Finden Sie Abteilungen mit mehr als 5 Mitarbeitern und einem Durchschnittsgehalt > 50.000 €.

---

## 16. Zusammenfassung

SQL DML/DQL ist das Herzstück der Datenbankarbeit. **SELECT** mit Projektion, Selektion, JOIN, Aggregation und Sortierung bildet das Rückgrat jeder Abfrage.

**Schlüsselkonzepte:**

- **SELECT**: Spalten auswählen
- **WHERE**: Zeilen filtern
- **JOIN**: Tabellen verknüpfen
- **GROUP BY**: aggregieren
- **HAVING**: Aggregate filtern
- **Subqueries**: verschachtelte Abfragen
- **CTE**: WITH-Klausel für komplexe Strukturen
- **INSERT/UPDATE/DELETE**: Datenmanipulation

### Selbsttest-Checkliste

- [ ] Ich nutze WHERE mit allen Operatoren sicher.
- [ ] Ich wende JOIN-Typen korrekt an.
- [ ] Ich aggregiere und filtere mit GROUP BY/HAVING.
- [ ] Ich nutze Subqueries und CTEs.
- [ ] Ich unterscheide DELETE und TRUNCATE.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3615 — Recherche 2026*
