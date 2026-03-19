<p align="center">
  <img src="PassiveRadiator.png" />
</p>

|Component|`PassiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
Der Passive Radiator ist eine Komponente, die zum langsamen Abkühlen von Fluiden verwendet wird, indem sie Wärme mit der Umgebung austauscht oder in den Weltraum abstrahlt. Er benötigt keine Energie.

# Usage
Seine Kühleffizienz hängt ab von:
- Der Umgebungstemperatur
- Der Dichte der umgebenden Umwelt

Der Wärmeaustausch erfolgt durch Wärmeleitung (verbessert bei höherer Dichte) und Strahlung.  
Wenn ein Fluid durch ihn hindurchfließt, gleicht sich seine Temperatur tendenziell an die Temperatur der Komponente an.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|
