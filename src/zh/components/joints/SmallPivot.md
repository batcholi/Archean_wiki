<p align="center">
  <img src="SmallPivot.png" />
</p>

|Component|`SmallPivot`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Small Pivot 是一种包含可建造旋转方块的组件。它设计用于在建筑上实现物体的旋转。

> <font color="green"> *此组件与建筑的增压相关，请参阅 [Pressurization](../../pressurization.md) 页面了解更多信息。*</font>

# Usage
Small Pivot 可以在两种模式下运行：伺服模式（默认）和速度模式。要切换模式，按 V 键打开组件的信息界面。

在该界面中，还有两个可配置项：
- `Max Rotation Speed`：决定最大旋转速度，单位为转/秒。
- `Acceleration`：决定枢轴加速到达其最大旋转速度的速率（单位为转/秒/秒）。

## Servo Mode
在伺服模式下，设备通过数据端口接收的数据旋转到精确位置。它接受 `-1.0` 到 `+1.0` 之间的归一化值，分别对应 `-360°` 到 `+360°` 的旋转。这意味着 `0.0`、`-1.0` 和 `+1.0` 将导致相同的伺服位置。

## Velocity Mode
在速度模式下，设备根据端口数据指示的方向连续运转，接受 `-1.0` 到 `+1.0` 之间的值来确定速度和旋转方向。`1.0` 表示最大旋转速度。

> - 安装在运动部件上的建筑不能与父级或同级建筑发生碰撞。它们只能与地形或其他独立建筑碰撞。
> - 要摧毁 Small Pivot，您必须先移除其包含的所有子方块/组件。


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s| 

![SmallPivotDemo](pivot.gif)
