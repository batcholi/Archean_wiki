<p align="center">
  <img src="SmallTurboPump.png" />
</p>

|Component|`SmallTurboPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
The Small Turbo pump is a component used to transfer high-density fluid up to 10 kg per second.

# Usage
The pump has two fluid ports, one on each side, marked by colors:
- Blue corresponds to the input
- Red corresponds to the output

## Power Supply
To use the pump, it needs to be powered by high-voltage. It consumes up to 10 kw when running at full speed.

## Data
The data port allows controlling the pump speed by sending a value between `-1` and `1`.
When the pump is connected to a computer, it can also retrieve the current flow rate.

> When sending a negative value, the pump will effectively run in reverse.
