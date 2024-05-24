<p align="center">
  <img src="BigTurboPump.png" />
</p>

|Component|`BigTurboPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 150 cm|
#
---

# Description
The Big Turbo pump is a component used to transfer high-density fluid up to 100 kg per second.

# Usage
The pump has two fluid ports, one on each side, marked by colors:
- Blue corresponds to the input
- Red corresponds to the output

## Power Supply
To use the pump, it needs to be powered by high-voltage. It consumes up to 100 kw when running at full speed.

## Data
The data port allows controlling the pump speed by sending a value between `-1` and `1`.
When the pump is connected to a computer, it can also retrieve the current flow rate.

> When sending a negative value, the pump will effectively run in reverse.
