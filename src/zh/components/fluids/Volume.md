<p align="center">
  <img src="Volume.png" />
</p>

|Component|`Volume`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
Volume 组件添加到建筑后，会自动计算并定义其所占据的体积。此功能可用于：
- 设计自定义形状的燃料箱。  
- 确保特定环境（如潜艇、火箭）的舱室增压。  
- 制作飞艇……
- ……  

> <font color="green"><strong> 此组件与建筑的增压相关，请参阅 [Pressurization](../../pressurization.md) 页面了解更多信息。</strong></font>

# Usage
Volume 组件使用简便，无需特殊配置。只需将其添加到建筑中并点击 `Scan` 按钮，即可自动检测其所在密封舱室的体积。注意，它只计算其所在舱室的体积，而非整个建筑。您需要为每个要增压的舱室分别添加一个 Volume 组件。

该组件可以显示两种状态：
- `Airtight`：当舱室完全密封时，状态变为绿色。
- `Leak`：当舱室不气密时，状态变为红色。

Volume 屏幕仅显示密封舱室的体积，单位为立方米（m³）。如需更详细的信息，可以按 `V` 键访问其信息窗口。可用数据包括：
- `Volume capacity (m³)`：密封体积的总容量。
- `Contents Mass (kg)`：体积中内容物的总质量。
- `Pressure (kPa)`：密封舱室内的压力。
- `Liquid Level (%)`：液体填充百分比。
- `Composition`：不同流体的归一化百分比分布。

在创造模式下，会出现额外按钮，允许填充或清空体积。


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Level|0 to 1|
|1|Volume (m³)|number|
|2|State|text|

