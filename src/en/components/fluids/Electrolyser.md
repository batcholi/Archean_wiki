<p align="center">
  <img src="Electrolyser.png" />
</p>

|Component|`Electrolyser`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
The electrolyser is a component that allows the dissociation of water into hydrogen and oxygen.

# Usage
The electrolyser requires high voltage energy input and up to 10 kW during operation and will produce linearly proportional according to the amount of available power up to a maximum of 1 kg of water per second with 10 kW of power.

To start the electrolysis process, simply connect a water source to its blue input port. This source can come from a [fluid port](../fluids/FluidPort.md) submerged in water to directly extract water from the sea, for example, or a tank containing water.

The produced hydrogen and oxygen can then be collected respectively from the yellow (H2) and cyan (O2) output ports.

### Production
The electrolyser can process up to 1 kg of water per second, providing approximately [0.9 kg of oxygen and 0.1 kg of hydrogen](# "O2:0.88kg / H2:0.11kg") per second.