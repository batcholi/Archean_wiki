<p align="center">
  <img src="ItemConveyor.png" />
</p>

|Component|`ItemConveyor`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 100 cm|
|**Push/Pull Item**|Initiate Push/Pull|
#
---

# Description
The item conveyor is a component that allows moving items from one point to another. It operates by pulling items at the input and pushing them at the output. It can be used, for example, to transport items from one container to another.

# Usage
The item conveyor requires low voltage power, with power consumption directly proportional to the flow rate of items being moved.

It can be configured either through its information window (accessible with the `V` key) or through its data port.
The available configuration options are:

|Option|Value|Description|
|---|---|---|
|**Pull n items/sec**|1 to 1000|Maximum number of items to move per second|
|**Pull x kg/sec**|0 to 1000 kg|Maximum mass of items to move per second|
|**Filter**|text|Allows whitelisting a specific type of item. For example, if "Wire" is specified, only wires will be allowed to pass|

> - The item conveyor can only filter one type of item at a time. If you need to move multiple types of items, you will need to use multiple conveyors.
> - The filter is case-sensitive.

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|ON|0 or 1|
|1|Pull n items/second|1 to 1000|
|2|Filter|text|
|3|Pull x kg/second|0 to 1000|
