<p align="center">
  <img src="TiltSensor.png" />
</p>

|Component|`TiltSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Tilt Sensor 允许通过其数据端口发送基于水平面的当前倾斜度。

# Usage
放置在建筑上后，可以连接到计算机等设备以获取介于 `-1.0` 和 `+1.0` 之间的倾斜值。  
其长轴用作水平仪指示器。  
`-1.0` 或 `+1.0` 表示倾斜 90 度，一端完全朝下，另一端完全朝上，而 `0.0` 表示与水平面平齐。

> 在太空中不起作用
