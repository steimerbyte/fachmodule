# Fachmodul: App-Entwicklung mit Android Studio

**Kurs-ID:** 2691
**Kategorie:** Kursbibliothek / Fachmodule / Informatik / Mobile
**Quelle:** https://moodle.oszimt.de/course/view.php?id=2691

---

## Inhaltsverzeichnis

1. [Lernziele](#1-lernziele)
2. [Android – Überblick](#2-android--überblick)
3. [Android Studio Installation](#3-android-studio-installation)
4. [Projektstruktur und erste App](#4-projektstruktur-und-erste-app)
5. [Activities, Layouts, Views](#5-activities-layouts-views)
6. [Datenbank mit Room](#6-datenbank-mit-room)
7. [Build und Veröffentlichung](#7-build-und-veröffentlichung)
8. [Übungen](#8-übungen)
9. [Zusammenfassung](#9-zusammenfassung)

---

## 1. Lernziele

Nach Bearbeitung dieses Fachmoduls können Sie:

- Android Studio installieren und einrichten,
- einfache Android-Apps erstellen,
- Activities, Layouts und Views nutzen,
- Apps im Google Play Store veröffentlichen.

---

## 2. Android – Überblick

**Android** ist das **führende mobile Betriebssystem** (ca. 70 % Marktanteil).

**Eckpfeiler:**

- Linux-Kernel
- Java-basierte Entwicklung (heute Kotlin)
- Offen (Open Source, AOSP)
- Multi-Touch, GPS, Kamera, Sensoren
- Großer App-Markt (Google Play)

**Versionen:** Aktuell Android 14 (2023)

---

## 3. Android Studio Installation

### 3.1 Voraussetzungen

- 64-Bit-Betriebssystem
- Mindestens 8 GB RAM (16 GB empfohlen)
- Java JDK 17+
- ~10 GB freier Speicherplatz

### 3.2 Installation

1. Download von <https://developer.android.com/studio>
2. Installations-Wizard durchlaufen
3. SDK Manager: API-Level wählen (z. B. Android 14)
4. Virtual Device Manager: Emulator erstellen

### 3.3 Komponenten

- **Android Studio** (IDE)
- **Android SDK** (Bibliotheken)
- **Android Emulator** (virtuelles Gerät)
- **ADB** (Android Debug Bridge)

---

## 4. Projektstruktur und erste App

### 4.1 Neues Projekt erstellen

1. File → New → New Project
2. **Empty Activity** wählen
3. **Name**: z. B. "MeineErsteApp"
4. **Language**: Kotlin (empfohlen)
5. **Minimum SDK**: API 24 (Android 7.0)

### 4.2 Projektstruktur

```
app/
├── src/main/
│   ├── java/com/example/meineersteapp/
│   │   └── MainActivity.kt
│   ├── res/
│   │   ├── layout/activity_main.xml
│   │   ├── values/strings.xml
│   │   └── ...
│   └── AndroidManifest.xml
└── build.gradle.kts
```

### 4.3 Erste Zeile Code

```kotlin
package com.example.meineersteapp

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}
```

---

## 5. Activities, Layouts, Views

### 5.1 Activity

**Activity** = Bildschirm in Android.

- Hat **Lifecycle**: onCreate, onStart, onResume, onPause, onStop, onDestroy
- Eine App hat mehrere Activities
- Navigation mit **Intents**

### 5.2 Layouts

| Layout | Verwendung |
|---|---|
| **LinearLayout** | lineare Anordnung |
| **ConstraintLayout** | flexibel, komplex |
| **FrameLayout** | ein Element |
| **RelativeLayout** | relativ zueinander |

### 5.3 Views (Widgets)

| View | Beschreibung |
|---|---|
| **TextView** | Text anzeigen |
| **EditText** | Texteingabe |
| **Button** | Schaltfläche |
| **ImageView** | Bild anzeigen |
| **CheckBox** | Auswahl an/aus |
| **RadioButton** | Einzel-Auswahl |
| **Spinner** | Dropdown-Liste |
| **RecyclerView** | scrollbare Liste |

### 5.4 Layout-XML

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hallo Welt!" />

    <Button
        android:id="@+id/button"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Klick mich" />

</LinearLayout>
```

### 5.5 Activity-Code

```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val button = findViewById<Button>(R.id.button)
        button.setOnClickListener {
            val textView = findViewById<TextView>(R.id.textView)
            textView.text = "Geklickt!"
        }
    }
}
```

---

## 6. Datenbank mit Room

### 6.1 Room-Persistenz

**Room** ist die empfohlene **Abstraktionsschicht über SQLite** in Android.

### 6.2 Komponenten

- **Entity**: Datenbanktabelle als Klasse
- **DAO**: Data Access Object mit Abfragen
- **Database**: Datenbank-Klasse

### 6.3 Beispiel

```kotlin
@Entity
data class Mitarbeiter(
    @PrimaryKey val id: Int = 0,
    val name: String,
    val abt: String
)

@Dao
interface MitarbeiterDao {
    @Query("SELECT * FROM Mitarbeiter")
    suspend fun getAll(): List<Mitarbeiter>

    @Insert
    suspend fun insert(mitarbeiter: Mitarbeiter)
}

@Database(entities = [Mitarbeiter::class], version = 1)
abstract class AppDatabase : RoomDatabase() {
    abstract fun mitarbeiterDao(): MitarbeiterDao
}
```

---

## 7. Build und Veröffentlichung

### 7.1 APK bauen

1. Build → Generate Signed Bundle / APK
2. KeyStore erstellen oder auswählen
3. Release-Konfiguration wählen
4. APK signieren

### 7.2 Google Play Store

1. Google Play Console: <https://play.google.com/console>
2. Entwickler-Konto (25 $ einmalig)
3. App hochladen:
   - APK oder AAB (Android App Bundle)
   - Store-Eintrag: Titel, Beschreibung, Screenshots, Icon
4. Content Rating ausfüllen
5. Preisgestaltung und Vertrieb wählen
6. Veröffentlichen

### 7.3 Alternative Stores

- **Amazon Appstore**
- **F-Droid** (Open Source)
- **Samsung Galaxy Store**
- **Huawei AppGallery**

---

## 8. Übungen

### Übung 1 — Erste App

Erstellen Sie eine einfache App mit Button und TextView.

### Übung 2 — Activity-Navigation

Erstellen Sie eine App mit zwei Activities und Navigation.

### Übung 3 — Liste mit RecyclerView

Erstellen Sie eine App mit scrollbarer Liste.

### Übung 4 — Datenbank

Speichern Sie Daten mit Room.

### Übung 5 — App-Icon

Erstellen Sie ein App-Icon.

### Übung 6 — Veröffentlichung

Bereiten Sie eine App-Veröffentlichung vor.

---

## 9. Zusammenfassung

**Android Studio** ist die **offizielle IDE für Android-Entwicklung**:

**Architektur:**

- Activities, Views, Layouts
- Lifecycle-Management
- Intents für Navigation

**Datenbank:**

- **Room** als ORM für SQLite
- Entity, DAO, Database

**Veröffentlichung:**

- Signiertes APK/AAB
- Google Play Console

### Selbsttest-Checkliste

- [ ] Ich installiere Android Studio.
- [ ] Ich erstelle Activities und Layouts.
- [ ] Ich nutze Room für Datenbankzugriff.
- [ ] Ich bereite App-Veröffentlichung vor.

---

*Quelle: https://moodle.oszimt.de/course/view.php?id=2691 — Recherche 2026*
