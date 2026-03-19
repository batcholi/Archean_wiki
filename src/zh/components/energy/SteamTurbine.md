<p align="center">
  <img src="SteamTurbine.png" />
</p>

|Component|`SteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|150 x 200 x 200 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Steam Turbine 组件将热蒸汽的热能转换为电能。

# Usage
它通过将热水蒸汽注入其流体输入口来运行。蒸汽越热且流量越高，能产生的能量就越多。

满负荷运行时，最高可输出约 **27 兆瓦**。

需要流体输出连接。没有输出连接，涡轮机将无法排出蒸汽，也无法产生能量。

- 最低运行温度：373 K  
- 最高有效温度：650 K（最佳运行温度）  
- 最大流量：100 kg/s  

产生的能量直接输出到高压电气输出端。  

当功率未被完全消耗时，涡轮机会自动旁通以保持最大转速。
这种效果会导致输出流体的温度降低幅度减小。

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Potential Energy output (watts)|number|
