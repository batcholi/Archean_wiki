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
Docking Port 是一个允许将两个建造连接在一起的组件。连接后可以在建造之间传输数据、能量、流体和**物品**，同时也在物理上将它们约束在一起，使它们固定相连。

# Usage
Docking Port 不需要供电。
单独的数据连接器用于控制 Docking Port，而其他连接器用于连接各种电缆，将数据、能量或流体传输到/从另一个 Docking Port。

### Transfer Mode
Docking Port 可以在两种传输模式下运行，通过信息菜单（`V` 键）配置：
- **Fluid Mode**（默认）：在对接的端口之间传输流体
- **Item Mode**：在对接的端口之间传输物品

> 两个 Docking Port 必须设置为相同的模式才能进行传输。

> Docking Port 只能与另一个 Docking Port 对接。

### Usage with aliases
不能同时为两个端口使用默认别名，因为对象在其信息窗口（`V`）中只会显示一个别名字段。同样，[Router](../computers/Router.md) 每个组件也只显示一个别名字段。
要分别使用带别名的数据端口，您需要使用 [Data Bridge](../computers/DataBridge.md) 或 [Data Junction](../computers/DataJunction.md)。这样您可以为这些对象分配别名，而不是为对接端口分配。

### List of outputs
|Channel|Function|
|---|---|
|0|Is Docked

### List of inputs
|Channel|Function
|---|---|
|0|Arm/Disarm Docking

