<p align="center">
    <img src="SolarSensor.png" />
</p>

|Component|`SolarSensor`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**| 1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#

---

# Description
Solar Sensor 是一种测量太阳入射角和潜在太阳能功率的组件。

# Usage
放置在建筑上后，该传感器可以连接到计算机以获取入射角的归一化值，通常表示太阳相对于传感器位置的位置。该传感器还可以获取接收到的潜在太阳能功率值，单位为 W/m²。

> - 可以不使用计算机，将这些传感器直接连接到铰链，实现太阳能板的太阳追踪。


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Normalized Angle|-1.0 to +1.0|
|1|Solar Power|W/m²|
