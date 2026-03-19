<p align="center">
  <img src="SmallTurboPump.png" />
</p>

|Component|`SmallTurboPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Small Turbo Pump 是一种用于传输高密度流体的组件，最大流量为每秒 10 kg。

# Usage
## Power Supply
要使用该泵，需要高压供电。满速运行时最高消耗 10 kW。

## Data
数据端口允许通过发送 `-1` 到 `1` 之间的值来控制泵速。
当泵连接到计算机时，还可以获取当前流量。

> 发送负值时，泵将反向运行。
