<p align="center">
  <img src="ActiveRadiator.png" />
</p>

|Component|`ActiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|40 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
Active Radiator 是一种用于冷却流经其中的流体的组件。它配备了风扇，启动后能大幅提高与环境的热交换效率。

# Usage
该散热器需要：
- 电力供应
- 数据输入以激活风扇。

未供电时，其冷却能力非常有限。供电并激活后，它会缓慢地使循环流体与环境之间的温度趋于平衡。

它在供电时持续消耗 100 瓦。

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|

