<p align="center">
    <img src="Numpad.png" />
</p>

|Component|`Numpad`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---
# Description
Numpad 是一个提供触摸数字键盘的组件，用于向其他组件发送数值。

# Usage
您可以按 `F` 键使用数字键盘的触摸按钮输入数值，输入的内容将显示在 Numpad 屏幕上，但只有在按下确认按钮（绿色）后才会生效/更新。

黄色按钮允许您删除最后输入的数字，红色按钮允许您清除所有内容。

> - 如果当前值为负数，您可以按 `-` 触摸按钮使其变为正数。
> - 当按下确认按钮时，通道 1 会发送 `1` 持续 1 个 tick，否则发送 `0`。
