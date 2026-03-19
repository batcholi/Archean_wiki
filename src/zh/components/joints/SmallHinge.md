<p align="center">
  <img src="SmallHinge.png" />
</p>

|Component|`SmallHinge`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Small Hinge 是一种包含可建造方块的铰链组件。

> <font color="green"> *此组件与建筑的增压相关，请参阅 [Pressurization](../../pressurization.md) 页面了解更多信息。*</font>

# Usage
Small Hinge 仅在伺服模式下运行。

按 V 键打开信息界面时，有两个可配置项：
- `Max Rotation Speed`：决定最大旋转速度，单位为转/秒。
- `Acceleration`：决定铰链加速到达其最大旋转速度后再减速到达目标位置的速率（单位为转/秒/秒）。

该设备通过数据端口接收的数据旋转到精确位置。它接受 `-1.0` 到 `+1.0` 之间的归一化值，分别对应 `-90°` 到 `+90°` 的旋转。

> - 安装在运动部件上的建筑不能与父级或同级建筑发生碰撞。它们只能与地形或其他独立建筑碰撞。
> - 要摧毁 Small Hinge，您必须先移除其包含的所有子方块/组件。
### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s|

![SmallPivotDemo](hinge.gif)
