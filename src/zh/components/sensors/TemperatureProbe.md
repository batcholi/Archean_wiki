<p align="center">
  <img src="TemperatureProbe.png" />
</p>

|Component|`TemperatureProbe`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|250 g|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|10 x 10 x 1 cm|
#
---

# Description
Temperature Probe 是一种测量其所附着的方块或面板温度的组件。

# Usage
附着在你的 build 上后，可以连接到 Computer以获取其探针尖端接触点处材料的温度。温度以开尔文（Kelvin）为单位提供，每 0.2 秒刷新一次。当它没有接触任何方块或面板时，读数为 0。

超过 1350 K 时，探针会受损。完全受损的探针读数为 0，可以修复。

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Temperature|Kelvin|
