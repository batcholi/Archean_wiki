# XenonCode - Documentation

**XenonCode** 是一种轻量级编程语言，设计为游戏中虚拟计算设备（即：游戏中的可编程计算机）的高级脚本语言。

# Capabilities

- 类型化变量
- 常量
- 动态数组
- 向量和矩阵（最高 4x4）支持 swizzling
- 对数值的标准算术运算
- 简便的字符串连接和格式化
- 用户自定义函数
- 设备定义的函数和对象
- 尾随/成员函数
- 内置标准数学函数
- 内置虚拟设备间的 IO 操作
- 内置键值对象
- 同步间隔函数（定时器）
- `if`/`elseif`/`else` 条件语句
- `while` 循环
- `foreach` 数组循环
- `repeat n` 循环
- `for` 带首尾索引的循环

# Sample code

```xc
include "my_functions.xc"

; Declare global storage
storage var $myStorageVar : number
storage array $myStorageArray : number

; Declare global variables
var $myVar = 0
var $myVar2 = "Hello World"
var $myVar3 : number
var $myVar4 : text
array $myArray : number
array $myArray2 : text

; Declare a user-defined function that changes the values of $myVar and $myVar2
function @myFunction($arg1 : number, $arg2 : text)
	$myVar = $arg1
	$myVar2 = $arg2

; Declare a user-defined function that returns a value
function @myFunction2($arg1 : number, $arg2 : text) : number
	return $arg1 + size($arg2)

init
	; Call a user-defined function
	@myFunction(1, "Hello")

	; Call a trailing function
	$myVar.@myFunction2("Hey")

	; Add values to an array
	$myArray.append(1)
	$myArray.append(5)
	$myArray.append(0)

	; Sort an array
	$myArray.sort()

	; Iterate over an array
	foreach $myArray ($index, $item)
		$myVar4 &= $index:text & ": " & $item:text & ", "

	; Output to a virtual device (ie: a console at input port 0)
	output.0 ($myVar4)
	output.0 (text("Sum of values in the array: {}", $myArray.sum))
	output.1 ($myArray.0:text)
	output.1 ($myArray.1:text)
	var $index = 2
	output.1 ($myArray.$index:text)
	
	; Repeat a statement three times
	repeat 3 ($i)
		output.1 ($i)

	; for loops
	for 3,8 ($i)
		; value of $i will go from 3 to 8 inclusively
	
```

## 开发者类型

1. `User`：使用此语言编写脚本的人，通常是游戏中的玩家。
2. `Device`：定义功能和可用函数的实现，通常是特定游戏中特定类型的可编程虚拟设备。

# Syntax

XenonCode 的设计理念是非常基础的语法和非常精确的结构。

- 每条语句都应短小且易于阅读
- 需要的特殊字符极少
- 比大多数其他语言更少晦涩难懂
- 缩进定义作用域（仅使用 Tab，没有歧义）
- 每行一条指令
- 数组索引与大多数编程语言一样从 0 开始，但使用 `arr.0` 点表示法代替典型的 `arr[0]` 下标表示法
- 100% 不区分大小写
- 实现可以定义自定义的 "Device" 函数、对象和入口点

### Types

XenonCode 是一种类型化语言，但只包含两种通用类型，以及两者的数组，和实现定义的对象。

用户可以声明的通用数据类型：
- `number`
- `text`
- `vecN`（固定大小的数值向量，例如 `vec3`）
- `matNxM`（固定大小的数值矩阵，例如 `mat4x4`）

`number` 变量在内部始终是 64 位浮点数，但当其值为 1 或 0（true 或 false）时也可以作为布尔值使用，不过任何非零值都被求值为 true。

`text` 变量包含纯 Unicode 文本，其最大大小取决于实现。
文本字面量定义在双引号 `" "` 内。
要在文本中使用双引号字符，可以将其重复。
没有其他转义序列机制。反斜杠 `\` 只是字符串的一部分，实现可以决定用它来做转义序列。
```xc
var $myText = "Say ""Hello"" to this text"
```

对象类型供实现使用，对用户来说是不透明的，意味着它们的结构不一定被定义，但实现可以为用户提供这些对象的一些成员函数。

尽管这是一种类型化语言，但当编译器在初始化期间可以自动推断类型时，不需要指定类型。只有在没有初始化时才需要指定类型。

所有用户自定义的词都必须以前缀字符开头：
- `$` 用于变量
- `@` 用于函数

### Comments

注释是以 `;` 开头的行。
代码语句也可以以尾随注释结尾。
注意：`//` 已被弃用，不应使用。

# Limitations
此语言设计为可能在多人游戏的服务器端执行，因此出于安全和性能原因，用户能做的事情有限制。

- 没有指针或引用类型（实现定义的对象除外，这些对象必须由实现在运行时进行清理）
- 每个周期的指令数可能受到限制，超出可能导致用户的虚拟崩溃
- 数组大小可能在运行时受到限制，超出可能触发用户的虚拟崩溃
- 允许递归调用函数（递归调用函数本身），使用特定语法且限制为 16 次递归
- 函数必须在使用之前完全定义，因此定义顺序很重要（这是强制执行上一点的方式）

### 每个虚拟计算机的限制
这些由实现定义，可能包括多种变体或可由用户自定义

- ROM（最大编译程序大小，以 32 位字为单位）
- RAM（最大局部、全局和临时变量数加上所有局部和全局数组乘以其大小）
- STORAGE（最大存储变量数加上所有存储数组乘以其大小）
- Frequency（定时器函数和输入读取的最大频率）
- Ports（最大输入/输出数）
- IPC（每周期最大指令数，一行代码可能计为多条指令）

### 数据操作
- 所有函数（包括定时器）都是原子性执行的，防止任何数据竞争
- 函数参数始终按值传递，函数不能修改放在其参数列表中的变量
- 尾随函数会修改前导变量的值
- 通用类型的变量赋值始终复制值
- 实现定义的对象始终按引用传递
- 实现定义的对象不能被复制，除非实现通过设备函数提供该功能
- 除以零会导致运行时错误。用户有责任确保对此进行处理。

### 基本规则
- 变量可以使用 `var` 声明，并可选地分配初始值，否则使用通用默认值（number 为 0，text 为 ""）
- 对象变量必须在声明时使用构造函数或返回该类型对象的设备函数进行赋值
- 以变量名（以 `$` 开头）开始的语句意味着我们正在修改其值
- 如果变量赋值后的下一个词是 `=`，则后续表达式的结果将作为其值赋值
- 如果变量赋值后的下一个词是点和函数，则该函数调用被视为尾随函数
- 调用尾随函数会修改前导变量的值，该变量也作为函数的第一个参数使用，调用时必须从参数列表中省略
- 以函数名（用户自定义函数以 `@` 开头）开始的语句意味着我们正在调用该函数并丢弃其返回值
- 调用函数永远不会修改在括号内传递的任何通用类型参数的值，通用类型始终按值传递
- 括号中未被函数名前置的任何内容被视为单独的表达式，最内层最左边的表达式最先计算
- 数学运算符的优先级遵循通常规则

# Valid usage

XenonCode 设计为编译成字节码，这种字节码在运行时非常快速地被宿主游戏解析。

## 每行必须以以下首词之一开始（附示例）：

### 全局作用域
- `include` 导入另一个文件的内容
- `const` 声明全局常量
- `var` 声明全局变量
- `array` 声明全局数组
- `storage` 声明存储变量或数组，在断电重启后仍然持久保存
- `init` 定义 init 函数体，设备通电时执行一次
- `tick` 声明 tick 函数体，每个时钟周期执行一次
- `function` 声明用户自定义函数
- `recursive function` 声明可以递归调用自身的用户自定义函数
- `timer` 定义以特定频率（Hz）重复执行的函数体
- `input` 定义输入函数
- `;` 注释
- 实现定义的入口点
- 一个或多个 Tab，意味着我们在函数体内，然后适用以下规则：

### 函数体 / 入口点
- `var` 在当前局部作用域声明新变量（从函数外部无法访问）
- `array` 在当前局部作用域声明新数组（从函数外部无法访问）
- `$` 为现有变量赋新值
- `@` 调用用户自定义函数
- `output` 内置函数，通过特定端口向另一个设备发送数据
- `foreach` 遍历数组的所有项
- `repeat` 将代码块重复 n 次
- `while` 在条件求值为 true 时循环
- `for` 根据给定的首末索引循环代码块
- `break` 在此处停止循环，如同已完成所有迭代
- `continue` 在此处停止当前迭代并立即运行下一次迭代
- `if` 如果条件求值为 true 则运行代码块
- `elseif` 在 if 之后，当之前的条件求值为 false 且新条件求值为 true 时
- `else` 在 if 之后，当所有条件都求值为 false 时
- `return` 在此处停止函数执行并向调用者返回一个值

## 保留关键字
由于所有用户自定义的词都必须以 `$` 或 `@` 开头，因此不需要保留字。
实现/设备必须注意只定义不与其使用的 XenonCode 版本的内置关键字冲突的函数名和对象类型。

## 声明常量
常量是在程序执行过程中不应改变的命名值。它们是在编译时定义的固定值。
它们的赋值必须明确给出，且必须是在编译时可以确定结果的表达式。

`const $stuff = 5` 声明一个名为 $stuff 的常量，其值为数字 5
`const $stuff = "hello"` 声明一个名为 $stuff 的常量，其值为文本 "hello"

## 声明变量
变量是在程序执行过程中可以改变的命名值。
我们可以为其分配初始值，也可以不分配。
如果不分配初始值，将使用默认的通用值，且必须提供类型。
变量只能在其声明的作用域内访问。例如，如果在函数开头声明变量，则在整个函数中都可用。如果在 if 块中声明变量，则只在该块中可用，直到对应的 `else`、`elseif` 或返回父作用域。
在全局作用域中声明的变量可从任何地方访问。
对于在全局作用域中声明的变量，当分配初始值时，给定的表达式必须在编译时可确定。
变量名必须以字母或下划线（`a`-`z` 或 `_`）开头，然后只能包含字母数字字符和下划线。

`var $stuff = 5` 声明一个 number 变量，程序启动时初始值为 5
`var $stuff = "hello"` 声明一个 text 变量，程序启动时初始值为 "hello"
`var $stuff:number` 声明一个 number 变量，程序启动时初始值为 0
`var $stuff:text` 声明一个 text 变量，程序启动时初始值为 ""
`var $stuff = position()` 声明一个实现定义的对象类型 `position` 的实例（这是一个示例）

实现定义的对象不能在没有初始化的情况下声明，因为它们没有默认值。

## 为变量赋新值
要为变量赋新值，只需以变量名开始语句，后跟 `=` 和一个表达式，该表达式的结果将成为新值。
也可以使用尾随函数来固有地修改该变量的值。

`$stuff = 5` 将值 5 赋给名为 $stuff 的变量
`$stuff = $other + 5` 将表达式 ($other + 5) 的结果赋给名为 $stuff 的变量
`$stuff.round()` 调用一个尾随函数来对变量的值进行四舍五入

## 声明数组
数组是特定类型值的动态列表。我们可以追加或删除值，访问列表中的特定值，或遍历所有值。
声明数组时，不能指定初始值，且必须提供类型。
数组在程序启动时以零大小初始化，可以在程序执行过程中添加/删除/修改值

`array $stuff:number` 声明一个数字数组
`array $stuff:text` 声明一个文本数组

数组不能包含实现定义的对象，只能包含通用类型。

## 向量和矩阵

向量和矩阵是固定大小的 64 位浮点数容器，适用于位置、变换和线性代数。所有元素初始化为零。

### 声明

使用 `vecN` 声明向量（1D），使用 `matNxM` 声明 2D 矩阵，维度最高为 4。

```xc
var $position : vec3       ; 3 元素向量（vec2、vec3、vec4 可用）
var $transform : mat4x4    ; 4x4 矩阵
var $rotation : mat3       ; mat3x3 的简写
```

| 类型 | 简写 | 描述 |
|------|------|------|
| `vec2`、`vec3`、`vec4` | -- | 包含 2、3 或 4 个元素的向量 |
| `matNxM` | -- | N 行 M 列的 2D 矩阵（例如 `mat3x4`） |
| `matN` | `matNxN` | 方阵简写（例如 `mat3` = `mat3x3`） |

### 分量访问

使用 `.x`、`.y`、`.z`、`.w` 或等效的 `.0`、`.1`、`.2`、`.3` 访问元素。

**向量** -- 每个访问器引用单个元素：
```xc
var $v : vec3
$v.x = 1       ; 元素 0
$v.y = 2       ; 元素 1
$v.z = 3       ; 元素 2
$v.0 = 1       ; 与 .x 相同
```

**2D 矩阵** -- 第一个访问器选择行，第二个选择该行中的列：
```xc
var $m : mat4x4
$m.0.x = 1     ; 第 0 行，第 0 列
$m.1.y = 1     ; 第 1 行，第 1 列
$m.w.w = 1     ; 第 3 行，第 3 列（与 $m.3.3 相同）
```

### Swizzling

组合 `xyzw` 中的 2-4 个分量名称，一次提取多个元素到新向量中：
```xc
var $v : vec3
$v.x = 10
$v.y = 20
$v.z = 30
var $a : vec2
$a = $v.xy         ; 包含 (10, 20) 的 vec2
var $b : vec2
$b = $v.zx         ; 包含 (30, 10) 的 vec2
```
Swizzling 始终生成**副本** -- 修改结果不会影响原始值。

### 算术运算

相同大小的向量/矩阵之间的**逐元素**运算：
```xc
var $a : vec3
var $b : vec3
var $c : vec3
$c = $a + $b       ; 逐元素加法
$c = $a - $b       ; 逐元素减法
```

**标量**乘法和除法缩放每个元素：
```xc
$c = $a * 2        ; 所有元素乘以 2
$c = $a / 2        ; 所有元素除以 2
```

当维度兼容时，使用 `*` 进行**矩阵乘法**：
```xc
var $m : mat3x3
var $v : vec3
var $result : vec3
$result = $m * $v  ; 3x3 矩阵乘 3x1 向量 = 3x1 向量
```

**复合赋值**运算符也适用：`+=`、`-=`、`*=`、`/=`

### Trailing 函数（就地修改）

这些函数直接修改向量或矩阵，不返回值。

| 函数 | 适用于 | 描述 |
|------|--------|------|
| `.normalize()` | 向量 | 缩放为单位长度 |
| `.cross($other)` | vec3 | 将自身与 `$other` 的叉积存入自身 |
| `.transpose()` | 方阵 | 就地转置 |
| `.inverse()` | 方阵 | 就地求逆 |
| `.identity()` | 方阵 | 设为单位矩阵 |
| `.lerp($other, $t)` | 向量 / 矩阵 | 以因子 `$t` 向 `$other` 插值 |

```xc
var $dir : vec3
$dir.x = 3
$dir.y = 4
$dir.normalize()   ; $dir 现在是单位向量
```

### 标准函数（返回新值）

这些函数不修改其参数。返回单个数值的函数标记为*标量*。

| 函数 | 返回 | 描述 |
|------|------|------|
| `length($v)` | 标量 | 向量的长度 |
| `distance($a, $b)` | 标量 | 两个向量之间的欧几里得距离 |
| `dot($a, $b)` | 标量 | 两个向量的点积 |
| `angle($a, $b)` | 标量 | 两个向量之间的夹角（弧度） |
| `cross($a, $b)` | vec3 | 两个 vec3 向量的叉积 |
| `determinant($m)` | 标量 | 方阵的行列式 |
| `normalize($v)` | 同类型 | 向量的归一化副本 |
| `transpose($m)` | 同类型 | 方阵的转置副本 |
| `inverse($m)` | 同类型 | 方阵的逆矩阵副本 |
| `lerp($a, $b, $t)` | 同类型 | `$a` 和 `$b` 之间以因子 `$t` 插值的副本 |

### 传递给函数

向量和矩阵可以用作函数参数类型和返回类型：
```xc
function @scale($v : vec3, $factor : number) : vec3
	return $v * $factor

var $result : vec3
$result = @scale($myVec, 2.5)
```

## 声明 storage
Storage 用于在断电重启甚至重新编译后保持数据持久化。
我们可以声明 number 或 text 类型的 storage 变量和数组。
Storage 只应在全局作用域中声明。
```xc
storage var $stuff:number
storage var $stuff:text
storage array $stuff:number
storage array $stuff:text
```

## 访问/赋值数组中的第 n 个项
要访问或修改数组中特定项的值，必须使用尾随运算符 `.` 后跟项的从 0 开始的索引或包含该索引的变量
`$stuff.0 = 5` 将值 5 赋给数组的第一个项
`$stuff.$index = 5` 将值 5 赋给索引由 $index 的值定义的项
`$value = $stuff.1` 将数组第二个项的值赋给变量 $value

## 访问/赋值 text 变量中的第 n 个字符
Text 变量的工作方式与数组非常相似。我们可以使用尾随运算符 `.` 来访问或修改文本中特定字符的值。
`$myText.0 = "a"` 将 "a" 设为 $myText 的第一个字符

### 键值对象

XenonCode 支持自己的键值类型，始终以文本形式存储。
只需声明一个文本变量，并使用其键作为尾随成员来赋值/读取其成员
```xc
var $myObject = ".a{5}.b{8}" ; you can use the serialization format like so, but you don't have to, you may simply start with an empty text and assign the members one by one
print($myObject.a) ; will print 5
$myObject.b += 2 ; adds 2 to b which was 8 and will now be 10
```

## Init 函数
Init 函数体将在每次虚拟计算机通电时首先执行。
init 函数不能由用户调用。它只能被定义，设备将在虚拟启动时自动调用它。
```xc
init
    $stuff = 5
    @func1()
    ;...
```

## Tick 函数
Tick 函数在该虚拟计算机的每个时钟周期开始时执行。
tick 函数不能由用户调用。它只能被定义，设备将在每个周期自动调用它。
```xc
tick
    ; This body is executed once per clock cycle at the virtual computer's frequency
```

## Timer 函数
Timer 函数以指定的间隔或频率执行，但每个时钟周期最多执行一次。
我们可以指定 `interval`（每 N 秒）或 `frequency`（每秒 N 次）。
Timer 函数不能由用户调用。它们只能被定义，设备将在适当的时间自动调用它们。
```xc
timer frequency 4
    ; stuff here runs 4 times per second
timer interval 2
    ; stuff here runs once every 2 seconds
```
注意：如果虚拟计算机的时钟速度慢于给定的间隔或频率，该 timer 函数将无法以指定的间隔或频率正确运行，可能会在每个时钟周期执行。

## Input
Input 入口点是访问从另一个设备接收到的信息的方式。
它们可能在每个时钟周期内执行任意次数，取决于自上一个时钟周期以来接收了多少数据。实现可能决定仅使用最新接收的数据每周期运行一次。
设备可能有接收缓冲区的上限，定义了每个时钟周期内 input 函数可被调用的最大次数。
如果达到该限制，只保留最后 N 个值在缓冲区中。
Input 入口点类似于用户自定义函数，包含参数但没有返回值，且必须指定端口索引。
端口索引必须在 input 关键字和尾随运算符 `.` 之后指定。
端口索引也可以通过常量指定（必须在编译时已知）。
函数参数必须用括号包围，且必须指定其类型。
入口点不能由用户直接调用。它们只能被定义，然后如果收到数据，设备将在时钟周期结束时自动调用它们。
```xc
input.0 ($arg1:number, $arg2:text)
    $stuff = $arg1
input.$myPortIndex ($arg1:number, $arg2:text)
    $stuff = $arg1
```

## Output
Output 函数是我们向另一个设备发送数据的方式。此函数旨在作为语句调用，不能像 input 函数那样在全局作用域中使用。
我们也必须像 input 函数一样传入端口索引，它也可以通过编译时已知的常量指定。
我们必须传递用括号包围的参数列表（或一组空括号）。
`output.0 ($stuff, $moreStuff)`

## If Elseif Else
与大多数编程语言一样，我们可以使用条件语句。
```xc
if $stuff == 5
    ; then run this
elseif $stuff == 6
    ; then run that instead
else
    ; all previous conditions evaluate to false, then run this instead
```

## Foreach 循环
遍历数组的所有项。
该循环语句下的代码块将为数组中的每个项逐一执行。
```xc
foreach $stuff ($index, $item)
    ; we loop through the array $stuff, and we define $index which contains the 0-based index of this item and $item for the current item's value
    ; note that $item is a copy of its value, so modifying the value of $item will not affect the original array $stuff
    ; if we want to persist the modified $item value into the original array, we can use $index to index the element from the array like so:
    $stuff.$index = $item
    ; CAUTION: $index is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
你也可以对键值对象使用 foreach 循环
```xc
foreach $obj ($key, $value)
    print($key)
    print($value)
```

## Repeat 循环
此循环将重复执行后续代码块给定的次数。
```xc
repeat 5 ($i)
    ; this block will be repeated 5 times, and $i is the 0-based index of this iteration (first time will be 0, last will be 4)
    ; CAUTION: $i is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
次数（上面指定为 5）也可以通过变量或常量指定，但不能是表达式

## For 循环
此循环类似于 repeat，但接受首末索引而不是重复次数
```xc
for 3,8 ($i)
	; $i will start at 3, and end with 8, inclusively, for a total of 6
```

## While 循环
此循环将在给定条件求值为 true 时运行后续代码块。
```xc
while $stuff < 5
    $stuff++
```

## Break
此关键字用于停止循环，如同它完成了所有迭代。
```xc
while $stuff < 5
    $stuff++
    if $stuff == 3
        break
```

## Continue
此关键字用于在此处停止当前迭代并立即运行下一次迭代。
```xc
while $stuff < 5
    $stuff++
    if $stuff == 2
        continue
```

## 数学运算符
- `+` 加法
- `-` 减法
- `*` 乘法
- `/` 除法
- `%` 取模
- `^` 幂

## 尾随运算符
- `++` 递增变量的值
- `--` 递减变量的值
- `!!` 反转变量的值（如果值为 `0` 则设为 `1`，否则设为 `0`）

## 赋值运算符
- `=` 直接赋值

以下运算符将在前导变量和后续表达式之间计算相应的数学运算，然后将结果赋回前导变量。
- `+=` 加法
- `-=` 减法
- `*=` 乘法
- `/=` 除法
- `%=` 取模
- `^=` 幂
- `&=` 连接文本

## 条件运算符
- `==` 等于
- `<>` 或 `!=` 不等于
- `>` 大于
- `<` 小于
- `<=` 小于或等于
- `>=` 大于或等于
- `&&` 或 `and` 条件与
- `||` 或 `or` 条件或
- `xor` 异或，等价于 (!!a != !!b)

## 其他运算符
- `.`（尾随运算符）引用数组或文本的子项，或在前导变量上调用尾随函数，或对象的成员
- `:`（类型转换运算符）转换为另一种类型
- `&`（连接运算符）连接文本
- `!`（非运算符）反转布尔值或表达式（非零数字变为 0，0 变为 1）

## 类型转换（将变量解析为另一种类型）

要将现有变量解析为另一种类型，只需添加冒号和类型，如下：
```xc
$someTextValue = $someNumberValue:text
```
这仅适用于通用类型 `number` 和 `text`，不适用于数组或对象。

## 字符串连接

要连接文本，只需在同一赋值中用连接运算符 `&` 分隔所有文本值/变量（如果需要，别忘了转换为文本类型）。
```xc
$someTextVar = "Hello, " & $someName & "!, My age is " & $age:text & " and I have all my teeth"
```

## Include
你可能想将项目拆分为多个源文件。
为此，你可以将一些代码放入另一个 `.xc` 文件中，并在父文件中使用 `include` 关键字。
```xc
include "test.xc"
```
这实际上等同于将 `test.xc` 中的所有行插入到 `include` 所在位置的当前文件中。
这可以在多个层级上完成，只需确保文件不会直接或间接地包含自身，否则其中的定义将冲突并导致编译错误。

# 用户自定义函数

函数定义了一组操作，我们可以在程序执行过程中调用一次或多次。

要在函数中运行的操作出现在其函数体内。

函数可以有参数，在函数体内使用，使操作可以根据某些变量的值有所变化。

函数参数在函数名之后的括号内定义，它们可以是 `number`、`text` 或实现定义的对象类型。

函数名与变量名具有相同的规则。

注意：函数必须在使用之前完全定义。这意味着函数声明的顺序很重要，我们只能调用在调用者之上声明的函数，且函数不能调用自身。这强制执行了"无栈递归"规则。

### 声明

以下是一些函数声明示例

此函数接受一个 number 参数：
```xc
function @func0 ($var1:number)
```

此函数接受两个 number 参数：
```xc
function @func1 ($var1:number, $var2:number)
```

此函数接受一个 number 参数和一个 text 参数：
```xc
function @func2 ($var1:number, $var2:text)
```

此函数接受一个实现定义的对象类型 `position` 参数：
```xc
function @func3 ($var1:position)
```

此函数接受一个 number 参数和一个 text 参数并返回一个 number 值：
```xc
function @func2 ($var1:number, $var2:text) : number
```

### 函数体
函数体（调用时执行的操作）必须在声明后的下一行，缩进一个 Tab。
函数体内允许空行，编译器会忽略它们。
函数体可以有 `return` 语句，后跟一个可选的表达式，该表达式将用于在调用者语句中赋值给前导变量。
当返回值时，返回类型必须在参数末尾、右括号和冒号之后提供。

```xc
function @func1 ($var1:number, $var2:number) : number
    return $var1 + $var2
```

### 调用

调用函数将运行其函数体中的操作。
要调用函数，只需写函数名（用户自定义函数以 `@` 开头），然后在括号内用逗号分隔其参数，如下：
```xc
@func1(4, 6)
```
这里我们传递了两个 number 参数，因此此调用执行上面声明的函数体。
当然也可以使用变量甚至复杂表达式代替字面量数字作为函数参数。

#### 注意：
允许省略参数。
它们的值最初采用默认的空值（"" 或 0），然后在后续对该函数的调用中保持传入或赋给它们的值。
在函数内更改参数的值也将在下次调用该函数时持续存在，如果该参数被省略。
因此，如果需要默认参数值的概念，可以在函数体中使用参数之后将其赋值。
这种省略参数的概念也可以被视为类似于 C++ 中静态局部变量的概念。

### 返回值

函数可以使用 `return` 关键字返回一个值。
此返回值可以赋给变量，如下：
```xc
$value = @func1(4, 6)
```

# 递归函数
递归函数是调用自身的函数。
要定义递归函数，使用 `recursive function`，使用 `recurse` 来调用函数自身。
```xc
recursive function @recursiveFunc($myVar:number)
    if $myVar < 15
        recurse($myVar++)
```
这个递归函数示例将在 $myVar 的值小于 15 时调用自身。
递归函数限制为 16 次递归调用。

注意：`recurse` 关键字仅在递归函数内可用，用于调用函数自身。参数列表必须与函数定义相同。

# 尾随函数
任何函数都可以作为尾随函数调用，包括用户自定义函数。
其工作方式是在底层将前导变量作为第一个参数传递给该函数，然后将返回值赋给它。
调用尾随函数时，必须省略第一个参数，因为它会自动将前导变量作为其第一个参数发送。
如果函数定义没有任何参数，这仍然有效，尽管我们只是不关心前导变量的当前值，但会为其赋一个新值。
如果是通用类型，函数定义必须有与前导变量匹配的返回类型。
尾随函数可以在实现定义的对象上调用，此时第一个参数必须是该对象类型，函数没有返回类型且不能返回任何值。
由于不能将数组作为函数参数传递，数组只能使用其专门定义的尾随函数。
```xc
$myVariable.round()
```
```xc
$myVariable.@func1(6)
```
```xc
$myArray.clear()
```

# 内置函数

### Math
这些函数在基础语言中定义，接受一个或多个参数。
Math 尾随函数将使用前导变量作为其第一个参数，并通过赋其返回值来修改该变量。
- `floor`(number)
- `ceil`(number)
- `round`(number)
- `sin`(number) 弧度制
- `cos`(number) 弧度制
- `tan`(number) 弧度制
- `asin`(number) 弧度制
- `acos`(number) 弧度制
- `atan`(number) 或 (number, number) 弧度制
- `abs`(number)
- `fract`(number)
- `log`(number, base)
- `sqrt`(number)
- `sign`(number [, default])
- `pow`(number, exponent)
- `clamp`(number, minimum, maximum)
- `step`(edge1, edge2, number) 或 (edge, number)
- `smoothstep`(edge1, edge2, number)
- `lerp`(a, b, number)
- `mod`(number, divisor) 取模运算符
- `min`(number, number)
- `max`(number, number)
- `avg`(number, number)
- `add`(number, number)
- `sub`(number, number)
- `mul`(number, number)
- `div`(number, number)

### Text 函数
- `text`(inputTextWithFormatting, vars ...) 详见下方说明
- `substring`($myText, start, length) 返回新字符串
- `replace`($myText, searchText, replaceText [, count]) 返回一个新字符串，其中所有 `searchText` 的出现替换为 `replaceText`，如果指定了 `count` 则最多替换该次数
- `size`($myText) 返回 $myText 中的字符数
- `last`($myText) 返回 $myText 中的最后一个字符
- `lower`($myText) 返回 $myText 的小写版本
- `upper`($myText) 返回 $myText 的大写版本

#### 格式化
`text` 函数的第一个参数是格式。
格式基本上是一个文本，其中可以包含大括号，这些大括号将被某些变量或表达式的值替换。
示例：
```xc
$formattedText = text("My name is {} and I am {} years old.", $name, $age)
```
上面的空大括号将按相同顺序被后续参数中对应的变量替换。
也可以通过在大括号内提供一些伪值来以特定方式格式化 number 变量，如下：
- `{}` 根据值自动仅显示必要的位数（例：`3` 或 `123.456`）
- `{0}` 四舍五入到最近的整数值（例：`3` 或 `123`）
- `{00}` 四舍五入到最近的整数值但至少显示两位数（例：`03` 或 `123`）
- `{0e}` 以科学记数法显示四舍五入的整数值（例：`3e+00` 或 `1e+02`）
- `{0e.00}` 以科学记数法显示值，小数点后两位（例：`3.00e+00` 或 `1.23e+02`）
- `{0.0}` 四舍五入到小数点后一位（例：`3.0` 或 `123.5`）
- `{0000.00}` 至少显示 4 位整数位并四舍五入到小数点后两位（例：`0003.00` 或 `0123.46`）

### 数组尾随函数
这些函数必须作为尾随函数调用，它们不返回任何值，而是修改数组
- $myArray.`clear`() 清空数组
- $myArray.`sort`() 按升序排列数组
- $myArray.`sortd`() 按降序排列数组
- $myArray.`append`(value1, value2, ...) 将一个或多个值追加到数组末尾
- $myArray.`pop`() 删除数组中的最后一个值，将其大小减一
- $myArray.`insert`(index, value) 在数组的特定位置插入新值，将后续所有值后移一位
- $myArray.`erase`(index) 在特定索引处从数组中删除元素，将后续所有值前移一位
- $myArray.`fill`(qty, value) 调整大小并用给定大小和所有项的指定值填充数组（这将清除数组中先前存在的任何值）
- $myArray.`from`(other [, separator]) 将数组内容设为另一个数组或文本。Separator 用于使用特定字符串进行拆分（仅当 other 是文本时有效）。当在文本上执行并给定数组和分隔符时，此函数也可以反向工作。

### 数组尾随成员
使用尾随运算符 `.`，我们也可以返回关于某些类型变量的特定信息。
- $myArray.`size` 返回 $myArray 中的元素数
- $myArray.`min` 返回数字数组中的最小值
- $myArray.`max` 返回数字数组中的最大值
- $myArray.`avg` 返回数字数组中的平均值
- $myArray.`med` 返回数字数组中的中位数
- $myArray.`sum` 返回数字数组中所有值的总和
- $myArray.`last` 返回数组中最后一个项的值，也允许通过赋值表达式来修改该值

### 其他有用的辅助函数
- `contains`($myText, "str") 如果 $myText 包含 "str" 返回 1，否则返回 0
- `find`($myText, "str") 返回 $myText 中 "str" 第一次出现的第一个字符的索引，未找到返回 -1
这些也适用于数组。
- `isnumeric`($myText) 如果 $myText 是数字返回 1，否则返回 0

### 三元运算符
三元运算符是一种简写的条件表达式，根据条件的求值返回一个值。
```xc
$myVar = if($cond, $valTrue, $valFalse)
```

### Device 函数
实现应该定义应用程序特定的设备函数。
以下是可能或可能不被定义的基本设备函数示例：
- `delta`() 返回自上次执行此 `delta` 函数以来的时间差（秒）
不需要任何参数的设备函数在表达式中调用时可以不使用括号。

# 编译器规范
本节面向希望在其游戏中使用此功能的游戏开发者。

XenonCode 附带自己的解析器/编译器/解释器库，以及一个非常简单的 CLI 工具。

## 编辑器
建议代码编辑器在每次击键时对当前行运行以下解析：
- 如果前导空格序列比前一个非空行更远，则将其替换为恰好比前一个非空行多一个 Tab
- 在按空格键时自动完成单词（如果该单词不是现有符号）
    - 写入匹配以已写字符开头的符号的最少剩余字符（最大公约数）
        - 如果这是前导词：仅使用全局作用域语句词自动完成
        - 如果前面有 Tab：仅使用函数体语句词自动完成
        - 当当前单词的第一个字符是 `$` 时，使用用户变量自动完成
        - 当当前单词的第一个字符是 `@` 时，使用用户函数自动完成
        - 否则，使用以下之一自动完成：
            - 当前函数/foreach/repeat 参数
            - 内置函数
            - 运算符

## 运行时

虚拟计算机通电时：
- 执行 init() 函数体

一个时钟周期，每秒执行 'frequency' 次：
- 执行自上一个周期以来接收到数据的所有 input 函数（每个每周期一次）
- 执行自定义事件/入口点
- 执行 tick 函数
- 如果到时间则按顺序执行所有 timer 函数
- 休眠 Elapsed-1/Frequency 秒

# 测试 XenonCode
你可能想测试 XenonCode 或练习你的编码技能。
有一个在线工具在 <a href="https://xenoncode.com/">XenonCode.com</a>

另外，你也可以尝试直接在你的计算机上运行它。
为此，XenonCode 有一个 CLI 的 `-run` 命令来在控制台中测试一些脚本。
此仓库附带 CLI 工具，位于 `build/xenoncode`
以下是如何下载并运行 XenonCode：
```shell
# Clone this github repository
git clone https://github.com/batcholi/XenonCode.git
cd XenonCode
# Compile & Run the XC program located in test/
build/xenoncode -compile test -run test
```
你可以编辑 `test/` 中的 .xc 源文件，然后再次运行最后一行来编译和运行。
`test/storage/` 目录将被创建，其中将包含存储数据（以 `storage` 关键字为前缀的变量）。
请注意，此 `-run` 命令旨在快速测试语言，仅运行 `init` 函数。
此外，请确保你的编辑器配置为使用 Tab 而不是空格，以正确解析缩进。

如果你想将 XenonCode 集成到你的 C++ 项目中，可以包含 `XenonCode.hpp`。
此方面的更多文档即将推出，同时你可以参考 `main.cpp` 作为示例，但其用法仍可能会改变。
