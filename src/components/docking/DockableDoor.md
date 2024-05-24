<p align="center">
  <img src="DockableDoor.png" />
</p>

|Component|`DockableDoor`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|250 x 250 x 100 cm|
#
---

# Description
The Dockable Door is a large door that can dock to a similar door to connect two build together. Docking allows for the transfer of data, energy, and fluids between the connected build, but also constrains the two builds together in terms of physics. They are stuck together.

>Dockable Doors can only be installed on the face of frames.

# Usage
To function properly, the Dockable Door needs to be powered via low voltage. It consumes 20 watts when inactive and up to 250 watts when the doors are in motion.

The interior side of the door has two panels for interacting with the door or transferring data, energy, or fluids through the docking port.

Here is an image illustrating the two panels.
- The panel in green is for interacting with the door, powering it, and controlling it remotely via a data port. (The table below indicates the inputs/outputs of the data port)
- The panel in blue is for connecting various cables that will transfer data, energy, or fluids to/from the other docked door.

![DockableDoorDemo](DockableDoorExample.png)

### List of inputs
|Channel|Function|
|---|---|
|0|Close/Open Door|
|1|Arm/Disarm Dock|

### List of outputs
|Channel|Function|
|---|---|
|0|Door State|
|1|Dock State|
