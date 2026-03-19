<p align="center">
  <img src="FluidJunction.png" />
</p>

|Component|`FluidJunction`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
Fluid Junction 是一种允许分流或合并流体的组件。

# Usage
Fluid Junction 按照下方示例图所示的逻辑传输流体。具有 4 个端口的面上的端口仅与只有 1 个端口的面上的端口进行通信。

当流体通过底部的单个端口进入时，会根据所连接组件的接收能力在四个顶部端口之间进行分配。如果所有端口都处于开启状态，流体将被均匀分配。但是，如果一个或多个端口关闭（例如由于 [Fluid Valve](./FluidValve.md)），流体总量将仅在仍能接收流量的剩余端口之间重新分配。

<p align="center">
  <img src="diagrFluidJunction.png" />
</p>
