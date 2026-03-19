<p align="center">
  <img src="ChemicalFurnace.png" />
</p>

|Component|`ChemicalFurnace`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|150 x 200 x 200 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
|**Push/Pull Item**|Accept Push / Initiate Push|
#
---

# Description
Chemical Furnace 组件用于加热流体和物品，通常用于进行化学反应。

# Usage
它需要电力才能运行。其功耗取决于目标温度和被加热的内容物，在最苛刻的条件下最高可达 **5 MW**。

Chemical Furnace 还配备了触摸屏，可以：
- 显示当前温度
- 手动设置目标温度

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Target Temperature (K)|number|
|1|Purge|0 or 1|

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Current Temperature (K)|number|
