<p align="center">
  <img src="Crafter.png" />
</p>

|Component|`Crafter`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Accept Push/Pull, Initiate Pull|
|**Push/Pull Item**|Initiate Push/Pull|
#
---

# Description
The Crafter is a component that allows for the rapid crafting of items.

# Usage
The Crafter requires high voltage power and consumes 500 watts when idle and 10kw when operational.

It can be manually controlled through its integrated touch screen and/or through its data port for more advanced control.


### List of Inputs
|Channel|Function|Value|
|---|---|---|
|0|Continuous Crafting|0 or 1|
|1|Override Craft Selection|text|

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Progress|-1 or 0 to 1|
|1|Craft Selection|text|

> Informations:
>- When the available `progress` in the output data is `-1`, it means that the recipe cannot be performed either due to missing resources or the requested craft does not exist in the game.
>- Even though the Crafter only has two fluid ports, it can use as much fluid as needed for recipes by using [Fluid Junctions](../fluids/FluidJunction.md), which can be connected to all necessary fluid sources. The Crafter will simply use them when needed.

> Hints:
> - You can simply use a [Toggle Button](../controllers/ToggleButton.md) to start continuous crafting as long as the button is active or there are enough resources in the connected inventory.