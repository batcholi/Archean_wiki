<p align="center">
  <img src="SmallHinge.png" />
</p>

|Component|`SmallHinge`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
The Small Hinge is a component that includes a buildable block on a hinge.

# Usage
The Small Hinge only operates in servo mode.

When using V to open the information interface, there are two configurations possible:
- `Max Rotation Speed` which determines the maximum rotation speed in rotations per second.
- `Acceleration` which determines the rate (in rotations per second per second) at which the hinge will accelerate to reach its Max Rotation Speed before slowing down to reach its target position.

The device rotates to a precise position determined by the data received through its data port. It accepts normalized values between `-1.0` and `+1.0`, which correspond to rotations of `-90°` and `+90°`, respectively.

> Builds installed on a moving part cannot collide with a parent or sibling build. They can only collide with the terrain or other separate builds.

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s|

![SmallPivotDemo](hinge.gif)
