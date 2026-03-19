<p align="center">
  <img src="FluidValve.png" />
</p>

|Component|`FluidValve`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|accept Push/Pull -> forwards action to other side|
#
---

# Description
Das Fluid Valve ist eine Komponente, die die Steuerung des Fluidflusses ermöglicht.

# Usage
Standardmäßig ist das Ventil geschlossen und blockiert den Fluidfluss. Um den Fluidfluss zu steuern, senden Sie ein Datensignal zwischen `0 (Geschlossen)` und `1 (Offen)`.

Das Ventil gibt die Temperatur des durchfließenden Fluids auf Kanal 0 aus.
