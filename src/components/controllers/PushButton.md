<p align="center">
  <img src="PushButton.png" />
</p>

|Component|`PushButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
The push button constantly sends a value of `1` while it is pressed otherwise `0`.

# Usage
The button is activated with the `F` key and will remain active as long as the key is held down.

## Configuration
In the configuration menu accessible with the `V` key:

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Makes the button usable from both sides |
| **Single Pulse** | When enabled, the button sends `1` for a single tick then immediately resets to `0`, instead of staying active while held |
