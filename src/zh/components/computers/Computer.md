<p align="center">
  <img src="Computer.png" />
</p>

|Component|`Computer`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 50 cm|
#
---
> 要了解如何使用计算机的编程接口，请访问 XenonCode IDE 页面。

# Description

Computer 是一个用于运行 XenonCode 程序的组件，可以控制其他组件或在其屏幕上显示各种信息。

它具有决定其性能、存储和内存的特性。
这些信息可在 BIOS 上查看，如下图所示。

![Bios](bios.png)

### BIOS 信息：
- **Processor Type**：XPU64-AIO 处理器指的是这种一体式计算机组件类型。
- **Frequency**：频率是计算机执行当前程序代码的速度，将与服务器的 `updates_per_second` 设置匹配（默认每秒 25 tick）。
- **Max IPC**：此参数由配置文件决定，是每个周期在虚拟"崩溃"之前可执行的最大指令数。
- **System RAM**：在 XenonCode 程序中，您可以将值存储在易失性变量中，这些变量在计算机重启或程序重新加载时会重置。此参数表示当前运行程序所有变量的最大值数量。
- **Storage Capacity**：与系统 RAM 类似，还有一种存储变量类型，可将数据永久存储在硬盘上直到被修改。在此情况下，最多限制为 256 个值。
- **I/O Ports**：此参数由组件决定，仅表示计算机上的数据端口数量。

> BIOS 是每台计算机启动时默认运行的程序。
>
> 在此情况下，它的作用是显示计算机的特性以及硬盘上可用程序的列表，以便您选择一个来执行。
>
> 可以通过创建名为 "main.xc" 的新文件来自定义 BIOS，以修改其外观或自动加载程序。请参阅 XenonCode IDE 文档以获取更多信息。

# Usage
### 程序：
当程序创建并保存后，它将出现在 BIOS 的程序列表中。您可以使用 `F` 键选择要执行的程序。
### 按钮：
Computer 有两个物理按钮，"Code" 按钮用于打开 XenonCode IDE 来开发程序，"Reboot" 按钮用于重启计算机并重新执行 main.xc 程序（BIOS）。
### 电源：
Computer 需要低压电源才能运行。空闲时消耗 30 瓦，根据当前运行程序执行的指令数与服务器上配置的当前 MAX IPC 之间的比率，功耗最高可达 500 瓦。
### HDD：
Computer 有一个硬盘驱动器托架。您可以在托架中放置多个 HDD（一次只有一个处于活动状态），将 HDD 与其他计算机交换或将它们存放在物品栏中。当您想将计算机移到其他地方而不丢失代码时，这非常有用。

---
>- 内置屏幕的分辨率为 200x160 像素。
>- *HDD 的内容（您的代码）不会因为您误删 Computer 组件而丢失。它仍然存在于服务器的文件中（如果您是单人游戏则在您自己的电脑上）。您可以在 (Server Settings)/worlds/(World Name)/ARCHEAN_computer/HDD-... 中找到它。您甚至可以从那里编辑代码，如果您更喜欢使用外部编辑器（VSCode 实际上有可用的 XenonCode 扩展），它会在游戏中实时重启您的计算机。*
