# Benutzeroberfläche & Inventarverwaltung

Diese Seite behandelt alle Benutzeroberflächensysteme in Archean, einschließlich Inventarverwaltung, Tastenkürzel und Fensterverwaltung.

---

## Avatar-Inventare

Der Spieler hat Zugriff auf zwei persönliche Inventare:

### Gürtel

Der **Gürtel** ist die Schnellzugriffsleiste am unteren Bildschirmrand.

- Enthält **9 Plätze** für Werkzeuge und Gegenstände
- Wähle Gegenstände mit den Tasten **1** bis **9**
- Gesammelte Steine werden zuerst im Gürtel abgelegt, dann überlaufen sie in den Rucksack
- Der aktive Gegenstand zeigt eine grüne Umrandung

### Rucksack

Der **Rucksack** ist dein Hauptinventarspeicher.

- Öffnen/Schließen mit **Tab**
- Im Adventure-Modus: **48 Plätze**
- Im Creative-Modus: unbegrenzte Plätze mit vorgefüllten Gegenständen
- Hat eine **Suchleiste** zum Filtern von Gegenständen nach Name
- Die Masse der Gegenstände beeinflusst deine Bewegungsgeschwindigkeit im Adventure-Modus

---

## Hand-System

Die **Hand** ist dein aktuell ausgewählter/aktiver Gegenstand.

| Aktion | Beschreibung |
|--------|-------------|
| **Zahlentasten (1-9)** | Gürtelplatz als aktiv auswählen |
| **Doppelklick** auf einen Gegenstand | Als aktiv auswählen (funktioniert aus jedem offenen Inventar) |

Wenn ein Werkzeug in deiner Hand ist, kannst du es verwenden mit:
- **Linksklick** (Primärfunktion)
- **Rechtsklick** (Sekundärfunktion)
- **C gedrückt halten** um das Werkzeug zu konfigurieren
- **X gedrückt halten** für den Spezialmodus

---

## Komponenteninteraktion

Drücke **F**, um mit der Komponente oder dem Bildschirm zu interagieren, auf die/den du zielst (Inventare öffnen, Knöpfe drücken, Schalter umlegen, Hebel verstellen, auf Bildschirme klicken...).

Zusätzlich kannst du direkt auf Komponenten **linksklicken**:

| Bedingung | Verhalten |
|-----------|----------|
| **Freie Maus** (keine Mausbewegung) | Klicke auf eine sichtbare Komponente zur Interaktion |
| **Mausbewegung ohne aktiven Gegenstand** | Klicke zur Interaktion mit der Komponente im Fadenkreuz |
| **Mausbewegung mit aktivem Gegenstand** | Linksklick wird vom Werkzeug verwendet -- Komponenteninteraktion ist deaktiviert |

> **Hinweis:** Linksklick-Interaktion ermöglicht es dir, Knöpfe zu drücken oder Schalter umzulegen, ohne dein Werkzeug wegzulegen -- gib einfach die Maus frei oder leere deine Hand.

---

## Gegenstandsmanipulation

### Drag & Drop

| Aktion | Beschreibung |
|--------|-------------|
| **Gegenstand ziehen** | Gegenstand zwischen Plätzen oder Inventaren verschieben |
| **Außerhalb des Inventars ablegen** | Gegenstand auf den Boden fallen lassen (erzeugt eine Box) |

### Stapeln & Teilen

Beim Ziehen eines Gegenstandstapels:

| Aktion | Beschreibung |
|--------|-------------|
| **Rechtsklick** | **1** Gegenstand vom Stapel ablegen |
| **Shift + Rechtsklick** | Die **Hälfte** des Stapels ablegen |
| **Auf gleichen Gegenstandstyp ablegen** | Gegenstände zusammenstapeln (wenn Platz vorhanden) |

### Schnelltransfer

| Aktion | Beschreibung |
|--------|-------------|
| **Shift + Linksklick** | Gegenstand schnell in ein anderes offenes Inventar verschieben |

Dies funktioniert zwischen deinem Rucksack und jedem offenen Container. Gegenstände versuchen zuerst, sich mit vorhandenen Gegenständen des gleichen Typs zu stapeln.

---

## Herstellung

Öffne deinen Rucksack (**Tab**), um auf die Herstellungsoberfläche auf der linken Seite zuzugreifen.

### Herstellungsaktionen

| Modus | Verfügbare Schaltflächen |
|-------|-------------------|
| **Standard** | **+1** und **+10** |
| **Shift gedrückt halten** | **+50** und **+max** (basierend auf verfügbaren Ressourcen) |

Klicke auf eine Zutat, um Unterrezepte aufzuklappen und anzuzeigen (rekursive Herstellung).

### Herstellungsvoraussetzungen

- Feste Zutaten müssen sich in deinem Rucksack (oder einem offenen Inventar) befinden
- Flüssigkeiten (H₂O, H₂, O₂) müssen über **Kanister** in den dedizierten Flüssigkeitsplätzen am unteren Rand des Herstellungsfensters bereitgestellt werden
- Du kannst mit Ressourcen aus jedem offenen Inventar herstellen -- Zutaten werden automatisch in deinen Rucksack verschoben

### Item Processing Area

Die Item Processing Area (1 Platz) wird zur **Verarbeitung von Gegenständen** verwendet, nicht zur Herstellung. Zum Beispiel:
- Steine zu Erzen zerkleinern (Frühspiel im Adventure-Modus)

### Flüssigkeitsplätze

Am unteren Rand des Herstellungsfensters kannst du deine Flüssigkeitsstände sehen: **Wasser**, **Wasserstoff** und **Sauerstoff**.

- Dein Avatar hat einen **integrierten Wassertank**, der sich automatisch füllt, wenn deine Füße Wasser berühren (Ozean, See)
- Der **Elektrolyse**-Schalter wandelt Wasser in Wasserstoff und Sauerstoff um für Herstellungsrezepte, die diese benötigen

---

## Externe Inventare (Container)

Interagiere mit einem [Container](components/storage/Container.md) über **F**, um dessen Inventar zu öffnen.

### Werkzeuge aus Containern verwenden

Einige Werkzeuge können direkt aus einem Container heraus verwendet werden:

1. Lege das Werkzeug in den Container
2. **Doppelklicke** auf das Werkzeug, um es zu aktivieren
3. Das Werkzeug verwendet Ressourcen aus dem Container statt aus deinem Rucksack

> **Tipp:** Wenn du einen Gegenstand aus einem Container in deiner Hand ausgewählt hast, öffnet das Drücken von **Tab** automatisch sowohl deinen Rucksack als auch den Quellcontainer.

Dies ist besonders nützlich, wenn Ressourcen zu schwer sind, um sie auf deinem Avatar zu tragen:
- **Constructor Tool** -- baue mit Komponenten, die im Container gelagert sind
- **Destructor Tool** -- zerstörte Komponenten landen im Container
- **Spool Tool** -- verwende Kabelspulen aus dem Container
- **Blueprint Tool** -- spawne Fahrzeuge im Adventure-Modus mit allen erforderlichen Komponenten im Container
- **Rock Rake Tool** -- gesammelte Steine landen im Container

### Entfernungslimits

Offene Inventare haben eine maximale Interaktionsentfernung:
- **Container**: 100 Meter
- **Fallengelassene Boxen**: 10 Meter

Wenn du dich über das Limit hinaus bewegst, werden Gegenstände **ausgegraut** und können nicht mehr verwendet werden. Das Inventarfenster schließt sich automatisch, wenn du zu weit weg bist.

### Herstellung aus offenen Inventaren

Wenn ein Container geöffnet ist, kann das Herstellungssystem des Avatars automatisch Zutaten daraus entnehmen. So kannst du Gegenstände mit Ressourcen aus Containern herstellen, ohne sie manuell in deinen Rucksack zu übertragen.

---

## Komponenten auf dem Boden platzieren

Einige Komponenten können direkt auf dem Terrain platziert werden, ohne eine bestehende Konstruktion zu benötigen.

1. Wähle die Komponente in deiner Hand
2. Ziele auf den Boden (innerhalb von **10 Metern**)
3. **Linksklick** zum Platzieren

| Aktion | Beschreibung |
|--------|-------------|
| **Linksklick** | Komponente platzieren |
| **Shift gedrückt halten + Mausrad** | Komponente drehen |

Die Komponente richtet sich automatisch an der lokalen Schwerkraftrichtung aus. Eine neue Konstruktion wird erstellt, um die Komponente aufzunehmen.

---

## Fensterverwaltung

### Inventarfenster anheften

Viele Lagerfenster können **angeheftet** werden, um sie offen zu halten:
- Container
- Computer (HDD Bay, IDE)
- Fission Reactor Brennstoffplätze
- Trash Cans
- Fallengelassene Gegenstands-Boxen

| Aktion | Beschreibung |
|--------|-------------|
| **Pin-Symbol klicken** | Fenster anheften |
| **X klicken** | Fenster schließen und lösen |
| **ESC** | Alle angehefteten Fenster ausblenden |
| **Tab** | Ausgeblendete angeheftete Fenster wieder einblenden |

### GetInfo-Fenster

Drücke **V** während du auf eine Komponente zielst, um deren Informationsfenster zu öffnen. Dieses System funktioniert unabhängig vom Inventar-Anheften:

| Aktion | Beschreibung |
|--------|-------------|
| **Pin-Symbol klicken** | Fenster offen halten |
| **X klicken** | Fenster schließen und lösen |

- Mehrere GetInfo-Fenster können gleichzeitig angeheftet werden
- Angeheftete Fenster zeigen **Echtzeit-aktualisierte Werte**
- **ESC beeinflusst** GetInfo-Fenster **nicht**

Dies ist nützlich, um mehrere Komponenten gleichzeitig zu überwachen (z.B. Batteriestände, Tankdruck, Sensorwerte).
