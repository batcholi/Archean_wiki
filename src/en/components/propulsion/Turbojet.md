<p align="center">
  <img src="Turbojet.png" />
</p>

|Component|`Turbojet`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|400 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
The Turbojet is a jet engine that generates thrust by burning liquid fuel with ambient air.
It can produce up to **60 kN** of thrust at sea level, from a flow of 1.4 kg/s of dodecane (C12H26).

# Usage

## Setup
The engine requires:
- A pump pushing fuel into its fluid port (it does not pull from a tank by itself).
- A high voltage supply able to deliver **125 kW** during start-up.
- Three data channels: the starter, the igniters and the fuel valve.

It has no internal regulation: the fuel valve is directly the thrust control.

> **Tip:** to turn Oil Shale into usable fuel, cook it in a Chemical Furnace between **600 K and 700 K**. This crude oil is a stopgap until refining is available: its water and heavy hydrocarbons wear the turbojet out.

## Start-up
1. Starter at 1: the shaft spins up to about 24 % N1. The starter draws 125 kW as long as it runs.
2. Igniters at 1 (400 watts) and valve moderately open: combustion starts as soon as fuel reaches the chamber.
3. Once the engine is running, the starter and the igniters can be switched off: the flame alone keeps the shaft turning.

Fuel injected without a spark pools in the chamber and lights all at once on the first spark.

> The inspection panel shows the state of the three controls and the reason why the engine is not running (unpowered starter, closed valve, no fuel, no spark, no oxygen).

## Operation
Rated thrust is reached at about 77 % of the valve; wide open, it passes 30 % more than the rated flow and the gas temperature exceeds the blade limit.

The flame only holds within a richness band:
- Opening the valve abruptly makes the mixture too rich: the compressor surges (`Surge`) for a second and the engine takes damage.
- Closing it almost completely above 45 % N1 makes the mixture too lean: the flame goes out.

After a flameout, the igniters only relight the flame once the shaft has dropped below 55 % N1. A chamber that is still hot (above 750 K) relights the fuel by itself, without igniters.

Valve at 0, the flame goes out and the shaft takes about two minutes to stop.

Thrust decreases with altitude. In flight, speed compresses the air at the intake but reduces thrust at equal power.

## Limits
- Gas temperature (EGT) above **1250 K**: rapid blade wear.
- N1 above **105 %**: rapid rotor destruction.
- Water ingestion above 30 % N1: the blades break.
- Contaminated fuel (water, heavy hydrocarbons) beyond 5 %: wear. Crude oil wears the engine.

## States
|State|Meaning|
|---|---|
|Off|Engine stopped.|
|Cranking|The starter drives the shaft.|
|Running|Combustion in progress.|
|Surge|Compressor surge, mixture too rich.|
|Destroyed|Engine destroyed.|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Starter|0 or 1|
|1|Igniters|0 or 1|
|2|Throttle|0.0 to 1.0|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|N1|%|
|1|Thrust|Newtons|
|2|EGT|Kelvin|
|3|Running|0 or 1|
|4|Burned fuel flow|kg/s|
|5|Unburned fuel flow|kg/s|
|6|State|"Off", "Cranking", "Running", "Surge", "Destroyed"|
