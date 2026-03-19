<p align="center">
  <img src="ChemicalFurnace.png" />
</p>

|Component|`ChemicalFurnace`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|150 x 200 x 200 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
|**Push/Pull Item**|Accept Push / Initiate Push|
#
---

# Description
Die Chemical Furnace erhitzt Fluide und Items, üblicherweise um chemische Reaktionen durchzuführen.

# Usage
Sie benötigt elektrische Energie zum Betrieb. Ihr Stromverbrauch variiert je nach Zieltemperatur und dem zu erhitzenden Inhalt und kann unter den anspruchsvollsten Bedingungen bis zu **5 MW** erreichen.

Die Chemical Furnace ist außerdem mit einem Touchscreen ausgestattet, der Folgendes ermöglicht:
- Anzeige der aktuellen Temperatur
- Manuelles Einstellen einer Zieltemperatur

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Target Temperature (K)|number|
|1|Purge|0 or 1|

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Current Temperature (K)|number|
