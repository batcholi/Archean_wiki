<p align="center">
  <img src="PassiveRadiator.png" />
</p>

|Component|`PassiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
Passive Radiator 是一种通过与环境进行热交换或向太空辐射热量来缓慢冷却流体的组件。它不需要任何电力。

# Usage
其冷却效率取决于：
- 环境温度
- 周围环境的密度

热交换通过传导（密度越高效果越好）和辐射进行。  
当流体流过时，其温度趋向于与组件温度平衡。

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|

