<p align="center">
  <img src="DieselGenerator.png" />
</p>

|Component|`DieselGenerator`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|250 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push/Pull|
#
---

# Description
Der Diesel Generator ist ein Stromaggregat, das flüssigen Kraftstoff verbrennt, um Hochspannungsenergie zu erzeugen.
Er liefert bis zu **150 kW**, sein Referenzkraftstoff ist Dodecan (C12H26).

# Usage
Verbinden Sie eine Kraftstoffquelle mit seinem Fluid-Port, Niederspannung für den Anlasser, und senden Sie 1 an seinen Datenport, um ihn einzuschalten.

Der Anlasser zieht nur während des Startvorgangs 1000 Watt Niederspannung. Bei verfügbarem Kraftstoff springt der Motor in weniger als einer Sekunde an.

Die erzeugte Energie wird am Hochspannungsausgang geliefert. Der Kraftstoffverbrauch folgt der Last: etwa 10 g/s bei voller Leistung und 27 % davon im Leerlauf.

Der Motor atmet Umgebungsluft durch seinen Ansaugstutzen und stößt seine Abgase über seinen Auslass aus. Über die Luft- und Abgas-Ports können stattdessen Rohre angeschlossen werden; ein angeschlossener Ansaugstutzen ersetzt die Umgebungsluft. Die verfügbare Leistung sinkt mit der Sauerstoffmenge in der Luft.

Der Motor stirbt ab, wenn ihm der Sauerstoff ausgeht, sein Auspuff blockiert ist oder länger als eine Sekunde Kraftstoff fehlt. Nach einem Abwürgen senden Sie 0 und dann 1 an den Datenport, um ihn neu zu starten.

Er verträgt bis zu 55 % Kraftstoffverunreinigung (Wasser, schwere Kohlenwasserstoffe) ohne Verschleiß. Darüber hinaus verschleißt er.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Run|0 or 1|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Load|0.0 to 1.0|
|1|RPM|rpm|
|2|Fuel flow|kg/s|
|3|Running|0 or 1|
|4|State|"Off", "Starting", "Running", "Stalled", "Destroyed"|
