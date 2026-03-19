<p align="center">
  <img src="FluidPump.png" />
</p>

|Component|`FluidPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Fluid Pump 是一种用于传输流体的组件，最大流量为每秒 1 kg。与涡轮泵不同，它使用低压电源运行，并能即时响应控制输入，实现高响应性的流体管理。

# Usage
## Power Supply
要使用该泵，需要低压供电。满速运行时最高消耗 1 kW。

## Data
数据端口允许通过发送 `-1` 到 `1` 之间的值来控制泵速。  
当泵连接到计算机时，还可以获取当前流量。

> 发送负值时，泵将反向运行。
