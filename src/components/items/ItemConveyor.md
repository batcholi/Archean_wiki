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
The item conveyor requires low voltage power and consumes 100 watts, with power consumption directly proportional to the number of items being transferred.

It can be configured through its information window accessed with the `V` key or through its data port.
The available options are:

|Option|Value|Description|
|---|---|---|
|**Stack Size**|1 to 1000|Number of items to move per second|
|**Filter**|text|Allows whitelisting of items to be moved. For example, if "Wire" is specified, only wires will be allowed to pass|

> - The item conveyor can only filter one type of item at a time. If you need to move multiple types of items, you will need to use multiple conveyors.
> - The filter is case-sensitive.


### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|ON|0 or 1|
|1|Stack Size|1 to 1000|
|2|Filter|text|