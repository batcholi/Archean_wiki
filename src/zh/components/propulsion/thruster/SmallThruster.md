<p align="center">
  <img src="SmallThruster.png" />
</p>

|Component|`SmallThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Small Thruster 通过液体燃料与液氧的燃烧产生推力。
它可以使用 CH4（甲烷）和 H2（氢气）作为燃料。
它使用径向气尖喷管，能够高效地将燃烧能量直接转化为推力。
它可以从 10 Kg/s 液氧和 1.25 Kg/s H2 的流量产生高达 180 KN 的推力。

# Usage
将高流量氧化剂和燃料连接到流体端口，高压用于点火，在数据端口发送 1 以点火。

初始点火仅在燃料或氧化剂流量介于 1 g/s 和 5 kg/s 之间时发生。

当燃料为 H2 时，最佳流量比为 8:1（LOX:H2），低于 1:1 的比例可能导致熄火（无燃烧）。
当燃料为 CH4 时，最佳流量比为 4:1（LOX:CH4），低于 1:1 的比例可能导致熄火（无燃烧）。

燃烧开始后不需要保持点火器开启，但为防止熄火，建议保持开启状态。
点火器开启时持续消耗 1000 瓦。

Small Thruster 的喷嘴可以在两个轴上进行 -10 到 +10 度的万向节调整。

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|
|1|Gimbal X|-1.0 to +1.0|
|2|Gimbal Z|-1.0 to +1.0|

### List of outputs
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|

> 如果您的燃料箱是预混合的，则不需要使用两个流体端口。
