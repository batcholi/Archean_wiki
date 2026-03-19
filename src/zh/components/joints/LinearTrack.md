<p align="center">
  <img src="LinearTrack.png" />
</p>

|Component|`LinearTrack`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Linear Track 是一种包含可建造移动方块的组件。它设计用于在建筑上实现物体的直线平移。它只能沿着方块移动轴上自动创建的轨道进行平移。

> <font color="green"> *此组件与建筑的增压相关，请参阅 [Pressurization](../../pressurization.md) 页面了解更多信息。*</font>

# Usage
Linear Track 可以在两种模式下运行：伺服模式（默认）和速度模式。要切换模式，按 V 键打开组件的信息界面。

在该界面中，还有额外的可配置项：
- `Max Speed`：决定最大速度，单位为米/秒。
- `Acceleration`：决定线性轨道加速到达其最大速度的速率。
- `Override limits`：启用后，允许您手动设置最小和最大位置限制，而不使用基于可用轨道空间自动计算的值。

## Tracks
Linear Track 组件的轨道沿其轴自动创建和更新。轨道创建在任何类型的普通方块上方。要结束轨道，需要中断线路。例如在轨道上方放置另一个方块或在轨道沿线留一个空缺。

## Servo Mode
在伺服模式下，设备通过数据端口接收的数据移动到精确位置。它接受所有值，并在最小和最大范围内做出相应反应。因此，如果接收到大于或小于范围的数值，它将移动到相应的最小/最大位置。

## Velocity Mode
在速度模式下，设备根据端口数据指示的方向连续运动，接受 `-1.0` 到 `+1.0` 之间的值来确定速度和移动方向。`1.0` 表示最大速度。

> - 安装在运动部件上的建筑不能与父级或同级建筑发生碰撞。它们只能与地形或其他独立建筑碰撞。
> - 要摧毁 Linear Track，您必须先移除其包含的所有子方块/组件。
> - Linear Track 的最大行程范围为 -250m 到 +250m（共 500m）。


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Position|meters|
|1|Speed|m/s|
|2|Minimum Position|meters|
|3|Maximum Position|meters|

![LinearTrackDemo](lineartrack.gif)
