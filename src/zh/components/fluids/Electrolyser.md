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
Electrolyser 需要高压电力输入，运行时最高消耗 10 kW，并根据可用功率线性比例生产，在满功率 10 kW 下每秒最多可处理 1 kg 的水。

要启动电解过程，只需将水源连接到其蓝色输入端口。水源可以来自浸没在水中的 [Fluid Port](../fluids/FluidPort.md)（例如直接从海水中提取水），或者来自装有水的储罐。

产生的氢气和氧气可以分别从黄色（H2）和青色（O2）输出端口收集。

### Production
Electrolyser 每秒最多可处理 1 kg 的水，每秒可提供约 [0.9 kg 氧气和 0.1 kg 氢气](# "O2:0.88kg / H2:0.11kg")。
