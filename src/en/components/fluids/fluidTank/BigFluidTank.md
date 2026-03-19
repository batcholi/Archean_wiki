<p align="center">
  <img src="BigFluidTank.png" />
</p>

|Component|`BigFluidTank`|
|---|---|
|**Module**|`ARCHEAN_tank`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|250 x 250 x 250 cm|
|**Push/Pull Fluid**|Initiate Push, accept Push/Pull|
#
---

# Description
The big fluid tank is a component that allows storing all types of fluids.

Total capacity: `14 m³`

### List of output
|Channel|Function|Value|
|---|---|---|
|0|Fluid level|`0.0` to `1.0`|
|1|Fluid content|[Key-value](/xenoncode/documentation.md#key-value-objects)|
|2|Fluid temperature|Kelvin|