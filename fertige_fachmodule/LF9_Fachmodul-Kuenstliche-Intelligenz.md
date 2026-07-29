# Fachmodul: Künstliche Intelligenz

**Kurs-ID:** 3648
**Kategorie:** Kursbibliothek / Fachmodule / Informatik
**Quelle:** https://moodle.oszimt.de/course/view.php?id=3648

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [KI – Überblick](#2-ki--überblick)
3. [Geschichte](#3-geschichte)
4. [Symbolische KI vs. statistische KI](#4-symbolische-ki-vs-statistische-ki)
5. [Machine Learning](#5-machine-learning)
6. [Deep Learning](#6-deep-learning)
7. [Anwendungsgebiete](#7-anwendungsgebiete)
8. [Ethische Aspekte und AI Act](#8-ethische-aspekte-und-ai-act)
9. [LLMs: GPT, BERT, Claude](#9-llms-gpt-bert-claude)
10. [Übungen](#10-übungen)
11. [Zusammenfassung](#11-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- die Geschichte und Grundlagen der KI erklären,
- symbolische und statistische KI unterscheiden,
- Machine Learning und Deep Learning einordnen,
- Anwendungen und ethische Aspekte bewerten.

---

## 2. KI – Überblick

**Künstliche Intelligenz (KI, engl. AI)** bezeichnet Systeme, die **Aufgaben übernehmen**, die **menschliche Intelligenz** erfordern.

**Teilgebiete:**

- **Wissensrepräsentation**
- **Schlussfolgern**
- **Maschinelles Lernen**
- **Neuronale Netze**
- **Neuronale Netze und Deep Learning**
- **Verarbeitung natürlicher Sprache (NLP)**
- **Computer Vision**
- **Robotik**

---

## 3. Geschichte

| Jahr | Ereignis |
|---|---|
| 1950 | Turing-Test |
| 1956 | Dartmouth-Konferenz: Begriff "KI" geprägt |
| 1960er | Erste Expertensysteme, Lisp |
| 1970er | KI-Winter (geringe Erwartungen) |
| 1980er | Expertensysteme wieder, XCON |
| 1990er | Maschinelles Lernen, statistische Methoden |
| 1997 | Deep Blue schlägt Kasparow |
| 2006 | Deep Learning (Hinton) |
| 2011 | Watson gewinnt Jeopardy |
| 2012 | AlexNet gewinnt ImageNet |
| 2016 | AlphaGo schlägt Lee Sedol |
| 2020 | GPT-3 |
| 2022 | ChatGPT, Stable Diffusion, Midjourney |
| 2023 | GPT-4, Claude, LLaMA |
| 2024 | Multimodale KI, AI Act EU |

---

## 4. Symbolische KI vs. statistische KI

### 4.1 Symbolische KI

- **Wissensrepräsentation** durch Logik, Regeln, Ontologien
- Beispiel: Expertensysteme (MYCIN, XCON), Wissensrepräsentation mit Ontologien
- Vorteile: nachvollziehbar, erklärbar
- Nachteile: schwer zu skalieren, benötigt explizites Wissen

### 4.2 Statistische KI (heute dominant)

- Lernen aus Daten
- Beispiel: Neuronale Netze, Machine Learning
- Vorteile: skaliert, lernt aus Erfahrung
- Nachteile: schwer nachvollziehbar ("Black Box"), benötigt viele Daten

---

## 5. Machine Learning

### 5.1 Definition

**Machine Learning (ML)** ist der Teilbereich der KI, in dem Systeme **aus Daten lernen**, ohne explizit programmiert zu werden.

### 5.2 Kategorien

- **Supervised Learning**: mit gelabelten Daten (Klassifikation, Regression)
- **Unsupervised Learning**: ohne Labels (Clustering, Dimensionsreduktion)
- **Reinforcement Learning**: durch Belohnung/Bestrafung
- **Self-Supervised Learning**: Labels werden automatisch erzeugt

### 5.3 Algorithmen

| Kategorie | Algorithmen |
|---|---|
| **Klassifikation** | Logistische Regression, Decision Tree, Random Forest, SVM, KNN, Neuronale Netze |
| **Regression** | Lineare Regression, Ridge, Lasso, Random Forest |
| **Clustering** | k-Means, DBSCAN, Hierarchical Clustering |
| **Dimensionsreduktion** | PCA, t-SNE, UMAP |

### 5.4 Trainingszyklus

1. Daten sammeln
2. Daten bereinigen
3. Features extrahieren
4. Modell wählen
5. Trainieren (mit Hyperparameter-Tuning)
6. Evaluieren
7. Produktiv setzen (Deployment)
8. Überwachen (Monitoring)

---

## 6. Deep Learning

### 6.1 Definition

**Deep Learning** nutzt **tiefe neuronale Netze** mit vielen Schichten.

### 6.2 Architekturen

- **CNN** (Convolutional Neural Networks): Bilderkennung
- **RNN** (Recurrent Neural Networks): Sequenzen (Sprache, Audio)
- **LSTM, GRU**: verbesserte Sequenz-Modelle
- **Transformer**: aktueller Standard, Attention-Mechanismus
- **GAN** (Generative Adversarial Networks): Bildgenerierung
- **Diffusion Models**: Bild- und Audiogenerierung
- **VAE** (Variational Autoencoders): Generierung

### 6.3 Anwendungen

- **Computer Vision**: Objekterkennung, Segmentierung, autonomes Fahren
- **NLP**: Übersetzung, Chatbots, Textzusammenfassung
- **Spracherkennung**: Siri, Alexa, Whisper
- **Bild- und Audio-Generierung**: DALL-E, Midjourney, Stable Diffusion

---

## 7. Anwendungsgebiete

- **Sprache**: Chatbots, Übersetzung, Spracherkennung
- **Bild**: Objekterkennung, autonomes Fahren, medizinische Diagnostik
- **Industrie**: Predictive Maintenance, Qualitätskontrolle
- **Finanzen**: Kreditwürdigkeit, Betrugserkennung, Trading
- **Medizin**: Diagnose, Bildanalyse, Wirkstoffentwicklung
- **Bildung**: personalisiertes Lernen, automatische Bewertung
- **Marketing**: Empfehlungen, Targeting, Textgenerierung

---

## 8. Ethische Aspekte und AI Act

### 8.1 Ethische Fragen

- **Bias**: Diskriminierung in KI-Systemen
- **Transparenz**: Wie entscheidet die KI?
- **Datenschutz**: Training mit persönlichen Daten
- **Arbeitsmarkt**: Welche Jobs verschwinden?
- **Autonomie**: Wann darf KI entscheiden?
- **Verantwortung**: Wer haftet bei Fehlern?

### 8.2 EU AI Act (2024)

- **Risikobasierte Regulierung**
- Verbotene KI (z. B. Social Scoring)
- Hochrisiko-KI (z. B. Bewerbungs-KI, Medizin-KI)
- Begrenzte Risiken (z. B. Chatbots)
- Minimale Risiken (z. B. Spam-Filter)
- Sanktionen: bis zu 7 % des Jahresumsatzes

### 8.3 GDPR und KI

- Personenbezogene Daten im Training: DSGVO-konform
- Erklärbarkeit automatisierter Entscheidungen (Art. 22)
- Datenschutz-Folgenabschätzung (DSFA)

---

## 9. LLMs: GPT, BERT, Claude

### 9.1 GPT (Generative Pre-trained Transformer)

- **OpenAI**: GPT-1 (2018), GPT-2 (2019), GPT-3 (2020), GPT-3.5/ChatGPT (2022), GPT-4 (2023), GPT-4o (2024)
- **Decoder-only** Transformer
- Training: Next-Token-Prediction auf riesigen Textmengen

### 9.2 BERT (Bidirectional Encoder Representations from Transformers)

- **Google**: 2018
- **Encoder-only** Transformer
- Pre-training: Masked Language Modeling
- Für: Textklassifikation, NER, Frage-Antwort

### 9.3 Weitere LLMs

- **Claude (Anthropic)**: Constitutional AI
- **LLaMA (Meta)**: Open-Source-Familie
- **Mistral**: europäisches Open-Source-LLM
- **Gemini (Google)**: multimodales Modell
- **GPT-NeoX, Falcon, BLOOM**: Open-Source

### 9.4 Transformer-Architektur

- **Self-Attention**: jedes Token "achtet" auf alle anderen
- **Multi-Head Attention**: mehrere parallele Attention-Schichten
- **Positional Encoding**: berücksichtigt Reihenfolge
- **Encoder-Decoder** oder **Decoder-only**

### 9.5 Anwendungen

- **Chatbots und virtuelle Assistenten**
- **Übersetzung**
- **Textgenerierung** (Marketing, Content)
- **Code-Generierung** (GitHub Copilot, Cursor)
- **Frage-Antwort-Systeme**
- **Sentiment-Analyse**

---

## 10. Übungen

### Übung 1 — Geschichte

Erstellen Sie eine Zeitleiste der KI-Geschichte.

### Übung 2 — ML-Kategorien

Welche ML-Kategorie passt für: Spam-Filter, Bilderkennung, Kundensegmentierung?

### Übung 3 — Anwendungen

Nennen Sie drei KI-Anwendungen in Ihrem Alltag.

### Übung 4 — Ethik

Diskutieren Sie Bias in KI-Systemen.

### Übung 5 — AI Act

Welche KI-Systeme fallen unter das Hochrisiko-Verbot?

### Übung 6 — LLMs

Vergleichen Sie GPT, BERT, LLaMA.

---

## 11. Zusammenfassung

**Künstliche Intelligenz** ist ein **faszinierendes und schnell wachsendes Feld**:

**Geschichte:**

- 1950er: Beginn
- 1960er-80er: Symbolische KI
- 1990er-2010er: Statistisches ML
- 2010er: Deep Learning
- 2020er: LLMs, multimodale KI

**Machine Learning:**

- Supervised, Unsupervised, Reinforcement
- Klassifikation, Regression, Clustering

**Deep Learning:**

- CNN, RNN, Transformer
- Computer Vision, NLP, Generierung

**Ethische Aspekte:**

- Bias, Transparenz, Datenschutz
- EU AI Act, DSGVO

### Selbsttest-Checkliste

- [ ] Ich erkläre KI-Geschichte.
- [ ] Ich unterscheide ML-Kategorien.
- [ ] Ich beschreibe Deep Learning.
- [ ] Ich bewerte ethische Aspekte.
- [ ] Ich vergleiche LLMs.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=3648 — Recherche 2026*
