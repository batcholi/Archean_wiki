<p align="center">
  <img src="MiniThruster.png" />
</p>

|Component|`MiniThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Mini Thruster 通过液体燃料与液氧的燃烧产生推力。
它可以使用 CH4（甲烷）和 H2（氢气）作为燃料，但需要预混合的燃料-氧化剂组合。  
它可以从 1 Kg/s 预混合液氧和 H2 的流量产生高达 18 KN 的推力。
  
# Usage
将高流量氧化剂和燃料连接到流体端口，低压用于点火，在数据端口发送 1 以点火。

当燃料为 H2 时，最佳流量比为 8:1（LOX:H2），低于 1:1 的比例可能导致熄火（无燃烧）。
当燃料为 CH4 时，最佳流量比为 4:1（LOX:CH4），低于 1:1 的比例可能导致熄火（无燃烧）。

燃烧开始后不需要保持点火器开启，但为防止熄火，建议保持开启状态。
点火器开启时持续消耗 100 瓦。

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|

### List of outputs
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|
