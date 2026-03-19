<p align="center">
  <img src="ToggleButton.png" />
</p>

|Component|`ToggleButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Toggle Button 在激活或停用时持续发送一个值。默认情况下，开启时发送 `1`，关闭时发送 `0`，但可以配置自定义值。

# Usage
使用 `F` 键来切换 Toggle Button 的状态。

## Configuration
在使用 `V` 键访问的配置菜单中：

| Option | Description |
|--------|-------------|
| **Dual-Sided** | 使按钮可从两侧使用 |
| **Allow IO Input** | 允许通过数据端口从其他组件控制按钮 |
| **Off Value** | 按钮关闭时发送的值（默认：`0`） |
| **On Value** | 按钮开启时发送的值（默认：`1`） |
