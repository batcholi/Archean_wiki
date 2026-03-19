<p align="center">
  <img src="RTG.png" />
</p>

|Component|`RTG`|
|---|---|
|**Module**|`ARCHEAN_rtg`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 100 cm|
#
---

# Description
放射性同位素热电发电机（RTG）产生低压能量。它可以根据环境的散热能力提供持续功率。

# Usage
将 RTG 连接到需要低压能量运行的组件。

RTG 有两个电气端口，允许您同时连接两个组件或链接多个 RTG 以增加总功率输出。

### List of outputs
|Channel|Function|
|---|---|
|0|Generated Power (Watts)|
|1|Output Power (Watts)|

> - RTG 最高可产生 **12 kW** 的功率。其实际输出取决于环境的散热能力（在太空真空中降至约 6 kW）。它不会对玩家或环境产生任何有害影响。
>
> - 如果您使用 RTG 为两个组件供电，两个端口分配的总功率不能超过 RTG 的可用输出功率。
>
> - 如果两个组件之一想要消耗 RTG 的全部可用功率，可能会导致另一个组件完全无法使用电力。在这种情况下，最好使用电力 Junction，以确保所有组件均等地获得电力。


# How to produce Plutonium

## 钚生产流程

|步骤|输入|输出|温度|
|---|---|---|---|
|Crusher|Uranium Ore: 1000 g|Uranium Powder (U) : 1000 g (U235 : 10%, U238 : 90%)|-|
|ChemicalFurnace（黄饼 - U₃O₈）|Uranium Powder (U) : 0.714 g, O₂ : 0.128 g|Yellow Cake (U₃O₈) : 0.842 g|750K - 950K|
|ChemicalFurnace（二氧化铀 - UO₂）|Yellow Cake (U₃O₈) : 0.842 g, H₂ : 0.004 g|Uranium Dioxide (UO₂) : 0.810 g, H₂O : 0.036 g|850K - 1050K|
|Crafter|Uranium Dioxide (UO₂) : 1000 g|Uranium Rod (U235 : 10%, U238 : 90%) : 1|-|
|Crusher|Uranium Rod|Plutonium Dioxide (PuO₂) : 1 g (Pu : 100%)|-|
|Crafter|Plutonium Dioxide (PuO₂) : 5000 g|Plutonium Pellet : 1|-|

> 建议使用低浓缩铀（LEU）进行钚生产。浓缩程度不影响获得的钚数量。

---

# Additional Information
<font color="orange">
在现实中，从乏核燃料中提取钚是一项极其复杂和苛刻的工业操作，需要先进的基础设施和专业设施。因此，Archean 目前不支持钚的回收和再处理。  

相反，RTG 使用专门为能量生产而制造的简化形式的钚。虽然这种替代品仍然比现实世界中的钚更容易处理，但其生产比之前版本的游戏更具挑战性，使得 RTG 不再那么容易获得，同时对高级玩家仍然可以达成。
</font>
