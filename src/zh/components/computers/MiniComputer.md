<p align="center">
  <img src="MiniComputer.png" />
</p>

|Component|`MiniComputer`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description

MiniComputer 是一个用于运行 XenonCode 程序来控制其他组件的组件。
它是 [Computer](Computer.md) 的小型版本，没有内置屏幕。

# Usage
在功能方面与 Computer 完全相同，其使用方式几乎一致。

主要区别在于 MiniComputer 没有内置屏幕，因此无法显示列出可用程序的 BIOS。

如果它只包含一个程序，该程序将自动加载。如果您想拥有多个程序，必须通过创建 "main.xc" 文件来制作自定义 BIOS，以加载您选择的程序。

`main.xc`:
```xc
init
	load_program("rover") ; this will load the file "rover.main.xc"
```
