# 采矿

Archean 中的采矿是指在天体地形中寻找、收集和加工矿物资源的过程。它是制造系统的基础——没有矿石，您什么也造不了。

完整的采矿流程为：**扫描 → 收集 → 碾碎 → 制造**。

## 定位矿石

在收集石头之前，您应该先确定哪里有高浓度的矿石。

[Ore Scanner Tool](tools/OreScannerTool.md) 是一个手持设备，可以实时显示您面对方向的矿石密度图。只需装备它并四处查看——这是勘察地点最快的方式。

如需自动扫描，[Ore Scanner](components/mining/OreScanner.md) 组件可通过 [XenonCode](xenoncode/documentation.md) 控制，并以[键值文本对象](xenoncode/documentation.md#key-value-objects)的形式返回成分数据。

---

## 收集石头

石头是散布在天体表面的小型物体。它们大小不一，**越大的石头在捡起时提供越多的材料**。

### 徒手捡取
没有装备任何工具时，按 `LMB` 捡起石头。每块石头需要单独点击。

### Rock Rake Tool
[Rock Rake](tools/RockRakeTool.md) 是手动收集石头的推荐方式：

- **按住 `LMB`**：持续捡起您看向的石头
- **`RMB`**：在捡起石头前检查其成分和产出

---

## 自动采矿 — Mining Drill

[Mining Drill](components/mining/MiningDrill.md) 自动从地形中提取石头。它必须安装在使用 [Ground Anchor](components/miscellaneous/GroundAnchor.md) 固定的建筑上。

钻头的效率会随深度降低——当产出下降时，您应该**定期搬迁**钻头。详细规格请参阅 [Mining Drill](components/mining/MiningDrill.md) 页面。

---

## 石头成分

每块石头都有一个**成分**——一组元素及其各自的密度，由其在地形上的位置决定。成分以[键值文本对象](xenoncode/documentation.md#key-value-objects)表示：

`.Al{0.1500}.Fe{0.2000}.Si{0.6500}` — 表示 15% 铝、20% 铁、65% 硅。

**成分相同**的石头会在物品栏中堆叠。不同成分的石头占据不同的格子。

### 元素

|符号|元素|符号|元素|
|---|---|---|---|
|Al|铝|Ni|镍|
|C|碳|Si|硅|
|Cr|铬|Ag|银|
|Cu|铜|Sn|锡|
|Au|金|Ti|钛|
|F|萤石|W|钨|
|Fe|铁|U|铀|
|Pb|铅|Ch|???|

---

## 加工石头

要将石头转化为可用的矿石，您需要碾碎它们。有两种方法：

### 角色加工（前期）
您的背包有一个内置的 **Item Processing Area**（1 个格子），可从[制造界面](interfaces.md#item-processing-area)访问。将石头放入此格子并点击 **Crush** 即可直接从物品栏中将石头转化为矿石。速度较慢但不需要任何基础设施——这是 Adventure 模式中获取第一批矿石的方法。

### Crusher 组件（自动化）
[Crusher](components/mining/Crusher.md) 是一个可放置的组件，用于大规模加工。它根据石头的成分按比例将其转化为矿石。例如，碾碎 10 Kg 含 20% 铁的石头可获得 2000 g 铁矿石。

当浓度很低时，Crusher 会在多块石头之间累积小数量，直到能产出至少 1 单位——不会有任何损失。

> Crusher **不会**从输入端主动拉取——石头必须被 [push](pushpull.md) 到它。详见 [Push & Pull](pushpull.md) 页面。

---

## 资源分布

矿石分布因天体、海拔和火山特征的距离而异。详见 [Earth](celestialbodies/earth.md) 和 [Moon](celestialbodies/moon.md)。

|稀有度|元素|寻找地点|
|---|---|---|
|常见|Si, Fe, C, Cu, Sn|各处 / 海平面以上|
|不常见|Al, Ag|高海拔（山区）|
|稀有|Ni, Cr, Ti, W|高海拔 / 极高海拔|
|非常稀有|Au, Pb, U, F|深海 / 火山附近|

- **火山**增加铁和铅的产出，并且是**萤石的唯一来源**

---

## 实用技巧

- **先勘察**：使用 Ore Scanner Tool 找到富含所需矿石的地点后再放置基础设施
- **典型配置**：Mining Drill → Crusher → Container，或 Mining Drill → Container → [Conveyor](components/items/ItemConveyor.md) → Crusher
- **规模**：1 台 Crusher 在高压下最多可处理 4 台 Mining Drill 的产出
- 当效率显著下降时**搬迁钻头**
- **前期使用 Rock Rake**：用它收集第一批铁矿并制造出 Mining Drill
- **检查成分**：用 Rock Rake 右键点击石头，在捡起前查看其含量
