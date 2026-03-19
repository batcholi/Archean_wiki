<p align="center">
  <img src="DistanceSensor.png" />
</p>

|Component|`DistanceSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Distance Sensor 是一种激光测距仪，用于测量到最近表面（地形或建筑）的距离。它可以在可配置的范围内检测地形和其他建筑的碰撞体。

# Usage
放置在建筑上后，需要低压电源连接和数据连接才能工作。传感器沿其前表面发射射线。当 "Show Laser" 输入启用时，会显示一条可见的红色激光束直到检测到的表面。

### Range & Multi-tick Scanning
默认范围为 1000m（单 tick，即时结果）。可以通过 "Max Range" 输入通道将范围扩展到最大 25,000m。当范围超过 1000m 时，地形扫描会分布在多个服务器 tick 上（每 tick 128 个地形步进）：

|Range|Ticks|Delay|
|---|---|---|
|1,000 m|1|即时|
|5,000 m|5|~200 ms|
|10,000 m|10|~400 ms|
|25,000 m|25|~1 s|

> 实体检测（建筑）始终是即时的，与范围无关。只有地形追踪会分布在多个 tick 上。

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|On/Off|number (≠ 0 = on)|
|1|Show Laser|number (≠ 0 = on)|
|2|Max Range|number (meters, 1000-25000, default 1000)|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Distance|number (meters, -1 if out of range)|

>- 未激活或超出范围时，输出为 -1。
>- 传感器不会检测自身所在的建筑。
>- 传感器可以检测玩家角色。
