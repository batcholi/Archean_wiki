# Archean 中的 HUD 管理
## 简介
HUD（抬头显示器）系统允许玩家创建自己的图形界面，使用 XenonCode 在屏幕上显示文本、按钮、图形等信息。

HUD 完全由客户端管理，这意味着每个玩家都有自己的 HUD，其他玩家无法看到。但是，它们可以通过集成系统与 [Beacon](../components/navigation/Beacon.md) 或其他玩家进行通信，该系统允许在频率上发送和接收数据。

需要注意的是，由于 HUD 完全在客户端运行，它们将在你连接的所有服务器/世界上可用。你不能为特定的服务器/世界设置它们，除非按照下一节所述手动操作。

> 附加信息：
> - 在 HUD 上使用按钮或任何其他交互时，建议使用 `右键` 以避免抓取鼠标视角。

## 创建 HUD
由于 HUD 是完全客户端的功能，游戏中没有直接与之关联的物品。要创建 HUD，你需要通过游戏设置菜单 `F1` 进入 `HUD` 标签页。

![HUD Menu](hud-img/hudMenu.png)

从此菜单中，你可以创建任意数量的 HUD，并通过复选框随意激活/停用它们。重要的是要知道每个 HUD 是一个独立的实例，不会原生地与其他 HUD 通信，尽管可以通过本页稍后解释的功能进行通信。

创建 HUD 后，你可以打开其 IDE 来编写功能代码。

## 创建你的第一个图形界面
HUD 使用面板在屏幕上显示内容。面板可以包含图形元素，如文本、按钮、图形等。

你可以创建任意数量的面板并在屏幕上随意定位。
要创建面板，语法类似于你在 [dashboard](dashboard.md) 屏幕上可能看到的。
    
```xc
var $panel = panel(center, sizeX, sizeY)
```

在屏幕中央显示 "Hello World" 的 HUD 示例，使用 100x50 像素的灰色框

```xc
var $panel = panel(center, 100, 50)

init
    $panel.blank(gray)
    $panel.write(1, 1, cyan, "Hello World")
```

![Hello World](hud-img/hudExample.png)

# HUD 特定函数列表

### 与游戏窗口相关的函数
```xc
screen_w ; 返回游戏窗口的宽度
screen_h ; 返回游戏窗口的高度
screen_ratio ; 返回屏幕的宽高比（width/height）
fov ; 返回玩家摄像机视野角度（弧度）
aim_distance ; 返回玩家瞄准目标的距离（米）

mouse_x ; 返回鼠标在游戏窗口上的 x 位置
mouse_y ; 返回鼠标在游戏窗口上的 y 位置

set_resolution_scale($scale)
; 设置 HUD 的内部分辨率，从 1（全分辨率）到 8（低分辨率）。
; 默认值为 2。HUD 以屏幕分辨率除以 $scale 进行渲染。
; 最终显示大小受 ($scale * ui_scaling) 影响。
```
> 请记住，游戏设置中配置的 UI Scaling 会影响这些函数返回的值。

### 与面板相关的函数
```xc
var $myPanel = panel(center, $width, $height) ; 创建一个以屏幕为中心的面板，大小为 width, height
; 'Center' 可以替换为 'Top'、'top_left'、'top_right'、'bottom'、'bottom_left'...

$myPanel.set_position($x, $y) ; 将面板移动到位置 x, y
$myPanel.set_size($width, $height) ; 将面板调整为大小 width, height

$myPanel.width ; 返回面板的宽度
$myPanel.height ; 返回面板的高度
$myPanel.x ; 返回面板的 x 位置
$myPanel.y ; 返回面板的 y 位置
$myPanel.scroll ; 返回鼠标滚动值（-1、0 或 1）

; 入口点
click.$myPanel ($x:number, $y:number) ; 返回面板内的点击位置
```
注意：在面板上绘制的方式类似于 [dashboard screen](../xenoncode/dashboard.md#screen-rendering-functions)

### 与集成计算机相关的函数
```xc
set_cps(25) ; 设置每秒 HUD 周期数
tick ; 返回当前 tick 索引
language ; 返回玩家当前的语言代码（例如 "en"、"fr"）
mouse_look() ; 如果鼠标视角激活返回 1，否则返回 0
```

### 与通信相关的函数
```xc
var $beacon = beacon($transmitFreq, $receiveFreq) ; 允许发送/接收数据

var $data = $beacon.data ; 返回信标接收到的数据
var $distance = $beacon.distance ; 返回玩家与远程信标之间的距离
var $dir_x = $beacon.direction_x ; 返回玩家与远程信标之间的 x 方向
var $dir_y = $beacon.direction_y ; 返回玩家与远程信标之间的 y 方向
var $dir_z = $beacon.direction_z ; 返回玩家与远程信标之间的 z 方向
var $is_recv = $beacon.is_receiving ; 此信标是否在接收频率上接收数据

$beacon.transmit($data) ; 在发射频率上发送数据
```

# Shared Values
Shared Values 是一项允许检索和设置玩家客户端中信息的功能。

原生提供了一系列共享值，允许你检索有关玩家环境的信息。

```xc
var $comp = get("avatar_sensor_environment_composition") ; 返回玩家环境的成分
var $density = get("avatar_sensor_density") ; 返回玩家环境的密度
var $temp = get("avatar_sensor_temperature") ; 返回玩家环境的温度（开尔文）
var $gravity = get("avatar_sensor_gravity") ; 返回玩家环境的重力
var $speed = get("avatar_sensor_speed") ; 返回玩家的速度（m/s）
var $alt = get("avatar_sensor_altitude") ; 返回玩家的海拔（米）
var $alt = get("avatar_sensor_altitude_absolute") ; 返回玩家的绝对海拔（米）
var $view = get("avatar_is_3rd_person") ; 返回玩家是否处于第三人称视角

var $inv = get("avatar_inventory") ; 以键值字符串返回玩家的背包内容
var $belt = get("avatar_belt") ; 以键值字符串返回腰带内容
var $mass = get("avatar_mass") ; 返回包含背包的角色质量（kg）（角色基础质量为 100kg）
var $water = get("avatar_water_level") ; 返回玩家的水分等级
var $o2 = get("avatar_oxygen_level") ; 返回玩家的氧气等级
var $h2 = get("avatar_hydrogen_level") ; 返回玩家的氢气等级
```

## 创建自定义 Shared Values
可以创建自定义 Shared Values 来传输/接收信息，例如在 HUD 之间。
```xc
set("mySharedValue", "Hello World") ; 设置由 "mySharedValue" 标识的共享值为 "Hello World"
get("mySharedValue") ; 返回共享值 "mySharedValue" 的值
```

# 虚拟屏幕和 screen_copy
这些函数在 HUD 中可用，工作方式与计算机上相同。
请参阅 [virtualscreen](../xenoncode/computer.md#virtual-screen-function) 和 [screen_copy](../xenoncode/computer.md#screen-rendering-functions-draw-on-a-virtual-screen) 的文档。

# 示例
### 显示玩家速度的 HUD
```xc
var $panel = panel(top,100,12)

tick
	$panel.blank()
	$panel.text_align(top)
	$panel.write(1,1,cyan,text("Speed: {0} km/h", get("avatar_sensor_speed")*3.6))
```
<video controls width="600">
    <source src="hud-img/speedDemo.mp4" type="video/mp4">
</video>

### 追踪信标并显示距离的 HUD
```xc
var $panel = panel(center, 50,50)
var $beacon = beacon("", "target")

function @target_beacon($b:beacon, $p:panel, $width:number, $height:number, $color:number)
    if $b.direction_z > 0
        var $f = screen_w / (2 * tan(fov / 2))
        var $rz = $b.direction_z * (screen_w / screen_h)
        var $x_proj = ($b.direction_x * $f) / $rz
        var $y_proj = ($b.direction_y * $f) / $rz
        var $x = screen_w / 2 + $x_proj - $width / 2
        var $y = screen_h / 2 - $y_proj - $height / 2
        $p.set_position($x, $y)
        $p.set_size($width, $height)
        $p.blank()
        $p.draw_rect(0, 0, $width, $height, $color)
        $p.text_align(center)
        $p.write(text("{0.0} m", $b.distance))

tick
    @target_beacon($beacon, $panel, 50, 50, green)
```
<video controls width="600">
    <source src="hud-img/targetDemo.mp4" type="video/mp4">
</video>
