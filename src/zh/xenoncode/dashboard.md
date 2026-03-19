# Dashboard
## 简介
使用 Dashboard Tool 时，各种元素如屏幕和标签可以用于显示信息，就像 [AIO computer](../components/computers/Computer.md) 的屏幕一样。然而，作为外部屏幕，在某些情况下其操作可能略有不同。

## Dashboard 屏幕/标签的首次使用
### 与 Dashboard 元素的通信
Dashboard 与游戏中大多数可用组件不同，它使用单个数据端口来访问仪表板上所有可用的元素。每个元素都有一个唯一的通信通道，可用于发送和接收数据。你可以通过在瞄准要交互的仪表板元素时按 `V` 键来获取通道。

*注意：通道按递增顺序分配，这意味着添加到仪表板的第一个元素将有通道 0，第二个将有通道 1，以此类推。如果移除一个元素，通道将被重新分配给下一个添加的元素。*
### 创建和使用 Dashboard 屏幕/标签
当使用 [computer](../components/computers/Computer.md) 的集成屏幕时，你可以直接在上面执行操作，例如将屏幕涂成红色或显示文本 "Hello World"。
```xc
init
    blank(red)
    write(0, 0, white, "Hello World")
```
在仪表板的上下文中，你必须先在变量中定义屏幕才能对其执行操作。
```xc
var $screen = screen(0,3) ;screen(aliasOrIoNumber, channelIndex)

init
    $screen.blank(red)
    $screen.write(0, 0, white, "Hello World")
```

### Dashboard 特定函数列表
假设我们已将变量 `$screen` 分配给我们的仪表板屏幕，以下是你可以用来与之交互的函数列表。

### 程序入口点
```xc
click.$screen ($x:number, $y:number)
; 当用户点击屏幕时执行此入口点，给出以像素为单位的 xy 坐标。
; 一个程序中可以定义多个 'click' 入口点，它们将按定义顺序执行。
```

### 内置值
```xc
$num_value = $screen.char_w ; 考虑当前文本大小后的字符宽度（像素）
$num_value = $screen.char_h ; 考虑当前文本大小后的字符高度（像素）

$num_value = $screen.width ; 虚拟显示器的宽度（像素）
$num_value = $screen.height ; 虚拟显示器的高度（像素）

$num_value = $screen.clicked ; 瞄准虚拟显示器时鼠标按钮是否被按下
$num_value = $screen.click_x ; 鼠标按钮按下时鼠标光标在虚拟显示器上的 x 坐标
$num_value = $screen.click_y ; 鼠标按钮按下时鼠标光标在虚拟显示器上的 y 坐标
```
    
### 屏幕渲染函数
```xc
$screen.blank($black) ; 用给定颜色清除屏幕

$screen.write(0, 0, green, "Hello") ; 在屏幕左上角写一条绿色的 Hello 消息
$screen.write(0, $screen.char_h, blue, "Hey") ; 在第一条消息下方写一条蓝色的 Hey 消息
; 注意 char_w 和 char_h 返回一个字符的像素大小 + 1 个额外像素，用作行间距乘数或计算文本宽度。

$screen.text_size(2) ; 将文本大小设为原始大小的两倍，仅对当前周期中后续的 write 有效，直到下次调用 text_size()
$screen.text_align(top_left) ; 将文本对齐设为 top_left，仅对当前周期中后续的 write 有效，直到下次调用 text_align()
;(top_left, top, top_right, left, center, right, bottom_left, bottom, bottom_right)
$screen.newline_spacing(3) ; 设置在 write() 中使用 "\n" 换行时的行间距，仅对当前周期中后续的 write 有效，直到下次调用 newline_spacing()


; 绘制函数使用位置 X 和 Y，其中 0,0 = 左上角，单位为像素。
; draw_point(x, y, color)
$screen.draw_point($screen.width/2, $screen.height/2, white) ; 在屏幕中央绘制一个白色像素点
; draw_line(x1, y1, x2, y2, color)
$screen.draw_line(0, 0, $screen.width, $screen.height, yellow) ; 绘制一条从左上角到右下角的黄色线条
; draw_rect(x1, y1, x2, y2, color [, fillcolor])
$screen.draw_rect(50, 50, 60, 60, red) ; 绘制一个红色正方形，从坐标 50,50（包含）到 60,60（不包含），实际大小为 10x10。
; draw_triangle(x1, y1, x2, y2, x3, y3, color [, fillcolor])
$screen.draw_triangle($screen.width/2, 0, 0, $screen.height, $screen.width, $screen.height, blue) ; 从屏幕顶部中间到底部两角绘制一个蓝色三角形
; draw_circle(x, y, radius, color [, fillcolor])
$screen.draw_circle($screen.width/2, $screen.height/2, 50, green) ; 在屏幕中央绘制一个半径 50 像素的绿色圆
; draw_poly(color, x1, y1, x2, y2, x3, y3, x4, y4)
$screen.draw_poly(yellow, 0, 0, 50, 50, 100, 0) ; 绘制一个有 3 个点的黄色多边形。点的数量没有限制，可以创建复杂的形状。

; 绘制函数也可以变成按钮。适用于 rect、triangle 和 circle。
if $screen.button_rect(0, 0, 40, 10, gray) ; 在屏幕左上角绘制一个灰色矩形按钮。点击时求值为 true。
    if user == owner
        print("The owner of this computer clicked the button")
    else
        print("The button was clicked by " & user) ; 向控制台打印消息（在本例中按钮被点击时）
; 这里我们还使用了内置值 'user' 和 'owner'，它们是玩家用户名

; 旧版 draw|button 函数，使用 width/height 参数（仍然支持）
; draw(x, y, color, width, height)
$screen.draw(0, 0, red, 50, 70) ; 在坐标 0,0 处绘制一个宽 50 高 70 的红色矩形
if $screen.button(10, 10, red, 30, 30) ; 在坐标 10,10 处绘制一个宽 30 高 30 的红色按钮。点击时求值为 true。
    print("The button was clicked")


var $somePixelColor = $screen.pixel(10, 10) ; 获取坐标 10,10 处像素的当前颜色
```
