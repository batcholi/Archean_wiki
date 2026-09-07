<p align="center">
  <img src="Electrolyser.png" />
</p>

|Component|`Electrolyser`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Electrolyser 是一种能够将水分解为氢气和氧气的组件。

# Usage
Electrolyser 需要高压电力输入，运行时最高消耗 16 MW，并根据可用功率线性比例生产，在 16 MW 下每秒最多可处理 1 kg 的水，即每 kg 氢气约需 40 kWh。它至少需要 1 kW 才能运行：低于该阈值时不产生任何东西。

要启动电解过程，只需将水源连接到其蓝色输入端口。水源可以来自浸没在水中的 [Fluid Port](../fluids/FluidPort.md)（例如直接从海水中提取水），或者来自装有水的储罐。

产生的氢气和氧气可以分别从黄色（H2）和青色（O2）输出端口收集。

### Production
Electrolyser 每秒最多可处理 1 kg 的水，每秒可提供约 [0.9 kg 氧气和 0.1 kg 氢气](# "O2:0.88kg / H2:0.11kg")。

当两个输出储罐都已满时，Electrolyser 以 50 W 待机，并在其中任一储罐重新接受气体时自动恢复运行。

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|功率设定，占额定 16 MW 的比例（0 = 关闭，1 = 电源提供的全部功率）|0.0 到 1.0|

### List of outputs
|Channel|Function|
|---|---|
|0|消耗功率（瓦）|
|1|处理的水（kg/s）|
|2|产生的氢气（kg/s）|
|3|产生的氧气（kg/s）|
