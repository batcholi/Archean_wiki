<p align="center">
  <img src="DockableDoor.png" />
</p>

|Component|`DockableDoor`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|250 x 250 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
Dockable Door 是一扇大型门，可以与同类型的门对接，将两个建造连接在一起。对接允许在连接的建造之间传输数据、能量和流体，同时也在物理上将两个建造约束在一起，使它们固定相连。

> - Dockable Door 只能安装在框架的面上。
> - Dockable Door 只能与另一个 Dockable Door 对接。
> - <font color="green"> *此组件与建造的加压相关，请参阅[加压](../../pressurization.md)页面以获取更多信息。*</font>

# Usage
为了正常工作，Dockable Door 需要通过低压供电。不活动时消耗 20 瓦，门运动时功耗最高可达 250 瓦。

门的内侧有两个面板，用于与门交互或通过对接端口传输数据、能量或流体。

以下图片展示了这两个面板。
- 绿色面板用于与门交互、供电以及通过数据端口远程控制。（下表显示了数据端口的输入/输出）
- 蓝色面板用于连接各种电缆，将数据、能量或流体传输到/从另一个对接的门。

![DockableDoorDemo](DockableDoorExample.png)

### Usage with aliases
不能同时为两个端口使用默认别名，因为对象在其信息窗口（`V`）中只会显示一个别名字段。同样，[Router](../computers/Router.md) 每个组件也只显示一个别名字段。
要分别使用带别名的数据端口，您需要使用 [Data Bridge](../computers/DataBridge.md) 或 [Data Junction](../computers/DataJunction.md)。这样您可以为这些对象分配别名，而不是为对接端口分配。

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
