<p align="center">
  <img src="dataspool.png" />
  <img src="lowvoltagespool.png" />
  <img src="highvoltagespool.png" />
  <img src="fluidspool.png" />
  <img src="itemconduitspool.png" />
</p>

|Item|`Spool`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Length**|100 m|

# Description
The different spools allow connecting components to transfer data, energy, items or fluids.

# Usage
## Creating a cable (connecting two components)
The creation of a cable starts and ends on a component connector.

The placement of cables is completely free and allows adding as many points as you want (as long as you spool's remaining length) to customize its shape. During the creation of a cable, if you have placed multiple points, you can remove points using the `right-click` to refine the placement or completely cancel the creation of the cable if there are no more existing points.

Cables can be stacked on top of other existing cables and on components. (To snap it on the surface of a component, you must hold the `Shift` key).

## Creating a Flexible Cable
You may want to connect components of different builds together temporarily or simply attach two builds together.  
This will effectively create a Flexible cable.  
The two builds will effectively be linked together and constrained in the physics engine.  
There is no force limit, the cables will not detach.  
You can also add a flexible cable between two components of the same build by holding `X`, to get a straight (maybe a bit curved) cable that will be affected by gravity.

## Deleting a cable
You can delete a cable with a `right-click` as long as the tool in your hand is the appropriate cable spool.

## Painting cables
You can paint cables using the [Paint Tool](../tools/PaintTool.md) just like you would with blocks.
Cables offer two additional customization options:
- `Shift` to paint a cable and make it transparent
- `X` to paint a cable normally with a striped effect
  
You can also combine both effects by holding down both keys.

---
>- *When creating your cable, if it refuses to be created, it is likely that you do not have enough available length in your current spool to create the cable.*
>- *Cables have no transfer limit nor loss related to length.*
>- *Cables do not determine the direction of what they transport.*
>- *A cable cannot be modified once placed, you must delete it.*
>- *Flexible cables will affect performance significantly, whereas normal cables will not affect performance at all even if you have thousands of them in a build. Try to prioritize using normal cables where you can*
