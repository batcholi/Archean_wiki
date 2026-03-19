<p align="center">
  <img src="RCS.png" />
</p>

|Component|`RCS`|
|---|---|
|**Module**|`ARCHEAN_rcs`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
RCS（反应控制系统）由冷气推进器组成，主要用于控制航天器的姿态和位置。它也用于航天器对接时的精细调整。RCS 由多个小型推进器组成，可以单独快速开启/关闭以提供精确控制。

# Usage
RCS 可以使用各种流体驱动，其性能取决于流体的密度和压力。可以通过计算机或其他设备来控制推力和方向。

它不进行任何形式的燃烧。

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Nozzle 0 (Center)|0.0 to 1.0|
|1|Nozzle 1|0.0 to 1.0|
|2|Nozzle 2|0.0 to 1.0|
|3|Nozzle 3|0.0 to 1.0|
|4|Nozzle 4|0.0 to 1.0|
