# Fachmodul: GIT und IDE

**Kurs-ID:** 1931
**Kategorie:** Kursbibliothek / Fachmodule / Software-Engineering
**Quelle:** https://moodle.oszimt.de/course/view.php?id=1931

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [IDE – Überblick](#2-ide--überblick)
3. [IntelliJ IDEA](#3-intellij-idea)
4. [Eclipse](#4-eclipse)
5. [VS Code](#5-vs-code)
6. [Git in IDEs](#6-git-in-ides)
7. [Build-Tools](#7-build-tools)
8. [Debugging in IDEs](#8-debugging-in-ides)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- eine geeignete IDE auswählen,
- Git in der IDE nutzen,
- Build-Tools bedienen,
- Debugger einsetzen.

---

## 2. IDE – Überblick

Eine **Integrated Development Environment (IDE)** ist eine Entwicklungsumgebung, die Editor, Compiler, Debugger und weitere Werkzeuge integriert.

**Wichtige Java-IDEs:**

- **IntelliJ IDEA** (Ultimate, Community)
- **Eclipse IDE**
- **VS Code** mit Java-Erweiterungen
- **NetBeans** (Apache-Projekt)

---

## 3. IntelliJ IDEA

### 3.1 Varianten

- **Community Edition**: kostenlos, Open Source
- **Ultimate Edition**: kommerziell, mit Enterprise-Funktionen

### 3.2 Funktionen

- Smarte Code-Vervollständigung
- Refactoring-Werkzeuge
- Integriertes Debugging
- Versionsverwaltungs-Integration (Git, SVN)
- Build-Tools (Maven, Gradle)
- Profiling und Performance-Analyse
- Plugin-Ökosystem

### 3.3 Wichtige Shortcuts

| Aktion | Shortcut |
|---|---|
| Suche überall | Doppel-Shift |
| Klasse suchen | Ctrl+N |
| Symbol suchen | Ctrl+Shift+Alt+N |
| Refactoring-Menü | Ctrl+Alt+Shift+T |
| Formatieren | Ctrl+Alt+L |
| Run | Shift+F10 |
| Debug | Shift+F9 |
| Git Push | Ctrl+Shift+K |

---

## 4. Eclipse

### 4.1 Überblick

- Open Source IDE (Eclipse Foundation)
- Plugin-basiert (Equinox)
- Weit verbreitet im Enterprise-Umfeld

### 4.2 Werkzeuge

- JDT (Java Development Tools)
- WTP (Web Tools Platform)
- EGit (Git-Integration)
- Maven/Gradle-Integration

### 4.3 Wichtige Shortcuts

| Aktion | Shortcut |
|---|---|
| JavaDoc generieren | Shift+Alt+J |
| Quick Fix | Ctrl+1 |
| Quick Assist | Ctrl+2 |
| Formatieren | Ctrl+Shift+F |
| Run | Ctrl+F11 |
| Debug | F11 |

---

## 5. VS Code

### 5.1 Überblick

- Leichtgewichtiger Editor von Microsoft
- Plattformübergreifend (Windows, macOS, Linux)
- Java-Entwicklung mit Extensions

### 5.2 Wichtige Java-Extensions

- **Extension Pack for Java**: offizielles Microsoft-Paket
- **Language Support for Java**: Syntax-Highlighting
- **Debugger for Java**: Debugging
- **Maven/Gradle**: Build-Tools
- **Spring Boot Extension Pack**
- **Project Manager for Java**: Projektverwaltung

### 5.3 Vorteile

- Sehr schnell
- Großes Extension-Ökosystem
- Multi-Language

---

## 6. Git in IDEs

### 6.1 IntelliJ Git

- VCS-Menü oder Git-Toolfenster (Alt+9)
- Commit, Push, Pull direkt
- Branch-Verwaltung
- Diff-Viewer
- Konflikt-Resolver

### 6.2 Eclipse EGit

- Team-Menü
- Git-Staging-View
- Pull, Push, Commit

### 6.3 VS Code Git

- Source Control-Ansicht (Strg+Shift+G)
- Inline-Diff
- Branch-Anzeige unten

---

## 7. Build-Tools

### 7.1 Maven

- **Project Object Model (POM)**: `pom.xml`
- Convention over Configuration
- Standardverzeichnisstruktur
- Plugins für verschiedene Aufgaben

### 7.2 Gradle

- Build-Skripte in Groovy/Kotlin DSL
- Inkrementelle Builds
- Mächtiger als Maven für komplexe Builds

### 7.3 Build-Befehle

```bash
# Maven
mvn clean compile
mvn test
mvn package
mvn install
mvn deploy

# Gradle
gradle clean build
gradle build
gradle test
gradle run
```

---

## 8. Debugging in IDEs

### 8.1 Breakpoints

- **Zeilen-Breakpoint**: hält an bestimmter Zeile
- **Conditional Breakpoint**: Bedingung erfüllt
- **Methoden-Breakpoint**: bei Methodenaufruf
- **Exception-Breakpoint**: bei Exception

### 8.2 Debug-Fenster

- **Variables**: aktuelle Werte lokaler Variablen
- **Watches**: selbst hinzugefügte Ausdrücke
- **Call Stack**: Methodenaufrufkette
- **Breakpoints**: alle Breakpoints anzeigen

### 8.3 Schritt-Funktionen

- **Step Over** (F8): nächste Zeile, ohne in Methoden zu springen
- **Step Into** (F7): in Methodenaufruf springen
- **Step Out** (Shift+F8): Methode verlassen
- **Resume** (F9): bis nächsten Breakpoint

### 8.4 Bedingter Breakpoint

```java
for (int i = 0; i < 1000; i++) {
    System.out.println(i);  // Breakpoint mit Bedingung: i == 500
}
```

Rechtsklick auf Breakpoint → Condition → `i == 500`

---

## 9. Übungen

### Übung 1 — IDE installieren

Installieren Sie IntelliJ IDEA Community Edition.

### Übung 2 — Erstes Projekt

Erstellen Sie ein Java-Projekt in der IDE.

### Übung 3 — Git-Integration

Klonen Sie ein Repo in die IDE und machen Sie Commits.

### Übung 4 — Maven nutzen

Erstellen Sie ein Maven-Projekt mit `pom.xml`.

### Übung 5 — Debugging

Setzen Sie einen Breakpoint und debuggen Sie schrittweise.

### Übung 6 — Shortcuts lernen

Lernen Sie die wichtigsten Shortcuts für Ihre IDE.

---

## 10. Zusammenfassung

**IDEs** sind die zentrale Werkbank für Software-Entwickler:

| IDE | Vorteil |
|---|---|
| **IntelliJ** | beste Java-IDE |
| **Eclipse** | Open Source, Enterprise |
| **VS Code** | leicht, Multi-Language |

**Build-Tools:** Maven (Standard), Gradle (flexibel)

**Git-Integration:** in allen IDEs nativ

**Debugging:** Breakpoints, Variables, Call Stack, Schritt-Funktionen

### Selbsttest-Checkliste

- [ ] Ich wähle die passende IDE.
- [ ] Ich nutze Shortcuts effizient.
- [ ] Ich nutze Git in der IDE.
- [ ] Ich bediene Maven/Gradle.
- [ ] Ich debugge systematisch.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=1931 — Recherche 2026*
