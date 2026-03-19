<p align="center">
  <img src="ThrottleLever.png" />
</p>

|Component|`ThrottleLever`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Throttle Lever 是一种控制器，根据杆的位置持续发送模拟值。输出值映射到可配置的范围（默认 `-1.0` 到 `+1.0`）。

# Usage
通过按住 `F` 键并`上下移动鼠标`来控制推杆。

> - 推杆中心位置有阻力，帮助精确找到中心位置。
> - 可以在使用 `V` 键访问的配置菜单中配置推杆的 **Min** 和 **Max** 值，以及**回中吸附**功能。
> - 可以通过在配置菜单中启用 "Allow IO Input" 模式，使推杆通过数据端口被其他组件控制。
