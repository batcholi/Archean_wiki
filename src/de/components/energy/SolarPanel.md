<p align="center">
  <img src="SolarPanel.png" />
</p>

|Component|`SolarPanel`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|25 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|200 x 200 x 25 cm|
#
---

# Description
Das Solar Panel erzeugt Niederspannungsenergie. Es hat einen Wirkungsgrad von 25% und eine Fläche von 4 Quadratmetern (2x2 Meter).
Die Ausgangsleistung wird basierend auf seiner Entfernung und Ausrichtung zur Sonne(n) begrenzt.
Die Sonne hat eine realistische Bestrahlungsstärke (etwa 1390 W/m² in der Erdumlaufbahn). Auf Archeans Erde innerhalb der Atmosphäre können Sie unter besten Umständen bis zu ~1350 Watt pro Panel erzeugen, auf dem atmosphärelosen Mond ~1390 Watt. Ein untergetauchtes Panel erzeugt nichts.

# Usage
Verbinden Sie das Solar Panel mit der Komponente, die Niederspannungsenergie zum Betrieb benötigt.

Das Solar Panel hat zwei elektrische Anschlüsse, sodass Sie zwei Komponenten gleichzeitig anschließen oder mehrere Solar Panels in Reihe schalten können, um die insgesamt verfügbare Leistung zu erhöhen.

### List of outputs
|Channel|Function|
|---|---|
|0|Generated Power (Watts)|
|1|Output Power (Watts)|

> Wenn Sie das Solar Panel zur Versorgung von zwei Komponenten verwenden, darf die über die beiden Anschlüsse verteilte Gesamtleistung die Ausgangsleistung des Panels nicht überschreiten.
>
> Wenn eine der beiden Komponenten die gesamte verfügbare Leistung des Panels verbrauchen möchte, kann dies die andere Komponente daran hindern, überhaupt Strom zu nutzen. In diesem Fall ist es besser, Power Junctions zu verwenden, um sicherzustellen, dass alle Komponenten mit Strom versorgt werden.
