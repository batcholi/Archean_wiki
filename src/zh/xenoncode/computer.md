# Computer

## Computer 特定函数

### 程序入口点
```xc
input.0 ($value0:number, $value1:number, $value2:text)
; 当从指定 IO 索引的输入接收到值时执行此入口点。
; 参数是每个通道接收到的值。可以提供任意数量的参数及其适当的类型。
; 每个程序中每个 IO 索引只能定义一个 'input' 入口点。

update
; 此入口点在每个服务器 tick 的每个周期结束时（定时器之后）执行。
; 一个程序中可以定义多个 'update' 入口点，它们将按定义顺序执行。

click ($x:number, $y:number)
; 当用户点击屏幕时执行此入口点，给出以像素为单位的 xy 坐标。
; 一个程序中可以定义多个 'click' 入口点，它们将按定义顺序执行。

click_hold ($x:number, $y:number)
; 当用户按住屏幕点击时持续执行此入口点，给出以像素为单位的 xy 坐标。
; 适用于拖拽交互或持续输入检测。
; 一个程序中可以定义多个 'click_hold' 入口点，它们将按定义顺序执行。

scroll ($delta:number)
; 当用户瞄准屏幕时滚动鼠标滚轮时执行此入口点。
; $delta 参数表示滚动方向和量（正值为向上滚动，负值为向下滚动）。
; 一个程序中可以定义多个 'scroll' 入口点，它们将按定义顺序执行。

shutdown
; 当计算机关机或重启之前执行此入口点（但崩溃时不执行）。
; 一个程序中可以定义多个 'shutdown' 入口点，它们将按定义顺序执行。
```

### 内置值
```xc
$num_value = delta_time ; tick 之间的时间间隔（秒）（等价于 1.0 / system_frequency）
$num_value = tick ; 自计算机启动以来的当前 tick 索引

$num_value = char_w ; 考虑当前文本大小后的字符宽度（像素）
$num_value = char_h ; 考虑当前文本大小后的字符高度（像素）

$num_value = screen_w ; 虚拟显示器的宽度（像素）
$num_value = screen_h ; 虚拟显示器的高度（像素）

$num_value = clicked ; 瞄准虚拟显示器时鼠标按钮是否被按下
$num_value = click_x ; 鼠标按钮按下时鼠标光标在虚拟显示器上的 x 坐标
$num_value = click_y ; 鼠标按钮按下时鼠标光标在虚拟显示器上的 y 坐标
$num_value = scroll ; 滚轮增量值（正值为向上滚动，负值为向下滚动）

$num_value = system_frequency ; 系统时钟频率（赫兹，每秒 tick 数）
$num_value = programs_count ; 当前虚拟 HDD 上的程序数量
$num_value = system_ipc ; 虚拟 CPU 的每周期最大指令数 (IPC)
$num_value = system_ram ; RAM 中的最大变量数
$num_value = ipc ; 虚拟 CPU 的每周期指令数 (IPC)
```
	
### 内置函数
```xc
var $programName = program_name(0) ; 返回程序名，给定 0 到 programs_count-1 之间的索引
load_program($programName) ; 加载程序并调用其 init 函数（先卸载当前运行的程序，对其调用 shutdown）
reboot() ; 重启计算机（调用 shutdown 入口点并加载 BIOS 或主程序）

$text_value = device_type(aliasOrIoNumber) ; 返回给定 IO 索引的设备类型
```

### Screen Override
Computer 可以覆盖连接到它的任何组件的屏幕。这允许你用 XenonCode 程序渲染的自定义图形替换组件的默认显示。

要启用屏幕覆盖：
1. 使用 `V` 打开组件的 GetInfo 菜单
2. 勾选 **Override Screen** 选项
3. 在代码中使用 `screen(ioIndex, channel)` 引用屏幕并像其他屏幕一样在上面绘制

### IO
Computer 可以直接解析组件别名而无需 Router。只需将别名作为 IO 函数的第一个参数即可。

```xc
; input_[number|text](aliasOrIoNumber, channelIndex) ; 返回给定别名和索引的输入值
var $someNumber = input_number("", 0)
var $someText = input_text("", 0)

; output_[number|text](aliasOrIoNumber, channelIndex, value) ; 将给定值发送到给定别名和索引的输出
output_number(0, 0, $num_value) ; 向别名为 computer 的输出发送数字
output_number("computer", 0, $num_value) ; 向别名为 computer 的输出发送数字
output_text("computer", 0, "hello") ; 向别名为 computer 的输出发送文本 hello
```
	
	
### 屏幕渲染函数（在虚拟屏幕上绘制）
```xc
blank($black) ; 用给定颜色清除屏幕

write(0, 0, green, "Hello") ; 在屏幕左上角写一条绿色的 Hello 消息
write(0, char_h, blue, "Hey") ; 在第一条消息下方写一条蓝色的 Hey 消息
; 注意 char_w 和 char_h 返回一个字符的像素大小 + 1 个额外像素，用作行间距乘数或计算文本宽度。

text_size(2) ; 将文本大小设为原始大小的两倍，仅对当前周期中后续的 write 有效，直到下次调用 text_size()
text_align(top_left) ; 将文本对齐设为 top_left，仅对当前周期中后续的 write 有效，直到下次调用 text_align()
;(top_left, top, top_right, left, center, right, bottom_left, bottom, bottom_right)
newline_spacing(3) ; 设置在 write() 中使用 "\n" 换行时的行间距，仅对当前周期中后续的 write 有效，直到下次调用 newline_spacing()


; 绘制函数使用位置 X 和 Y，其中 0,0 = 左上角，单位为像素。
; draw_point(x, y, color)
draw_point(screen_w/2, screen_h/2, white) ; 在屏幕中央绘制一个白色像素点
; draw_line(x1, y1, x2, y2, color)
draw_line(0, 0, screen_w, screen_h, yellow) ; 绘制一条从左上角到右下角的黄色线条
; draw_rect(x1, y1, x2, y2, color [, fillcolor])
draw_rect(50, 50, 60, 60, red) ; 绘制一个红色正方形，从坐标 50,50（包含）到 60,60（不包含），实际大小为 10x10。
; draw_triangle(x1, y1, x2, y2, x3, y3, color [, fillcolor])
draw_triangle(screen_w/2, 0, 0, screen_h, screen_w, screen_h, blue) ; 从屏幕顶部中间到底部两角绘制一个蓝色三角形
; draw_circle(x, y, radius, color [, fillcolor])
draw_circle(screen_w/2, screen_h/2, 50, green) ; 在屏幕中央绘制一个半径 50 像素的绿色圆
; draw_poly(color, x1, y1, x2, y2, x3, y3, x4, y4)
draw_poly(yellow, 0, 0, 50, 50, 100, 0) ; 绘制一个有 3 个点的黄色多边形。点的数量没有限制，可以创建复杂的形状。

; 绘制函数也可以变成按钮。适用于 rect、triangle 和 circle。
if button_rect(0, 0, 40, 10, gray) ; 在屏幕左上角绘制一个灰色矩形按钮。点击时求值为 true。
    if user == owner
        print("The owner of this computer clicked the button")
    else
        print("The button was clicked by " & user) ; 向控制台打印消息（在本例中按钮被点击时）
; 这里我们还使用了内置值 'user'、'username' 和 'owner'
; 'user' 返回点击玩家的用户令牌（文本）
; 'username' 返回点击玩家的用户名（文本）
; 'owner' 返回计算机所有者的用户令牌（文本）

; 旧版 draw|button 函数，使用 width/height 参数（仍然支持）
; draw(x, y, color, width, height)
draw(0, 0, red, 50, 70) ; 在坐标 0,0 处绘制一个宽 50 高 70 的红色矩形
if button(10, 10, red, 30, 30) ; 在坐标 10,10 处绘制一个宽 30 高 30 的红色按钮。点击时求值为 true。
    print("The button was clicked")


var $somePixelColor = pixel(10, 10) ; 获取坐标 10,10 处像素的当前颜色

; 从一个屏幕复制区域到另一个屏幕
screen_copy($sprites, $dash, $src_x, $src_y, $dst_x, $dst_y, $width, $height, $color, $rotation, $bilinear)
; $color、$rotation 和 $bilinear 参数是可选的。
; $color    ：对复制区域应用色调。使用 -1 不应用色调。
; $rotation ：旋转复制区域（以度为单位，顺时针）。
; $bilinear ：启用双线性插值。设为 1 启用
```

### 虚拟屏幕函数
允许使用 XenonCode 创建虚拟屏幕。这种由代码定义的屏幕不是物理屏幕，主要用于存储视觉数据。然后可以使用 `screen_copy()` 函数将此数据复制到物理屏幕，这比重新绘制更快。

典型用途：将精灵存储在虚拟屏幕中，一次性全部复制到物理屏幕。例如，创建复杂的背景并一次性复制，而不是每次重新绘制。

避免在循环中在虚拟屏幕上绘制，因为这与直接在物理屏幕上绘制一样慢。虽然在某些用例中这可能有用，但我们建议以静态方式使用。


```xc
var $vScreen = virtualscreen(100, 200) ;virtualscreen(width, height)
;虚拟屏幕的最大尺寸为 10000x10000 像素。

init
    $vScreen.blank(black); 用黑色清除虚拟屏幕
    $vScreen.write(0, 0, white, "Hello World") ; 在虚拟屏幕左上角写一条白色的 "Hello World" 消息
```
