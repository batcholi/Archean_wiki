<p align="center">
  <img src="ToggleButton.png" />
</p>

|Component|`ToggleButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
The switch button constantly sends a value when activated or deactivated. By default, it sends `1` when on and `0` when off, but custom values can be configured.

# Usage
The `F` key is used to toggle the Toggle Button.

## Configuration
In the configuration menu accessible with the `V` key:

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Makes the button usable from both sides |
| **Allow IO Input** | Allows the button to be controlled from another component through its data port |
| **Off Value** | The value sent when the button is off (default: `0`) |
| **On Value** | The value sent when the button is on (default: `1`) |