<p align="center">
  <img src="Buzzer.png" />
</p>

|Component|`Buzzer`|
|---|---|
|**Module**|`ARCHEAN_beep`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Buzzer 是一种可以产生 `sine`、`square`、`triangle` 或 `sawtooth` 类型声音的组件，同时允许控制声音的频率和振幅。

# Usage
### 更改音色类型
可以通过按 `V` 键访问的 Buzzer 配置界面更改音色。


### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|Amplitude|0 to 1|
|1|Frequency (Hz)|0 to 20000 (default: 440Hz)|

> - 要同时播放多个频率或多种音色，必须使用多个 Buzzer。
