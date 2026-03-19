<p align="center">
    <img src="ConstructorTool.png" />
</p>

|Item|`ConstructorTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Das Constructor Tool ist das Hauptwerkzeug zum Bauen in Archean. Es ermöglicht dir, neue Bauwerke zu erstellen, Rahmen hinzuzufügen oder zu entfernen und Blöcke verschiedener Formen zu platzieren.

# Build Modes
Drücke **C**, um das Radialmenü zu öffnen und einen Baumodus auszuwählen:

|Modus|Beschreibung|
|---|---|
|**Frame**|Erstelle und bearbeite das Strukturgerüst (Stahlträger)|
|**Cube**|Platziere kubische Blöcke|
|**Slope**|Platziere Schräg-/Rampenblöcke|
|**Corner**|Platziere Eckblöcke|
|**Pyramid**|Platziere Pyramidenblöcke|
|**InvCorner**|Platziere invertierte Eckblöcke|
|**Triangle**|Platziere dreieckige Mesh-Paneele|
|**Wall / Platform**|Platziere flache Wand- oder Bodenpaneele|
|**Strut**|Platziere dünne strukturelle Stahlträger|

# Materials
Beim Platzieren von Blöcken (nicht Rahmen) verwende das **Scrollrad** während du **C** gedrückt hältst, um das Material auszuwählen.

## Materialmassen

| Material | Masse pro Einheit |
|----------|---------------|
| Composite | 0,25 kg |
| Aluminium | 0,5 kg |
| Steel | 1 kg |
| Glass | 1 kg |
| Concrete | 10 kg |
| Lead | 150 kg |

> **Hinweis:** Stahlträger (Rahmen) wiegen jeweils **10 kg**.

### Wie die Blockmasse berechnet wird
Die Basiseinheit ist ein **25×25×25 cm** Würfel. Die Gesamtmasse eines Blocks hängt ab von:

1. **Größe**: Größere Blöcke enthalten mehr Einheiten (z.B. ein 50×50×50 cm Block = 8 Einheiten)
2. **Form**: Nicht-kubische Formen (Schrägen, Ecken, Pyramiden, invertierte Ecken) wiegen **50%** ihres kubischen Äquivalents, da sie weniger Volumen einnehmen
3. **Material**: Jedes Material hat eine andere Masse pro Einheit (siehe Tabelle oben)

**Formel:** `Mass = units × shape_factor × material_mass`
- `units` = (size_x) × (size_y) × (size_z) in 25-cm-Schritten
- `shape_factor` = 1.0 für Würfel und Wände, 0.5 für Schrägen, Ecken, Pyramiden und invertierte Ecken. Dreiecke haben variable Kosten basierend auf ihrer Fläche.

### Warum die Massen nicht der Realität entsprechen
Die Massen sind absichtlich vereinfacht:
- Werte sind aus Gründen der Lesbarkeit **gerundet**
- Blöcke sind nicht zu 100% massiv — sie stellen Strukturpaneele mit internem Gerüst dar, nicht massive Materialblöcke

# Elemente entfernen
Um ein beliebiges Element (Block, Dreieck, Strebe oder Wand) zu entfernen, ziele darauf während du **Rechtsklick** gedrückt hältst und drücke dann kurz **Linksklick**. Dies funktioniert in jedem Baumodus.

> Das Entfernen von Rahmen hat eigene Steuerungen (siehe Rahmenmodus unten).

# Usage

## Rahmenmodus

### Ein neues Bauwerk erstellen
Halte **Linksklick** eine Sekunde lang gedrückt und lasse dann los. Ein neues Bauwerk mit einem einzelnen 3x3x3 Metallrahmen wird erstellt.

> **Tipp:** Halte **Shift** beim Erstellen gedrückt, um den neuen Rahmen am Boden auszurichten und ihn als statisch (verankert) festzulegen.

### Ein Bauwerk im Weltraum erstellen
Wenn du dich im Weltraum in der Nähe eines bestehenden Bauwerks befindest, kannst du ein neues Bauwerk erstellen, das **5 Meter vor dir** erscheint. Das neue Bauwerk wird als Unterobjekt des nächstgelegenen Hauptbauwerks erstellt. Dies funktioniert auch mit dem [Blueprint Tool](BlueprintTool.md).

### Rahmen hinzufügen
Ziele auf eine bestehende Rahmenfläche und drücke kurz **Linksklick**.

### Rahmen entfernen
Ziele auf eine bestehende Rahmenfläche während du **Rechtsklick** gedrückt hältst und drücke dann kurz **Linksklick**.

### Einzelne Träger hinzufügen
Ziele auf einen bestehenden Rahmen an der Stelle, wo der Träger sein soll, während du **Shift** gedrückt hältst, und drücke dann kurz **Linksklick**.

### Einzelne Träger entfernen
Ziele auf einen bestehenden Rahmenträger während du **Shift** und **Rechtsklick** gedrückt hältst und drücke dann kurz **Linksklick**.

## Blockmodi (Cube, Slope, Corner, Pyramid, InvCorner)

### Blöcke hinzufügen
1. Ziele auf einen Block oder Träger
2. Drücke **Linksklick**, um den Block zu platzieren
3. Verwende das **Scrollrad**, um ihn zu drehen (außer bei Würfeln)
4. Halte **Linksklick** gedrückt und ziehe, um die Größe zu ändern
5. Verwende das **Scrollrad** während du **Linksklick** gedrückt hältst, um die Größe in der anderen Dimension zu ändern

> **Profi-Tipp:** Die Zieh-/Skalierungsebene wird durch die Flächennormale des Blocks bestimmt, auf die du zielst. Das Scrollrad skaliert in Richtung dieser Normalen, während das Ziehen über die anderen beiden Achsen skaliert.

> **Tipp:** Halte **Shift** bevor du **Linksklick** drückst, um den Block zu kopieren, auf den du zielst, oder den nächsten Block logisch hinzuzufügen.

## Dreiecksmodus

Der Dreiecksmodus ermöglicht das Platzieren von dreieckigen Mesh-Paneelen, die am Bauraster einrasten. Diese Paneele sind nützlich für geschwungene Formen, aerodynamische Oberflächen oder jede nicht-rechteckige Geometrie.

### Dreiecke platzieren
1. Klicke auf **3 Rasterpunkte** (Eckpunkte bestehender Blöcke, Dreiecke oder Streben), um ein Dreieck zu erstellen
2. Alternativ klicke auf eine **bestehende Kante**, um mit 2 vorausgewählten Eckpunkten zu beginnen — dann ist nur noch ein weiterer Klick nötig
3. Verwende das **Scrollrad** beim Platzieren, um **die Normalenrichtung umzukehren** (steuert, welche Seite des Dreiecks nach außen zeigt)
4. Halte **Shift** auf einer achsausgerichteten Blockfläche für **Unter-Raster-Präzision** mit Einrasten auf das volle 25-cm-Raster
5. Drücke **Rechtsklick**, um den zuletzt platzierten Eckpunkt rückgängig zu machen

> Dreiecke rasten an Eckpunkten von Blöcken, anderen Dreiecken und Strebenendpunkten ein. Maximale Spannweite beträgt 4 m pro Achse.

### Materialien
Halte **C** und verwende das **Scrollrad**, um das Material auszuwählen. Dreiecke unterstützen alle gleichen Materialien wie Blöcke.

### Glattes Shading
Drücke **X** während du auf ein Dreieck zielst, um glattes Shading für alle verbundenen Dreiecke in derselben Gruppe umzuschalten. Glattes Shading wird mit einem Flood-Fill-Algorithmus angewendet: Es breitet sich über **gemeinsame Kanten** auf alle angrenzenden Dreiecke aus, die eine zusammenhängende Oberfläche bilden.

Damit glattes Shading korrekt funktioniert:
- Dreieckseckpunkte müssen **exakt am Raster ausgerichtet** sein — benachbarte Dreiecke müssen dieselben Eckpunktpositionen teilen
- Separate Gruppen von Dreiecken (nicht durch gemeinsame Kanten verbunden) werden als **unabhängige Glättungsgruppen** behandelt — das Umschalten der Glättung bei einer Gruppe beeinflusst die andere nicht

> Glattes Shading berücksichtigt auch den Symmetriemodus.

## Strebenmodus

Streben sind dünne strukturelle Stahlträger, die zwei Rasterpunkte verbinden. Sie sind nützlich für Fachwerke, Antennen, Gerüste oder leichte Strukturelemente.

### Streben platzieren
1. Klicke auf **2 Rasterpunkte**, um eine Strebe zwischen ihnen zu erstellen
2. Streben rasten an Eckpunkten von Blöcken, Dreiecken und anderen Streben ein
3. Drücke **Rechtsklick**, um den ersten platzierten Eckpunkt rückgängig zu machen

> Maximale Spannweite beträgt 4 m pro Achse. Im Abenteuermodus werden **Steel Rod**-Items benötigt.

### Unterteilungs-Einrastung
Halte **Shift** während du auf eine bestehende Strebe zielst, um an Unterteilungspunkten entlang der Strebe einzurasten. Verwende das **Scrollrad** während du **Shift** gedrückt hältst, um die Unterteilungsschrittweite zu ändern:

|Schrittgrößen|
|---|
|1 m|
|50 cm|
|25 cm (Standard)|
|10 cm|
|5 cm|

Dies ermöglicht das Platzieren neuer Streben oder Dreiecke in präzisen Abständen entlang einer bestehenden Strebe.

## Wand-/Plattform-Modus

### Wände hinzufügen
Ziele auf eine Rahmenfläche und drücke kurz **Linksklick**.

> **Tipp:** Halte **Shift**, um die andere logische Rahmenfläche zu verwenden, auf die du zielst.

> **Tipp:** Halte **Shift** beim Platzieren, um am Boden einzurasten und eine statische Plattform direkt vor dir zu erstellen.

# Symmetriemodus
Das Constructor Tool unterstützt symmetrisches Bauen, mit dem du automatisch gespiegelte Strukturen bauen kannst.

Die Symmetrie kann über das **GetInfo**-Menü des Bauwerks aktiviert werden (drücke **V** auf einem beliebigen Rahmen). Wenn aktiviert:
- Werden alle Rahmen- und Blockoperationen über die Symmetrieachse gespiegelt
- Die Position der Symmetrieachse kann mit einer **Präzision von 0,125 m** angepasst werden, was eine Spiegelplatzierung in der Mitte von Blöcken ermöglicht

# Abenteuermodus
Im Abenteuermodus benötigst du die erforderlichen Materialien in deinem Inventar:
- **Steel Beams** für Rahmen
- **Block-Items** (Composite, Concrete, Steel, etc.) für Blöcke

Das Werkzeug zeigt an, wie viele Materialien für jede Operation benötigt werden.

---

> **Tipp:** Aktiviere Tooltips über das **F1**-Menü für kontextsensitive Hilfe bei der Verwendung des Constructor Tool.
