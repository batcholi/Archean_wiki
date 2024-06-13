<p align="center">
  <img src="MiningDrill.png" />
</p>

|Component|`MiningDrill`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 100 cm|
|**Push/Pull Item**|Initiate Push|
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

## Data retrieval
The Mining Drill allows retrieving information about the composition at its position at any time.
The returned value is a [Key-Value objects](../../xenoncode/documentation.md#key-value-objects) that is presented in the following format, for example: `.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}`.
This means that the position contains 12% carbon, 5% iron, 3% silicon, and 80% copper.


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

