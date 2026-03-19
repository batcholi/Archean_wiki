<p align="center">
  <img src="TerrainScanner.png" />
</p>

|Component|`TerrainScanner`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 25 x 25 cm|
#
---

# Description
Der Terrain Scanner ist eine Komponente, die es ermöglicht, die Höhe des Terrains an einer oder mehreren Positionen (nach Entfernung) in Richtung seines Sensors abzurufen. Er funktioniert nur auf Planeten und Monden.

# Usage
Technisch gesehen ist der Scanner sehr einfach. Sie senden ihm eine Zahl auf Kanal 0, die der Entfernung in Metern entspricht, in der Sie das Terrain horizontal scannen möchten, und der Scanner gibt eine Zahl zurück, die der Höhe an dieser Entfernung in Richtung des Sensors entspricht.

Die zurückgegebene Höhe ist im Fall der Erde relativ zum Meeresspiegel.

Seine Stärke liegt in der Fähigkeit, ihm mehrere Entfernungen auf verschiedenen Kanälen zu senden, um mehrere Punkte gleichzeitig bei jedem Server-Tick zu scannen (standardmäßig 25 Mal pro Sekunde).

> Richten Sie ihn niemals nach unten/oben, er funktioniert am besten beim horizontalen Scannen.

## Example
Um das Terrain in einer Entfernung von 10m zu scannen, müssen Sie den Wert 10 auf Eingangskanal 0 senden. Der Scanner gibt eine Zahl zurück, die der Höhe in 10m Entfernung auf dem entsprechenden Ausgangskanal entspricht.

Um das Terrain in Entfernungen von 10m und 20m zu scannen, müssen Sie den Wert 10 auf Eingangskanal 0 und den Wert 20 auf Eingangskanal 1 senden. Der Scanner gibt dann eine Zahl für die Höhe in 10m Entfernung auf Ausgangskanal 0 und eine weitere Zahl für 20m Entfernung auf Ausgangskanal 1 zurück.

Mit diesen Möglichkeiten können Sie zum Beispiel eine XenonCode-Schleife verwenden, um alle Höhen innerhalb einer Reichweite von 100m mit einem Schritt von 10m zu scannen und sie in der Konsole anzuzeigen.

```xc
    repeat 10 ($i)
        output_number($scanner_io, $i, $i*10)
        print(input_number($scanner_io, $i))
```

Beachten Sie, dass es eine Verzögerung von 1 Tick zwischen dem Senden an den Ausgang und dem Abrufen vom Eingang gibt.
Grundsätzlich liefert der Scanner die Ergebnisse basierend auf den Werten, die Sie ihm im vorherigen Tick gesendet haben. Verschieben Sie also Ihre Entfernungswerte nicht zwischen den Kanälen und verwenden Sie keine zufälligen Werte, sondern halten Sie sie über mehrere Ticks hinweg konsistent.

## Go further
Der Terrain Scanner scannt das Terrain in Richtung seines Sensors. Sie können ihn auf einem Small Pivot installieren, um ihn zum Beispiel zu drehen und eine Höhenkarte um seine Position herum mit einem XenonCode-Programm und den In-Game-Bildschirmen zu erstellen.

## Energy
Der Terrain Scanner verbraucht Niederspannungsenergie zum Betrieb. Sein Verbrauch ist direkt proportional zur Anzahl der verwendeten Kanäle. Je mehr Positionen Sie in einem einzelnen Tick scannen, desto mehr Energie verbrauchen Sie, nämlich 100 Watt pro Kanal pro Tick.
