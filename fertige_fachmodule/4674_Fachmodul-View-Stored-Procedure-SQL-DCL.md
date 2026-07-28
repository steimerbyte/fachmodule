# Fachmodul: View, Stored Procedure, Trigger, Indizes, SQL-Injections

**Kurs-ID:** 4674
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4674

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Views](#2-views)
3. [Materialisierte Views](#3-materialisierte-views)
4. [Stored Procedures](#4-stored-procedures)
5. [Funktionen](#5-funktionen)
6. [Trigger](#6-trigger)
7. [Indizes](#7-indizes)
8. [SQL-Injection](#8-sql-injection)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Views und materialisierte Views erstellen,
- Stored Procedures und Funktionen nutzen,
- Trigger implementieren,
- Indizes optimieren,
- SQL-Injections verhindern.

---

## 2. Views

### 2.1 Einfache View

```sql
CREATE VIEW v_aktive_mitarbeiter AS
SELECT MitarbeiterID, Name, AbtID
FROM Mitarbeiter
WHERE Aktiv = TRUE;
```

### 2.2 Updatable View

Einfache Views (ohne JOIN, GROUP BY, Aggregat) sind updatebar:

```sql
UPDATE v_aktive_mitarbeiter SET Name = 'Anna' WHERE MitarbeiterID = 1001;
```

### 2.3 WITH CHECK OPTION

```sql
CREATE VIEW v_aktive_mitarbeiter AS
SELECT MitarbeiterID, Name, AbtID
FROM Mitarbeiter
WHERE Aktiv = TRUE
WITH CHECK OPTION;
```

Verhindert Updates, die den Filter verletzen.

### 2.4 DROP VIEW

```sql
DROP VIEW IF EXISTS v_aktive_mitarbeiter;
```

---

## 3. Materialisierte Views

### 3.1 Konzept

**Materialisierte Views** speichern das **Ergebnis physisch** (auf Disk), nicht nur die Abfrage.

### 3.2 Anwendungsfälle

- **Data Warehousing**: schnelle Berichte
- **Komplexe Aggregationen**: vorberechnet
- **Reporting**: OLAP

### 3.3 PostgreSQL

```sql
CREATE MATERIALIZED VIEW mv_vertrieb_monat AS
SELECT YEAR(Bestelldatum) AS Jahr, MONTH(Bestelldatum) AS Monat, SUM(Betrag)
FROM Bestellung
GROUP BY YEAR(Bestelldatum), MONTH(Bestelldatum);

-- Aktualisieren
REFRESH MATERIALIZED VIEW mv_vertrieb_monat;
```

### 3.4 Oracle

```sql
CREATE MATERIALIZED VIEW mv_vertrieb ...
REFRESH FAST ON COMMIT;  -- Inkrementelles Refresh
```

---

## 4. Stored Procedures

### 4.1 Erstellen

```sql
DELIMITER //
CREATE PROCEDURE AddMitarbeiter(IN p_name VARCHAR(100), IN p_abt INT)
BEGIN
    INSERT INTO Mitarbeiter (Name, AbtID, Eintrittsdatum)
    VALUES (p_name, p_abt, CURRENT_DATE);
END //
DELIMITER ;
```

### 4.2 Aufrufen

```sql
CALL AddMitarbeiter('Anna Müller', 10);
```

### 4.3 IN/OUT/INOUT

```sql
CREATE PROCEDURE GetMitarbeiterCount(IN p_abt INT, OUT p_count INT)
BEGIN
    SELECT COUNT(*) INTO p_count FROM Mitarbeiter WHERE AbtID = p_abt;
END;

CALL GetMitarbeiterCount(10, @count);
SELECT @count;
```

### 4.4 DROP PROCEDURE

```sql
DROP PROCEDURE IF EXISTS AddMitarbeiter;
```

---

## 5. Funktionen

### 5.1 Skalare Funktion

```sql
CREATE FUNCTION BerechneBonus(p_gehalt DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_gehalt * 0.10;
END;

SELECT BerechneBonus(5000);
```

### 5.2 DROP FUNCTION

```sql
DROP FUNCTION IF EXISTS BerechneBonus;
```

---

## 6. Trigger

### 6.1 Konzept

**Trigger** sind **automatische Aktionen**, die bei Datenbankereignissen ausgeführt werden.

### 6.2 BEFORE INSERT

```sql
CREATE TRIGGER trg_mitarbeiter_before_insert
BEFORE INSERT ON Mitarbeiter
FOR EACH ROW
BEGIN
    IF NEW.Eintrittsdatum IS NULL THEN
        SET NEW.Eintrittsdatum = CURRENT_DATE;
    END IF;
END;
```

### 6.3 AFTER UPDATE

```sql
CREATE TRIGGER trg_mitarbeiter_audit
AFTER UPDATE ON Mitarbeiter
FOR EACH ROW
INSERT INTO AuditLog (Tabelle, Aktion, Benutzer, Zeit)
VALUES ('Mitarbeiter', 'UPDATE', USER(), NOW());
```

### 6.4 DROP TRIGGER

```sql
DROP TRIGGER IF EXISTS trg_mitarbeiter_audit;
```

---

## 7. Indizes

### 7.1 Erstellen

```sql
-- Einfacher Index
CREATE INDEX idx_mitarbeiter_name ON Mitarbeiter(Name);

-- Eindeutiger Index
CREATE UNIQUE INDEX idx_mitarbeiter_email ON Mitarbeiter(Email);

-- Composite
CREATE INDEX idx_mitarbeiter_abt_geh ON Mitarbeiter(AbtID, Gehalt DESC);

-- Funktional
CREATE INDEX idx_lower_email ON Mitarbeiter(LOWER(Email));

-- Partielle Index (PostgreSQL)
CREATE INDEX idx_aktiv ON Mitarbeiter(Name) WHERE Aktiv = TRUE;
```

### 7.2 Index-Typen

| Typ | Verwendung |
|---|---|
| **B-Tree** | Vergleich, Bereich, ORDER BY (Standard) |
| **Hash** | Exakte Gleichheit (=) |
| **Bitmap** | Data Warehouse, niedrige Kardinalität |
| **GIN** | JSONB, Arrays, Volltextsuche |
| **GiST** | Geodaten, Volltextsuche |
| **BRIN** | Sehr große Tabellen, sortierte Daten |

### 7.3 Löschen

```sql
DROP INDEX IF EXISTS idx_mitarbeiter_name;
```

### 7.4 EXPLAIN zur Analyse

```sql
EXPLAIN SELECT * FROM Mitarbeiter WHERE Name = 'Anna';
```

---

## 8. SQL-Injection

### 8.1 Angriff

Eingabe: `' OR 1=1 --`

Resultierende Abfrage:
```sql
SELECT * FROM users WHERE name = '' OR 1=1 --' AND password = '...';
```

Alle Zeilen werden zurückgegeben!

### 8.2 Prävention

#### Prepared Statements

```java
// FALSCH (String-Konkatenation)
String query = "SELECT * FROM users WHERE name='" + input + "'";

// RICHTIG (Prepared Statement)
PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE name = ?");
ps.setString(1, input);
ResultSet rs = ps.executeQuery();
```

#### Weitere Maßnahmen

- **Input-Validierung**: Eingaben prüfen
- **Least Privilege**: minimale Rechte
- **Stored Procedures**: parametrisiert
- **ORM nutzen**: verhindert direkte SQL
- **WAF** (Web Application Firewall): erkennt Angriffsmuster
- **Error-Handling**: keine internen Fehler ausgeben

---

## 9. Übungen

### Übung 1 — View

Erstellen Sie eine View, die aktive Mitarbeiter zeigt.

### Übung 2 — Stored Procedure

Schreiben Sie eine Prozedur, die Bestellungen archiviert.

### Übung 3 — Trigger

Erstellen Sie einen Trigger, der Änderungen loggt.

### Übung 4 — Index

Erstellen Sie Indizes für häufige Abfragen.

### Übung 5 — SQL-Injection

Welche Abfragen sind anfällig? Wie sichern Sie sie ab?

### Übung 6 — Materialisierte View

Erstellen Sie eine materialisierte View für Verkaufszahlen.

---

## 10. Zusammenfassung

**Fortgeschrittene SQL-Objekte:**

- **Views**: virtuelle Tabellen, vereinfachen Abfragen
- **Materialisierte Views**: physisch gespeichert
- **Stored Procedures**: gekapselte Logik
- **Trigger**: automatische Reaktionen
- **Indizes**: Performance-Boost

**Sicherheit:**

- **Prepared Statements** gegen SQL-Injection
- Input-Validierung
- Least Privilege

### Selbsttest-Checkliste

- [ ] Ich erstelle Views und materialisierte Views.
- [ ] Ich nutze Stored Procedures.
- [ ] Ich implementiere Trigger.
- [ ] Ich optimiere mit Indizes.
- [ ] Ich verhindere SQL-Injection.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4674 — Recherche 2026*
