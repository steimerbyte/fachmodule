# Fachmodul: Dateiformate – XML

**Kurs-ID:** 2961
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2961

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist XML?](#2-was-ist-xml)
3. [Aufbau und Syntax](#3-aufbau-und-syntax)
4. [XML-Deklaration und Wohlgeformtheit](#4-xml-deklaration-und-wohlgeformtheit)
5. [Document Type Definition (DTD)](#5-document-type-definition-dtd)
6. [XML Schema (XSD)](#6-xml-schema-xsd)
7. [Namespaces](#7-namespaces)
8. [Parser: SAX, DOM, StAX, JAXB](#8-parser-sax-dom-stax-jaxb)
9. [XPath, XSLT, XQuery](#9-xpath-xslt-xquery)
10. [XML in der Praxis](#10-xml-in-der-praxis)
11. [Übungen](#11-übungen)
12. [Zusammenfassung](#12-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- XML-Dokumente erstellen und validieren,
- DTD und XSD verstehen,
- XML in Java verarbeiten,
- XPath-Abfragen formulieren,
- XML in modernen Standards (Webservice, Office) nutzen.

---

## 2. Was ist XML?

**XML (Extensible Markup Language)** ist eine **textbasierte Auszeichnungssprache** zur strukturierten Darstellung von Daten.

**Eigenschaften:**

- Selbstbeschreibend
- Menschen- und maschinenlesbar
- Plattformunabhängig
- Unicode-Unterstützung
- Strukturierte Hierarchien

**Anwendungen:**

- Webservices (SOAP)
- Office Open XML (docx, xlsx)
- RSS/Atom (Feeds)
- Konfigurationsdateien
- Datenaustausch

---

## 3. Aufbau und Syntax

### 3.1 Beispiel

```xml
<?xml version="1.0" encoding="UTF-8"?>
<buch xmlns="http://example.com/buchschema" version="1.0">
    <titel>Java ist auch eine Insel</titel>
    <autor>Christian Ullenboom</autor>
    <isbn>978-3-8362-9127-3</isbn>
    <preis waehrung="EUR">39.90</preis>
    <kapitel nummer="1">
        <titel>Sprachgrundlagen</titel>
        <seiten>42</seiten>
    </kapitel>
</buch>
```

### 3.2 Grundregeln

- Tags in spitzen Klammern
- Geschachtelte Elemente (korrekt geschlossen)
- Genau ein Wurzelelement
- Groß-/Kleinschreibung beachten
- Attribut-Werte in Anführungszeichen
- Spezielle Zeichen escapen (z. B. `&amp;`, `&lt;`, `&gt;`)

---

## 4. XML-Deklaration und Wohlgeformtheit

### 4.1 XML-Deklaration

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

- Optional, aber empfohlen
- Erste Zeile des Dokuments
- UTF-8 heute Standard

### 4.2 Wohlgeformtheit (Well-formed)

Ein XML-Dokument ist **wohlgeformt**, wenn:

- Genau ein Wurzelelement
- Alle Elemente korrekt geschlossen
- Elemente korrekt geschachtelt
- Attribute in Anführungszeichen
- Spezielle Zeichen escaped
- Kommentare korrekt: `<!-- ... -->`

### 4.3 XML-Dokument

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- Kommentar -->
<root>
    <element attribute="value">Inhalt</element>
    <leer/>
    <spezial>&lt;&gt;&amp;</spezial>
</root>
```

---

## 5. Document Type Definition (DTD)

### 5.1 Zweck

DTD definiert die **Struktur** eines XML-Dokuments (erlaubte Elemente, Attribute, Reihenfolge).

### 5.2 Beispiel

```xml
<?xml version="1.0"?>
<!DOCTYPE bibliothek [
    <!ELEMENT bibliothek (buch+)>
    <!ELEMENT buch (titel, autor, isbn, preis)>
    <!ELEMENT titel (#PCDATA)>
    <!ELEMENT autor (#PCDATA)>
    <!ELEMENT isbn (#PCDATA)>
    <!ELEMENT preis (#PCDATA)>
    <!ATTLIST preis waehrung CDATA "EUR">
]>
<bibliothek>
    <buch>...</buch>
</bibliothek>
```

### 5.3 Einschränkungen

- Eingeschränkte Datentypen
- Nur sehr begrenzte Validierung
- Wird heute meist durch XSD ersetzt

---

## 6. XML Schema (XSD)

### 6.1 Zweck

**XML Schema** bietet **starke Typisierung** und reichhaltigere Validierung als DTD.

### 6.2 Beispiel

```xml
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="buch">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="titel" type="xs:string"/>
                <xs:element name="autor" type="xs:string"/>
                <xs:element name="isbn" type="xs:string"/>
                <xs:element name="preis">
                    <xs:complexType>
                        <xs:simpleContent>
                            <xs:extension base="xs:decimal">
                                <xs:attribute name="waehrung" type="xs:string" default="EUR"/>
                            </xs:extension>
                        </xs:simpleContent>
                    </xs:complexType>
                </xs:element>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
</xs:schema>
```

### 6.3 Built-in-Datentypen

- `xs:string`, `xs:int`, `xs:decimal`, `xs:boolean`
- `xs:date`, `xs:dateTime`, `xs:time`
- `xs:positiveInteger`, `xs:nonNegativeInteger`

---

## 7. Namespaces

### 7.1 Zweck

Vermeidung von Namenskonflikten bei Kombination mehrerer XML-Sprachen.

### 7.2 Beispiel

```xml
<?xml version="1.0"?>
<root xmlns:html="http://www.w3.org/1999/xhtml"
      xmlns:svg="http://www.w3.org/2000/svg">
    <html:p>HTML-Absatz</html:p>
    <svg:rect width="100" height="50"/>
</root>
```

### 7.3 Default-Namespace

```xml
<?xml version="1.0"?>
<buch xmlns="http://example.com/buch">
    <titel>...</titel>
</buch>
```

---

## 8. Parser: SAX, DOM, StAX, JAXB

### 8.1 SAX (Simple API for XML)

- **Ereignis-basiert**: Parser liest und feuert Events
- Stream-basiert, kein DOM im Speicher
- Speichereffizient, schnell
- Nur vorwärts

### 8.2 DOM (Document Object Model)

- **Baum-basiert**: komplettes XML wird im Speicher abgebildet
- Navigation in beide Richtungen
- Modifikation möglich
- Speicherintensiv

### 8.3 StAX (Streaming API for XML)

- **Pull-basiert**: Anwendung zieht Events
- Zwischen SAX und DOM
- Lesen ohne Callback-Struktur

### 8.4 JAXB (Java Architecture for XML Binding)

- **Objekt-Mapping**: Java-Klassen ↔ XML
- Annotationsbasiert: `@XmlRootElement`, `@XmlElement`
- Generierung aus XSD: `xjc`

### 8.5 Beispiel JAXB

```java
@XmlRootElement(name = "buch")
public class Buch {
    @XmlElement private String titel;
    @XmlElement private String autor;
    @XmlAttribute private String isbn;
}
```

---

## 9. XPath, XSLT, XQuery

### 9.1 XPath

**XPath** ist eine Abfragesprache für XML-Dokumente:

```xpath
/buecherei/buch[titel='Java']
//autor[starts-with(.,'C')]
/buch/*[last()]
```

### 9.2 XSLT

**XSLT** transformiert XML in andere Formate (XML, HTML, Text):

```xml
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html><body>
            <h1><xsl:value-of select="buch/titel"/></h1>
        </body></html>
    </xsl:template>
</xsl:stylesheet>
```

### 9.3 XQuery

Funktionale Abfragesprache für XML, ähnlich SQL für XML.

---

## 10. XML in der Praxis

### 10.1 Webservices

- **SOAP**: XML-basiert
- **WSDL**: Webservice-Beschreibung
- **REST mit XML**: oft als Alternative zu JSON

### 10.2 Office

- **OpenXML** (Office Open XML): docx, xlsx, pptx
- **ODF** (Open Document Format): odt, ods, odp

### 10.3 Konfiguration

- **Maven `pom.xml`**: Projektkonfiguration
- **Ant `build.xml`**: Build-Skripte
- **Spring `applicationContext.xml`**: Spring-Konfiguration
- **Android Manifest**: App-Manifest

### 10.4 Datenaustausch

- **X12 (EDI)**: Standard für Handelsdaten
- **HL7**: Gesundheitswesen
- **FIX**: Finanznachrichten
- **Sitemap**: SEO

### 10.5 JSON vs. XML

| Aspekt | XML | JSON |
|---|---|---|
| Lesbarkeit | gut | sehr gut |
| Strukturierung | sehr ausdrucksstark | einfach |
| Validierung | DTD, XSD | JSON Schema |
| Werkzeuge | ausgereift | sehr gut |
| Performance | größer | kleiner |

Heute: JSON bevorzugt für Web APIs, XML für Bürokommunikation, Office, SOAP.

---

## 11. Übungen

### Übung 1 — XML erstellen

Erstellen Sie ein XML-Dokument für Ihre Lieblingsfilme.

### Übung 2 — XSD entwerfen

Entwerfen Sie ein XSD für eine Adressdatenstruktur.

### Übung 3 — XPath-Abfrage

Formulieren Sie XPath-Abfragen für Ihre XML-Daten.

### Übung 4 — JAXB nutzen

Erstellen Sie JAXB-Klassen für Ihr XML-Dokument.

### Übung 5 — Parser vergleichen

Vergleichen Sie SAX, DOM und StAX.

### Übung 6 — XSLT

Schreiben Sie ein XSLT-Stylesheet für HTML-Ausgabe.

---

## 12. Zusammenfassung

**XML** ist eine **textbasierte Auszeichnungssprache** für strukturierte Daten:

**Aufbau:**

- XML-Deklaration
- Wurzelelement
- Geschachtelte Elemente mit Attributen

**Validierung:**

- **DTD**: einfach, eingeschränkt
- **XSD**: mächtig, starke Typen

**Parser:**

- **SAX**: event-basiert, speichereffizient
- **DOM**: baum-basiert, vollständig
- **StAX**: pull-basiert
- **JAXB**: Java-Mapping

**Verwandt:** XPath, XSLT, XQuery

**Anwendungen:** SOAP, Office Open XML, Konfigurationsdateien

### Selbsttest-Checkliste

- [ ] Ich erstelle wohlgeformtes XML.
- [ ] Ich entwerfe XSD-Schemata.
- [ ] Ich nutze Parser in Java.
- [ ] Ich formuliere XPath-Abfragen.
- [ ] Ich kenne Anwendungsgebiete.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2961 — Recherche 2026*
