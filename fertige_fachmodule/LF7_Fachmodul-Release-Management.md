# FM: Release Management

**Kurs-ID:** 4861
**Kategorie:** Kursbibliothek / Fachmodule / ITSM
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4861

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist Release Management?](#2-was-ist-release-management)
3. [Release-Typen](#3-release-typen)
4. [Release-Lifecycle](#4-release-lifecycle)
5. [Release-Train und Continuous Delivery](#5-release-train-und-continuous-delivery)
6. [Build, Test, Stage, Deploy](#6-build-test-stage-deploy)
7. [DevOps und CI/CD](#7-devops-und-cicd)
8. [Werkzeuge](#8-werkzeuge)
9. [KPIs](#9-kpis)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Release Management von Deployment Management abgrenzen,
- Release-Typen unterscheiden,
- Release-Lifecycle planen,
- DevOps-Praktiken anwenden,
- CI/CD-Pipelines aufsetzen.

---

## 2. Was ist Release Management?

**Release Management** plant, steuert und koordiniert die **Bereitstellung neuer Releases** (Versionen) von IT-Services.

**Ziele:**

- Geordnete, planbare Releases
- Minimale Ausfallzeit
- Reproduzierbarkeit
- Schnellere Time-to-Market

**Abgrenzung:**

- **Release Management**: Sammlung von Changes zu einem Release
- **Deployment Management**: Technische Bereitstellung
- **Change Enablement**: Einzelner Change

---

## 3. Release-Typen

### 3.1 Major Release

- Große Änderungen, neue Funktionen
- Beispiel: Version 2.0 → 3.0
- Lange Vorlaufzeit

### 3.2 Minor Release

- Kleine neue Funktionen, Verbesserungen
- Beispiel: Version 3.0 → 3.1
- Mittlere Vorlaufzeit

### 3.3 Patch Release / Hotfix

- Fehlerbehebungen, Sicherheits-Patches
- Beispiel: Version 3.1.0 → 3.1.1
- Kurze Vorlaufzeit

### 3.4 Emergency Release

- Kritische Sicherheits-Patches
- Schneller Prozess

---

## 4. Release-Lifecycle

### 4.1 Phasen

```
[Planung] → [Entwicklung] → [Build] → [Test] → [Stage] → [Freigabe] → [Deployment] → [Betrieb]
```

### 4.2 Planung

- Inhalte des Releases
- Zeitplan
- Ressourcen
- Risikobewertung
- Stakeholder-Kommunikation

### 4.3 Entwicklung

- Feature-Entwicklung in Branches
- Code-Reviews
- Unit-Tests
- Continuous Integration

### 4.4 Test

- Integrationstests
- Systemtests
- Performance-Tests
- Sicherheitstests
- Abnahmetests

### 4.5 Freigabe

- Release Notes
- Dokumentation
- Build-Artefakte (z. B. Docker-Image)
- Versions-Tagging

### 4.6 Deployment

- Canary Deployment
- Blue/Green Deployment
- Rolling Update
- Big Bang (selten)

---

## 5. Release-Train und Continuous Delivery

### 5.1 Release-Train

Regelmäßige, geplante Release-Zyklen (z. B. monatlich) mit fixen Inhalten:

- **Vorteil**: Planbarkeit, Stabilität
- **Nachteil**: Lange Wartezeit auf neuen Code

### 5.2 Continuous Delivery

Jeder Commit ist potentiell produktionsreif:

- **Vorteil**: Schnelle Markteinführung
- **Nachteil**: Erfordert hohe Automatisierung und Testqualität

### 5.3 Continuous Deployment

- Automatische Bereitstellung in Produktion
- Jeder grüne Build wird automatisch deployt

---

## 6. Build, Test, Stage, Deploy

### 6.1 Build

- Quellcode wird kompiliert
- Artefakte erzeugt (JAR, Docker-Image)
- Build-Artefakte werden versioniert (z. B. in Nexus, Artifactory)

### 6.2 Test (Stufen)

- **Unit-Test**: einzelne Funktionen
- **Integrationstest**: Zusammenspiel von Komponenten
- **Systemtest**: Gesamtsystem
- **Abnahmetest**: Geschäftsprozesse durch Anwender

### 6.3 Stage

- **Dev**: Entwicklungsumgebung
- **Test**: Testumgebung
- **Staging**: produktionsähnliche Umgebung
- **Prod**: Produktion

### 6.4 Deploy

- Bereitstellung in Zielumgebung
- Konfiguration
- Smoke-Test nach Deployment
- Rollback bei Problemen

---

## 7. DevOps und CI/CD

### 7.1 DevOps-Prinzipien

- **Kultur**: Zusammenarbeit Dev ↔ Ops
- **Automatisierung**: Build, Test, Deploy
- **Messung**: KPIs
- **Sharing**: Wissen, Tools

### 7.2 CI/CD-Pipeline

```
Code → Commit → Build → Test → Deploy → Monitor
```

### 7.3 CI/CD-Tools

- **Jenkins**: weit verbreitet, Open Source
- **GitLab CI/CD**: integriert in GitLab
- **GitHub Actions**: GitHub-Workflows
- **CircleCI, Travis CI**: SaaS-CI/CD
- **Argo CD**: GitOps für Kubernetes
- **Tekton**: Kubernetes-native CI/CD

### 7.4 Beispiel: GitHub Actions

```yaml
name: CI/CD
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build
        run: mvn package
      - name: Test
        run: mvn test
      - name: Deploy
        if: github.ref == 'refs/heads/main'
        run: ./deploy.sh
```

---

## 8. Werkzeuge

### 8.1 Release-Tools

- **Jenkins, GitLab CI, GitHub Actions**: CI/CD
- **Octopus Deploy**: Deployment-Spezialist
- **JFrog Artifactory**: Artefakt-Repository
- **Sonatype Nexus**: Artefakt-Repository
- **Helm**: Kubernetes Package Manager
- **Terraform**: Infrastructure as Code

---

## 9. KPIs

| KPI | Beschreibung |
|---|---|
| **Lead Time** | Zeit von Code-Commit bis Produktion |
| **Deployment Frequency** | Häufigkeit der Deployments |
| **Change Failure Rate** | Anteil fehlgeschlagener Changes |
| **Mean Time to Recover** | Recovery-Zeit bei Ausfällen |
| **Mean Time to Detect** | Erkennungszeit |
| **Release Velocity** | Anzahl Features pro Release |

Diese KPIs stammen aus dem **DORA Report** (DevOps Research and Assessment).

---

## 10. Übungen

### Übung 1 — Release-Typ

Welcher Release-Typ passt für: neues Feature, Sicherheits-Patch, neue Version?

### Übung 2 — CI/CD-Pipeline

Beschreiben Sie eine CI/CD-Pipeline für eine Java-Anwendung.

### Übung 3 — Deploy-Strategie

Vergleichen Sie Blue/Green, Canary und Rolling Update.

### Übung 4 — DORA-KPIs

Was messen die DORA-KPIs?

### Übung 5 — Tool-Auswahl

Welche CI/CD-Tools würden Sie für ein mittleres Unternehmen wählen?

---

## 11. Zusammenfassung

**Release Management** koordiniert die Bereitstellung neuer Software-Versionen:

**Release-Typen:**

| Typ | Beispiel |
|---|---|
| Major | v1 → v2 |
| Minor | v2.0 → v2.1 |
| Patch | v2.1.0 → v2.1.1 |
| Emergency | Sicherheits-Patch |

**Lifecycle:** Planung → Entwicklung → Build → Test → Stage → Freigabe → Deployment → Betrieb

**CI/CD:**

- Continuous Integration: automatisierter Build und Test
- Continuous Delivery: produktionsbereit
- Continuous Deployment: automatische Bereitstellung

**DevOps-KPIs (DORA):**

- Lead Time
- Deployment Frequency
- Change Failure Rate
- MTTR

### Selbsttest-Checkliste

- [ ] Ich unterscheide Release-Typen.
- [ ] Ich plane einen Release-Lifecycle.
- [ ] Ich implementiere CI/CD-Pipelines.
- [ ] Ich wende DORA-KPIs an.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4861 — Recherche 2026*
