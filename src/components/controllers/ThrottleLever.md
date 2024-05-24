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

>There is resistance in the center of the lever to help find the precise center position.

---

### Tip
You can use a function in a computer to give it a classic accelerator behavior, where the low position returns `0` and the high position returns `1`.

```xc
; Where `a` is the throttle output
(a+1)/2
```
