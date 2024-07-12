<p align="center">
  <img src="FluidValve.png" />
</p>

|Component|`FluidValve`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|accept Push/Pull -> forwards action to other side|
#
---

# Description
The fluid valve is a component that allows control of the flow of fluid passing through it.

# Usage
By default, the valve is open and allows the fluid to pass through. To control the fluid flow, send a data signal between `0 (Open)` and `1 (Closed)`.