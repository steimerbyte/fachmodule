# Fachmodul: Normalisierung (Datenbank)

**Kurs-ID:** 2599
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2599

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Normalisierung?](#2-was-ist-normalisierung)
3. [Anomalien in nicht normalisierten Datenbanken](#3-anomalien-in-nicht-normalisierten-datenbanken)
4. [Funktionale Abhängigkeiten](#4-funktionale-abhängigkeiten)
5. [Erste Normalform (1NF)](#5-erste-normalform-1nf)
6. [Zweite Normalform (2NF)](#6-zweite-normalform-2nf)
7. [Dritte Normalform (3NF)](#7-dritte-normalform-3nf)
8. [Boyce-Codd-Normalform (BCNF)](#8-boyce-codd-normalform-bcnf)
9. [Vierte und Fünfte Normalform (4NF, 5NF)](#9-vierte-und-fünfte-normalform-4nf-5nf)
10. [Wann nicht normalisieren?](#10-wann-nicht-normalisieren)
11. [Vollständiges Beispiel: E-Commerce-Bestellung](#11-vollständiges-beispiel-e-commerce-bestellung)
12. [Quellen und Bildverweise](#12-quellen-und-bildverweise)
13. [Lernaufgaben](#13-lernaufgaben)
14. [Zusammenfassung](#14-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- den Sinn und Zweck der Normalisierung erklären,
- Anomalien in nicht normalisierten Datenbanken identifizieren,
- funktionale Abhängigkeiten erkennen und analysieren,
- Tabellen schrittweise in 1NF, 2NF, 3NF und BCNF überführen,
- entscheiden, wann Denormalisierung sinnvoll ist,
- die Normalisierung an einem konkreten Beispiel anwenden.

---

## 2. Was ist Normalisierung?

**Normalisierung** ist der systematische Prozess der Zerlegung von Relationen, um **Redundanzen zu vermeiden** und **Anomalien** zu verhindern.

**Ziele:**

- Vermeidung von Einfüge-, Update- und Löschanomalien
- Konsistenz der Daten
- Schlankere, wartbarere Schemata
- Reduzierte Speichernutzung

**Trade-offs:**

- Mehr JOINs bei Abfragen (Performance)
- Komplexere Schemata

---

## 3. Anomalien in nicht normalisierten Datenbanken

### 3.1 Einfüge-Anomalie (Insertion Anomaly)

Daten können nicht eingefügt werden, ohne andere Daten einzufügen.

**Beispiel:** Eine neue Abteilung kann nicht angelegt werden, solange kein Mitarbeiter zugeordnet ist.

### 3.2 Update-Anomalie (Modification Anomaly)

Eine Information muss an mehreren Stellen geändert werden. Wird eine Stelle vergessen, entsteht Inkonsistenz.

**Beispiel:** Ein Mitarbeiter wechselt die Abteilung. Alle Zeilen mit dem Mitarbeiternamen müssen aktualisiert werden.

### 3.3 Lösch-Anomalie (Deletion Anomaly)

Beim Löschen einer Zeile gehen unbeabsichtigt weitere Informationen verloren.

**Beispiel:** Wird der einzige Mitarbeiter einer Abteilung gelöscht, verschwindet die Information über die Abteilung selbst.

---

## 4. Funktionale Abhängigkeiten

### 4.1 Definition

Eine **funktionale Abhängigkeit** X → Y bedeutet: Wenn zwei Tupel in allen Attributen von X übereinstimmen, dann stimmen sie auch in allen Attributen von Y überein.

**Beispiel:** `MitarbeiterID → Name, Gehalt, Abteilung`

Die MitarbeiterID bestimmt eindeutig Name, Gehalt und Abteilung.

### 4.2 Schlüssel und Bestimmung

- **Determinante** (X): die Attribute, von denen andere abhängen
- **Determinierte Attribute** (Y): die abhängigen Attribute
- **Superschlüssel**: Attribute, von denen alle anderen Attribute abhängen
- **Schlüsselkandidat**: minimaler Superschlüssel

### 4.3 Triviale Abhängigkeit

X → Y ist **trivial**, wenn Y ⊆ X. Beispiele: `{MitarbeiterID} → {MitarbeiterID}` oder `{MitarbeiterID, Name} → {Name}`.

### 4.4 Vollständige funktionale Abhängigkeit

X → Y ist **vollständig**, wenn kein Attribut aus X entfernt werden kann, ohne dass die Abhängigkeit verloren geht. Relevant für 2NF.

### 4.5 Transitive Abhängigkeit

Wenn X → Y und Y → Z, dann ist X → Z transitiv. Relevant für 3NF.

---

## 5. Erste Normalform (1NF)

### 5.1 Definition

Eine Relation ist in **1NF**, wenn:

- Alle Attribute atomar sind (keine Listen, Mengen, Mehrfachwerte)
- Jedes Tupel eindeutig identifizierbar ist

### 5.2 Beispiel

**Verletzung:**

```
Mitarbeiter(MitarbeiterID, Name, Projekte)
(1001, "Anna", {Alpha, Beta})
```

**1NF-Lösung:**

```
Mitarbeiter_Projekt(MitarbeiterID, Projekt)
(1001, "Alpha")
(1001, "Beta")
```

Oder als Tabelle:

```
Mitarbeiter(MitarbeiterID, Name)
Mitarbeiter_Projekt(MitarbeiterID, Projekt)
```

---

## 6. Zweite Normalform (2NF)

### 6.1 Definition

Eine Relation ist in **2NF**, wenn:

- Sie in 1NF ist
- Jedes Nicht-Schlüssel-Attribut **vollständig** vom gesamten Primärschlüssel abhängt (keine partielle Abhängigkeit)

### 6.2 Beispiel

**Verletzung:**

```
Bestellung(BestellID, ProduktID, ProduktName, BestellDatum, Menge)
Primärschlüssel: (BestellID, ProduktID)
ProduktName hängt nur von ProduktID ab (partielle Abhängigkeit)
```

**2NF-Lösung:**

```sql
CREATE TABLE Bestellung (
   BestellID INT PRIMARY KEY,
   BestellDatum DATE
);
CREATE TABLE Bestellung_Position (
   BestellID INT,
   ProduktID INT,
   Menge INT,
   PRIMARY KEY (BestellID, ProduktID),
   FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID),
   FOREIGN KEY (ProduktID) REFERENCES Produkt(ProduktID)
);
CREATE TABLE Produkt (
   ProduktID INT PRIMARY KEY,
   ProduktName VARCHAR(100)
);
```

---

## 7. Dritte Normalform (3NF)

### 7.1 Definition

Eine Relation ist in **3NF**, wenn:

- Sie in 2NF ist
- Keine **transitive Abhängigkeit** zwischen Nicht-Schlüssel-Attributen besteht

### 7.2 Beispiel

**Verletzung:**

```
Mitarbeiter(MitarbeiterID, Name, AbtID, AbtName)
AbtID → AbtName (transitiv: MitarbeiterID → AbtID → AbtName)
```

**3NF-Lösung:**

```sql
CREATE TABLE Abteilung (
   AbtID INT PRIMARY KEY,
   AbtName VARCHAR(100)
);
CREATE TABLE Mitarbeiter (
   MitarbeiterID INT PRIMARY KEY,
   Name VARCHAR(100),
   AbtID INT,
   FOREIGN KEY (AbtID) REFERENCES Abteilung(AbtID)
);
```

---

## 8. Boyce-Codd-Normalform (BCNF)

### 8.1 Definition

Eine Relation ist in **BCNF**, wenn:

- Sie in 3NF ist
- Für jede nicht-triviale funktionale Abhängigkeit X → Y ist X ein **Superschlüssel**

### 8.2 Beispiel

**Verletzung:**

```
StudentMatrNr(StudentID, KursName, Professor)
Annahme: Jeder Professor hält nur einen Kurs
Professor → KursName, aber Professor ist nicht Schlüssel
```

**BCNF-Lösung:**

```sql
CREATE TABLE ProfKurs (Professor INT PRIMARY KEY, KursName VARCHAR(100));
CREATE TABLE StudentMatrNr (
   StudentID INT,
   Professor INT,
   PRIMARY KEY (StudentID),
   FOREIGN KEY (Professor) REFERENCES ProfKurs(Professor)
);
```

### 8.3 3NF vs. BCNF

- 3NF erlaubt bestimmte Abhängigkeiten, wenn Schlüsselattribute beteiligt sind
- BCNF ist strenger und vermeidet diese Ausnahmen
- 3NF wird bevorzugt, wenn keine perfekte Zerlegung ohne Informationsverlust möglich ist

---

## 9. Vierte und Fünfte Normalform (4NF, 5NF)

### 9.1 Vierte Normalform (4NF)

Eliminiert **mehrwertige Abhängigkeiten** (Multi-Valued Dependencies, MVDs).

**Beispiel:**

```
Mitarbeiter(MitarbeiterID, Sprache, Hobby)
```

Ein Mitarbeiter kann mehrere Sprachen und mehrere Hobbys haben — unabhängig voneinander.

**4NF-Lösung:**

```sql
CREATE TABLE Mitarbeiter_Sprache (
   MitarbeiterID INT,
   Sprache VARCHAR(50),
   PRIMARY KEY (MitarbeiterID, Sprache)
);
CREATE TABLE Mitarbeiter_Hobby (
   MitarbeiterID INT,
   Hobby VARCHAR(50),
   PRIMARY KEY (MitarbeiterID, Hobby)
);
```

### 9.2 Fünfte Normalform (5NF)

Eliminiert **Join-Abhängigkeiten**, die sich aus ungewöhnlichen Beziehungen ergeben. In der Praxis selten relevant.

---

## 10. Wann nicht normalisieren?

Normalisierung ist nicht immer optimal:

- **Data Warehousing**: Star/Snowflake-Schema ist oft denormalisiert für Performance
- **Performance-kritische Anwendungen**: Weniger JOINs
- **Audit-Trails**: Historische Daten oft denormalisiert
- **OLAP-Workloads**: Aggregationen vorberechnen

**Denormalisierung** ist die bewusste Verletzung der Normalisierungsregeln aus Performance-Gründen, mit explizitem Management der Redundanz.

---

## 11. Vollständiges Beispiel: E-Commerce-Bestellung

### 11.1 Ausgangstabelle

```
Bestellung(BestellID, Datum, KundeID, KundeName, KundeStadt,
            ProduktID, ProduktName, Preis, Menge)
```

**Probleme:**

- Mehrere Produkte pro Bestellung → mehrere Zeilen pro Bestellung
- Kundenname und -stadt mehrfach redundant
- Produktname und Preis mehrfach redundant

### 11.2 Schritt 1: 1NF

Atomare Werte sicherstellen:

```
Bestellung(BestellID, Datum, KundeID, KundeName, KundeStadt,
            ProduktID, ProduktName, Preis, Menge)
```

PK muss beide IDs umfassen: `(BestellID, ProduktID)`

### 11.3 Schritt 2: 2NF

Bestellungs- und Produktinformationen trennen:

```sql
CREATE TABLE Bestellung (
   BestellID INT PRIMARY KEY,
   Datum DATE,
   KundeID INT
);
CREATE TABLE Bestellposition (
   BestellID INT,
   ProduktID INT,
   Menge INT,
   PRIMARY KEY (BestellID, ProduktID),
   FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID)
);
```

### 11.4 Schritt 3: 3NF

Kunden- und Produktdaten extrahieren:

```sql
CREATE TABLE Kunde (
   KundeID INT PRIMARY KEY,
   Name VARCHAR(100),
   Stadt VARCHAR(100)
);
CREATE TABLE Produkt (
   ProduktID INT PRIMARY KEY,
   Name VARCHAR(200),
   Preis DECIMAL(10,2)
);
CREATE TABLE Bestellung (
   BestellID INT PRIMARY KEY,
   Datum DATE,
   KundeID INT,
   FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
);
CREATE TABLE Bestellposition (
   BestellID INT,
   ProduktID INT,
   Menge INT,
   PRIMARY KEY (BestellID, ProduktID),
   FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID),
   FOREIGN KEY (ProduktID) REFERENCES Produkt(ProduktID)
);
```

### 11.5 Ergebnis

```
Kunde(KundeID, Name, Stadt)
Produkt(ProduktID, Name, Preis)
Bestellung(BestellID, Datum, KundeID)
Bestellposition(BestellID, ProduktID, Menge)
```

**Vorteile:**

- Kundenname nur 1× gespeichert (Update einer Adresse an einer Stelle)
- Produktpreis nur 1× gespeichert (Preisänderung an einer Stelle)
- Mehrere Bestellpositionen pro Bestellung möglich
- Mehrere Bestellungen pro Kunde möglich

---

## 12. Quellen und Bildverweise

### Bildverweise

- Normalformen-Diagramme: <https://de.wikipedia.org/wiki/Normalisierung_(Datenbank)>
- ERD zu Relational Mapping: <https://commons.wikimedia.org/wiki/Category:Database_design>

### Quellen

- E. F. Codd: *A Relational Model of Data for Large Shared Data Banks*, 1970
- E. F. Codd: *Further Normalization of the Data Base Relational Model*, 1971
- C. Date: *An Introduction to Database Systems*
- R. Elmasri, S. Navathe: *Grundlagen von Datenbanksystemen*
- A. Kemper, A. Eickler: *Datenbanksysteme: Eine Einführung*
- de.wikipedia.org/wiki/Normalisierung_(Datenbank)
- de.wikipedia.org/wiki/Boyce-Codd-Normalform
- oer-informatik.de/normalisierung
- datenbanken-verstehen.de

---

## 13. Lernaufgaben

### Übung 1 — 1NF

Gegeben:

```
Buch(ISBN, Titel, Autoren)
(978-1, "Java", {Ullenboom, Bloch})
(978-2, "Python", {Lubanovic, Barry})
```

Überführen Sie in 1NF.

### Übung 2 — 2NF

Gegeben:

```
Bestellung(BestellID, ProduktID, Datum, ProduktName, Preis, Menge)
```

PK: `(BestellID, ProduktID)`

Identifizieren Sie die partielle Abhängigkeit und überführen Sie in 2NF.

### Übung 3 — 3NF

Gegeben:

```
Mitarbeiter(MitarbeiterID, Name, AbtID, AbtName, AbtStandort)
```

PK: `MitarbeiterID`

Identifizieren Sie die transitive Abhängigkeit und überführen Sie in 3NF.

### Übung 4 — BCNF

Gegeben:

```
StudentBetreuer(StudentID, BetreuerID, Fach)
Annahme: Ein Betreuer betreut genau ein Fach
PK: (StudentID, BetreuerID)
```

Ist die Tabelle in BCNF? Falls nein, überführen Sie.

### Übung 5 — Praxis

Modellieren Sie ein Bibliothekssystem (Bücher, Mitglieder, Ausleihen) und normalisieren Sie bis 3NF.

---

## 14. Zusammenfassung

Die **Normalisierung** ist ein systematischer Prozess zur Vermeidung von Redundanzen und Anomalien in relationalen Datenbanken.

| Normalform | Hauptanforderung |
|---|---|
| **1NF** | Atomare Werte |
| **2NF** | 1NF + keine partiellen Abhängigkeiten |
| **3NF** | 2NF + keine transitiven Abhängigkeiten |
| **BCNF** | 3NF + jede Determinante ist Superschlüssel |
| **4NF** | BCNF + keine mehrwertigen Abhängigkeiten |

### Selbsttest-Checkliste

- [ ] Ich erkenne Anomalien in nicht normalisierten Schemata.
- [ ] Ich identifiziere funktionale Abhängigkeiten.
- [ ] Ich überführe Tabellen in 1NF, 2NF, 3NF und BCNF.
- [ ] Ich entscheide, wann Denormalisierung sinnvoll ist.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2599 — Recherche 2026*
