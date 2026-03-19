<p align="center">
  <img src="Hitch.png" />
</p>

|Component|`Hitch`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description  
The Hitch component connects two builds together at a fixed point, while allowing full rotational freedom around the joint. Once connected, the vehicles remain locked in position but are free to rotate relative to each other around the hitch.

# Usage  

The Hitch has a **data port** that controls its state.  
When two Hitch components are activated (armed) and come into close proximity, they automatically connect.
The connection can be broken at any time by deactivating either component.

> - For performance reasons, collisions are not processed between hitched builds. The game uses server-side physics, and continuously checking collisions between vehicles in close proximity would be too costly. A future update may allow players to define constraints across all hitch axes to simulate physical limits, for example, preventing a trailer from rotating beyond a certain angle to avoid clipping into its tractor.

### List of inputs
|Channel|Function|value|
|---|---|---|
|0|Arm/Disarm Docking|0 or 1|

### List of outputs
|Channel|Function|value|
|---|---|---|
|0|Is Docked|0 or 1|
