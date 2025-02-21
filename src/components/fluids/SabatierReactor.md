<p align="center">
<img src="SabatierReactor.png" />
</p>

|Component|`SabatierReactor`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Accept Push/Initiate Push|
#
---

# Description
The Sabatier reactor is a component that allows the conversion of carbon dioxide (CO2) and hydrogen (H2) into methane (CH4).

# Usage
The Sabatier reactor requires high voltage energy input and up to 10 kW during operation. It captures CO2 directly from the ambient air around it, which means it must be placed in an environment containing CO2 to function.

To start the conversion process, simply connect a hydrogen source to its yellow input port. The produced methane can then be collected from the red output port.

### Production
The Sabatier reactor can process up to 0.1 kg of hydrogen per second, providing 0.2 kg of methane per second.

> The Sabatier reactor releases water (H2O) into its environment during the reaction. This water is usually not visible, but in a sealed volume, it will start to accumulate.
