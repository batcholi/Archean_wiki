<p align="center">
  <img src="OreScanner.png" />
</p>

|Component|`OreScanner`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 25 x 25 cm|
#
---

# Description
Ore Scanner 是一种可以在传感器方向上获取一个或多个位置（按距离）地形成分的组件。它仅在行星和卫星上工作，主要用于查找用于制造系统的矿石。

# Usage
从技术角度来看，扫描仪非常简单。您在通道 0 中发送一个数字，对应您要水平扫描地形的距离（米），扫描仪将返回该距离处传感器方向上的成分文本对象。

它的优势在于可以在不同通道中发送多个距离，在每个服务器 tick（默认每秒 25 次）上同时扫描多个点。

> 切勿将其朝上/朝下指向，水平扫描效果最佳。

## Example
要扫描距离 10m 处的地形，需要在输入通道 0 中发送值 10。扫描仪将在相应的输出通道中返回对应 10m 距离处成分的文本对象。

要扫描距离 10m 和 20m 处的地形，例如需要在输入通道 0 中发送值 10，在输入通道 1 中发送值 20。扫描仪将在输出通道 0 中返回对应 10m 距离处成分的文本对象，在输出通道 1 中返回 20m 距离处的另一个文本对象。

利用这些功能，例如可以使用 XenonCode 循环扫描 100m 范围内每隔 10m 的所有成分，并在控制台中显示。

```xc
	repeat 10 ($i)
		output_number($scanner_io, $i, $i*10)
		print(input_text($scanner_io, $i))
```

请注意，在发送到输出和从输入获取之间会有 1 tick 的延迟。
基本上，扫描仪将根据您在上一个 tick 发送的值给出结果，因此不要在通道之间打乱距离值，也不要使用随机值，尽量在多个 tick 之间保持一致。

## Data retrieval
当执行扫描后，您可以获取成分信息，它将以 key-value 文本对象的形式呈现。
例如，如果您扫描了距离 10m 处的地形，可以获取到形如 `.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}` 的文本对象，这表示 10m 距离处的地形含有 12% 碳、5% 铁、3% 硅和 80% 铜。

您可以使用 [XenonCode](../../xenoncode/documentation.md) 中实现的 key-value 系统轻松解析这些数据以获取您感兴趣的信息。

## Go further
Ore Scanner 在其传感器方向上扫描地形。您可以将其安装在 Small Pivot 上，例如旋转它，使用 XenonCode 程序和游戏内屏幕创建其位置周围的成分地图。

## Energy
Ore Scanner 需要低压能源才能工作。其功耗与您使用的通道数量成正比。在单个 tick 中扫描的位置越多，消耗的能量就越多，每个通道每 tick 消耗 100 瓦。
