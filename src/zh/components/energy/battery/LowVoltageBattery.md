<p align="center">
  <img src="LowVoltageBattery.png" />
</p>

|Component|`LowVoltageBattery`|
|---|---|
|**Module**|`ARCHEAN_battery`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description
- 电压：44 至 52 伏，取决于当前充电状态
- 电流：每端口 1000 安培
- 总容量：10 kWh
- 电气端口：4 个
- 数据端口：1 个，用于电池状态监控

> **回收：**压碎后，此电池可返还约 **50%** 的制造原材料矿石。

# Usage
电池每端口提供 1000 安培，每个端口最高可提供 52 kW 为组件供电。

### List of outputs
|Channel|Function|
|---|---|
|0|Voltage|
|1|Max Capacity (Wh)|
|2|State of charge|
|3|Throughputs (watts)|
