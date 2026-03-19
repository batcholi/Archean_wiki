<p align="center">
  <img src="BigThruster.png" />
</p>

|Component|`BigThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Der Big Thruster erzeugt Schub durch die Verbrennung von flüssigem Treibstoff mit flüssigem Sauerstoff.
Er kann sowohl CH4 (Methan) als auch H2 (Wasserstoff) als Treibstoff verwenden.
Er verwendet eine radiale Aerospike-Düse und ist sehr effizient bei der Umwandlung von Verbrennungsenergie direkt in Schub.
Er kann bis zu 1,8 MN Schub bei einer Durchflussrate von 100 kg/s LOX und 12,5 kg/s H2 erzeugen.

# Usage
Verbinden Sie Oxidator und Treibstoff mit hohem Durchfluss an die Fluidports, Hochspannung für die Zündung, und senden Sie 1 über den Datenport zum Zünden.

Die anfängliche Zündung erfolgt nur, wenn die Durchflussrate zwischen 1 g/s und 50 kg/s liegt, entweder für den Treibstoff oder den Oxidator.

Bei Verwendung von H2 als Treibstoff ist das optimale Mischungsverhältnis 8:1 (LOX:H2), und ein Verhältnis von < 1:1 kann zu einem Flammenabriss führen (keine Verbrennung).
Bei Verwendung von CH4 als Treibstoff ist das optimale Mischungsverhältnis 4:1 (LOX:CH4), und ein Verhältnis von < 1:1 kann zu einem Flammenabriss führen (keine Verbrennung).

Der Zünder muss nicht eingeschaltet bleiben, sobald die Verbrennung begonnen hat, obwohl es ratsam ist, ihn für den Fall eines Flammenabriss eingeschaltet zu lassen.
Die Zündung verbraucht kontinuierlich 1000 Watt, wenn sie eingeschaltet ist.

Die Düse des Big Thruster kann mit einer Variation von -10 bis +10 Grad in zwei Achsen schwenken.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|
|1|Gimbal X|-1.0 to +1.0|
|2|Gimbal Z|-1.0 to +1.0|

### List of outputs
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|

> Wenn Ihr Treibstofftank vorgemischt ist, müssen Sie nicht beide Fluidports verwenden.
