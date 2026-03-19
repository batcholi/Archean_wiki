<p align="center">
  <img src="DashboardTool.png" />
</p>

|Item|`DashboardTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Dashboard Tool 用于以更灵活的方式设计包含小型组件的仪表板。它允许你在表面上放置屏幕、按钮、LED、标签和其他元素，以创建自定义控制面板和显示器。

# Usage
按 `C` 打开径向菜单并选择要放置的元素。

按 `V` 打开元素的 GetInfo 菜单以访问附加选项。

## 可用元素

### 屏幕

| 类型 | 分辨率 | 最大尺寸 |
|------|------------|----------|
| Standard Screen | 2 像素/cm (200 px/m) | 4 m |
| HD Screen | 6 像素/cm (600 px/m) | 50 cm |

HD Screen 提供 3 倍更高的像素密度以实现更精细的显示，但限制在 50 cm 以内。

屏幕每 20 ms 更新一次。

**GetInfo 选项 (`V`)：**
- **Matte**：在光泽和哑光表面之间切换

### 标签
标签的功能类似于屏幕，但分辨率为 5 像素/cm (500 px/m)，最大尺寸为 1 m。

标签每 500 ms 更新一次，更适合静态或变化缓慢的文本显示。

**GetInfo 选项 (`V`)：**
- **Text**：输入要显示的文本（支持多行）
- **Text Align**：Center、Left、Right、Top、Bottom、Top Left、Bottom Left、Top Right、Bottom Right
- **Text Size**：1 到 8
- **Color picker**：设置文本颜色

### 按钮

#### [PushButton](../components/controllers/PushButton.md)
按下时发送信号。

**GetInfo 选项 (`V`)：**
- **Single Pulse**：启用后，每次按下只发送一个脉冲，而不是按住时连续发送信号

#### [ToggleButton](../components/controllers/ToggleButton.md)
点击时在开/关状态之间切换。

**GetInfo 选项 (`V`)：**
- **Allow IO input**：接受输入信号来控制状态
- **Horizontal**：切换水平方向

#### ArrowButton
带旋转选项的方向按钮。

**GetInfo 选项 (`V`)：**
- **Rotation**：0-3（90° 增量）
- **Single Pulse**：与 PushButton 相同

### LED
LED 可以像按钮一样被点击，并可以显示自定义颜色。

**GetInfo 选项 (`V`)：**
- **Single Pulse (press)**：每次点击只发送一个脉冲
- **Color From Input**：从数据通道接收颜色值，而不是使用配置的颜色
- **Color picker**：设置 LED 颜色

### Trim
Trim 是一个装饰元素，可以以 1 cm 的精度放置，并以 1 cm 为增量调整大小，最大可达 4 m。适合为仪表板布局添加视觉分隔或边框。

## 将组件添加到仪表板
任何组件都可以放置在仪表板上的任意位置和方向。这允许将仪表、传感器或其他组件直接嵌入到你的仪表板设计中。

## 编程
有关使用 XenonCode 编程仪表板屏幕的信息，请参阅 [Dashboard XenonCode 文档](../xenoncode/dashboard.md)。
