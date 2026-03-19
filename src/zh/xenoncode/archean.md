<!-- toc -->

## Archean XenonCode 文档

这是与 Archean 特定 XenonCode 实现相关的扩展文档。

有关 XenonCode 的基本语法，请参阅 [Documentation](documentation.md)。
根据上下文，某些功能可能不可用或行为有所不同。以下页面提供了这些上下文的更多详细信息：
- [Computer](computer.md)
- [Dashboard](dashboard.md)
- [HUD](hud.md)

---

## 所有上下文中可用的 Archean 特定功能
### Includes
Includes 可用于在程序之间共享功能、将多个程序合并为一个，或者只是保持程序整洁有序。
```xc
include "some_helper_functions.xc"
```

### 基本声明
```xc
var $num_value : number
const $speed_of_light = 299792458
```

### Storage 声明
```xc
storage var $memorized_value : number
storage array $memorized_names : text
;Storage 值在重启和程序修改之间保持不变。它们始终默认初始化为 0 或空。
```

### 程序入口点
```xc
init
; 此入口点在程序加载时执行一次。
; 一个程序中只能定义一个 'init' 入口点。

tick
; 此入口点在每个服务器 tick 执行一次。
; 一个程序中只能定义一个 'tick' 入口点。

timer interval 5
; 此入口点每 5 秒执行一次。
; 一个程序中可以定义多个 'timer interval' 入口点，它们将在各自的时间到来时在 tick 之后执行。
timer frequency 10
; 此入口点每秒执行 10 次。
; 一个程序中可以定义多个 'timer frequency' 入口点，它们将在各自的时间到来时在 tick 之后执行。
```

### 内置值
```xc
$num_value = time ; 当前时间，以十进制 Unix 时间戳表示，单位为秒，具有微秒精度
$num_value = pi ; 3.14159265.....
$num_value = 2pi ; 3.14159265 * 2
```
	
### 内置函数
```xc
; 随机数生成器
$num_value = random(0, 100) ; 返回 0 到 100 之间（包含）的随机整数值
$num_value = random ; 返回 0.0 到 1.0 之间的随机浮点值（恰好为 0.0 或 1.0 的概率极低）

; 游戏模式
$num_value = game_mode() ; 返回当前游戏模式（0 = Creative，1 = Adventure）

; 制作配方
var $categories = get_recipes_categories("crafter") ; 返回给定上下文的逗号分隔配方类别列表
var $recipes = get_recipes("crafter", "CATEGORY") ; 返回给定类别中逗号分隔的配方名称列表（类别必须为大写）
var $recipe = get_recipe("crafter", "recipeName") ; 返回一个包含成分名称和数量的键值文本对象
var $label = get_recipe_label("module.recipeName") ; 返回配方的显示标签（去除模块前缀）
```


### Color
```xc
var $blue = color(0, 0, 255) ; 返回由三个 0 到 255 之间的值给定的 RGB 颜色。始终假定完全不透明（如同 a 分量传入 255）。
var $translucentRed = color(255, 0, 0, 128) ; 返回由四个 0 到 255 之间的值给定的 RGBA 颜色。a 分量值 128 将有效为 50% 不透明度。0 表示透明。
var $redComponent = color_r($translucentRed) ; 实际上是上一个函数的反向操作，用于取回 255 的值。color_g、color_b 和 color_a 同理。

; 内置颜色
var $black = black
var $white = white
var $red = red
var $green = green
var $blue = blue
var $yellow = yellow
var $pink = pink
var $orange = orange
var $cyan = cyan
var $gray = gray
var $purple = purple
var $brown = brown
```
