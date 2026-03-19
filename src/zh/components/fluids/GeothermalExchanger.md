<p align="center">
  <img src="GeothermalExchanger.png" />
</p>

|Component|GeothermalExchanger|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Geothermal Exchanger 是一种利用地下深处的天然热量来加热流体的组件。

# Usage
Geothermal Exchanger 专用于固定建筑。一旦放置在建筑上并接通低压电源（持续消耗 1000 瓦），它将自动锚定到地面，完全阻止结构移动。

> #### 警告：
> - Geothermal Exchanger 会锁定建筑位置。要恢复移动能力，必须先将其摧毁。
> - 如果摧毁 Geothermal Exchanger 后结构仍然静止，只需临时放置一个 [Ground Anchor](../miscellaneous/GroundAnchor.md) 来刷新其状态，使其重新激活。

Geothermal Exchanger 必须放置在非常靠近地面的位置。如果其底部距离地面超过 0.5 米，它将保持不活动状态。

一旦运行：
- 它会缓慢向下钻探，最大深度为 1000 米。
- 钻探越深，循环流体的温度越高（最高 650K）。
- 当温度达到 373K 时开始泵送流体。

它主要用于通过将流体输送至 Steam Turbine 来产生能量。

### Additional Information
- Geothermal Exchanger 仅适用于水（H₂O）。
- 最大流量：0.1 kg/s。

> 一台 Small Steam Turbine 通常可以由最多 10 台 Geothermal Exchanger 有效供给，理论最大输出功率约为 270 kW。

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Depth|meters|
|1|Temperature|Kelvin|
