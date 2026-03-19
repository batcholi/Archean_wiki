<p align="center">
  <img src="ItemConveyor.png" />
</p>

|Component|`ItemConveyor`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 100 cm|
|**Push/Pull Item**|Initiate Push/Pull|
#
---

# Description
Item Conveyor 是一种允许将物品从一个位置移动到另一个位置的组件。它通过在输入端拉取物品并在输出端推送物品来运作。例如，可用于将物品从一个容器传输到另一个容器。

# Usage
Item Conveyor 需要低压供电，功耗与移动物品的流量成正比。

可以通过其信息窗口（按 `V` 键访问）或通过数据端口进行配置。
可用的配置选项有：

|Option|Value|Description|
|---|---|---|
|**Pull n items/sec**|1 to 1000|每秒移动的最大物品数量|
|**Pull x kg/sec**|0 to 1000 kg|每秒移动的最大物品质量|
|**Filter**|text|允许白名单指定特定类型的物品。例如，如果指定 "Wire"，则只允许电线通过|

> - Item Conveyor 一次只能过滤一种类型的物品。如果需要移动多种类型的物品，则需要使用多个传送带。
> - 过滤器区分大小写。

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|ON|0 or 1|
|1|Pull n items/second|1 to 1000|
|2|Filter|text|
|3|Pull x kg/second|0 to 1000|
