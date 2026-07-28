# Fachmodul: Einführung in neuronale Netze

**Kurs-ID:** 3803
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3803

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Biologisches Vorbild](#2-biologisches-vorbild)
3. [Künstliches Neuron](#3-kuenstliches-neuron)
4. [Netzarchitektur](#4-netzarchitektur)
5. [Aktivierungsfunktionen](#5-aktivierungsfunktionen)
6. [Backpropagation](#6-backpropagation)
7. [Architekturen: CNN, RNN, Transformer](#7-architekturen-cnn-rnn-transformer)
8. [Übungen](#8-übungen)
9. [Zusammenfassung](#9-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- das biologische Vorbild eines Neurons erklären,
- künstliche Neuronen und ihre Komponenten beschreiben,
- Netzarchitekturen unterscheiden,
- Backpropagation und Gradient Descent verstehen.

---

## 2. Biologisches Vorbild

### 2.1 Neuron

- **Dendriten**: empfangen Signale
- **Zellkörper (Soma)**: verarbeitet Signale
- **Axon**: leitet Signale weiter
- **Synapsen**: Verbindungen zu anderen Neuronen

### 2.2 Aktionspotential

- Überschreitung eines Schwellenwerts
- Elektrochemisches Signal entlang des Axons
- Auslösung an Synapsen

### 2.3 Lernen

- **Synaptische Plastizität**: Verbindungen werden stärker oder schwächer
- **Hebb'sche Regel**: "Neurons that fire together, wire together"

---

## 3. Künstliches Neuron

### 3.1 Aufbau

```
       w1
      ─────→ ╲
  x1   w2     ╲
  ──────→      ╲
  x2   w3       ──→ Σ → f(Σ) → y
  ──────→      ╱
  xn   wn     ╱
       b ────→ ╱
```

### 3.2 Bestandteile

- **Eingaben x₁, x₂, ..., xₙ**
- **Gewichte w₁, w₂, ..., wₙ**
- **Bias b**: Schwellenwert-Verschiebung
- **Aktivierung Σ = Σ wᵢxᵢ + b**
- **Aktivierungsfunktion f(Σ)**: nicht-linear
- **Ausgang y = f(Σ)**

### 3.3 Perzeptron (Rosenblatt, 1958)

- Einfachstes Neuronenmodell
- **Heaviside-Aktivierung**: f(x) = 0 wenn x < 0, sonst 1
- Kann nur lineare Probleme lösen
- XOR-Problem nicht lösbar (deshalb Multi-Layer-Perzeptron)

---

## 4. Netzarchitektur

### 4.1 Feedforward Neural Network

```
Input → Hidden Layer(s) → Output
```

- **Fully Connected**: jedes Neuron mit jedem verbunden
- **Multi-Layer Perceptron (MLP)**: mehrere Hidden Layers

### 4.2 Aufbau

```
Input Layer (784 Neuronen für 28×28 Bild)
    ↓
Hidden Layer 1 (128 Neuronen, ReLU)
    ↓
Hidden Layer 2 (64 Neuronen, ReLU)
    ↓
Output Layer (10 Neuronen für 10 Klassen, Softmax)
```

### 4.3 Anzahl Parameter

```
parameter = (input_dim * hidden_dim) + hidden_dim + (hidden_dim * output_dim) + output_dim
```

Beispiel: 784 → 128 → 10

```
= 784*128 + 128 + 128*10 + 10
= 100.352 + 128 + 1.280 + 10
= 101.770
```

---

## 5. Aktivierungsfunktionen

| Funktion | Formel | Wertebereich | Verwendung |
|---|---|---|---|
| **Sigmoid** | f(x) = 1/(1+e^(-x)) | (0, 1) | Output bei binärer Klassifikation |
| **Tanh** | f(x) = (e^x - e^(-x))/(e^x + e^(-x)) | (-1, 1) | Hidden Layer früher |
| **ReLU** | f(x) = max(0, x) | [0, ∞) | Hidden Layer (Standard heute) |
| **Leaky ReLU** | f(x) = max(0.01x, x) | (-∞, ∞) | Verbessert ReLU |
| **Softmax** | f(x_i) = e^x_i / Σ e^x_j | (0, 1), Σ=1 | Multiclass-Output |

### 5.1 Warum nicht-linear?

- Lineare Aktivierungen → lineares Netz → nur linear separierbare Probleme
- Nicht-linearität ermöglicht komplexe Muster

---

## 6. Backpropagation

### 6.1 Lernprozess

1. **Forward Pass**: Eingaben durch Netz → Vorhersage
2. **Loss berechnen**: Vergleich mit wahrem Wert
3. **Backward Pass**: Gradienten des Loss bezüglich Gewichte
4. **Gewichte anpassen**: mit Gradient Descent

### 6.2 Loss-Funktionen

| Problem | Loss |
|---|---|
| **Regression** | Mean Squared Error (MSE) |
| **Binäre Klassifikation** | Binary Cross-Entropy |
| **Multiclass** | Categorical Cross-Entropy |

### 6.3 Gradient Descent

```
neue_gewichte = alte_gewichte - lernrate * gradient
```

### 6.4 Lernrate (Learning Rate)

- Zu hoch → Netz divergiert
- Zu niedrig → Netz lernt sehr langsam
- Adaptive: Adam, RMSprop

---

## 7. Architekturen: CNN, RNN, Transformer

### 7.1 CNN (Convolutional Neural Networks)

- **Anwendung**: Bildverarbeitung, Videoanalyse
- **Komponenten**: Convolutional Layer, Pooling, Fully Connected
- **Vorteil**: Parameter-Sharing, Translations-Invarianz

### 7.2 RNN (Recurrent Neural Networks)

- **Anwendung**: Sequenzen (Sprache, Audio)
- **Problem**: Vanishing Gradient bei langen Sequenzen
- **Lösung**: LSTM, GRU

### 7.3 LSTM/GRU

- **LSTM**: Long Short-Term Memory mit Input/Forget/Output Gates
- **GRU**: Gated Recurrent Unit, vereinfacht

### 7.4 Transformer

- **Self-Attention**: jedes Token achtet auf alle anderen
- **Multi-Head**: parallele Attention-Schichten
- **Positional Encoding**: Reihenfolge berücksichtigen
- **Anwendung**: LLMs (GPT, BERT), Übersetzung, Bilderkennung (Vision Transformer)

---

## 8. Übungen

### Übung 1 — Perzeptron

Berechnen Sie die Ausgabe eines einfachen Perzeptrons.

### Übung 2 — Aktivierungsfunktionen

Vergleichen Sie Sigmoid, Tanh, ReLU.

### Übung 3 — Parameter

Berechnen Sie die Anzahl der Parameter eines MLP.

### Übung 4 — Forward Pass

Berechnen Sie die Aktivierungen Schicht für Schicht.

### Übung 5 — Gradient Descent

Simulieren Sie einen Gradient-Descent-Schritt.

### Übung 6 — Architektur

Vergleichen Sie CNN, RNN, Transformer.

---

## 9. Zusammenfassung

**Neuronale Netze** sind die Grundlage des modernen Deep Learning:

**Komponenten:**

- Eingaben, Gewichte, Bias
- Aktivierungsfunktion
- Ausgabe

**Architekturen:**

- **CNN**: Bilderkennung
- **RNN/LSTM**: Sequenzen
- **Transformer**: aktueller Standard

**Lernen:**

- Forward Pass
- Loss berechnen
- Backpropagation
- Gradient Descent

**Aktivierungsfunktionen:** ReLU, Sigmoid, Softmax

### Selbsttest-Checkliste

- [ ] Ich erkläre das künstliche Neuron.
- [ ] Ich beschreibe Aktivierungsfunktionen.
- [ ] Ich erkläre Backpropagation.
- [ ] Ich vergleiche CNN, RNN, Transformer.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3803 — Recherche 2026*
