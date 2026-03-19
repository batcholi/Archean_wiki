<p align="center">
  <img src="MiniThruster.png" />
</p>

|Component|`MiniThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Der Mini Thruster erzeugt Schub durch die Verbrennung von flüssigem Treibstoff mit flüssigem Sauerstoff.
Er kann sowohl CH4 (Methan) als auch H2 (Wasserstoff) als Treibstoff verwenden, benötigt jedoch eine vorgemischte Treibstoff-Oxidator-Kombination.  
Er kann bis zu 18 KN Schub bei einer Durchflussrate von 1 kg/s vorgemischtem LOX und H2 erzeugen.
  
# Usage
Verbinden Sie Oxidator und Treibstoff mit hohem Durchfluss an die Fluidports, Niederspannung für die Zündung, und senden Sie 1 über den Datenport zum Zünden.

Bei Verwendung von H2 als Treibstoff ist das optimale Mischungsverhältnis 8:1 (LOX:H2), und ein Verhältnis von < 1:1 kann zu einem Flammenabriss führen (keine Verbrennung).
Bei Verwendung von CH4 als Treibstoff ist das optimale Mischungsverhältnis 4:1 (LOX:CH4), und ein Verhältnis von < 1:1 kann zu einem Flammenabriss führen (keine Verbrennung).

Der Zünder muss nicht eingeschaltet bleiben, sobald die Verbrennung begonnen hat, obwohl es ratsam ist, ihn für den Fall eines Flammenabriss eingeschaltet zu lassen.
Die Zündung verbraucht kontinuierlich 100 Watt, wenn sie eingeschaltet ist.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|

### List of outputs
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|
