<p align="center">
  <img src="RTG.png" />
</p>

|Component|`RTG`|
|---|---|
|**Module**|`ARCHEAN_rtg`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 100 cm|
#
---

# Description
The radioisotope thermoelectric generator (RTG) generates low-voltage energy. It can provide a continuous power depending on the cooling ability of the environment.

# Usage
Connect the RTG to the component that requires low-voltage energy to function.

The RTG has two electrical ports, which allows you to connect two components simultaneously or chain multiple RTGs to increase the total power output.

### List of outputs
|Channel|Function|
|---|---|
|0|Generated Power (Watts)|
|1|Output Power (Watts)|

> - Currently, the RTG provides unlimited energy and does not have any harmful effects on the player or the environment.
>
> - If you are using the RTG to power two components, the total power distributed across the two ports cannot exceed the RTG's available output power.
>
> - If one of the two components wants to consume the entire available power from the RTG, it may prevent the other component to use any power at all. It is better to use power junctions in this case, to make sure all components get fed with power equally.
