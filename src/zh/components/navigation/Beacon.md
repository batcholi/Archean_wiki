<p align="center">
  <img src="Beacon.png" />
</p>

|Component|`Beacon`|
|---|---|
|**Module**|`ARCHEAN_beacon`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Beacon 是一种允许向其他 Beacon 发送和/或接收数据的组件。

# Usage
要正常工作，Beacon 需要低压供电，运行时消耗 10 瓦。
可以通过数据端口或按 `V` 键访问的配置界面来设置发送和/或接收数据。

放置 Beacon 时，全息图上会出现一个箭头，指示 Beacon 的定位方向。

## Configuration Interface
- `Transmit Data`：允许发送 `数字/文本` 数据。
- `Transmit Frequency`：允许调整发送频率。
- `Receive Frequency`：允许调整接收频率。
#### Informations
- `Last Received Distance`：显示与上次接收数据的 Beacon 之间的距离（米）。
- `Last Received Direction`：显示上次接收数据的 Beacon 的方向（x,y,z）。
- `Last Received Data`：显示上次接收到的数据。
- `Is Receiving`：显示 Beacon 当前是否正在接收数据。

## Data Port
Beacon 有一个数据端口，允许通过计算机或其他组件使用它。

### List of outputs
|Channel|Function|Range|
|---|---|---|
|0|Data|number or text|
|1|Distance|number (meters)|
|2|Direction X|-1.0 to +1.0|
|3|Direction Y|-1.0 to +1.0|
|4|Direction Z|-1.0 to +1.0|
|5|Is Receiving|0 or 1|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Transmit Data|number or text|
|1|Transmit Frequency|number or text|
|2|Receive Frequency|number or text|

> 信息：
>- Beacon 之间的通信没有距离限制，但如果多个 Beacon 在同一频率上广播，最近的 Beacon 将优先。
>- Beacon 的信号不受障碍物影响。

> 提示：
>- Beacon 一次只能发送单个数据，可以是数字或文本。但您可以使用 [Key-Value objects](../../xenoncode/documentation.md#key-value-objects) 系统来发送所需数量的数据。
