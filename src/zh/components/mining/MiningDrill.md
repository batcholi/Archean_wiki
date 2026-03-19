<p align="center">
  <img src="MiningDrill.png" />
</p>

|Component|`MiningDrill`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 100 cm|
|**Push/Pull Item**|Initiate Push|
#
---

# Description
Mining Drill 是一种可以钻探地形以提取岩石的组件，提取的岩石可以粉碎后获得矿石。

# Usage
要使其工作，需要将其安装在使用 [Ground Anchor](../miscellaneous/GroundAnchor.md) 锚定到地面的建筑上。
您需要将其连接到 [Container](../storage/Container.md) 或任何其他接收物品的设备，以收集开采的岩石。

根据能源类型，它可以以不同的速度提取岩石。

|Energy|Power required|Speed|Depth|
|---|---|---|---|
|Low Voltage|10 kw|最多每秒 10 块岩石|每秒 0.01 米|
|High Voltage|100kw|最多每秒 100 块岩石|每秒 0.1 米|

## Data retrieval
Mining Drill 允许随时获取其所在位置的成分信息。
返回值为 [Key-Value objects](../../xenoncode/documentation.md#key-value-objects)，格式示例如下：`.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}`。
这表示该位置含有 12% 碳、5% 铁、3% 硅和 80% 铜。


## Efficiency & depletion
采矿区域并非无限的，随着钻探深度的增加会逐渐耗尽，效率也会相应降低。  
您需要不时地对其进行重新定位。


### List of outputs
|Channel|Function|
|---|---|
|0|Composition|
|1|Depth|
|2|Efficiency|
|3|MiningRate|
|4|DrillingRate|

