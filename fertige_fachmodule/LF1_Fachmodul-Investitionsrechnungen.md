# Fachmodul: Investitionsrechnungen im Unternehmen

**Kurs-ID:** 3343
**Kategorie:** Kursbibliothek / Fachmodule / Wirtschaft
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3343

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Statische Investitionsrechnung](#2-statische-investitionsrechnung)
3. [Dynamische Investitionsrechnung](#3-dynamische-investitionsrechnung)
4. [Vergleich der Methoden](#4-vergleich-der-methoden)
5. [Investitionsrechnung im IT-Bereich](#5-investitionsrechnung-im-it-bereich)
6. [ROI und TCO](#6-roi-und-tco)
7. [Übungen](#7-übungen)
8. [Zusammenfassung](#8-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- statische und dynamische Investitionsrechnungen durchführen,
- die passende Methode für ein Investitionsvorhaben wählen,
- Investitionen im IT-Bereich bewerten.

---

## 2. Statische Investitionsrechnung

### 2.1 Überblick

Statische Methoden vernachlässigen den **Zeitwert des Geldes** und sind daher nur eingeschränkt aussagekräftig.

### 2.2 Kostenvergleichsrechnung

Vergleich der **Kosten pro Periode**:

```
Kosten_pro_Jahr = Anschaffungskosten / Nutzungsdauer + jährliche Betriebskosten
```

**Annahme:** Leistung und Erlöse sind gleich.

### 2.3 Gewinnvergleichsrechnung

Vergleich der **Gewinne pro Periode**:

```
Gewinn = Erlöse - Kosten
```

### 2.4 Rentabilitätsrechnung

```
Rentabilität = (Gewinn / eingesetztes Kapital) × 100 %
```

### 2.5 Amortisationsrechnung

```
Amortisationszeit = Anschaffungskosten / jährlicher Gewinn (oder Einsparung)
```

Gibt an, nach wie vielen Jahren die Investition sich selbst trägt.

---

## 3. Dynamische Investitionsrechnung

### 3.1 Überblick

Dynamische Methoden berücksichtigen den **Zeitwert des Geldes**: ein Euro heute ist mehr wert als ein Euro morgen (Zinseszinseffekt).

### 3.2 Barwertmethode (Kapitalwertmethode)

```
Barwert = Summe der Einzahlungsüberschüsse × Abzinsungsfaktor
```

Mit Abzinsungsfaktor:

```
DF(t) = 1 / (1 + i)^t
```

**Kapitalwert** = Summe der Barwerte – Anfangsinvestition

- **Kapitalwert > 0**: Investition vorteilhaft
- **Kapitalwert = 0**: Grenzfall
- **Kapitalwert < 0**: Investition nicht vorteilhaft

### 3.3 Interner Zinsfuß

Der **Zinssatz**, bei dem der Kapitalwert null wird.

- Je höher der interne Zinsfuß, desto besser
- Vergleich mit geforderter Mindestrendite

### 3.4 Annuitätenmethode

```
Annuität = Anschaffungskosten × Annuitätenfaktor
```

Annuitätenfaktor:

```
AF = (i × (1+i)^n) / ((1+i)^n - 1)
```

Vergleich der Annuitäten verschiedener Investitionen.

### 3.5 Beispiel Barwert

```
Investition: 100.000 €
Erträge (1-5 Jahre): 30.000 € pro Jahr
Zinssatz: 5 %

Jahr 1: 30.000 / 1,05^1 = 28.571 €
Jahr 2: 30.000 / 1,05^2 = 27.211 €
Jahr 3: 30.000 / 1,05^3 = 25.915 €
Jahr 4: 30.000 / 1,05^4 = 24.681 €
Jahr 5: 30.000 / 1,05^5 = 23.506 €
Summe Barwert: 129.884 €

Kapitalwert = 129.884 - 100.000 = 29.884 €
→ Investition vorteilhaft
```

---

## 4. Vergleich der Methoden

| Methode | Vorteil | Nachteil |
|---|---|---|
| **Kostenvergleich** | einfach | ignoriert Erlöse |
| **Gewinnvergleich** | berücksichtigt Erlöse | einperiodig |
| **Rentabilität** | Vergleich mit Alternativen | einperiodig |
| **Amortisation** | einfach | kein Gesamtnutzen |
| **Kapitalwert** | berücksichtigt Zins | komplex |
| **Interner Zinsfuß** | vergleichbar | mehrdeutig |
| **Annuität** | jährlich vergleichbar | rechenintensiv |

---

## 5. Investitionsrechnung im IT-Bereich

### 5.1 IT-spezifische Faktoren

- **Technologische Veränderungen**: kurze Lebenszyklen
- **Schulungskosten**: für neue Software
- **Migrationskosten**: Datenübernahme
- **Skalierbarkeit**: Cloud vs. On-Premises

### 5.2 Total Cost of Ownership (TCO)

- **Anschaffung**: Hardware, Software, Lizenzen
- **Installation**: Setup, Konfiguration
- **Betrieb**: Strom, Wartung, Personal
- **Wartung**: Updates, Support
- **Entsorgung**: am Lebensende

### 5.3 ROI (Return on Investment)

```
ROI = (Gewinn aus Investition / Investitionskosten) × 100 %
```

Vergleich mit Hurdle-Rate (Mindestrendite).

---

## 6. ROI und TCO

### 6.1 Beispiel TCO über 5 Jahre

| Kostenart | Jahr 1 | Jahr 2-5 | Summe |
|---|---|---|---|
| Anschaffung Hardware | 10.000 | – | 10.000 |
| Lizenzen | 5.000 | 1.000/Jahr | 9.000 |
| Strom | 500 | 500/Jahr | 2.500 |
| Wartung | – | 1.500/Jahr | 6.000 |
| Personal | 20.000 | 20.000/Jahr | 100.000 |
| Updates | – | 2.000/Jahr | 8.000 |
| **Summe** | | | **135.500** |

### 6.2 ROI-Beispiel

```
Investition: 50.000 €
Einsparung pro Jahr: 15.000 €
Lebensdauer: 5 Jahre

ROI = (5 × 15.000 - 50.000) / 50.000 × 100 % = 50 %
```

---

## 7. Übungen

### Übung 1 — Statische Methoden

Berechnen Sie Amortisationszeit für eine Investition.

### Übung 2 — Barwertmethode

Berechnen Sie den Kapitalwert für ein Investitionsvorhaben.

### Übung 3 — Interner Zinsfuß

Bestimmen Sie den internen Zinsfuß.

### Übung 4 — TCO

Berechnen Sie TCO für eine Server-Lösung.

### Übung 5 — ROI

Berechnen Sie den ROI für eine Software-Einführung.

### Übung 6 — Methodenwahl

Welche Methode für welche Entscheidung?

---

## 8. Zusammenfassung

**Investitionsrechnungen** bewerten Investitionen wirtschaftlich:

**Statische Methoden:**

- Kostenvergleich, Gewinnvergleich
- Rentabilität, Amortisation
- Einfach, aber zeitwertblind

**Dynamische Methoden:**

- **Barwertmethode (Kapitalwert)**: Barwertberechnung
- **Interner Zinsfuß**: Zinssatz, bei dem Kapitalwert = 0
- **Annuitätenmethode**: gleichmäßige jährliche Belastung

**IT-Bereich:**

- **TCO**: Total Cost of Ownership
- **ROI**: Return on Investment

### Selbsttest-Checkliste

- [ ] Ich führe statische Investitionsrechnungen durch.
- [ ] Ich berechne Barwerte und interne Zinsfüße.
- [ ] Ich wende TCO und ROI im IT-Bereich an.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3343 — Recherche 2026*
