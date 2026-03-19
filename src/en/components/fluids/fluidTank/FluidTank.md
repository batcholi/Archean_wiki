<p align="center">
  <img src="FluidTank.png" />
</p>

|Component|`FluidTank`|
|---|---|
|**Module**|`ARCHEAN_tank`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push, accept Push/Pull|

#
---

# Description
The fluid tank is a component that allows storing all types of fluids.

Total capacity: `1.50 m³`

### List of output
|Channel|Function|Value|
|---|---|---|
|0|Fluid level|`0.0` to `1.0`|
|1|Fluid content|[Key-value](/xenoncode/documentation.md#key-value-objects)|
|2|Fluid temperature|Kelvin|
