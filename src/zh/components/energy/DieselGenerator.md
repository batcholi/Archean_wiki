<p align="center">
  <img src="DieselGenerator.png" />
</p>

|Component|`DieselGenerator`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|250 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push/Pull|
#
---

# Description
Diesel Generator 是一种燃烧液体燃料以产生高压电力的发电机组。
它最多可输出 **150 kW**，其参考燃料是十二烷（C12H26）。

# Usage
将燃料源连接到其流体端口，将低压电连接到起动机，并向其数据端口发送 1 以启动它。

起动机仅在启动期间消耗 1000 瓦低压电。有燃料可用时，发动机在一秒内启动。

产生的电力通过高压输出端口输出。燃料消耗随负载变化：满功率时约 10 g/s，怠速时为该值的 27 %。

发动机通过进气口吸入环境空气，并通过排气口排出废气。空气和排气端口可以改为连接管道；连接管道的进气口将取代环境空气。可用功率随空气中的氧气量减少而降低。

发动机在缺氧、排气被堵塞或燃料中断超过一秒时熄火。熄火后，向数据端口先发送 0 再发送 1 即可重新启动。

它可承受最高 55 % 的燃料污染（水、重质烃）而不磨损。超过此值则会磨损。

> **提示：** 要把 Oil Shale 变成可用燃料，请在 Chemical Furnace 中以 **600 K 至 700 K** 加热。

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Run|0 or 1|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Load|0.0 to 1.0|
|1|RPM|rpm|
|2|Fuel flow|kg/s|
|3|Running|0 or 1|
|4|State|"Off", "Starting", "Running", "Stalled", "Destroyed"|
