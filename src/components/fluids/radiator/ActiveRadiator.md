<p align="center">
  <img src="ActiveRadiator.png" />
</p>

|Component|`ActiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|40 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
The Active Radiator is a component designed to cool down fluids flowing through it. It is equipped with a fan that greatly improves heat exchange with the environment when activated.

# Usage
The radiator requires:
- An electrical power supply
- A data input to activate its fan.

Without power, its cooling ability is very limited. When powered and activated, it slowly equalizes temperature between the circulating fluids and the environment.

It continuously consumes 100 Watts when powered.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|
