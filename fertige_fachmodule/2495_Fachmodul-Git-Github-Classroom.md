# Fachmodul: Git mit GitHub Classroom

**Kurs-ID:** 2495
**Kategorie:** Kursbibliothek / Fachmodule / Software-Engineering
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2495

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Versionskontrolle – Überblick](#2-versionskontrolle--überblick)
3. [Git-Grundlagen](#3-git-grundlagen)
4. [Git-Branches und Workflows](#4-git-branches-und-workflows)
5. [Konflikte lösen](#5-konflikte-lösen)
6. [GitHub und Pull Requests](#6-github-und-pull-requests)
7. [GitHub Classroom einrichten](#7-github-classroom-einrichten)
8. [.gitignore](#8-gitignore)
9. [Übungen](#9-übungen)
10. [Zusammenfassung](#10-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Git-Grundlagen anwenden,
- Repositories anlegen und klonen,
- mit Branches arbeiten und Konflikte lösen,
- GitHub Classroom einrichten,
- Schüler/Studenten Aufgaben zuweisen.

---

## 2. Versionskontrolle – Überblick

**Versionskontrolle** (Version Control System, VCS) verwaltet Änderungen an Dateien über die Zeit.

**Arten:**

- **Lokal** (RCS): nur auf einem Rechner
- **Zentralisiert** (SVN, CVS): ein zentraler Server
- **Verteilt** (Git, Mercurial): jeder hat eine vollständige Kopie

**Git** ist heute der De-facto-Standard:

- Entwickelt von Linus Torvalds (2005) für den Linux-Kernel
- Verteilte Architektur
- Schnell, effizient, mächtig

---

## 3. Git-Grundlagen

### 3.1 Konzepte

- **Repository (Repo)**: Sammlung von Dateien mit Versionshistorie
- **Commit**: Snapshot eines Zustands
- **Working Directory**: lokale Arbeitskopie
- **Staging Area (Index)**: Zwischenbereich für Commits
- **Branch**: parallele Entwicklungslinie
- **HEAD**: aktueller Branch/Zustand

### 3.2 Grundlegende Befehle

```bash
# Repository initialisieren
git init

# Status anzeigen
git status

# Dateien zum Staging hinzufügen
git add datei.txt
git add .

# Commit erstellen
git commit -m "Beschreibung der Änderung"

# Remote hinzufügen
git remote add origin https://github.com/user/repo.git

# Änderungen hochladen
git push -u origin main

# Änderungen herunterladen
git pull

# Repository klonen
git clone https://github.com/user/repo.git

# Historie anzeigen
git log
git log --oneline
```

### 3.3 Git-Konfiguration

```bash
git config --global user.name "Max Mustermann"
git config --global user.email "max@example.com"
git config --global init.defaultBranch main
```

---

## 4. Git-Branches und Workflows

### 4.1 Branch-Befehle

```bash
git branch                     # Branches auflisten
git branch feature-login        # Branch erstellen
git checkout feature-login      # Branch wechseln
git switch feature-login        # Alternative (ab Git 2.23)
git checkout -b feature-x        # Erstellen + Wechseln
git switch -c feature-x
git merge feature-login        # Branch mergen
git branch -d feature-login      # Branch löschen
```

### 4.2 Git Flow (Vincent Driessen)

- **master/main**: Produktion
- **develop**: Integration
- **feature/\***: neue Features
- **release/\***: Release-Vorbereitung
- **hotfix/\***: kritische Bugfixes

### 4.3 GitHub Flow (vereinfacht)

- **main**: produktionsbereit
- **feature/\***: neue Features
- Pull Request + Review + Merge in main

### 4.4 Trunk-based Development

- Direkt in main committen
- Feature Flags zur Aktivierung
- Für Continuous Deployment

---

## 5. Konflikte lösen

### 5.1 Wann entstehen Konflikte?

- Zwei Branches ändern die gleiche Zeile
- Eine Branch löscht eine Datei, die in der anderen geändert wurde

### 5.2 Konflikte lösen

```bash
git merge feature-login
# CONFLICT in src/login.java
git status           # zeigt betroffene Dateien
# Konflikt manuell lösen im Editor
git add src/login.java
git commit
```

### 5.3 Konflikt-Marker

```java
<<<<<<< HEAD
System.out.println("Login alt");
=======
System.out.println("Login neu");
>>>>>>> feature-login
```

### 5.4 Tools

- **Git-Konflikte im Editor**: VS Code, IntelliJ (visuell)
- **git mergetool**: externes Tool konfigurieren
- **git rerere**: Konflikte automatisch wiederverwenden

---

## 6. GitHub und Pull Requests

### 6.1 GitHub

- Web-Plattform für Git-Repositories
- Kollaboration, Code-Review, CI/CD
- Aktionen: Pull Requests, Issues, Actions, Pages

### 6.2 Pull Request (PR)

Workflow:

1. Branch erstellen und pushen
2. Pull Request auf GitHub öffnen
3. Reviewer kommentieren
4. Diskussion und Änderungen
5. CI/CD läuft automatisch
6. Genehmigung und Merge in main

### 6.3 GitHub Actions (CI/CD)

```yaml
name: CI

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Java
        uses: actions/setup-java@v4
        with:
          java-version: '21'
      - run: mvn test
```

---

## 7. GitHub Classroom einrichten

### 7.1 Was ist GitHub Classroom?

- Werkzeug für Lehrkräfte zur Verwaltung von Git-Aufgaben
- Automatische Erstellung von Schüler-Repos aus Vorlage
- Test-Integration möglich (automatische Bewertung)

### 7.2 Workflow

1. **Organisation erstellen** auf GitHub
2. **GitHub Classroom** aktivieren (<https://classroom.github.com>)
3. **Klassenzimmer** (Classroom) erstellen
4. **Aufgabe** (Assignment) erstellen
   - Repository-Vorlage (Template)
   - Test-Konfiguration
5. **Schüler einladen** per Link
6. Schüler akzeptieren → eigenes Repo wird erstellt
7. Schüler arbeiten im Repo
8. Lehrkraft sieht Commits, Pull Requests, Testergebnisse

### 7.3 Aufgabentypen

- **Individual**: jeder Schüler hat eigenes Repo
- **Group**: Teams arbeiten gemeinsam

### 7.4 Automatische Tests

- GitHub Actions für Tests
- Beispiel: Java-Maven-Tests laufen bei jedem Commit
- Punkte können automatisch vergeben werden

---

## 8. .gitignore

### 8.1 Zweck

- Bestimmte Dateien nicht in Git aufnehmen
- Beispiel: `bin/`, `target/`, `.idea/`, Geheimnisse, Logs

### 8.2 Beispiel

```gitignore
# Java
*.class
*.jar
target/
build/

# IDEs
.idea/
*.iml
.vscode/
.project
.classpath

# OS
.DS_Store
Thumbs.db

# Geheimnisse
.env
*.key
```

### 8.3 GitHub-Vorlagen

- <https://github.com/github/gitignore>: Sammlung für viele Sprachen
- z. B. `Java.gitignore`, `Python.gitignore`

---

## 9. Übungen

### Übung 1 — Erstes Repo

Erstellen Sie ein lokales Repo und machen Sie Commits.

### Übung 2 — GitHub

Erstellen Sie ein Repo auf GitHub und pushen Sie es.

### Übung 3 — Branching

Erstellen Sie einen Feature-Branch und mergen Sie ihn zurück.

### Übung 4 — Konflikt

Erzeugen Sie absichtlich einen Konflikt und lösen Sie ihn.

### Übung 5 — GitHub Classroom

Erstellen Sie eine Aufgabe in GitHub Classroom.

### Übung 6 — CI/CD

Erstellen Sie eine GitHub-Action für ein Java-Projekt.

---

## 10. Zusammenfassung

**Git** ist das führende verteilte Versionskontrollsystem:

**Grundlagen:**

- `git init`, `git add`, `git commit`, `git push`, `git pull`, `git clone`

**Branching:**

- Git Flow, GitHub Flow, Trunk-based Development

**Konflikte:**

- Manuell oder per Tool lösen
- Marker `<<<<<<<`, `=======`, `>>>>>>>`

**GitHub Classroom:**

- Aufgaben für Schüler/Studenten
- Automatische Bewertung mit GitHub Actions

### Selbsttest-Checkliste

- [ ] Ich nutze Git-Grundbefehle.
- [ ] Ich erstelle und merge Branches.
- [ ] Ich löse Konflikte.
- [ ] Ich nutze GitHub Classroom.
- [ ] Ich konfiguriere `.gitignore`.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2495 — Recherche 2026*
