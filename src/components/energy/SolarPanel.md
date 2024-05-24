<p align="center">
  <img src="SolarPanel.png" />
</p>

|Component|`SolarPanel`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 25 cm|
#
---

# Description
The solar panel generates low voltage energy. It has an efficiency of 99.9% and a surface area of 4 square meters (2x2 meters).
The power output will be limited based on its distance and orientation to the sun(s).
With the default solar system configuration in Archean, the sun is only about 25% as bright as our actual sun. On Archean's Earth inside the atmosphere in the best circumstances, you might be able to generate up to ~ 980 watts per panel.

# Usage
Connect the solar panel to the component that requires low voltage energy to function.

The solar panel has two electrical ports, which allows you to connect two components simultaneously or chain multiple solar panels in series to increase the total available power.

### List of outputs
|Channel|Function|
|---|---|
|0|Generated Power (Watts)|
|1|Output Power (Watts)|

> If you are using the solar panel to power two components, the total power distributed across the two ports cannot exceed the panel's output power.
>
> If one of the two components wants to consume the entire available power from the panel, it may prevent the other component to use any power at all. It is better to use power junctions in this case, to make sure all components get fed with power.
