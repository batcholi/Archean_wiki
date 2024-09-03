<p align="center">
  <img src="GroundAnchor.png" />
</p>

|Component|`GroundAnchor`|
|---|---|
|**Module**|`ARCHEAN_anchor`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 100 x 100 cm|
#
---

# Description
The Ground Anchor is a device that locks a build to the ground when activated, preventing any movement.

# Usage
The Ground Anchor operates without requiring external power. Its mechanism relies on a simple value, `0` for deactivated (not anchored) or `1` for activated (anchored) through its data port.

>- To release a grounded build, removing the ground anchor is not enough. You must either unanchor the current ground anchor or install a new ground anchor to reactivate the build's physics, provided there are no longer any grounded anchors attached.
>- If an [OwnerPad](OwnerPad.md) is present, using the "Reset" button to move the build will NOT be prevented by the Ground Anchor.
>- The Ground Anchor cannot anchor a vehicle to another vehicle, it only works on terrains.
