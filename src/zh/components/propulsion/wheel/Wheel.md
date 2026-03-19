<p align="center">
  <img src="Wheel.png" />
</p>

|Component|`Wheel`|
|---|---|
|**Module**|`ARCHEAN_wheel`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 75 x 100 cm|
#
---

# Description
Wheel 是一种允许建筑前进/后退、转向和制动的组件。它包含可配置的悬挂和变速箱。

# Usage
可以通过按 `V` 键访问的配置界面进行配置。

### Configuration Interface
它提供轮子的信息并允许进行配置。
#### Information
- `Motor Rotation Speed`：电机转速，单位为转/秒。
- `Wheel Rotation Speed`：轮子转速，单位为转/秒。
- `Power`：功耗，单位为瓦。
- `Brake`：轮子制动值。
- `Ground Speed`：轮子相对于地面的速度，单位为 m/s。
- `Gear Ratio`：轮子速比。

#### Configuration
- `Mudguard`：显示/隐藏挡泥板。
- `Reverse`：反转轮子的旋转方向。
- `Grip`：调整轮子的抓地力。
- `Suspension`：调整轮子的悬挂。

### Energy
Wheel 有一个低压能源端口和一个高压能源端口。
### Low-Voltage Energy
在此配置下，轮子最高消耗 20 kW。
#### High-Voltage Energy
在此配置下，轮子最高消耗 200 kW。

> - 您可以通过 `V` 键访问的配置菜单反转轮子的旋转方向。这也会调整模型的方向，包括胎面花纹。此设置不会改变轮子的行驶方向。

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|Accelerate|-1.0 to +1.0|
|1|Steer|-1.0 to +1.0|
|2|Regen|0 or 1|
|3|Brake|0.0 to 1.0|
|4|Gearbox|-1.0 to +1.0|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Wheel Rotation Speed|rot/s|
|1|Ground Friction|0 to 1|
