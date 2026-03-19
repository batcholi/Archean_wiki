<p align="center">
  <img src="AltitudeSensor.png" />
</p>

|Component|`AltitudeSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Altitude Sensor 通过其数据端口发送传感器位置与地面或天体中心之间的高度。

# Usage
放置在建筑上后，可以连接到计算机等设备以获取高度（米）。Altitude Sensor 的朝向不影响其工作。

### List of outputs
|Channel|Function|
|---|---|
|0|Absolute Altitude|
|1|Above Terrain|

>- 在 "Above Terrain" 模式下，水不被视为地形。
>- Altitude Sensor 仅在天体环境中工作。
