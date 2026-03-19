<p align="center">
  <img src="FissionReactor.png" />
</p>

|Component|`FissionReactor`|
|---|---|
|**Module**|`ARCHEAN_nuclear`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|300 x 300 x 275 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Fission Reactor 是一个通过铀棒核裂变产生热量的组件。

---

# Usage

## 基本运行原理
反应堆使用核裂变产生的能量加热水（H₂O）。

水具有双重作用：
- 冷却反应堆堆芯。
- 产生蒸汽驱动涡轮机。

---

## 所需资源
反应堆需要：
- 持续的低压电源供应，功率为 **1000 W**。
- 冷水供应。
- 在反应堆的全部 4 个内部区域放置铀棒。

> 强烈建议每个区域至少放置一根铀棒。  
> 有空区域的反应堆将运行不良或根本无法运行。

---

## 物品栏和区域
反应堆有 **40 个槽位**，分为 **4 个独立区域**。

每个区域根据放置的铀棒数量和类型影响其局部功率和温度。

---

## 控制棒
每个区域有一个可调节的*控制棒*：
- 0% 抽出（完全插入） → 反应停止。
- 100% 抽出 → 最大反应。

---

## 反应启动
需要通过数据端口进行手动中子注入。

启动期间每秒最多可发送 **1000 个中子**
（每个区域每秒最多 **250 个中子**）。

> - 即使铀的 U235 含量为 100%，也需要初始中子供应。
> - 使用低浓缩铀（10% U235）时，启动可能需要持续注入中子数分钟。

---

## 链式反应行为

尽管反应堆的每个区域都有自己的铀棒、温度和中子数量，但反应堆的设计模拟了整个堆芯中真实的链式反应。

- 区域之间并非完全隔离。
- 一个区域产生的中子可以部分扩散到相邻区域。
- 这种行为提高了反应的稳定性，有助于较弱的区域维持裂变。

> 高活性区域可以支持活性较低的区域，但所有区域都正确装填燃料对于最大效率仍然至关重要。

---

## 冷却和蒸汽产生
与 [Steam Turbines](SteamTurbine.md) 配合使用时，理想的出水温度为 **650 K**。

- 低于此温度 → 能量产出减少。
- 高于此温度 → 效率损失（无额外收益）。

> 过高的水流量可能过度冷却反应堆并限制功率输出。

---

## 反应堆状态

|State|含义|
|---|---|
|IDLE|反应堆关闭。|
|STARTING|正在启动（中子注入中）。|
|ACTIVE|核反应活跃（正在产生中子）。|
|COOLDOWN|冷却进行中（未产生中子）。|
|HOT|反应堆过热，请增加流体流量。|
|SCRAM|紧急停堆已触发（控制棒锁定在 0% 抽出位置）。|
|CRITICAL|反应堆堆芯严重过热，即将熔毁。|
|MELTDOWN|堆芯熔毁。反应堆在手动重置前无法使用。|

---

## 安全与熔毁
- 温度超过 **1200 K** → 进入 *CRITICAL* 状态 - 即将熔毁。

在 *MELTDOWN* 状态下：
- 蒸汽流停止 - 无法产生能量。
- 反应堆在手动重置前无法使用。

### 重置熔毁
通过反应堆界面（`V` 键）中的重置按钮。

> - 在创造模式中，此按钮始终可用。  
> - 在冒险模式中，仅在反应堆进入熔毁状态后可用。

---

# 铀棒磨损

铀棒在参与核反应的过程中会随时间缓慢退化。

### 同位素消耗
- **U235** 逐渐被消耗以维持裂变。
- **U238** 也可以部分转化为钚。

### 裂变产物
运行期间，铀棒会自动积累裂变产物：
- **氙（Xe）**
- **钚（Pu）**

这些元素会随着铀棒老化直接出现在其成分中。
> 需要注意的是，这些裂变产物目前在游戏中没有用途。要获取用于制造 RTG 的钚，您必须使用 RTG 页面上描述的钚制造流程 [RTG](./RTG.md#how-to-produce-plutonium)。

### 耗尽的铀棒
当铀棒的 **U235** 浓度降至 **4.45%** 以下时，它变为*耗尽*状态。

> 耗尽的铀棒即使有外部中子供应也无法维持链式反应。

### 磨损因素
铀棒的寿命完全取决于：
- 其初始 U235 浓缩率。
- 反应堆实际产生的功率（即中子通量）。

> → 浓缩率越低且功率提取越高，铀棒磨损越快。  
> → 相反，高浓缩铀棒在中等功率下运行可以持续极长时间。

### List of inputs

|Channel|Function|Value|
|---|---|---|
|0|Control Rod Zone 1|0.0 to 1.0|
|1|Control Rod Zone 2|0.0 to 1.0|
|2|Control Rod Zone 3|0.0 to 1.0|
|3|Control Rod Zone 4|0.0 to 1.0|
|4|Neutrons Injection|0 to 1000|
|5|SCRAM (Emergency Shutdown)|0 or 1|

---

### List of outputs

|Channel|Function|Value|
|---|---|---|
|0|Zone 1 Temperature (Kelvin)|Number|
|1|Zone 2 Temperature (Kelvin)|Number|
|2|Zone 3 Temperature (Kelvin)|Number|
|3|Zone 4 Temperature (Kelvin)|Number|
|4|Control Rod Position Zone 1|0.0 to 1.0|
|5|Control Rod Position Zone 2|0.0 to 1.0|
|6|Control Rod Position Zone 3|0.0 to 1.0|
|7|Control Rod Position Zone 4|0.0 to 1.0|
|8|Neutron Flux Zone 1|Number|
|9|Neutron Flux Zone 2|Number|
|10|Neutron Flux Zone 3|Number|
|11|Neutron Flux Zone 4|Number|
|12|Input Water Temperature (Kelvin)|Number|
|13|Output Water Temperature (Kelvin)|Number|
|14|Water Flow Rate (kg/s)|Number|
|15|Reactor Status|"IDLE", "STARTING", "ACTIVE", "COOLDOWN", "HOT", "SCRAM", "CRITICAL", "MELTDOWN"|
|16|Lifetime|Estimated remaining time in seconds|

---

# 铀棒制造

---

## 低浓缩铀（LEU）

|步骤|输入|输出|温度|
|---|---|---|---|
|Crusher（铀粉）|Uranium Ore : 1000 g|Uranium powder (U235 : 10%, U238 : 90%) : 1000 g|-|
|ChemicalFurnace（黄饼 (U₃O₈)）|Uranium powder : 0.714 g, Oxygen (O₂) : 0.128 g|Yellow Cake (U₃O₈) : 0.842 g|750K - 950K|
|ChemicalFurnace（二氧化铀 (UO₂)）|Yellow Cake (U₃O₈) : 0.842 g, Hydrogen (H₂) : 0.004 g|Uranium dioxide (UO₂) : 0.810 g, Water (H₂O) : 0.036 g|850K - 1050K|
|Crafter（铀棒 LEU (UO₂)）|Uranium dioxide (UO₂) : 1000 g|Uranium rod LEU (UO₂, U235 : 10%, U238 : 90%) : 1|-|

---

## 高浓缩铀（HEU）

### UF₆（气态）生产

|步骤|输入|输出|温度|
|---|---|---|---|
|Crusher（萤石粉 (F₂)）|Fluorite Ore: 1000 g|Fluorite powder (F₂) : 1000 g|-|
|ChemicalFurnace（氟化氢 (HF)）<font color="orange">*</font>|Fluorite powder (F₂) : 0.038 g, Hydrogen (H₂) : 0.002 g|Hydrogen fluoride (HF) : 0.040 g|300K - 400K|
|ChemicalFurnace（四氟化铀 (UF₄)）|Hydrogen fluoride (HF) : 0.080 g, Uranium dioxide (UO₂) : 0.270 g|Uranium tetrafluoride (UF₄) : 0.314 g, Water (H₂O) : 0.036 g|750K - 950K|
|ChemicalFurnace（六氟化铀 (UF₆)）|Uranium tetrafluoride (UF₄) : 0.314 g, Fluorite powder (F₂) : 0.038 g|Uranium hexafluoride (UF₆) : 0.352 g|550K - 750K|

<font color="orange">*</font> 氟化氢（HF）的生产会触发高度放热反应。在这种特殊情况下，即使化学炉显示的温度值约为 3000K，产生的温度也不会影响化学反应。但在后续过程中，您需要在使用 HF 之前将其冷却，通常使用 [Active Radiator](../fluids/radiator/ActiveRadiator.md) 或类似的冷却设备。




---

### 浓缩离心机使用

|特性|值|
|---|---|
|功耗|1000 W|
|输入流量|0.1 kg/s|
|内部容量|10 kg|

操作：
- 第一台离心机从顶部接收六氟化铀（UF₆）。
- 重组分输出（底部）可以丢弃，因为它只含有 U238。
- 轻组分输出可以送入另一台离心机进行进一步处理。

> 通常，达到高 U235 浓度需要 8 到 10 台离心机的级联。

---

### 恢复为固态和铀棒 HEU 组装

|步骤|输入|输出|温度|
|---|---|---|---|
|ChemicalFurnace（氟化铀酰 (UO₂F₂)）|Uranium hexafluoride (UF₆) : 0.352 g, Water (H₂O) : 0.036 g|Uranyl fluoride (UO₂F₂) : 0.308 g, Hydrogen fluoride (HF) : 0.080 g|300K - 350K|
|ChemicalFurnace（二氧化铀 (UO₂)）|Uranyl fluoride (UO₂F₂) : 0.308 g, Hydrogen (H₂) : 0.002 g|Uranium dioxide (UO₂) : 0.270 g, Hydrogen fluoride (HF) : 0.040 g|750K - 850K|
|Crafter（铀棒 HEU (UO₂)）|Enriched uranium dioxide (UO₂) : 1000 g|Uranium rod HEU (UO₂, U235 content depends on enrichment) : 1|-|
