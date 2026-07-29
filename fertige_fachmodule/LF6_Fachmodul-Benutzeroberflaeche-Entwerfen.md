# Fachmodul: Benutzeroberfläche Entwerfen

**Kurs-ID:** 4761
**Kategorie:** Kursbibliothek / Fachmodule / Software-Engineering
**Quelle:** https://moodle.oszimt.de/course/view.php?id=4761

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Was ist HCI?](#2-was-ist-hci)
3. [Grundlagen der UI-Gestaltung](#3-grundlagen-der-ui-gestaltung)
4. [Nielsen's 10 Usability-Heuristiken](#4-nielsens-10-usability-heuristiken)
5. [GUI-Design-Prinzipien](#5-gui-design-prinzipien)
6. [Design-Pattern für GUIs](#6-design-pattern-für-guis)
7. [Komponentenbenennung (OSZ-IMT-Richtlinien)](#7-komponentenbenennung-osz-imt-richtlinien)
8. [Mockups und Wireframes](#8-mockups-und-wireframes)
9. [WinForms und moderne UI-Frameworks](#9-winforms-und-moderne-ui-frameworks)
10. [Barrierefreiheit (Accessibility)](#10-barrierefreiheit-accessibility)
11. [Usability-Tests](#11-usability-tests)
12. [Übungen](#12-übungen)
13. [Quellen](#13-quellen)
14. [Zusammenfassung](#14-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die Grundlagen der Mensch-Computer-Interaktion erklären,
- Nielsen's 10 Usability-Heuristiken anwenden,
- GUI-Komponenten korrekt einsetzen und benennen,
- Mockups und Wireframes erstellen,
- Benutzeroberflächen nach OSZ-IMT-Richtlinien gestalten,
- Usability-Tests planen und durchführen.

---

## 2. Was ist HCI?

**HCI (Human-Computer Interaction)** befasst sich mit der Gestaltung, Bewertung und Implementierung interaktiver Systeme für den menschlichen Gebrauch.

**Zentrale Themen:**

- Benutzerfreundlichkeit (Usability)
- Benutzererlebnis (User Experience, UX)
- Informationsarchitektur
- Interaktionsdesign
- Barrierefreiheit (Accessibility)

**Wichtige ISO-Normen:**

- **ISO 9241**: Ergonomie der Mensch-System-Interaktion
- **ISO 25010**: Software-Produktqualität (enthält Usability)
- **ISO 9241-210**: Menschzentrierte Gestaltung

---

## 3. Grundlagen der UI-Gestaltung

### 3.1 Ziele

- **Effektivität**: Aufgaben vollständig und korrekt lösen
- **Effizienz**: Aufgaben mit angemessenem Aufwand lösen
- **Zufriedenheit**: positive User Experience
- **Fehlertoleranz**: Vermeidung und Behandlung von Fehlern

### 3.2 HCI-Grundlagen

- **Affordances**: sichtbare Eigenschaften, die Funktionen andeuten
- **Constraints**: Einschränkungen, die Fehler verhindern
- **Mappings**: Beziehung zwischen Bedienelement und Wirkung
- **Feedback**: Rückmeldung über Systemzustand
- **Mental Models**: Vorstellung der Benutzer von der Software

### 3.3 Gestaltungsprinzipien (Norman/Don Norman)

1. **Sichtbarkeit**: Status ist erkennbar
2. **Feedback**: Aktion hat erkennbare Wirkung
3. **Constraints**: Eingaben sind eingeschränkt
4. **Konsistenz**: ähnliche Aufgaben haben ähnliche Bedienung
5. **Affordance**: Bedienelemente suggerieren ihre Funktion

---

## 4. Nielsen's 10 Usability-Heuristiken

1. **Sichtbarkeit des Systemstatus**: Der Benutzer sollte jederzeit wissen, was passiert.
2. **Übereinstimmung zwischen System und Realität**: Sprache und Konzepte aus der Benutzerwelt.
3. **Benutzerkontrolle und Freiheit**: Rückgängig-Machen und Exit-Funktionen.
4. **Konsistenz und Standards**: gleiche Wörter, Situationen, Aktionen.
5. **Fehlervermeidung**: Probleme erst gar nicht auftreten lassen.
6. **Wiedererkennung statt Erinnerung**: sichtbare Optionen.
7. **Flexibilität und Effizienz**: Anpassung an Experten und Anfänger.
8. **Ästhetik und minimalistisches Design**: keine irrelevanten Informationen.
9. **Hilfe erkennen, diagnostizieren und beheben**: verständliche Fehlermeldungen.
10. **Hilfe und Dokumentation**: leicht auffindbar und aufgabenspezifisch.

---

## 5. GUI-Design-Prinzipien

### 5.1 Konsistenz

- Gleiche Farben, Schriften, Layouts für ähnliche Funktionen
- Einheitliche Tastenkürzel (z. B. Strg+S für Speichern)
- Plattformkonventionen einhalten

### 5.2 Visuelles Feedback

- Hover-Effekte bei interaktiven Elementen
- Ladeanimationen für Wartezustand
- Erfolgsmeldungen für abgeschlossene Aktionen

### 5.3 Klare Sprache

- Kurze, aktive Formulierungen
- Fachbegriffe vermeiden oder erklären
- Konsistente Terminologie

### 5.4 Fehlerfreundlichkeit

- Konstruktive Fehlermeldungen
- Vorschläge zur Lösung
- Wiederherstellung ermöglichen (Undo)

---

## 6. Design-Pattern für GUIs

### 6.1 MVC (Model-View-Controller)

(siehe Fachmodul 1955)

### 6.2 MVP (Model-View-Presenter)

```
┌──────────┐    ┌──────────────┐    ┌────────────┐
│   View   │◄──►│  Presenter   │◄──►│   Model    │
└──────────┘    └──────────────┘    └────────────┘
```

### 6.3 MVVM (Model-View-ViewModel)

(siehe Fachmodul 1955)

### 6.4 Observer-Pattern

UI-Komponenten beobachten Datenänderungen automatisch (z. B. PropertyChanged in WPF).

---

## 7. Komponentenbenennung (OSZ-IMT-Richtlinien)

Die OSZ-IMT hat 2013 Richtlinien für die Benennung von Komponenten herausgegeben. Ein Auszug:

### 7.1 Allgemeine Regeln

- **Aussagekräftige Namen**: sprechende Identifizierer
- **PascalCase** für Klassen und Komponenten
- **camelCase** für Properties und Variablen
- **Ungarische Notation vermeiden** (statt `txtName` → `name`)

### 7.2 Komponenten-Präfixe

| Komponente | Präfix | Beispiel |
|---|---|---|
| Button | `btn` | `btnSpeichern` |
| TextBox | `txt` | `txtName` |
| Label | `lbl` | `lblName` |
| ComboBox | `cmb` | `cmbLand` |
| ListBox | `lst` | `lstAuswahl` |
| CheckBox | `chk` | `chkAktiv` |
| DataGridView | `dgv` | `dgvBestellung` |
| Panel | `pnl` | `pnlHauptbereich` |
| Form | `frm` | `frmHauptfenster` |

### 7.3 Beispiel

```csharp
public partial class frmKundenverwaltung : Form
{
    private TextBox txtName;
    private Button btnSpeichern;
    private DataGridView dgvKunden;
    private Label lblStatus;
}
```

---

## 8. Mockups und Wireframes

### 8.1 Was sind Mockups?

Ein **Mockup** ist eine visuelle Skizze der Benutzeroberfläche, die das Aussehen, aber nicht die Funktionalität zeigt.

### 8.2 Wireframes

**Wireframes** sind einfach gehaltene Skizzen mit Fokus auf Layout und Struktur.

### 8.3 Tools für Mockups

- **Balsamiq**: skizzenhafte Wireframes
- **Figma**: kollaboratives Design
- **Sketch**: macOS-Designtool
- **Adobe XD**: UX-Design
- **InVision**: Prototyping
- **draw.io**: einfache Wireframes

### 8.4 Beispiel Wireframe

```
┌─────────────────────────────────────┐
│ [OSZ-IMT Logo]        [User-Menü]   │
├─────────────────────────────────────┤
│ Navigation | Kundenverwaltung        │
├─────────────────────────────────────┤
│ Suche: [_______________] [Suchen]    │
├─────────────────────────────────────┤
│ Kundenliste (Tabelle)                │
│ ┌──────┬────────────┬──────────┐   │
│ │ ID   │ Name       │ Email    │   │
│ ├──────┼────────────┼──────────┤   │
│ │ 1001 │ Anna       │ a@x.de   │   │
│ │ 1002 │ Bernd      │ b@x.de   │   │
│ └──────┴────────────┴──────────┘   │
│                                     │
│ [Neu] [Bearbeiten] [Löschen]        │
└─────────────────────────────────────┘
```

---

## 9. WinForms und moderne UI-Frameworks

### 9.1 WinForms (Windows Forms)

- Teil von .NET Framework
- Sehr verbreitet in Legacy-Anwendungen
- Drag-and-Drop Designer in Visual Studio

```csharp
public partial class frmHauptfenster : Form
{
    private TextBox txtName;
    private Button btnOK;

    public frmHauptfenster()
    {
        InitializeComponent();
    }
}
```

### 9.2 WPF (Windows Presentation Foundation)

- Modernere Alternative zu WinForms
- XAML für deklarative UI
- Datenbindung

```xml
<Window x:Class="App.MainWindow">
    <StackPanel>
        <TextBox x:Name="txtName" />
        <Button x:Name="btnOK" Content="OK" />
    </StackPanel>
</Window>
```

### 9.3 Moderne Frameworks

- **React + Material-UI**: Web
- **Vue.js + Vuetify**: Web
- **Angular + Angular Material**: Web
- **Jetpack Compose**: Android
- **SwiftUI**: iOS
- **Flutter**: Cross-platform

---

## 10. Barrierefreiheit (Accessibility)

### 10.1 WCAG (Web Content Accessibility Guidelines)

- **A (Minimum)**: grundlegende Zugänglichkeit
- **AA (Standard)**: empfohlen
- **AAA (Maximum)**: höchste Zugänglichkeit

### 10.2 BITV (Barrierefreie Informationstechnik-Verordnung)

Deutsche Verordnung für barrierefreie Informationstechnik.

### 10.3 Praktische Maßnahmen

- **Kontraste**: mindestens 4,5:1 für Text (WCAG AA)
- **Tastaturzugriff**: alle Funktionen ohne Maus bedienbar
- **Screen-Reader**: ARIA-Labels, semantisches HTML
- **Fokus-Reihenfolge**: logische Reihenfolge
- **Vergrößerung**: bis 200 % ohne Funktionsverlust
- **Farbenblindheit**: nicht nur Farbe zur Statuskommunikation

---

## 11. Usability-Tests

### 11.1 Testmethoden

- **Kognitive Begehung** (Cognitive Walkthrough): Experte geht Aufgabe durch
- **Heuristische Evaluation**: Nielsen's 10 Heuristiken prüfen
- **Benutzer-Test**: reale Nutzer beobachten
- **A/B-Test**: zwei Varianten vergleichen
- **Think-Aloud**: Benutzer denkt laut während der Aufgabe

### 11.2 Ablauf

1. **Planung**: Aufgaben, Zielgruppe, Metriken
2. **Pilot-Test**: Test mit wenigen Probanden
3. **Hauptdurchlauf**: Tests mit genügend Probanden (5–10)
4. **Auswertung**: Erfolgsrate, Fehler, Zeit
5. **Iteration**: Verbesserungen einarbeiten

### 11.3 Beispiel-Aufgabe

> "Speichern Sie einen neuen Kunden 'Anna Müller' mit der E-Mail-Adresse 'anna@beispiel.de'."

- **Erfolgsrate**: 9 von 10 schaffen es
- **Zeit**: durchschnittlich 45 Sekunden
- **Fehler**: 2 kritische, 3 nicht-kritische

---

## 12. Übungen

### Übung 1 — Wireframe

Erstellen Sie ein Wireframe für eine Login-Seite mit Eingabefeldern, "Login"-Button und "Passwort vergessen"-Link.

### Übung 2 — Heuristische Evaluation

Analysieren Sie eine bekannte Webseite nach Nielsen's 10 Heuristiken.

### Übung 3 — WinForms

Erstellen Sie in WinForms ein kleines Formular mit TextBox, Button und ListBox. Verwenden Sie OSZ-IMT-Benennung.

### Übung 4 — Mockup mit draw.io

Erstellen Sie ein Mockup für eine Mobile-App (z. B. Aufgaben-Manager).

### Übung 5 — Usability-Test

Planen Sie einen Usability-Test für eine selbst gewählte Anwendung.

---

## 13. Quellen

- J. Nielsen: *Usability Engineering*
- D. Norman: *The Design of Everyday Things*
- B. Shneiderman: *Designing the User Interface*
- ISO 9241: <https://www.iso.org/standard/34923.html>
- WCAG: <https://www.w3.org/WAI/standards-guidelines/wcag/>
- Nielsen Norman Group: <https://www.nngroup.com/>
- BITV: <https://www.gesetze-im-internet.de/bitv_2_0/>

---

## 14. Zusammenfassung

**Benutzeroberflächen-Entwurf** ist ein zentraler Bestandteil der Software-Entwicklung:

- **Grundlagen**: HCI, Usability, UX
- **Heuristiken**: Nielsen's 10 Punkte
- **Design-Pattern**: MVC, MVP, MVVM
- **OSZ-IMT-Richtlinien**: einheitliche Benennung
- **Mockups/Wireframes**: frühe Visualisierung
- **Frameworks**: WinForms, WPF, Web-Frameworks
- **Barrierefreiheit**: WCAG, BITV
- **Tests**: Heuristik, Benutzertests

### Selbsttest-Checkliste

- [ ] Ich nutze Nielsen's Heuristiken.
- [ ] Ich erstelle Wireframes und Mockups.
- [ ] Ich benenne GUI-Komponenten nach OSZ-IMT-Richtlinien.
- [ ] Ich beachte Barrierefreiheit.
- [ ] Ich plane Usability-Tests.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=4761 — Recherche 2026*
