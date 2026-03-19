# 使用 XenonCode 添加功能

## 简介
为组件添加 XenonCode 脚本是**可选的**。如果你的组件不需要任何行为（没有屏幕、动画、物理或端口），你可以完全跳过此步骤。

要添加脚本，在你的组件文件夹中创建一个 `main.xc` 文件（例如 `mods/MYVENDOR_mymod/components/MyComponent/main.xc`）。此文件包含驱动组件在游戏中行为的 XenonCode 脚本。用于 modding 的 XenonCode 复用了游戏内的语法，同时暴露了与引擎集成和交互的额外 API。

> 参见 [Getting Started](getting-started.md) 了解如何创建 mod 并设置文件夹结构。

## 控制台输出
XenonCode 日志，无论是错误还是 print() 输出，都会显示在信息窗口中（默认 `V` 键）。此窗口显示最后 25 行日志，并在每次 XenonCode 脚本重新加载时清除其内容。对于编译或运行时错误，只显示一行错误消息，就像游戏内 IDE 一样。

## 宏
通过 XenonCode 进行 modding 引入了宏的概念，它让你声明将在脚本中使用的某些功能的存在。这些宏必须放在文件顶部、任何其他指令之前，并以 `#` 字符为前缀。

### 屏幕
```xc
#SCREEN "screen1" 80 40
; 从材质 "screen1" 创建一个 80x40 像素的屏幕。
```

### 命名 I/O 通道
在通过节点系统使用原生组件时，输入和输出通道被命名以便于识别。此宏允许你定义输入和输出通道的名称。
```xc
#DATAPORT input "data" 0 "Speed (km/h)"
; 将数据端口 "data" 的输入通道 0 的名称定义为 "Speed (km/h)"
#DATAPORT output "data" 3 "Velocity (m/s)"
; 将数据端口 "data" 的输出通道 3 的名称定义为 "Velocity (m/s)"
```
数据端口名称是在 Blender 中定义的名称。

### 信息菜单 (V)
```xc
#INFO text_info "Text1" "OK" "MyText"
; 添加一个由 "Text1" 标识的文本信息，标签为 "MyText"，默认值为 "OK"。
; 如果省略标签，则仅显示值而不带冒号。

#INFO numeric_info "Num1" 10 "MyNumber"
; 添加一个由 "Num1" 标识的数字信息，标签为 "MyNumber"，默认值为 10。

#INFO text "Text2" "This is the text" "This is the text label"
; 添加一个由 "Text2" 标识的文本字段，标签为 "This is the text label"，值为 "This is the text"。

; --------------------------------------------------------------------------------------------------------------------------

#INFO checkbox "Check1" 0 "MyCheckbox"
; 添加一个由 "Check1" 标识的复选框，标签为 "MyCheckbox"，默认值为 0（未选中）。

#INFO slider "Slider1" 20 0 100 "MySlider"
; 添加一个由 "Slider1" 标识的滑块，标签为 "MySlider"，默认值为 20，最小值为 0，最大值为 100。

#INFO drag "Drag1" 0 1 10 0.25 "MyDrag"
; 添加一个由 "Drag1" 标识的拖拽字段，标签为 "MyDrag"，默认值为 0，最小值为 1，最大值为 10，步长为 0.25。

#INFO button "Button1" "MyButton"
; 添加一个由 "Button1" 标识的按钮，标签为 "MyButton"。

; --------------------------------------------------------------------------------------------------------------------------

#INFO colorpicker "Color1" "MyCustomColor"
; 添加一个由 "Color1" 标识的颜色选择器，标签为 "MyCustomColor"。

```

> **注意：** <font color="orange">Text1、Num1 等标识符会被转换为小写。通过 get_info() 等函数调用时，请始终使用小写。</font>

### 信息菜单函数
```xc
get_info($name); 返回信息菜单中数字元素的值。
get_info_text($name); 返回信息菜单中文本元素的值。
set_info($name, $value); 设置信息菜单中元素的值。
```
## 入口点
```xc
#SCREEN screen1 80 40
var $screen = screen("screen1")

; 如果屏幕已分配给变量，获取屏幕的点击坐标：
click.$screen($x:number, $y:number)
	print($x, $y) ; 显示点击坐标

; 获取未分配给变量的屏幕或组件中任何材质的点击坐标：
click($x:number, $y:number, $material:text)
	if $material == "screen1"
		print($x, $y) ; 显示点击坐标
; 如果材质已通过 #SCREEN 宏声明为屏幕，XY 坐标将以像素为单位；否则将在 0.0 到 1.0 的范围内，根据材质的 UV 映射。

; click_hold 的工作方式与 click 相同，但在按钮按住时持续触发：
click_hold.$screen($x:number, $y:number)
click_hold($x:number, $y:number, $material:text)

; 鼠标滚轮事件的 scroll 入口点：
scroll.$screen($scroll:number) ; $scroll 为 -1 或 1
scroll($scroll:number, $x:number, $y:number, $material:text)
; 如果材质已通过 #SCREEN 宏声明为屏幕，XY 坐标将以像素为单位；否则将在 0.0 到 1.0 的范围内，根据材质的 UV 映射。
```

### 内置值
```xc
$num_value = delta_time ; tick 之间的时间间隔（秒）（等价于 1.0 / system_frequency）
```

## 函数列表

#### 屏幕
```xc
screen($materialName); 根据材质名称返回屏幕对象。
$screen.scroll ; 返回滚动值（-1、0 或 1）
;virtualscreen() 和 screen_copy() 可用，行为与 [Computer](../xenoncode/computer.md)/[Dashboard](../xenoncode/dashboard.md) 上相同。
```

#### 动画
```xc
animate($jointName, $axis, $speed [, $targetValue]); 动画化一个关节。
get_joint($jointName, $axis); 返回关节的当前值。
; $axis 是一个枚举——直接使用以下值之一（不加引号）：
; linear_x | linear_y | linear_z | angular_x | angular_y | angular_z
```

有关在 Blender 中创建关节和目标的更多信息，请参见[使用 Blender 进行 3D 建模](blender.md)。

#### 视觉效果
```xc
set_emissive($renderableName, $materialName, $color, $power); 设置材质的自发光。
set_light($target, $radius, $color, $power, $angle); 创建光源。
set_plasma($target, $radius, $depth, $temperature); 定义等离子体效果。
toggle_renderable($renderableName, $active); 启用或禁用网格。
```

#### 音频效果
```xc
play_tone_once($target, $toneMode, $frequency, $amplitude, $duration);
; 生成的一次性音调
play_tone($target, $toneMode, $frequency, $amplitude);
; 生成的循环音调

; $toneMode 是一个枚举——直接使用以下值之一（不加引号）
; sine_wave | square_wave | triangle_wave | sawtooth_wave;


play_sound_once($target, $audioFilePath[, $volume, $pitch, $innerRadius, $outerRadius, $begin, $end]);
; 一次性 .wav 播放
play_sound($target, $audioFilePath[, $volume, $pitch, $innerRadius, $outerRadius, $begin, $end]);
; 循环 .wav 播放

; $volume: 0.0 到 1.0（默认：0.5）
; $pitch: 0.1 到 4.0（默认：1.0）
; $inner/outer radius 定义声音的距离衰减。（默认：innerRadius=1，outerRadius=25）
; $begin/$end: 文件内的时间切片，单位为秒（默认：begin=0，end=-1 播放到结尾）

sound_info($audioFilePath)
; 返回包含音频文件信息的 KV 对象：
;   - duration（秒）
;   - sample_rate（赫兹）
;   - channels（声道数）
;   - size（字节）
```
> * 你可以在同一个目标上同时播放多个音频条目，但每个条目必须有不同的键。
>	键由 `$target` + `$audioFilePath` 构成。
>	这意味着如果你在同一个目标上用不同参数多次触发相同的音频文件，它将替换当前正在播放的同一键的实例。
> * 测试并保证的格式：.**wav**、.**ogg**、.**mp3**
>   *FMOD 音频引擎可以解码许多其他文件类型，但它们未在 Archean 中经过官方测试或支持*
>
> * 从 tick 或紧密循环中调用 **_once** 版本将在每个 tick 重新触发它们（_剧透：这可能不是你想要的_）。

#### 物理
```xc
apply_force($target, $force [, $applyAtCenterOfMass]); 沿目标节点的上方轴施加力。
apply_torque($target, $torque); 绕目标节点的上方轴施加扭矩。
set_mass($mass); 设置父实体的质量。
toggle_collider($colliderName, $active); 启用或禁用碰撞体。
```

#### 物理和环境信息
```xc
get_linear_velocity($target); 返回沿目标节点上方轴的线速度。
get_angular_velocity($target); 返回绕目标节点上方轴的角速度。
get_speed(); 返回父实体的绝对线速度。

get_environment($target, $includeTerrain); 返回目标节点处的环境属性。
; 以 KV 形式返回的属性列表：
;   - 大气成分（.molecule{摩尔分数}）。
;   - 重力（m/s²）。
;   - 温度（开尔文）。
;   - 压力（帕斯卡）。
;   - 密度（kg/m³）。
;   - 粘度（Pa·s）。
;   - 海拔（米）。
;   如果 $includeTerrain 为 true，还包括：
;   - 地面以上海拔（米）。
```

## 端口管理
### 能量
```xc
push_power($port, $voltage, $availablePower); 向端口提供电力并返回消耗的功率。
pull_power($port, $minimumVoltage, $consumedPower); 从端口拉取电力。返回可用功率。
```

### 流体
##### 函数
```xc
push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
; 将给定流体推送到连接到 $port 的设备，返回实际接受的质量。如果没有连接或 $mass <= 0，返回 0。

pull_fluid($port:text, $maxMass:number)
; 从连接的设备请求最多 $maxMass 的流体。返回包含拉取的成分和温度的 KV 对象。如果没有连接，返回空对象。

push_fluid_potential($port:text)
; 查询连接的设备当前可以从推送中接受多少流体，限制在 0 和 1 之间。依赖于设备实现 accept_push_fluid/accept_push_fluid_potential；如果端口无法处理推送入口点，返回 0。

pull_fluid_potential($port:text)
; 查询连接的设备在拉取时当前可以提供多少流体，限制在 0 和 1 之间。在另一个设备上使用 accept_pull_fluid/accept_pull_fluid_potential；如果端口无法服务拉取入口点，返回 0。
```

##### 入口点
当另一个设备对此组件调用该函数时。
```xc
accept_push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
; 当另一个设备尝试向此组件推送流体时调用。减少 $mass 以反映未接受的剩余部分（服务器将接受的质量计算为输入减去剩余）。

accept_pull_fluid($port:text, $maxMass:number, $compositionOut:text, $temperatureOut:number)
; 当另一个设备要拉取流体时调用。用导出的分子填充 $compositionOut 并设置 $temperatureOut。遵守 $maxMass 和你自己的存储限制，以便消费者只接收你能供应的量。

accept_pull_fluid_potential($port:text, $potentialOut:number)
; 报告你当前可以在此端口上提供的请求流体的比率（0-1）。当端口无法服务拉取或存储为空时，将 $potentialOut 保持为 0。

accept_push_fluid_potential($port:text, $potentialOut:number)
; 报告你当前可以在此端口上接受的输入流体的比率（0-1）。
```
_你可以在[流体代码片段](fluidSnippets.md)页面找到用于流体管理的 XenonCode 脚本示例列表。_

### 物品
```xc
push_item($port, $itemName, $itemProperties, $count); 向端口推送物品。返回接受的物品数量。
pull_item($port, $itemName, $maxCount, $maxMass); 从端口拉取物品。返回包含 itemName、count 和 properties 的 KV。
```

### 杂项
```xc
is_connected($port); 如果指定端口已连接返回 1，否则返回 0。
```
