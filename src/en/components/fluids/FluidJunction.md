<p align="center">
  <img src="FluidJunction.png" />
</p>

|Component|`FluidJunction`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
The Fluid Junction is a component that allows for the separation or combination of fluids.

# Usage
The Fluid Junction transfers fluids with the logic shown in the example image below. The ports on the face that contains 4 ports only communicate with the port on the face that contains only one.

When fluid enters through the single bottom port, it is distributed among the four top ports based on the acceptance capacity of the connected components. If all ports are open, the fluid is evenly divided. However, if one or more ports are closed (e.g., due to a [fluid valve](./FluidValve.md)), the total amount of fluid is redistributed only among the remaining ports that can still receive the flow.

<p align="center">
  <img src="diagrFluidJunction.png" />
</p>
