<p align="center">
  <img src="PlayerSensor.png" />
</p>

|Component|`PlayerSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
PlayerSensor 在相对于传感器位置和朝向的可配置 3D 包围盒内检测玩家。它以 key-value 文本对象的形式输出检测到的玩家信息。

# Usage
放置在建筑上后，PlayerSensor 将检测进入其检测区域的任何玩家。检测区域是一个可以通过 `V` 键菜单配置的 3D 盒体。

传感器在通道 0 上以 key-value 文本对象的形式输出玩家信息，包含：
- 玩家 ID
- 用户名
- 与传感器的距离

### V key configuration
- **box_min**：检测盒的最小坐标（X, Y, Z）- 默认：-10, -10, -10
- **box_max**：检测盒的最大坐标（X, Y, Z）- 默认：+10, +10, +10

检测盒坐标相对于传感器的位置和朝向。

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Detected players|key-value text|

### Output format
输出为 key-value 文本对象：`.p<playerID>{.username{<name>}.distance{<meters>}}`

