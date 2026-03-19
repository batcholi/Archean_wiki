<p align="center">
  <img src="Crusher.png" />
</p>

|Component|`Crusher`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Item**|Accept Push, Initiate Push|
#
---

# Description
Crusher 是一种可以快速粉碎岩石以获取矿石的组件。

它还可以用于**回收任何可制造的物品**，将其还原为原材料。回收过程通过递归分解制作配方，返回 **100% 的主要资源**。

> **注意：**[电池](../energy/battery/LowVoltageBattery.md)有特殊的回收配方，只返回其制造成本的约 **50%**。这是为了防止利用回收系统通过粉碎和重新制造耗尽的电池来获得免费充电。

# Usage
Crusher 需要高压供电，消耗 10 kW。

要使用 Crusher，只需通过其物品输入端口发送待粉碎的岩石。它不会从输入端主动拉取，但能够将获得的矿石推送到任何接受物品的容器中。

Crusher 每秒可处理 400 kg 的岩石，与 4 台满功率运行的 [Mining Drill](MiningDrill.md) 的产出相匹配。

> 当岩石成分中某些矿石的浓度较低时，Crusher 会积累低浓度矿石，直到能够生产至少一单位该矿石。
