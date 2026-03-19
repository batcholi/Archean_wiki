<p align="center">
  <img src="SlopeLight.png" />
</p>

|Component|`SlopeLight`|
|---|---|
|**Module**|`ARCHEAN_light`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---
# Description
SlopeLight 是一种紧凑型照明组件，专为安装在斜面上设计。默认照射角度为 120°。

# Usage
SlopeLight 需要低压供电，根据其信息菜单（按 `V` 键访问）中设置的功率，最高消耗 1000 W。

灯光的颜色和角度可以通过信息菜单（`V` 键）或数据端口进行配置。

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|

### V key configuration
- **Max Power**：可在 0 到 1000 W 之间调节（默认：200 W）
- **Angle**：可在 20° 到 120° 之间调节
- **RGB**：灯光颜色选择器
