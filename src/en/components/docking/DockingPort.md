<p align="center">
  <img src="DockingPort.png" />
</p>

|Component|`DockingPort`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
The docking port is a component that allows two builds to be connected together. The connection enables the transfer of data, energy, fluids, and **items** between the connected builds, but it also physically constrains them together. They are stuck together.

# Usage
The docking port does not need to be powered.
The separate data connector allows controlling the docking port, while the other connectors allow connecting various cables that will transfer data, energy, or fluids to/from the other docking port.

### Transfer Mode
The Docking Port can operate in two transfer modes, configurable via the GetInfo menu (`V` key):
- **Fluid Mode** (default): Transfers fluids between docked ports
- **Item Mode**: Transfers items between docked ports

> Both docking ports must be set to the same mode for transfers to work.

> The Docking Port can only be docked to another Docking Port.

### Usage with aliases
Using default aliases isn't possible for both ports simultaneously because the object will only display a single alias field in its information window (`V`). Similarly, the [router](../computers/Router.md) only displays a single alias field per component.
To separately use data ports with aliases, you need to use a [data bridge](../computers/DataBridge.md) or [data junction](../computers/DataJunction.md). This allows you to assign aliases to these objects instead of the docking ports.

### List of outputs
|Channel|Function|
|---|---|
|0|Is Docked

### List of inputs
|Channel|Function
|---|---|
|0|Arm/Disarm Docking

