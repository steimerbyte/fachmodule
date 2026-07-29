# Fachmodul: Java Einstieg

**Kurs-ID:** 2586
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Java
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2586

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Java?](#2-was-ist-java)
3. [Geschichte](#3-geschichte)
4. [Eigenschaften von Java](#4-eigenschaften-von-java)
5. [JVM, JRE, JDK](#5-jvm-jre-jdk)
6. [Installation und Einrichtung](#6-installation-und-einrichtung)
7. [Erste Schritte: Hello World](#7-erste-schritte-hello-world)
8. [Grundlegende Sprachelemente](#8-grundlegende-sprachelemente)
9. [IDEs und Tools](#9-ides-und-tools)
10. [Java-Versionen und LTS](#10-java-versionen-und-lts)
11. [Übungen](#11-übungen)
12. [Zusammenfassung](#12-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Java-Philosophie und Geschichte erklären,
- JVM, JRE, JDK unterscheiden,
- Java installieren und konfigurieren,
- ein erstes Java-Programm schreiben und ausführen,
- eine geeignete IDE auswählen.

---

## 2. Was ist Java?

**Java** ist eine **objektorientierte, plattformunabhängige Programmiersprache** mit großer Verbreitung in Enterprise-Anwendungen, Android-Apps, Web-Backends und Embedded Systems.

**Schlüsseleigenschaften:**

- "Write once, run anywhere" (WORA)
- Starke Typisierung
- Automatische Speicherbereinigung (Garbage Collection)
- Multithreading eingebaut
- Sicherheitskonzept (Sandbox, ClassLoader)

---

## 3. Geschichte

| Jahr | Ereignis |
|---|---|
| 1991 | Green Project bei Sun Microsystems (James Gosling) |
| 1995 | Java 1.0 veröffentlicht |
| 1996 | JDK 1.0 |
| 1998 | Java 2 (J2SE, J2EE, J2ME) |
| 2004 | Java 5 (Generics, Annotationen) |
| 2014 | Java 8 (Lambda, Streams, neue Date/Time) |
| 2017 | Java 9 (Modulsystem) |
| 2018 | Java 11 LTS |
| 2021 | Java 17 LTS |
| 2023 | Java 21 LTS |
| 2010 | Oracle übernimmt Sun |

---

## 4. Eigenschaften von Java

### 4.1 Eigenschaften

- **Objektorientiert**: alles ist ein Objekt (außer Primitive)
- **Plattformunabhängig**: läuft auf jeder JVM
- **Stark typisiert**: Typfehler werden früh erkannt
- **Multithreaded**: eingebaute Thread-Unterstützung
- **Sicher**: Sandbox, Bytecode-Verifier, SecurityManager
- **Robust**: starke Typisierung, Garbage Collection, Exception Handling

### 4.2 Nachteile

- Langsamer als C/C++ (aber JIT-Compiler hat viel aufgeholt)
- Boilerplate-Code (vor Java 8)
- Komplexität durch Frameworks

---

## 5. JVM, JRE, JDK

### 5.1 JVM (Java Virtual Machine)

- Führt Java-Bytecode aus
- Plattformspezifisch (Linux, Windows, macOS)
- Bietet Speicherverwaltung, Garbage Collection, JIT-Compiler
- "Write once, run anywhere"

### 5.2 JRE (Java Runtime Environment)

- JVM + Bibliotheken für Endnutzer
- Zum Ausführen von Java-Programmen
- Enduser brauchen JRE (meist mit JVM gebündelt)

### 5.3 JDK (Java Development Kit)

- JRE + Compiler (javac) + Debugger + Tools
- Für Entwickler
- Aktuell: OpenJDK, Oracle JDK, Adoptium (Eclipse Temurin)

### 5.4 Vergleich

| | JDK | JRE | JVM |
|---|---|---|---|
| **Zweck** | Entwicklung | Ausführung | Ausführung |
| **javac** | ja | nein | nein |
| **Bibliotheken** | ja | ja | nein (Teil) |
| **VM** | ja | ja | ja |
| **Tools** | ja | nein | nein |

---

## 6. Installation und Einrichtung

### 6.1 JDK installieren

1. **Adoptium Temurin** (ehem. AdoptOpenJDK) herunterladen
   - URL: <https://adoptium.net/>
   - LTS-Version wählen (z. B. JDK 21)
2. **Installation** durchführen
3. **JAVA_HOME** setzen
4. **PATH** um `$JAVA_HOME/bin` erweitern
5. Test: `java -version` und `javac -version`

### 6.2 Alternative Distributionen

- **Oracle JDK**: kommerziell
- **Eclipse Temurin**: Open Source, Adoptium
- **Microsoft OpenJDK**: für Windows optimiert
- **Amazon Corretto**: Cloud-optimiert

### 6.3 Konfiguration

```bash
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH
```

Windows:
```
JAVA_HOME=C:\Program Files\Java\jdk-21
PATH=%JAVA_HOME%\bin;%PATH%
```

---

## 7. Erste Schritte: Hello World

### 7.1 Quellcode

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### 7.2 Compilieren und Ausführen

```bash
javac HelloWorld.java   # erzeugt HelloWorld.class
java HelloWorld         # führt aus, Ausgabe: Hello, World!
```

### 7.3 Einzeiler (JDK 11+)

```bash
java HelloWorld.java
```

Seit JDK 11 kann der Java-Interpreter einzelne Quelldateien direkt ausführen (nur für Skripte und einfache Programme).

---

## 8. Grundlegende Sprachelemente

### 8.1 Variablen und Datentypen

```java
int zahl = 42;
double pi = 3.14159;
char buchstabe = 'A';
boolean istWahr = true;
String name = "Anna";
```

### 8.2 Kontrollstrukturen

```java
if (x > 0) {
    System.out.println("positiv");
} else {
    System.out.println("nicht positiv");
}

for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

while (running) {
    // ...
}
```

### 8.3 Klassen und Objekte

```java
public class Hund {
    private String name;
    private int alter;

    public Hund(String name, int alter) {
        this.name = name;
        this.alter = alter;
    }

    public void bellen() {
        System.out.println(name + " sagt: Wuff!");
    }

    public static void main(String[] args) {
        Hund bello = new Hund("Bello", 3);
        bello.bellen();
    }
}
```

---

## 9. IDEs und Tools

### 9.1 Beliebte IDEs

| IDE | Vorteile |
|---|---|
| **IntelliJ IDEA** | beste Java-IDE, Code-Analyse, Refactoring |
| **Eclipse** | Open Source, weit verbreitet |
| **VS Code** | leichtgewichtig, viele Plugins |
| **NetBeans** | offizielles Apache-Projekt |

### 9.2 Build-Tools

- **Maven**: XML-Konfiguration, Convention over Configuration
- **Gradle**: Groovy/Kotlin DSL, flexibel
- **Ant**: älter, heute selten

### 9.3 Versionsverwaltung

- **Git**: Standard
- Hosting: GitHub, GitLab, Bitbucket

---

## 10. Java-Versionen und LTS

### 10.1 Aktuelle LTS-Versionen

| Version | Veröffentlichung | Ende Premier Support |
|---|---|---|
| **Java 8** | 2014 | 2026 (extended) |
| **Java 11** | 2018 | 2027 |
| **Java 17** | 2021 | 2029 |
| **Java 21** | 2023 | 2031 |
| **Java 25** (geplant) | 2025 | – |

### 10.2 Wichtige Neuerungen

**Java 8**: Lambda, Streams, Optional, neue Date/Time API

**Java 9**: Module (Project Jigsaw)

**Java 11**: HTTP Client, `var`-Typ-Inferenz

**Java 14**: `Records` (Preview), `sealed` (Preview)

**Java 15**: Text Blocks

**Java 16**: Records final, Pattern Matching `instanceof`

**Java 17**: sealed classes, Pattern Matching `switch` (Preview)

**Java 21**: Virtual Threads, Pattern Matching `switch` final

---

## 11. Übungen

### Übung 1 — Installation

Installieren Sie JDK 21 auf Ihrem System.

### Übung 2 — Hello World

Schreiben Sie Ihr erstes Java-Programm und führen Sie es aus.

### Übung 3 — IDE

Installieren Sie IntelliJ IDEA Community Edition.

### Übung 4 — Variablen

Schreiben Sie ein Programm mit Variablen verschiedener Datentypen.

### Übung 5 — Klassen

Erstellen Sie eine Klasse `Auto` mit Attributen und Methoden.

---

## 12. Zusammenfassung

**Java** ist eine plattformunabhängige, objektorientierte Programmiersprache:

**Eckpfeiler:**

- "Write once, run anywhere"
- Starke Typisierung
- Automatische Speicherbereinigung
- Multithreading

**Toolchain:**

- **JDK** für Entwicklung
- **JRE/JVM** für Ausführung

**LTS-Versionen:** 8, 11, 17, 21 (für Produktion empfohlen)

**IDEs:** IntelliJ IDEA, Eclipse, VS Code

### Selbsttest-Checkliste

- [ ] Ich erkläre die Java-Philosophie.
- [ ] Ich unterscheide JVM, JRE, JDK.
- [ ] Ich installiere JDK.
- [ ] Ich schreibe ein Java-Programm.
- [ ] Ich wähle eine IDE aus.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2586 — Recherche 2026*
