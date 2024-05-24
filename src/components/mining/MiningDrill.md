<p align="center">
  <img src="MiningDrill.png" />
</p>

|Component|`MiningDrill`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 100 cm|
#
---

# Description
The Mining Drill is a component that allows drilling the terrain to extract rocks that can be crushed to obtain ores.

# Usage
To function, it needs to be installed on a build that must be anchored to the ground using a ground anchor.
You need to connect it to a Container of anything else that takes in Items, to collect the mined rocks.

Depending on the energy type, it can extract rocks at different speeds.
|Energy|Power required|Speed|Depth|
|---|---|---|---|
|Low Voltage|10 kw|Up to 10 rocks per second|0.01 meter per second|
|High Voltage|100kw|Up to 100 rocks per second|0.1 meter per second|

## Efficiency & depletion
The mined area is not unlimited, it gradually depletes as it goes deeper and the efficiency decreases accordingly.  
You will have to relocate it once in a while.


### List of outputs
|Channel|Function|
|---|---|
|0|Composition|
|1|Depth|
|2|Efficiency|
|3|MiningRate|
|4|DrillingRate|

