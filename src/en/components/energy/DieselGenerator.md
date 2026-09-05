<p align="center">
  <img src="DieselGenerator.png" />
</p>

|Component|`DieselGenerator`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|250 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push/Pull|
#
---

# Description
The Diesel Generator is a generator set that burns liquid fuel to produce high voltage power.
It can deliver up to **150 kW** and its reference fuel is dodecane (C12H26).

# Usage
Connect a fuel source to its fluid port, low voltage power for the starter, and send 1 to its data port to switch it on.

The starter draws 1000 watts of low voltage power during cranking only. With fuel available, the engine starts in under a second.

The power produced is delivered on the high voltage output. Fuel consumption follows the load: about 10 g/s at full power and 27 % of that at idle.

The engine breathes ambient air through its intake and rejects its exhaust gases through its outlet. The air and exhaust ports allow pipes to be connected instead; a piped intake replaces ambient air. The available power decreases with the amount of oxygen in the air.

The engine stalls if it runs out of oxygen, if its exhaust is blocked, or if fuel is missing for more than a second. After a stall, send 0 then 1 to the data port to restart it.

It tolerates up to 55 % fuel contamination (water, heavy hydrocarbons) without wear. Beyond that, it wears out.

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
