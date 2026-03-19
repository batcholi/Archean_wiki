<p align="center">
  <img src="GroundAnchor.png" />
</p>

|Component|`GroundAnchor`|
|---|---|
|**Module**|`ARCHEAN_anchor`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 100 x 100 cm|
#
---

# Description
Ground Anchor 是一种在激活时将建筑锁定在地面上的装置，防止任何移动。

# Usage
Ground Anchor 不需要外部电源即可运行。其机制依赖于一个简单的值，通过数据端口发送 `0` 表示停用（未锚定）或 `1` 表示激活（已锚定）。

>- 要释放一个已锚定的建筑，仅移除 Ground Anchor 是不够的。您必须取消当前 Ground Anchor 的锚定，或者安装一个新的 Ground Anchor 来重新激活建筑的物理效果，前提是不再有任何已锚定的锚点。
>- 如果存在 [OwnerPad](OwnerPad.md)，使用 "Reset" 按钮移动建筑不会被 Ground Anchor 阻止。
>- Ground Anchor 不能将载具锚定到另一个载具上，它只能在地形上使用。
