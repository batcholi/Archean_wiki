<p align="center">
  <img src="DashboardTool.png" />
</p>

|Item|`DashboardTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Das Dashboard Tool wird verwendet, um Dashboards mit kleineren Komponenten auf flexiblere Weise zu gestalten. Es ermöglicht dir, Bildschirme, Tasten, LEDs, Labels und andere Elemente auf Oberflächen zu platzieren, um individuelle Steuerpulte und Anzeigen zu erstellen.

# Usage
Drücke `C`, um das Radialmenü zu öffnen und das Element auszuwählen, das du platzieren möchtest.

Drücke `V`, um das GetInfo-Menü eines Elements zu öffnen und auf zusätzliche Optionen zuzugreifen.

## Verfügbare Elemente

### Bildschirme

| Typ | Auflösung | Maximale Größe |
|------|------------|----------|
| Standard Screen | 2 Pixel/cm (200 px/m) | 4 m |
| HD Screen | 6 Pixel/cm (600 px/m) | 50 cm |

HD Screens bieten eine 3x höhere Pixeldichte für detailliertere Anzeigen, sind aber auf 50 cm begrenzt.

Bildschirme aktualisieren sich alle 20 ms.

**GetInfo-Optionen (`V`):**
- **Matte**: Umschalten zwischen glänzender und matter Oberfläche

### Labels
Labels funktionieren wie Bildschirme, aber mit einer Auflösung von 5 Pixel/cm (500 px/m) und einer maximalen Größe von 1 m.

Labels aktualisieren sich alle 500 ms, was sie besser für statische oder sich langsam ändernde Textanzeigen geeignet macht.

**GetInfo-Optionen (`V`):**
- **Text**: Den anzuzeigenden Text eingeben (mehrzeilig unterstützt)
- **Text Align**: Center, Left, Right, Top, Bottom, Top Left, Bottom Left, Top Right, Bottom Right
- **Text Size**: 1 bis 8
- **Color picker**: Die Textfarbe festlegen

### Tasten

#### [PushButton](../components/controllers/PushButton.md)
Sendet ein Signal, wenn gedrückt.

**GetInfo-Optionen (`V`):**
- **Single Pulse**: Wenn aktiviert, wird nur ein einzelner Impuls pro Druck gesendet, anstatt eines kontinuierlichen Signals während des Gedrückthaltens

#### [ToggleButton](../components/controllers/ToggleButton.md)
Wechselt beim Klicken zwischen Ein-/Aus-Zuständen.

**GetInfo-Optionen (`V`):**
- **Allow IO input**: Eingangssignale zur Steuerung des Zustands akzeptieren
- **Horizontal**: Horizontale Ausrichtung umschalten

#### ArrowButton
Richtungstaste mit Drehoptionen.

**GetInfo-Optionen (`V`):**
- **Rotation**: 0-3 (90°-Schritte)
- **Single Pulse**: Wie bei PushButton

### LED
LEDs können wie Drucktasten angeklickt werden und können benutzerdefinierte Farben anzeigen.

**GetInfo-Optionen (`V`):**
- **Single Pulse (press)**: Nur einen einzelnen Impuls pro Klick senden
- **Color From Input**: Farbwert vom Datenkanal empfangen, anstatt die konfigurierte Farbe zu verwenden
- **Color picker**: Die LED-Farbe festlegen

### Trim
Trim ist ein dekoratives Element, das mit einer Präzision von 1 cm platziert und in 1-cm-Schritten bis zu 4 m in der Größe verändert werden kann. Nützlich, um visuelle Trennungen oder Rahmen zu deinem Dashboard-Layout hinzuzufügen.

## Komponenten zu Dashboards hinzufügen
Jede Komponente kann an beliebigen Positionen und Ausrichtungen auf einem Dashboard platziert werden. Dies ermöglicht das Einbetten von Instrumenten, Sensoren oder anderen Komponenten direkt in dein Dashboard-Design.

## Programmierung
Informationen zur Programmierung von Dashboard-Bildschirmen mit XenonCode findest du in der [Dashboard XenonCode Dokumentation](../xenoncode/dashboard.md).
