<p align="center">
  <img src="Beacon.png" />
</p>

|Component|`Beacon`|
|---|---|
|**Module**|`ARCHEAN_beacon`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
The beacon is a component that allows for transmitting and/or receiving data to/from other beacons.

# Usage
To function, a beacon needs to be powered by low-voltage energy and will consume 10 watts during operation.
It can be configured to transmit and/or receive data using the data ports or its configuration interface accessible via the `V` key.

When placing a beacon, an arrow appears on the hologram to indicate the localize direction of the beacon.

## Configuration Interface
- `Transmit Data`: Allows sending a `number/text` data.
- `Transmit Frequency`: Allows adjusting transmission frequency.
- `Receive Frequency`: Allows adjusting reception frequency.
#### Informations
- `Last Received Distance`: Displays the distance in meters from the last beacon it received data from.
- `Last Received Direction`: Displays the direction (x,y,z) from the last beacon it received data from.
- `Last Received Data`: Displays the last received data.
- `Is Receiving`: Displays if the beacon is currently receiving data.

## Data Port
The beacon has a data port that allows it to be used from a computer or other components.

### List of outputs
|Channel|Function|Range|
|---|---|---|
|0|Data|number or text|
|1|Distance|number (meters)|
|2|Direction X|-1.0 to +1.0|
|3|Direction Y|-1.0 to +1.0|
|4|Direction Z|-1.0 to +1.0|
|5|Is Receiving|0 or 1|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Transmit Data|number or text|
|1|Transmit Frequency|number or text|
|2|Receive Frequency|number or text|

> Informations:
>- There is no distance limit for communications between beacons, although the closest will have precedence if multiple beacons broadcast on the same frequency.
>- The signal of a beacon is not affected by obstacles.

> Hints:
>- The beacon can only transmit a single data at a time, either a number or text. But you can use the [Key-Value objects](../../xenoncode/documentation.md#key-value-objects) system to transmit as much data as needed.
