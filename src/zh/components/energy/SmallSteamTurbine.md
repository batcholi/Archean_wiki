<p align="center">
  <img src="SmallSteamTurbine.png" />
</p>

|Component|`SmallSteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|75 x 75 x 150 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Small Steam Turbine 组件是 [Steam Turbine](SteamTurbine.md) 的紧凑版本，用于将热蒸汽的热能转换为电能。

# Usage
它通过将热水蒸汽注入其流体输入口来运行。蒸汽越热且流量越高，能产生的能量就越多。

满负荷运行时，最高可输出约 **270 千瓦**。

与任何蒸汽涡轮机一样，需要流体输出连接来排出蒸汽。没有输出连接，涡轮机将无法产生能量。

- 最低运行温度：373 K  
- 最高有效温度：650 K（最佳运行温度）  
- 最大流量：1 kg/s  

产生的能量直接输出到高压电气输出端。  

当功率未被完全消耗时，涡轮机会自动旁通以保持最大转速。
这种效果会导致输出流体的温度降低幅度减小。

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Potential Energy output (watts)|number|
