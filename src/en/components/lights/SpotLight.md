<p align="center">
  <img src="SpotLight.png" />
</p>

|Component|`SpotLight`|
|---|---|
|**Module**|`ARCHEAN_light`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
The spotlight is a component that allows to illuminate a large area with a maximum angle of 120°. It is particularly suitable to place on vehicles as a headlight.

# Usage
The spotlight must be powered by low voltage and consumes up to 1000 W depending on the power set in its information menu accessible via the `V` key.

The colors of the spotlight can be changed via its information menu or via its data port.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|