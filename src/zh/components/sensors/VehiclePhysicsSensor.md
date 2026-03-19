<p align="center">
    <img src="VehiclePhysicsSensor.png" />
</p>

|Component|`VehiclePhysicsSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**| 1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#

---

# Description
Vehicle Physics Sensor 是一种提供载具物理状态、质量、尺寸、质心和 G 力信息的组件。

# Usage
放置在建筑上后，该传感器可以连接到计算机以获取载具的物理信息。以下是可以获取的信息：
- Active Physics：指示物理是否处于活动状态。
- Mass：载具的质量。
- Size (X,Y,Z)：载具的包围盒尺寸。
- Center of Mass (X,Y,Z)：质心相对于传感器位置的位置。
- G-force (X,Y,Z)：相对于传感器朝向的 G 力。

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Active Physics|0 or 1|
|1|Mass|kg|
|2|Size X|meters|
|3|Size Y|meters|
|4|Size Z|meters|
|5|Center of Mass X|meters|
|6|Center of Mass Y|meters|
|7|Center of Mass Z|meters|
|8|G-force X|G|
|9|G-force Y|G|
|10|G-force Z|G|
