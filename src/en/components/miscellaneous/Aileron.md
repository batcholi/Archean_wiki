<p align="center">
  <img src="Aileron.png" />
</p>

|Component|`Aileron`|
|---|---|
|**Module**|`ARCHEAN_aileron`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
#
---

# Description
The aileron is a device that influences the aerodynamics of a build.

Its effectiveness is closely related to the density of the medium in which it operates, whether it is in the atmosphere (aircraft...) or in water (boat...).

# Usage
The aileron does not require any energy to operate, only a value between `-1.0` and `+1.0` through its data port.

>- The ailerons don't compute occlusions like blocks do. This allows for optimizing the flight efficiency of a vehicle by hiding them in larger surfaces, such as inside the wings.
