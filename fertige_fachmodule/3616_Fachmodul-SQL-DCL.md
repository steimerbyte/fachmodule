# Fachmodul: SQL-DCL (Data Control Language)

**Kurs-ID:** 3616  
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Datenbanksysteme  
**Quellkurs:** https://moodle.oszimt.de/course/view.php?id=3616  
**Bearbeitungsstand:** Fachbuchkapitel, recherchiert und erweitert am 2026-07-28

> **Hinweis zur Portabilität:** SQL ist standardisiert, die konkrete Syntax der Benutzer- und Rollenverwaltung sowie die verfügbaren Privilegien unterscheiden sich jedoch zwischen Datenbanksystemen. Die Beispiele dieses Moduls verwenden ausdrücklich **MySQL 8.x** beziehungsweise **PostgreSQL 15–18**. Statements vor dem Einsatz in einer produktiven Umgebung anhand der Dokumentation der verwendeten Version prüfen.

---

## 1. Lernziele und Voraussetzungen

Nach der Bearbeitung dieses Moduls können Lernende:

- DCL von DDL, DML und TCL abgrenzen;
- Datenbankbenutzer, Rollen, Objekte und Privilegien unterscheiden;
- mit `GRANT` gezielte Berechtigungen erteilen und mit `REVOKE` entziehen;
- das Prinzip der geringsten Rechte (Principle of Least Privilege) auf Datenbankzugriffe anwenden;
- Benutzer und Rollen in MySQL und PostgreSQL einrichten;
- Transaktionen mit `BEGIN`, `COMMIT`, `ROLLBACK` und `SAVEPOINT` kontrollieren;
- die ACID-Eigenschaften erklären und auf Fehlerfälle anwenden;
- Shared Locks und Exclusive Locks sowie typische Sperrkonflikte analysieren;
- Zugriffsmodelle testen, dokumentieren und sicher betreiben.

**Voraussetzungen:** grundlegende SQL-Abfragen (`SELECT`, `INSERT`, `UPDATE`, `DELETE`), Tabellen und Primär-/Fremdschlüssel, grundlegende Shell- oder Datenbank-Client-Nutzung. Für die praktischen Aufgaben werden zwei lokale Testdatenbanken empfohlen. Niemals Experimente zur Berechtigungsverwaltung auf einer produktiven Datenbank durchführen.

---

## 2. Einordnung: Was ist DCL?

Die **Data Control Language** ist der Teil von SQL, mit dem Zugriffe auf Datenbankressourcen gesteuert werden. DCL beantwortet die Fragen:

1. **Wer** ist der Zugreifende? (Benutzer, Rolle, Dienstkonto)
2. **Worauf** darf zugegriffen werden? (Server, Datenbank, Schema, Tabelle, View, Spalte, Sequenz, Funktion)
3. **Was** darf die Identität tun? (lesen, einfügen, ändern, löschen, ausführen usw.)
4. **Darf sie die Berechtigung weitergeben?** (`WITH GRANT OPTION` beziehungsweise Rollen-Administrationsrechte)

Eine häufig verwendete, aber nicht überall gleich scharf definierte Einteilung lautet:

| Sprachbereich | Zweck | Beispiele |
|---|---|---|
| DDL | Struktur definieren | `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE` |
| DML | Daten bearbeiten/abfragen | `SELECT`, `INSERT`, `UPDATE`, `DELETE` |
| DCL | Zugriffe autorisieren | `GRANT`, `REVOKE` |
| TCL | Transaktionsgrenzen steuern | `BEGIN`, `COMMIT`, `ROLLBACK`, `SAVEPOINT` |

In Lehrbüchern werden `CREATE USER`, `CREATE ROLE` und `DROP USER` teils als DCL, teils als separate **Account-/Security-Statements** klassifiziert. Funktional gehören sie zur Datenbank-Sicherheitsverwaltung und werden hier gemeinsam behandelt. Transaktionen sind streng genommen TCL, für eine sichere Rechteverwaltung und für die Gesamtperspektive auf Datenbanksicherheit sind sie dennoch unverzichtbar.

![Abbildung 1: Einordnung der SQL-Sprachbereiche](https://upload.wikimedia.org/wikipedia/commons/2/26/SQLある.png)  
*Bildidee: SQL-Sprachfamilien. Vor der Verwendung Lizenz und Verfügbarkeit des konkreten Bildes prüfen; alternativ selbst ein DCL/DML/DDL/TCL-Schaubild erstellen.*

---

## 3. Zentrale Begriffe und Sicherheitsmodell

### 3.1 Authentifizierung und Autorisierung

**Authentifizierung** prüft die Identität: Passwort, Zertifikat, Kerberos, LDAP, Cloud-Identity oder ein anderer Mechanismus. **Autorisierung** entscheidet anschließend, welche Aktionen diese Identität ausführen darf. Ein korrektes Passwort bedeutet daher nicht automatisch Zugriff auf jede Tabelle.

### 3.2 Benutzer, Rollen und Dienstkonten

- **Benutzer/Account:** eine Identität, die sich anmelden kann. In PostgreSQL ist ein „Login-Role“ eine Rolle mit `LOGIN`; in MySQL besteht ein Account aus Benutzername und Host-Komponente.
- **Rolle:** eine benannte Sammlung von Privilegien, die mehreren Konten zugewiesen werden kann. Rollen vermeiden individuelle, schwer kontrollierbare Rechteketten.
- **Dienstkonto:** technischer Account für Anwendung, Reporting, ETL oder Backup. Dienstkonten dürfen nicht mit persönlichen Konten geteilt werden.
- **PUBLIC:** in PostgreSQL eine implizite Gruppe aller Rollen. Rechte an `PUBLIC` wirken daher sehr weit und müssen bewusst vergeben werden.

### 3.3 Objekt und Privileg

Ein **Objekt** ist beispielsweise `firma.kunden` oder `public.rechnungen`. Ein **Privileg** ist eine erlaubte Operation auf diesem Objekt. Die konkrete Bedeutung hängt vom Objekt ab: `SELECT` auf einer Tabelle liest Daten, `EXECUTE` auf einer Funktion führt sie aus, `USAGE` auf einem Schema erlaubt typischerweise die Nutzung von Objekten darin, ersetzt aber nicht automatisch Tabellenrechte.

### 3.4 Prinzip der geringsten Rechte

Ein Konto erhält nur die Rechte, die es für seine Aufgabe benötigt, und nur so lange, wie es sie benötigt. Daraus folgen:

- Reporting-Konto: meistens `SELECT` auf ausgewählten Views, nicht `ALL PRIVILEGES` auf der gesamten Datenbank.
- Anwendungskonto: nur benötigte DML-Rechte, möglichst auf Views oder Stored Procedures statt auf Basistabellen.
- Migration-/DBA-Konto: erhöhte Rechte nur für den Deploy- oder Wartungsvorgang.
- Kein produktiver Anwendungsprozess mit Superuser-/Root-Rechten.
- Rechte regelmäßig inventarisieren und veraltete Accounts deaktivieren.

---

## 4. Privilegien: SELECT, INSERT, UPDATE, DELETE und ALL

| Privileg | Bedeutung | Typischer Einsatz |
|---|---|---|
| `SELECT` | Zeilen/Spalten lesen | Reporting, Suche, Read-only-Anwendung |
| `INSERT` | neue Zeilen einfügen | Datenerfassung, Import |
| `UPDATE` | vorhandene Werte ändern | Pflegeprozesse, Statusänderungen |
| `DELETE` | Zeilen löschen | kontrollierte Löschprozesse |
| `ALL PRIVILEGES` | alle für Objekt/Ebene relevanten Rechte | nur gezielt für Administration; nicht automatisch Superuser |

Weitere häufige Rechte sind `CREATE`, `ALTER`, `DROP`, `REFERENCES`, `TRIGGER`, `EXECUTE`, `USAGE`, `CONNECT` oder `CREATE TEMPORARY TABLES`. Ob ein Privileg verfügbar ist, hängt vom Objekt und DBMS ab.

**Wichtig:** `ALL PRIVILEGES` ist keine magische Umgehung jeder Sicherheitsgrenze. In MySQL umfasst `ALL` auf einer Ebene grundsätzlich die dort grantbaren Privilegien, aber nicht automatisch `GRANT OPTION` oder jedes dynamische Administrationsprivileg. In PostgreSQL bedeutet `ALL` die für den jeweiligen Objekttyp relevanten Privilegien. Zusätzlich können Besitzrechte, Rollenmitgliedschaften, Row-Level Security, Schema-Rechte und Datenbank- beziehungsweise Serverrechte die effektive Berechtigung beeinflussen.

Spaltenrechte sind ein wichtiges Mittel zur Minimierung:

```sql
-- PostgreSQL: nur zwei nicht-sensible Spalten lesen
GRANT SELECT (kunden_id, ort) ON TABLE public.kunden TO reporting_reader;

-- PostgreSQL: nur bestimmte Spalten ändern
GRANT UPDATE (telefon, email) ON TABLE public.kunden TO kundenpflege;
```

Für sensible Daten sind Views oft verständlicher und wartbarer als viele Spaltenlisten:

```sql
CREATE VIEW reporting.kunden_ohne_ geheimdaten AS
SELECT kunden_id, ort, status
FROM public.kunden;

GRANT USAGE ON SCHEMA reporting TO reporting_reader;
GRANT SELECT ON reporting.kunden_ohne_ geheimdaten TO reporting_reader;
```

*(In der Praxis Leerzeichen im Objektbezeichner entfernen: `kunden_ohne_geheimdaten`.)*

---

## 5. GRANT: Berechtigungen erteilen

Die allgemeine Form lautet:

```sql
GRANT <privilegien>
ON <objekt>
TO <benutzer_oder_rolle>;
```

Mehrere Privilegien werden kommasepariert angegeben. Wer eine Berechtigung weitergeben darf, benötigt die jeweilige Grant-Option beziehungsweise passende Administrationsrechte.

### 5.1 PostgreSQL: Tabellenrechte und Rollen

```sql
-- Rollen anlegen: NOLOGIN für Gruppenrollen
CREATE ROLE app_read NOLOGIN;
CREATE ROLE app_write NOLOGIN;

-- Login-Rolle für eine Anwendung
CREATE ROLE app_backend LOGIN PASSWORD 'NUR_IN_SECRET_MANAGER';

-- Rechte an Rollen statt direkt am Benutzer vergeben
GRANT SELECT ON TABLE public.kunden TO app_read;
GRANT SELECT, INSERT, UPDATE ON TABLE public.bestellungen TO app_write;

-- Rollenmitgliedschaft: app_backend erbt die Rechte von app_read
GRANT app_read TO app_backend;
GRANT app_write TO app_backend;

-- Schema-Nutzung nicht vergessen
GRANT USAGE ON SCHEMA public TO app_read, app_write;
```

In aktuellen PostgreSQL-Versionen ist `PUBLIC` auf vielen Objekten bereits mit Standardrechten bedacht. Eine explizite Berechtigungsprüfung und gegebenenfalls ein `REVOKE` sind deshalb Bestandteil eines sicheren Setups:

```sql
REVOKE ALL ON TABLE public.kunden FROM PUBLIC;
REVOKE ALL ON TABLE public.bestellungen FROM PUBLIC;
GRANT SELECT ON TABLE public.kunden TO app_read;
```

Für künftig angelegte Tabellen werden Standardrechte eingerichtet. Das ist notwendig, weil ein einmaliges `GRANT ON ALL TABLES` nicht automatisch jede später erzeugte Tabelle erfasst:

```sql
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO app_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO app_write;
```

### 5.2 MySQL: Account- und Objekt-Syntax

MySQL identifiziert Accounts gewöhnlich als `'name'@'host'`. Der Host ist sicherheitsrelevant: `'app'@'localhost'` und `'app'@'%'` sind unterschiedliche Accounts. Ein Wildcard-Host sollte nur verwendet werden, wenn Netzwerkzugriff, TLS und Firewall-Regeln ihn rechtfertigen.

```sql
CREATE USER 'reporting'@'10.20.%'
  IDENTIFIED BY 'NUR_IN_SECRET_MANAGER';

CREATE USER 'app_backend'@'10.20.%'
  IDENTIFIED BY 'NUR_IN_SECRET_MANAGER';

CREATE ROLE 'role_reporting';
CREATE ROLE 'role_app_write';

GRANT SELECT ON firma.kunden TO 'role_reporting';
GRANT SELECT, INSERT, UPDATE ON firma.bestellungen TO 'role_app_write';

GRANT 'role_reporting' TO 'reporting'@'10.20.%';
GRANT 'role_app_write' TO 'app_backend'@'10.20.%';

-- Rolle standardmäßig aktivieren (Beispiel MySQL 8)
SET DEFAULT ROLE 'role_reporting' TO 'reporting'@'10.20.%';
```

Rechte können auf Datenbank- oder Tabellenebene vergeben werden:

```sql
GRANT SELECT ON firma.* TO 'reporting'@'10.20.%';
GRANT SELECT, INSERT ON firma.bestellungen TO 'role_app_write';
```

Überprüfung:

```sql
SHOW GRANTS FOR 'reporting'@'10.20.%';
SHOW GRANTS FOR 'role_reporting';
```

MySQL schreibt erfolgreiche Berechtigungsänderungen selbst in den Berechtigungsdatenbestand; ein historisches `FLUSH PRIVILEGES` ist für normale `CREATE USER`-/`GRANT`-Statements nicht erforderlich. Direkte Manipulationen an Systemtabellen sind zu vermeiden.

---

## 6. REVOKE: Rechte entziehen

`REVOKE` spiegelt `GRANT` grundsätzlich:

```sql
REVOKE <privilegien>
ON <objekt>
FROM <benutzer_oder_rolle>;
```

Beispiele:

```sql
-- PostgreSQL
REVOKE DELETE ON TABLE public.bestellungen FROM app_write;
REVOKE app_write FROM app_backend;

-- MySQL
REVOKE UPDATE ON firma.bestellungen FROM 'role_app_write';
REVOKE 'role_app_write' FROM 'app_backend'@'10.20.%';
```

`REVOKE` entfernt nur die betreffende Berechtigungsquelle. Wenn ein Benutzer dasselbe Recht über eine zweite Rolle oder über `PUBLIC` weiterhin erhält, bleibt der effektive Zugriff bestehen. Deshalb muss bei einer Entziehung die gesamte Berechtigungskette betrachtet werden.

Weitergaberechte sind besonders kritisch:

```sql
-- PostgreSQL: nur die Weitergabe-Erlaubnis entfernen,
-- das eigentliche SELECT-Recht bleibt bestehen
REVOKE GRANT OPTION FOR SELECT
ON TABLE public.kunden FROM app_read;
```

In PostgreSQL können bei Rollenmitgliedschaften Optionen wie `ADMIN OPTION`, `INHERIT` und `SET` relevant sein. In MySQL wird die Rollenmitgliedschaft mit einer separaten Rollen-REVOKE-Syntax entzogen. Nach einer Änderung: neue Sitzung, bestehende Sitzung und aktive Rollen prüfen.

---

## 7. Benutzerverwaltung

### 7.1 PostgreSQL

PostgreSQL verwendet Rollen sowohl für Login-Identitäten als auch für Gruppen. Die komfortablen Aliase `CREATE USER` und `DROP USER` entsprechen Rollen mit beziehungsweise ohne Login-Eigenschaft.

```sql
CREATE ROLE alice LOGIN PASSWORD 'NUR_SICHER_VERWALTET';
ALTER ROLE alice SET statement_timeout = '30s';
ALTER ROLE alice VALID UNTIL '2027-12-31';

-- Login sperren, ohne die Rolle zu löschen
ALTER ROLE alice NOLOGIN;

-- Wieder aktivieren
ALTER ROLE alice LOGIN;

-- Löschen nur, wenn keine abhängigen Objekte/Rechte verbleiben
DROP ROLE alice;
```

In der Praxis sollten Passwörter nicht in Versionskontrolle, Shell-History oder Lernmaterial mit realen Werten stehen. Besser sind Secret Manager, Zertifikats-/SSO-Verfahren und kurzlebige Zugangsdaten.

### 7.2 MySQL

```sql
CREATE USER 'alice'@'localhost'
  IDENTIFIED WITH caching_sha2_password BY 'NUR_SICHER_VERWALTET';

ALTER USER 'alice'@'localhost' ACCOUNT LOCK;
ALTER USER 'alice'@'localhost' ACCOUNT UNLOCK;
ALTER USER 'alice'@'localhost' IDENTIFIED BY 'NEUES_SECRET';

DROP USER 'alice'@'localhost';
```

`DROP USER` ist endgültig für den Account und kann Anwendungen sofort funktionsunfähig machen. Vorher Abhängigkeiten, aktive Sessions, Jobs, Zertifikate und Secret-Rotation planen. Bei Personalwechseln ist `ACCOUNT LOCK` oft der kontrolliertere erste Schritt.

---

## 8. Rollen und RBAC

**Role-Based Access Control (RBAC)** ordnet Rechte Rollen und Rollen Benutzerkonten zu:

```text
Privilegien -> fachliche Rollen -> Benutzer/Dienstkonten
```

Beispielrollen:

- `reporting_reader`: lesen, keine Änderungen;
- `order_writer`: Bestellungen einfügen und Status ändern;
- `support_limited`: begrenzte Support-Views;
- `schema_migrator`: temporär für Strukturänderungen;
- `security_admin`: Benutzer- und Rollenverwaltung, nicht zwingend Datenzugriff.

Vorteile gegenüber Einzelrechten:

1. Onboarding und Offboarding werden reproduzierbar.
2. Rollen lassen sich versionieren und prüfen.
3. Ein fachliches Berechtigungsmodell bleibt unabhängig von konkreten Personen.
4. Änderungen müssen nicht in vielen Benutzerkonten wiederholt werden.

**Achtung bei Rollenkaskaden:** Rolle A kann Rolle B erben; B kann wiederum Rechte besitzen. Solche Graphen müssen dokumentiert und regelmäßig auf unerwartete Privilege Escalation geprüft werden. PostgreSQL und MySQL behandeln Aktivierung/Vererbung unterschiedlich; das Verhalten ist immer anhand der DBMS-Dokumentation und mit Testkonten zu validieren.

![Abbildung 2: RBAC-Modell](https://upload.wikimedia.org/wikipedia/commons/5/5d/Role-based_access_control.svg)  
*Bildverweis: Rollenbasierte Zugriffskontrolle; Lizenz und Bildinhalt vor Veröffentlichung prüfen.*

---

## 9. Transaktionen: BEGIN, COMMIT, ROLLBACK, SAVEPOINT

Eine **Transaktion** ist eine logische Einheit von Datenbankoperationen. Sie endet erfolgreich mit `COMMIT` oder wird mit `ROLLBACK` verworfen.

```sql
BEGIN;
UPDATE konto SET saldo = saldo - 100 WHERE konto_id = 1;
UPDATE konto SET saldo = saldo + 100 WHERE konto_id = 2;
COMMIT;
```

Tritt zwischen den Änderungen ein Fehler auf:

```sql
BEGIN;
UPDATE konto SET saldo = saldo - 100 WHERE konto_id = 1;
-- beispielsweise Fremdschlüssel-/Validierungsfehler:
UPDATE konto SET saldo = saldo + 100 WHERE konto_id = 999;
ROLLBACK;
```

Ein `SAVEPOINT` erzeugt einen Zwischenpunkt:

```sql
BEGIN;
INSERT INTO bestellungen (bestellung_id, kunde_id) VALUES (1001, 7);
SAVEPOINT nach_bestellung;

-- Fehlerhafte oder unerwünschte Zusatzaktion
INSERT INTO bestellpositionen (bestellung_id, artikel_id, menge)
VALUES (1001, 999999, 1);

ROLLBACK TO SAVEPOINT nach_bestellung;
-- Bestellung bleibt bestehen; die fehlerhafte Position ist verworfen.
COMMIT;
```

`ROLLBACK TO SAVEPOINT` verwirft nur Änderungen seit dem Savepoint. `RELEASE SAVEPOINT` gibt den Zwischenpunkt frei. Ein vollständiges `ROLLBACK` verwirft die ganze noch offene Transaktion.

### Unterschiede MySQL/PostgreSQL

- PostgreSQL startet standardmäßig jede einzelne Anweisung in einer Transaktion (Autocommit im Client); mit `BEGIN` werden mehrere Anweisungen gebündelt.
- MySQL benötigt für echte Rollbacks eine transaktionsfähige Storage Engine, typischerweise InnoDB. DDL kann je nach Statement/Version implizite Commits auslösen.
- `BEGIN` beziehungsweise `START TRANSACTION` sind in den üblichen Szenarien austauschbare Startformen, die genaue Semantik hängt vom Client und DBMS ab.
- Bei Anwendungsfehlern muss der Treiber den Transaktionsstatus sauber behandeln. Nach einem Fehler kann PostgreSQL eine Transaktion als „aborted“ markieren; dann ist meist ein `ROLLBACK` notwendig.

---

## 10. ACID-Eigenschaften

### Atomicity (Atomarität)

Eine Transaktion wirkt vollständig oder gar nicht. Bei einer Überweisung dürfen nicht nur die 100 Euro vom Ursprung abgebucht werden, ohne die Gutschrift beim Zielkonto zu verbuchen.

### Consistency (Konsistenz)

Eine erfolgreiche Transaktion führt von einem gültigen Datenbankzustand in einen anderen gültigen Zustand. Primärschlüssel, Fremdschlüssel, `CHECK`-Constraints, `NOT NULL` und fachliche Regeln begrenzen ungültige Zustände. Konsistenz ist nicht nur Aufgabe der Datenbank: Ein unvollständiges Datenmodell oder falsche Geschäftslogik kann auch in einer technisch gültigen Transaktion fachlich falsche Daten erzeugen.

### Isolation (Isolation)

Parallel laufende Transaktionen sollen sich gemäß dem gewählten Isolationslevel nicht in unerlaubter Weise beeinflussen. Typische Probleme sind Dirty Reads, Non-Repeatable Reads, Phantom Reads und Lost Updates. Höhere Isolation reduziert manche Anomalien, kann aber Sperrkonflikte und Kosten erhöhen.

### Durability (Dauerhaftigkeit)

Nach erfolgreichem `COMMIT` bleiben Änderungen auch nach Prozessabsturz oder Neustart erhalten. Datenbankmanagementsysteme erreichen dies typischerweise über Write-Ahead Logging/Redo-Logs, Flush-Strategien, Replikation und Backup-/Recovery-Verfahren. Ein `COMMIT` ersetzt kein Backup.

![Abbildung 3: ACID-Eigenschaften](https://upload.wikimedia.org/wikipedia/commons/3/38/ACID_database.svg)  
*Bildverweis: ACID-Übersicht; Lizenz vor Veröffentlichung prüfen oder eigene Grafik erstellen.*

---

## 11. Locking und konkurrierende Zugriffe

Sperren koordinieren parallele Transaktionen. Das Ziel ist, widersprüchliche Änderungen zu verhindern und die gewählte Isolation umzusetzen.

### 11.1 Shared Lock (S-Lock, Lesesperre)

Mehrere Transaktionen können in der Regel gleichzeitig eine Shared Lock auf derselben Ressource halten. Eine konkurrierende Änderung mit Exclusive Lock wird blockiert. In PostgreSQL ist `SELECT ... FOR SHARE` ein explizites Beispiel für eine gemeinsame Zeilensperre. In MySQL InnoDB kann `SELECT ... FOR SHARE` (Versionssyntax beachten) eine Shared Lock anfordern.

### 11.2 Exclusive Lock (X-Lock, Schreibsperre)

Eine Exclusive Lock verhindert, dass andere Transaktionen die Ressource gleichzeitig exklusiv verändern; je nach Operation und Isolationsmodell werden auch bestimmte Lesezugriffe blockiert. `UPDATE`, `DELETE` und `SELECT ... FOR UPDATE` sind typische Auslöser.

```sql
-- PostgreSQL und moderne MySQL-Syntax, innerhalb einer Transaktion
BEGIN;
SELECT konto_id, saldo
FROM konto
WHERE konto_id = 1
FOR UPDATE;

UPDATE konto SET saldo = saldo - 100 WHERE konto_id = 1;
COMMIT;
```

Sperren werden normalerweise bis zum Transaktionsende gehalten. Lange Transaktionen verursachen Wartezeiten, Deadlocks und eine wachsende Versionierungs-/Undo-Last.

### 11.3 Deadlocks und gute Praxis

Ein Deadlock entsteht etwa so:

- Transaktion A sperrt Zeile 1 und wartet auf Zeile 2.
- Transaktion B sperrt Zeile 2 und wartet auf Zeile 1.

DBMS erkennen solche Zyklen meist und brechen eine Transaktion ab. Anwendungen müssen Deadlock-Fehler abfangen und die gesamte Transaktion mit kontrolliertem Backoff wiederholen können.

Gegenmaßnahmen:

- Ressourcen immer in derselben Reihenfolge sperren;
- Transaktionen kurz halten;
- passende Indizes verwenden, damit nicht unnötig viele Zeilen gesperrt werden;
- keine Benutzerinteraktion innerhalb einer offenen Transaktion;
- Lock-/Statement-Timeouts einsetzen;
- bei Warteschlangen gegebenenfalls `NOWAIT` oder `SKIP LOCKED` prüfen;
- Deadlocks überwachen und nicht einfach nur global die Isolation erhöhen.

![Abbildung 4: Shared- und Exclusive-Locks](https://upload.wikimedia.org/wikipedia/commons/3/3f/Two-phase_locking.svg)  
*Bildverweis: Sperr-/Nebenläufigkeitskonzept; für die Buchfassung Lizenz und semantische Passung kontrollieren.*

![Abbildung 5: Transaktionslebenszyklus](https://upload.wikimedia.org/wikipedia/commons/1/1c/Transaction_processing.svg)  
*Bildverweis: Transaktionszustände; alternativ als eigene Grafik mit den Zuständen active, partially committed, committed, failed, aborted zeichnen.*

---

## 12. Vollständiges Praxisbeispiel: PostgreSQL

Das folgende Beispiel trennt Rollen, Login und Objekte. Die Ausführung erfolgt als Datenbankadministrator in einer Testdatenbank:

```sql
CREATE SCHEMA IF NOT EXISTS app;

CREATE TABLE IF NOT EXISTS app.bestellungen (
    bestellung_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kunden_id bigint NOT NULL,
    betrag numeric(12,2) NOT NULL CHECK (betrag >= 0),
    status text NOT NULL CHECK (status IN ('offen', 'bezahlt', 'storniert'))
);

CREATE ROLE bestellung_reader NOLOGIN;
CREATE ROLE bestellung_writer NOLOGIN;
CREATE ROLE bestellung_app LOGIN PASSWORD 'NUR_SECRET_MANAGER';

REVOKE ALL ON SCHEMA app FROM PUBLIC;
REVOKE ALL ON TABLE app.bestellungen FROM PUBLIC;

GRANT USAGE ON SCHEMA app TO bestellung_reader, bestellung_writer;
GRANT SELECT ON app.bestellungen TO bestellung_reader;
GRANT SELECT, INSERT, UPDATE ON app.bestellungen TO bestellung_writer;
GRANT bestellung_reader, bestellung_writer TO bestellung_app;

-- Sequenzrechte können für INSERT mit Identity/Serial erforderlich sein;
-- bei Bedarf anhand der konkreten PostgreSQL-Version testen:
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA app TO bestellung_writer;
```

Test als `bestellung_app`:

```sql
BEGIN;
INSERT INTO app.bestellungen (kunden_id, betrag, status)
VALUES (42, 199.90, 'offen');

SAVEPOINT vor_status;
UPDATE app.bestellungen
SET status = 'bezahlt'
WHERE kunden_id = 42 AND status = 'offen';

-- Wenn die fachliche Prüfung scheitert:
-- ROLLBACK TO SAVEPOINT vor_status;
COMMIT;
```

Validierung aus einer Administrationssitzung:

```sql
SELECT grantee, table_schema, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE table_schema = 'app'
ORDER BY grantee, table_name, privilege_type;
```

---

## 13. Vollständiges Praxisbeispiel: MySQL

```sql
CREATE DATABASE IF NOT EXISTS firma;

CREATE TABLE IF NOT EXISTS firma.bestellungen (
    bestellung_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    kunden_id BIGINT NOT NULL,
    betrag DECIMAL(12,2) NOT NULL,
    status ENUM('offen', 'bezahlt', 'storniert') NOT NULL
) ENGINE = InnoDB;

CREATE ROLE 'firma_reporting';
CREATE ROLE 'firma_order_writer';

CREATE USER 'reporting'@'10.20.%'
  IDENTIFIED BY 'NUR_SECRET_MANAGER';
CREATE USER 'order_app'@'10.20.%'
  IDENTIFIED BY 'NUR_SECRET_MANAGER';

GRANT SELECT ON firma.bestellungen TO 'firma_reporting';
GRANT SELECT, INSERT, UPDATE ON firma.bestellungen TO 'firma_order_writer';

GRANT 'firma_reporting' TO 'reporting'@'10.20.%';
GRANT 'firma_order_writer' TO 'order_app'@'10.20.%';
SET DEFAULT ROLE 'firma_reporting' TO 'reporting'@'10.20.%';
SET DEFAULT ROLE 'firma_order_writer' TO 'order_app'@'10.20.%';

SHOW GRANTS FOR 'reporting'@'10.20.%';
```

Transaktionsbeispiel:

```sql
START TRANSACTION;
SELECT bestellung_id, status
FROM firma.bestellungen
WHERE bestellung_id = 1
FOR UPDATE;

UPDATE firma.bestellungen
SET status = 'bezahlt'
WHERE bestellung_id = 1;
COMMIT;
```

Die Tabelle muss InnoDB verwenden, damit Zeilensperren und Rollback wie erwartet arbeiten. Bei Produktionsbetrieb sind zusätzlich TLS, Netzwerkbegrenzung, Auditierung, Backup und Secret-Management erforderlich.

---

## 14. Rechte prüfen und Fehler systematisch analysieren

### PostgreSQL

```sql
-- Rollen und Login-Eigenschaften
\du

-- Tabellenrechte im psql-Client
\dp app.bestellungen

-- Effektive Prüfung eines konkreten Rechts
SELECT has_table_privilege('bestellung_app', 'app.bestellungen', 'SELECT');
SELECT has_schema_privilege('bestellung_app', 'app', 'USAGE');

-- Katalogabfrage
SELECT grantee, privilege_type
FROM information_schema.role_table_grants
WHERE table_schema = 'app' AND table_name = 'bestellungen';
```

### MySQL

```sql
SHOW GRANTS FOR 'order_app'@'10.20.%';
SELECT user, host, account_locked
FROM mysql.user;
```

Typische Ursachen für „permission denied“/„access denied“:

1. falsches Konto (MySQL: Host-Komponente stimmt nicht);
2. Schema-/Datenbankrecht fehlt zusätzlich zum Tabellenrecht;
3. Rolle ist nicht aktiv oder nicht als Default gesetzt;
4. Recht wurde über `PUBLIC`/zweite Rolle angenommen, aber nicht tatsächlich erteilt;
5. Objekt liegt in einem anderen Schema oder wurde neu angelegt;
6. Sequenzrecht fehlt beim Einfügen in PostgreSQL;
7. bestehende Sitzung hat nicht die erwartete Rollenkonfiguration;
8. Row-Level Security oder zusätzliche Policy verweigert Zeilen;
9. Objektbesitzer/Owner und `GRANT OPTION` werden verwechselt;
10. der Client verbindet sich mit einer anderen Instanz oder Datenbank.

---

## 15. Sicherheits- und Betriebsleitlinien

- Berechtigungen als migrationsfähigen Code versionieren; manuelle Änderungen dokumentieren.
- Rollen nach Funktion statt nach Person benennen.
- Für Anwendungen separate Konten pro Dienst und Umgebung verwenden.
- `ALL PRIVILEGES`, Superuser und globale Wildcards vermeiden.
- Datenbankzugriffe auf Netzwerkebene begrenzen und Transportverschlüsselung aktivieren.
- Passwörter niemals im Quellcode, in Beispielen mit realen Werten oder in Tickets speichern.
- Rechteänderungen auditieren: Wer hat wann welches Recht erteilt oder entzogen?
- Regelmäßige Rezertifizierung durch Daten- und Systemverantwortliche einführen.
- Deaktivieren vor Löschen, wenn Nachvollziehbarkeit und Recovery wichtig sind.
- Neue Tabellen, Views, Funktionen und Sequenzen in das Default-Privilege-Konzept aufnehmen.
- Transaktionen klein halten, Fehler behandeln und Deadlock-Retries implementieren.
- Backups wiederherstellen können testen; Durability nicht nur behaupten.
- Testkonten und automatisierte Permission-Tests in CI nutzen.

---

## 16. Lernaufgaben mit Lösungen

### Aufgabe 1: Read-only-Reporting

**Aufgabe:** Erstelle in PostgreSQL eine Rolle `sales_reader`, die ausschließlich `SELECT` auf `sales.orders` erhält. `PUBLIC` darf nicht lesen.

**Lösung:**

```sql
CREATE ROLE sales_reader NOLOGIN;
REVOKE ALL ON TABLE sales.orders FROM PUBLIC;
GRANT USAGE ON SCHEMA sales TO sales_reader;
GRANT SELECT ON TABLE sales.orders TO sales_reader;
```

### Aufgabe 2: Recht entziehen

**Aufgabe:** `order_app` soll keine Bestellungen mehr löschen dürfen. Prüfe anschließend, ob das effektive Recht fehlt.

**Lösung PostgreSQL:**

```sql
REVOKE DELETE ON sales.orders FROM order_app;
SELECT has_table_privilege('order_app', 'sales.orders', 'DELETE');
```

Liefert die Prüfung weiterhin `true`, muss nach geerbten Rollen und `PUBLIC` gesucht werden.

### Aufgabe 3: MySQL-Rollen

**Aufgabe:** Erstelle eine Reporting-Rolle, weise sie einem Benutzer zu und zeige die resultierenden Grants.

**Lösung:**

```sql
CREATE ROLE 'reporting_role';
GRANT SELECT ON firma.* TO 'reporting_role';
CREATE USER 'reporting2'@'localhost' IDENTIFIED BY 'NUR_SECRET_MANAGER';
GRANT 'reporting_role' TO 'reporting2'@'localhost';
SET DEFAULT ROLE 'reporting_role' TO 'reporting2'@'localhost';
SHOW GRANTS FOR 'reporting2'@'localhost';
```

### Aufgabe 4: Savepoint

**Aufgabe:** Füge zwei Datensätze ein, verwirf nur den zweiten und committe den ersten.

**Lösung:**

```sql
BEGIN;
INSERT INTO demo (id, wert) VALUES (1, 'bleibt');
SAVEPOINT erster_eintrag;
INSERT INTO demo (id, wert) VALUES (2, 'wird verworfen');
ROLLBACK TO SAVEPOINT erster_eintrag;
COMMIT;
```

### Aufgabe 5: Locking erklären

**Aufgabe:** Sitzung A sperrt eine Kontozeile mit `FOR UPDATE`. Was geschieht in Sitzung B bei einem parallelen `UPDATE`?

**Lösung:** B wartet typischerweise bis zum Commit/Rollback von A oder läuft in ein Lock-Timeout. Die konkrete Warte- und Fehlerbehandlung hängt von DBMS, Timeout und Isolation ab. Ein Deadlock entsteht, wenn beide Sitzungen wechselseitig Ressourcen halten und aufeinander warten.

---

## 17. Testaufgaben / Erfolgskontrolle

1. Warum ist ein Rollenmodell besser wartbar als individuelle Grants?
2. Was ist der Unterschied zwischen Authentifizierung und Autorisierung?
3. Was bewirkt `WITH GRANT OPTION` und warum ist es riskant?
4. Warum reicht in PostgreSQL ein Tabellen-`GRANT` ohne Schema-`USAGE` häufig nicht aus?
5. Warum muss MySQL den Hostbestandteil eines Accounts berücksichtigen?
6. Was bleibt nach `ROLLBACK TO SAVEPOINT` erhalten?
7. Welche ACID-Eigenschaft schützt vor einem halben Überweisungsvorgang?
8. Wie unterscheiden sich Shared Lock und Exclusive Lock?
9. Nenne drei Maßnahmen gegen Deadlocks.
10. Warum ist `GRANT ALL PRIVILEGES` für eine Anwendung meist keine gute Standardeinstellung?

**Musterantworten:** Rollen bündeln Rechte und erleichtern Änderungen; Authentifizierung identifiziert, Autorisierung erlaubt; Grant Option erlaubt Weitergabe und kann Privilege Escalation erzeugen; Schema-USAGE ist ein zusätzlicher Zugriffspfad; MySQL-Accounts werden nach Benutzer und Host unterschieden; Savepoint-Rollback verwirft nur den späteren Abschnitt; Atomarität verhindert Teilwirkung; Shared Locks sind grundsätzlich gemeinsam haltbar, Exclusive Locks konkurrieren; konsistente Sperrreihenfolge, kurze Transaktionen, Indizes und Timeouts helfen; ALL verletzt Least Privilege und erhöht Schadenspotenzial.

---

## 18. Glossar

- **DCL:** Data Control Language, Steuerung von Berechtigungen.
- **Grant:** Erteilung eines Privilegs.
- **Revoke:** Entzug eines Privilegs oder einer Rollenmitgliedschaft.
- **Privilege:** einzelne erlaubte Aktion auf einem Objekt.
- **Role:** Bündel oder Träger von Berechtigungen.
- **RBAC:** Role-Based Access Control.
- **Owner:** Besitzer eines Datenbankobjekts mit besonderen Verwaltungsrechten.
- **PUBLIC:** alle Rollen in PostgreSQL.
- **Transaction:** atomare Einheit zusammengehöriger Datenänderungen.
- **Savepoint:** Zwischenpunkt für partielles Zurückrollen.
- **S-Lock/X-Lock:** gemeinsame beziehungsweise exklusive Sperre.
- **Deadlock:** zyklisches gegenseitiges Warten von Transaktionen.
- **Least Privilege:** nur notwendige Rechte vergeben.

---

## 19. Weiterführende Quellen und Bildrecherche

### Primärquellen

- MySQL `GRANT`: https://dev.mysql.com/doc/refman/8.4/en/grant.html
- MySQL `REVOKE`: https://dev.mysql.com/doc/refman/8.4/en/revoke.html
- MySQL Rollen: https://dev.mysql.com/doc/refman/8.4/en/roles.html
- MySQL `SHOW GRANTS`: https://dev.mysql.com/doc/refman/8.4/en/show-grants.html
- MySQL InnoDB Locking: https://dev.mysql.com/doc/refman/8.4/en/innodb-locking.html
- PostgreSQL Privilegien: https://www.postgresql.org/docs/current/ddl-priv.html
- PostgreSQL `GRANT`: https://www.postgresql.org/docs/current/sql-grant.html
- PostgreSQL `REVOKE`: https://www.postgresql.org/docs/current/sql-revoke.html
- PostgreSQL Rollen: https://www.postgresql.org/docs/current/user-manag.html
- PostgreSQL Transaktionen: https://www.postgresql.org/docs/current/tutorial-transactions.html
- PostgreSQL Savepoints: https://www.postgresql.org/docs/current/sql-savepoint.html
- PostgreSQL explizite Sperren: https://www.postgresql.org/docs/current/explicit-locking.html

### Geeignete Bild-/Diagrammideen

1. DCL/DML/DDL/TCL-Übersicht: https://en.wikipedia.org/wiki/Data_control_language
2. RBAC-Modell: https://en.wikipedia.org/wiki/Role-based_access_control
3. ACID-Modell: https://en.wikipedia.org/wiki/ACID
4. Zwei-Phasen-Sperrprotokoll: https://en.wikipedia.org/wiki/Two-phase_locking
5. PostgreSQL-Locking-Dokumentation mit Sperrmodi: https://www.postgresql.org/docs/current/explicit-locking.html

**Urheberrechtshinweis:** Externe Bildlinks sind Recherche- und Gestaltungshinweise, keine automatische Abdruckerlaubnis. Für eine veröffentlichte Buchfassung Lizenz, Urheber, Quelle, Version und Abrufdatum dokumentieren; bei Unsicherheit eigene Diagramme mit selbst erstellten Formen verwenden.

---

## 20. Zusammenfassung

DCL schützt Daten, indem es Identitäten, Rollen, Objekte und erlaubte Aktionen in Beziehung setzt. `GRANT` erteilt gezielte Rechte, `REVOKE` entzieht sie; `CREATE USER`, `CREATE ROLE`, `ALTER USER` und `DROP USER` verwalten die Identitäten und deren organisatorische Struktur. Ein gutes Berechtigungsmodell setzt auf Rollen, Least Privilege, nachvollziehbare Tests und regelmäßige Rezertifizierung. Transaktionen ergänzen die Zugriffskontrolle um zuverlässige Datenänderungen: `BEGIN` startet, `COMMIT` bestätigt, `ROLLBACK` verwirft und `SAVEPOINT` begrenzt die Rücknahme. ACID beschreibt die Zuverlässigkeit dieses Vorgangs. Sperren schützen parallele Vorgänge, müssen aber durch kurze Transaktionen, konsistente Reihenfolgen und robuste Fehlerbehandlung begleitet werden. MySQL und PostgreSQL verfolgen dieselben Grundideen, unterscheiden sich aber bei Accounts, Rollenaktivierung, Schema-/Sequenzrechten und Locking-Details.
