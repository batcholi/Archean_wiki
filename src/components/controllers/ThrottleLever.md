<p align="center">
  <img src="ThrottleLever.png" />
</p>

|Component|`ThrottleLever`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
The Throttle Lever is a type of control that constantly sends an analog value between `-1.0` and `+1.0` depending on the position of the lever.

# Usage
The lever is controlled with the mouse by holding the `F` key and moving the `mouse up/down`.

> - There is resistance in the center of the lever to help find the precise center position.
> - It is possible to configure the **Min** and **Max** values of the lever, as well as the **snap-to-center** feature from the configuration menu accessible with the `V` key.
> - The throttle lever can be controlled from another component through its data port by enabling the "Allow IO Input" mode in the configuration menu.
