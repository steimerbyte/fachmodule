# Fachmodul: Normalisierung (DB) LF08

**Kurs-ID:** 6722
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS / LF08
**Quelle:** https://moodle.oszimt.de/course/view.php?id=6722

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Wiederholung: Anomalien und Normalformen](#2-wiederholung-anomalien-und-normalformen)
3. [Schrittweise Normalisierung — Praxisbeispiel](#3-schrittweise-normalisierung--praxisbeispiel)
4. [Funktionale Abhängigkeiten erkennen](#4-funktionale-abhängigkeiten-erkennen)
5. [Normalisierung im OSZ-IMT-Kontext](#5-normalisierung-im-osz-imt-kontext)
6. [Übungen](#6-übungen)
7. [Quellen](#7-quellen)
8. [Zusammenfassung](#8-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Anomalien in nicht normalisierten Tabellen erkennen,
- Tabellen schrittweise in 1NF, 2NF, 3NF überführen,
- funktionale Abhängigkeiten identifizieren,
- im OSZ-IMT-Kontext typische LF08-Aufgaben lösen.

---

## 2. Wiederholung: Anomalien und Normalformen

(Siehe auch Fachmodul 2599 Normalisierung.)

**Anomalien:**

- **Einfüge-Anomalie**: Daten können nicht eingefügt werden, ohne andere einzufügen
- **Update-Anomalie**: Änderungen müssen an vielen Stellen erfolgen
- **Lösch-Anomalie**: Löschen entfernt unbeabsichtigt weitere Daten

**Normalformen:**

| NF | Anforderung |
|---|---|
| 1NF | Atomare Werte |
| 2NF | 1NF + keine partiellen Abhängigkeiten |
| 3NF | 2NF + keine transitiven Abhängigkeiten |
| BCNF | 3NF + jede Determinante ist Superschlüssel |

---

## 3. Schrittweise Normalisierung — Praxisbeispiel

### 3.1 Ausgangstabelle (0NF)

```
Bestellung(BestellID, Datum, KundeName, KundeStadt, ProduktName, Preis, Menge)
Beispieldaten:
(1001, 2024-01-15, "Anna", "Berlin", "Laptop", 1200.00, 1)
(1001, 2024-01-15, "Anna", "Berlin", "Maus", 25.00, 2)
(1002, 2024-01-16, "Bernd", "München", "Laptop", 1200.00, 1)
```

### 3.2 Schritt zu 1NF

Atomare Werte sind bereits gegeben. Aber die Tabelle hat ein Identifikationsproblem — `BestellID` allein reicht nicht als PK, weil sie mehrfach vorkommt.

**PK:** `(BestellID, ProduktName)`

### 3.3 Schritt zu 2NF

`ProduktName → Preis` (partielle Abhängigkeit vom Teil des PK):

```sql
CREATE TABLE Bestellung (
    BestellID INT,
    Datum DATE,
    KundeName VARCHAR(100),
    KundeStadt VARCHAR(50),
    PRIMARY KEY (BestellID)  -- funktioniert, weil jede Bestellung einen eigenen Block hat
);
CREATE TABLE Produkt (
    ProduktName VARCHAR(100) PRIMARY KEY,
    Preis DECIMAL(10,2)
);
CREATE TABLE Bestellposition (
    BestellID INT,
    ProduktName VARCHAR(100),
    Menge INT,
    PRIMARY KEY (BestellID, ProduktName),
    FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID),
    FOREIGN KEY (ProduktName) REFERENCES Produkt(ProduktName)
);
```

### 3.4 Schritt zu 3NF

`BestellID → KundeName, KundeStadt` (transitive Abhängigkeit):

```sql
CREATE TABLE Kunde (
    KundeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Stadt VARCHAR(50)
);
CREATE TABLE Bestellung (
    BestellID INT PRIMARY KEY,
    Datum DATE,
    KundeID INT,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
);
```

### 3.5 Endergebnis (3NF)

```
Kunde(KundeID, Name, Stadt)
Produkt(ProduktName, Preis)
Bestellung(BestellID, Datum, KundeID)
Bestellposition(BestellID, ProduktName, Menge)
```

---

## 4. Funktionale Abhängigkeiten erkennen

### 4.1 Vorgehensweise

1. Betrachte jede Zeile und vergleiche gleiche Attributwerte
2. Identifiziere, welche Attribute andere eindeutig bestimmen
3. Zeichne die Abhängigkeiten auf
4. Bestimme Schlüsselkandidaten

### 4.2 Beispiel

```
Mitarbeiter(MitarbeiterID, Name, AbtID, AbtName)
```

Funktionale Abhängigkeiten:

- `MitarbeiterID → Name, AbtID, AbtName` (MitarbeiterID ist Schlüssel)
- `AbtID → AbtName` (transitiv!)

**Lösung:**

```
Mitarbeiter(MitarbeiterID, Name, AbtID)
Abteilung(AbtID, AbtName)
```

---

## 5. Normalisierung im OSZ-IMT-Kontext

### 5.1 Typische LF08-Aufgaben

- "Bestellung" mit Kunden und Produkten
- "Forum" mit Benutzern, Foren, Threads, Beiträgen
- "Segeltörn" mit Booten, Seglern, Crew
- "Zwerge" mit Waffen, Aufgaben, Beute

### 5.2 Vorgehen

1. ERD aus Anforderungstext zeichnen
2. Kardinalitäten bestimmen
3. In Relationenmodell überführen
4. Normalisieren bis 3NF
5. SQL-DDL erstellen

### 5.3 Häufige Stolpersteine

- **PK mit Text statt ID** → Performance-Probleme
- **N:M nicht erkannt** → Daten verlieren oder duplizieren
- **Schwache Entitäten vergessen** → Anomalien
- **NULL-Werte übersehen** → Probleme mit Aggregaten

---

## 6. Übungen

### Übung 1 — Bücherei (3NF)

Modellieren Sie eine Bibliothek mit Büchern, Mitgliedern, Ausleihen und Autoren. Normalisieren Sie bis 3NF.

### Übung 2 — Flugbuchung

Modellieren Sie ein Flugbuchungssystem mit Passagieren, Flügen, Buchungen und Sitzen. Normalisieren Sie bis 3NF.

### Übung 3 — Krankenhaus

Modellieren Sie ein Krankenhaus mit Patienten, Ärzten, Behandlungen. Identifizieren Sie transitive Abhängigkeiten und normalisieren Sie.

### Übung 4 — IS-A-Beziehung

Gegeben: `Person` als Supertyp, `Student`/`Professor`/`Mitarbeiter` als Subtypen. Erstellen Sie das relationale Schema (Tabelle pro Subtyp).

---

## 7. Quellen

- E. F. Codd: *A Relational Model of Data for Large Shared Data Banks*, 1970
- C. Date: *An Introduction to Database Systems*
- R. Elmasri, S. Navathe: *Grundlagen von Datenbanksystemen*
- A. Kemper, A. Eickler: *Datenbanksysteme: Eine Einführung*
- de.wikipedia.org/wiki/Normalisierung_(Datenbank)
- LF08-Infoblätter des OSZ-IMT

---

## 8. Zusammenfassung

**Normalisierung** ist ein systematischer Prozess zur Vermeidung von Anomalien:

| Schritt | Ziel |
|---|---|
| 1NF | Atomare Werte |
| 2NF | Keine partiellen Abhängigkeiten |
| 3NF | Keine transitiven Abhängigkeiten |

**Praktisches Vorgehen:**

1. Anomalien in der Ausgangstabelle erkennen
2. Schrittweise in 1NF, 2NF, 3NF transformieren
3. DDL mit passenden Constraints erstellen

### Selbsttest-Checkliste

- [ ] Ich erkenne Anomalien in nicht normalisierten Tabellen.
- [ ] Ich identifiziere funktionale Abhängigkeiten.
- [ ] Ich überführe Tabellen schrittweise bis 3NF.
- [ ] Ich erstelle SQL-DDL mit Constraints.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=6722 — Recherche 2026*
