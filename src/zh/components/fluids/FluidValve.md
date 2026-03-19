<p align="center">
  <img src="FluidValve.png" />
</p>

|Component|`FluidValve`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|accept Push/Pull -> forwards action to other side|
#
---

# Description
Fluid Valve 是一种允许控制通过其流体流量的组件。

# Usage
默认情况下，阀门处于关闭状态，阻止流体通过。要控制流体流量，需发送介于 `0（关闭）` 和 `1（开启）` 之间的数据信号。

阀门在通道 0 上输出流经其中的流体温度。
