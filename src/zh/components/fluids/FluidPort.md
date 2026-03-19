<p align="center">
  <img src="FluidPort.png" />
</p>

|Component|`FluidPort`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Accept Push/Pull|
#
---

# Description
Fluid Port 是一种允许吸入或排出流体的装置。

> <font color="green"> *此组件与建筑的增压相关，请参阅 [Pressurization](../../pressurization.md) 页面了解更多信息。*</font>

在吸入流体时，它会抽取周围环境的成分。例如，如果它浸没在水中，可以将 H2O 填入流体储罐；如果在空气中，则会抽取大气成分。

在排出流体时，它可以清空流体储罐中的内容物。

# Usage
Fluid Port 充当流体容器与周围环境成分之间的桥梁。

要运行，需要将其连接到任何能够容纳或处理流体的组件。

以下是一个连接方式的示例。

![FluidPortDemo](fluidportdemo.jpg)

## Flow Rate Limit

Fluid Port 的最大流量为 **1.0 m³/s**（基于体积，而非质量）。

由于限制是体积性的，实际**传输的质量取决于流体密度**：
- 高密度流体（液态水、液氧等液体）每秒传输更多质量
- 低密度流体（气体、高海拔大气）每秒传输较少质量
- 在真空中（密度 = 0），无法传输任何物质

例如：
- 水（~1000 kg/m³）：最高 1000 kg/s
- 海平面空气（~1.2 kg/m³）：最高 1.2 kg/s
- 高海拔空气（~0.4 kg/m³）：最高 0.4 kg/s

## Placement

放置 Fluid Port 时，请确保**喷嘴开口朝向**您要交互的区域。您可以将其平装在墙壁上，开口朝内——只要喷嘴指向舱室内部，它就能正常工作。

## Information Window

按 `V` 键可在 Fluid Port 上显示：
- **Environment density**（kg/m³）：采样点的密度
- **Environment Composition**：按体积百分比显示的流体成分

如果采样点位于增压体积内部，将显示该体积的内容物。否则，显示环境（大气、水等）的信息。
