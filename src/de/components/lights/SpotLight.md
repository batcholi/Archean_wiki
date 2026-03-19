<p align="center">
  <img src="SpotLight.png" />
</p>

|Component|`SpotLight`|
|---|---|
|**Module**|`ARCHEAN_light`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Das SpotLight ist eine Komponente, die einen großen Bereich mit einem maximalen Winkel von 120° beleuchten kann. Es eignet sich besonders für die Montage an Fahrzeugen als Scheinwerfer.

# Usage
Das SpotLight muss mit Niederspannung versorgt werden und verbraucht bis zu 1000 W, abhängig von der in seinem Informationsmenü eingestellten Leistung, das über die `V`-Taste zugänglich ist.

Die Farben des SpotLight können über sein Informationsmenü oder über seinen Datenport geändert werden.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|
