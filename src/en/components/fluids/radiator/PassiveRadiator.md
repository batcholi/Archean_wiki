<p align="center">
  <img src="PassiveRadiator.png" />
</p>

|Component|`PassiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
The Passive Radiator is a component used to slowly cool down fluids by exchanging heat with the environment or radiating it out into space. It does not require any power.

# Usage
Its cooling efficiency depends on:
- The ambient temperature
- The density of the surrounding environment

Heat exchange happens through conduction (improved with higher density) and radiation.  
When a fluid flows through it, its temperature tends to equalize with the component's temperature.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|

