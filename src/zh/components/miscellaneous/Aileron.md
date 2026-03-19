<p align="center">
  <img src="Aileron.png" />
</p>

|Component|`Aileron`|
|---|---|
|**Module**|`ARCHEAN_aileron`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
#
---

# Description
Aileron 是一种影响建筑空气动力学的装置。

其效果与其运行介质的密度密切相关，无论是在大气中（飞机等）还是在水中（船等）。

# Usage
Aileron 不需要任何能源即可运行，只需通过数据端口发送一个介于 `-1.0` 和 `+1.0` 之间的值。

>- Aileron 不像方块那样计算遮挡。这允许通过将其隐藏在较大的表面（如机翼内部）中来优化载具的飞行效率。
