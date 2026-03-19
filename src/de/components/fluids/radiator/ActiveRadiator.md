<p align="center">
  <img src="ActiveRadiator.png" />
</p>

|Component|`ActiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|40 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
Der Active Radiator ist eine Komponente, die zum Abkühlen von durchfließenden Fluiden entwickelt wurde. Er ist mit einem Ventilator ausgestattet, der den Wärmeaustausch mit der Umgebung bei Aktivierung erheblich verbessert.

# Usage
Der Radiator benötigt:
- Eine elektrische Stromversorgung
- Einen Dateneingang zur Aktivierung seines Ventilators.

Ohne Strom ist seine Kühlleistung sehr begrenzt. Wenn er mit Strom versorgt und aktiviert wird, gleicht er langsam die Temperatur zwischen den zirkulierenden Fluiden und der Umgebung an.

Er verbraucht kontinuierlich 100 Watt, wenn er mit Strom versorgt wird.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|
