# Fachmodul: NoSQL Datenbanken

**Kurs-ID:** 4675
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / DBS
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4675

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [CAP-Theorem und BASE vs. ACID](#2-cap-theorem-und-base-vs-acid)
3. [NoSQL-Kategorien](#3-nosql-kategorien)
4. [Key-Value-Stores (Redis)](#4-key-value-stores-redis)
5. [Document Stores (MongoDB)](#5-document-stores-mongodb)
6. [Spaltenorientiert (Cassandra)](#6-spaltenorientiert-cassandra)
7. [Graphdatenbanken (Neo4j)](#7-graphdatenbanken-neo4j)
8. [Vergleich SQL vs. NoSQL](#8-vergleich-sql-vs-nosql)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- das CAP-Theorem erklären,
- die NoSQL-Kategorien unterscheiden,
- für Anwendungsfälle die passende Datenbank wählen,
- MongoDB, Redis, Cassandra und Neo4j einordnen.

---

## 2. CAP-Theorem und BASE vs. ACID

### 2.1 CAP-Theorem (Eric Brewer, 2000)

In einem verteilten System können nur **zwei der drei Eigenschaften** garantiert werden:

- **C**onsistency (Konsistenz): Alle Knoten sehen dieselben Daten zur gleichen Zeit
- **A**vailability (Verfügbarkeit): Jede Anfrage wird beantwortet
- **P**artition Tolerance (Partitionstoleranz): System funktioniert trotz Netzwerkaufteilung

### 2.2 Beispiele

- **CP**: HBase, MongoDB (Konfiguration)
- **AP**: Cassandra, CouchDB
- **CA** (klassisch): Relationale Datenbanken ohne Partition

### 2.3 ACID vs. BASE

| ACID (klassisch) | BASE (NoSQL) |
|---|---|
| **A**tomicity | **B**asically **A**vailable |
| **C**onsistency | **S**oft state |
| **I**solation | **E**ventually consistent |
| **D**urability | |

- **ACID**: strikte Konsistenz (z. B. Banken)
- **BASE**: lockere Konsistenz (z. B. Social Media)

---

## 3. NoSQL-Kategorien

| Kategorie | Beispiele | Eigenschaft |
|---|---|---|
| **Key-Value** | Redis, DynamoDB | einfache Schlüssel-Werte |
| **Document** | MongoDB, CouchDB | JSON-ähnliche Dokumente |
| **Column-Family** | Cassandra, HBase | spaltenorientiert, wide rows |
| **Graph** | Neo4j, JanusGraph | Knoten und Kanten |
| **Search** | Elasticsearch, Solr | Volltextsuche |
| **Time-Series** | InfluxDB, Prometheus | Zeitreihen |
| **Vector** | Pinecone, Milvus | Embeddings für KI |

---

## 4. Key-Value-Stores (Redis)

### 4.1 Eigenschaften

- Einfache Schlüssel-Werte
- Sehr schnell (In-Memory)
- Optional Persistenz

### 4.2 Beispiel

```
SET benutzer:1001:name "Anna Müller"
GET benutzer:1001:name
> "Anna Müller"

EXPIRE session:abc 3600
DEL benutzer:1001
```

### 4.3 Datenstrukturen

- Strings
- Hashes
- Lists
- Sets
- Sorted Sets
- Streams (ab 5.0)

### 4.4 Anwendungsfälle

- **Sessions** (Web-Login)
- **Cache** vor Datenbank
- **Real-Time Analytics**
- **Leaderboards**
- **Message Broker** (Redis Streams)

---

## 5. Document Stores (MongoDB)

### 5.1 Eigenschaften

- Dokumente im BSON-Format (binäres JSON)
- Flexible Schema
- Dokument-basiert
- Reichhaltige Abfragen

### 5.2 Beispiel-Dokument

```json
{
  "_id": ObjectId("..."),
  "name": "Anna Müller",
  "alter": 30,
  "email": "anna@example.com",
  "adresse": {
    "straße": "Hauptstraße 1",
    "stadt": "Berlin"
  },
  "hobbies": ["Lesen", "Wandern"],
  "registriert_am": ISODate("2024-01-15")
}
```

### 5.3 CRUD

```javascript
// Insert
db.mitarbeiter.insertOne({ name: "Anna", alter: 30 });

// Find
db.mitarbeiter.find({ name: "Anna" });

// Update
db.mitarbeiter.updateOne(
  { name: "Anna" },
  { $set: { alter: 31 } }
);

// Delete
db.mitarbeiter.deleteOne({ name: "Anna" });
```

### 5.4 Aggregations-Framework

```javascript
db.bestellung.aggregate([
  { $group: { _id: "$kunde", summe: { $sum: "$betrag" } } },
  { $sort: { summe: -1 } },
  { $limit: 10 }
]);
```

### 5.5 Anwendungsfälle

- Content-Management
- Mobile Apps
- IoT-Daten
- Katalog-Systeme
- E-Commerce

---

## 6. Spaltenorientiert (Cassandra)

### 6.1 Eigenschaften

- Wide-Column-Stores
- Partition Tolerance
- Linear skalierbar
- Letztendlich konsistent

### 6.2 Datenmodell

```
Keyspace (Datenbank)
└── Tables
    └── Rows (Partition Key + Clustering Key)
        └── Columns
```

### 6.3 CQL (Cassandra Query Language)

```sql
CREATE TABLE messages (
    id UUID PRIMARY KEY,
    user_id TEXT,
    content TEXT,
    created_at TIMESTAMP
);

INSERT INTO messages (id, user_id, content, created_at)
VALUES (uuid(), 'user1', 'Hallo', toTimestamp(now()));
```

### 6.4 Anwendungsfälle

- IoT und Telemetrie (viele Schreibvorgänge)
- Zeitreihendaten
- Messaging
- E-Commerce (Warenkörbe, Sitzplätze)

---

## 7. Graphdatenbanken (Neo4j)

### 7.1 Eigenschaften

- Knoten und Kanten
- Beziehungen als First-Class-Citizens
- Cypher Query Language

### 7.2 Beispiel

```cypher
CREATE (a:Person {name: "Anna"})
CREATE (b:Person {name: "Bernd"})
CREATE (a)-[:KENNT]->(b);
```

### 7.3 Abfrage

```cypher
MATCH (p:Person {name: "Anna"})-[:KENNT]->(freunde)
RETURN freunde.name;
```

### 7.4 Anwendungsfälle

- Soziale Netzwerke
- Empfehlungssysteme
- Fraud Detection
- Knowledge Graphs
- Netzwerkanalyse

---

## 8. Vergleich SQL vs. NoSQL

| Aspekt | SQL | NoSQL |
|---|---|---|
| **Schema** | starr | flexibel |
| **Skalierung** | vertikal | horizontal |
| **Konsistenz** | ACID | oft BASE |
| **Anfragesprache** | SQL (standardisiert) | je nach System |
| **Transaktionen** | ACID | oft eventual consistency |
| **Anwendung** | strukturierte Daten | flexible, große Datenmengen |

---

## 9. Übungen

### Übung 1 — CAP-Theorem

Welche Eigenschaften bevorzugen Sie für eine Bankanwendung? Einen Social-Media-Feed?

### Übung 2 — NoSQL wählen

Welche NoSQL-Datenbank für: Session-Speicher, soziales Netzwerk, Zeitreihen?

### Übung 3 — MongoDB

Erstellen Sie eine MongoDB-Sammlung und führen Sie CRUD-Operationen durch.

### Übung 4 — Redis

Nutzen Sie Redis für Session-Caching.

### Übung 5 — Neo4j

Modellieren Sie ein soziales Netzwerk in Neo4j.

### Übung 6 — Migration

Welche Schritte für die Migration einer SQL-Datenbank zu NoSQL?

---

## 10. Zusammenfassung

**NoSQL** ist eine **Familie von Datenbanksystemen** für unterschiedliche Anwendungsfälle:

**CAP-Theorem:** Konsistenz, Verfügbarkeit, Partitionstoleranz — nur 2 von 3 möglich

**Kategorien:**

- **Key-Value**: Redis, DynamoDB
- **Document**: MongoDB, CouchDB
- **Column-Family**: Cassandra, HBase
- **Graph**: Neo4j

**Vorteile:** horizontale Skalierung, flexible Schemas

**Trade-offs:** BASE statt ACID, keine Standard-Abfragesprache

### Selbsttest-Checkliste

- [ ] Ich erkläre CAP-Theorem und BASE.
- [ ] Ich unterscheide NoSQL-Kategorien.
- [ ] Ich wähle die passende NoSQL-Datenbank.
- [ ] Ich kenne Anwendungsfälle.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4675 — Recherche 2026*
