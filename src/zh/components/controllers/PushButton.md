<p align="center">
  <img src="PushButton.png" />
</p>

|Component|`PushButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Push Button 在按下时持续发送 `1`，否则发送 `0`。

# Usage
按钮通过 `F` 键激活，只要按住该键就会保持激活状态。

## Configuration
在使用 `V` 键访问的配置菜单中：

| Option | Description |
|--------|-------------|
| **Dual-Sided** | 使按钮可从两侧使用 |
| **Single Pulse** | 启用后，按钮发送 `1` 持续一个 tick 然后立即重置为 `0`，而不是在按住时保持激活 |
