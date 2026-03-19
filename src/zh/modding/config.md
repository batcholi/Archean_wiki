# 制作配方

## 简介

要使你的 mod 组件可以在游戏中制作，你需要在 mod 文件夹的根目录创建一个 `config.yaml` 文件。此文件定义：
- **Items**：每个物品的最大堆叠数量
- **Recipes**：如何制作（Crafter）、回收（Crusher）或化学加工（Chemical Furnace）你的物品
- **Creative Inventory**：在 Creative 模式重置时出现在玩家背包中的物品

## Mod 文件夹结构

Mod 是一个包含所有自定义组件的文件夹。以下是预期的结构：

```
Archean/Archean-data/mods/
└── MYVENDORNAME_mymod/
    ├── config.yaml              <- 制作配方（本页）
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- 3D 模型
    │   │   ├── main.xc (optional)                <- XenonCode 脚本
    │   │   └── MyComponent1.png                  <- 缩略图
    │   └── MyComponent2/
    │       ├── MyComponent2 (.bin, .gltf, etc.)
    │       ├── main.xc (optional)
    │       └── MyComponent2.png
```

> **重要**：`config.yaml` 文件必须放在 mod 文件夹的根目录，而不是 `components` 子文件夹内。

## 文件结构

`config.yaml` 文件有以下部分：

```yaml
items:
  # 定义物品的最大堆叠数量

recipes:
  # 定义制作、回收和化学配方

inventory_creative_backpack:
  # 在 Creative 模式重置时添加到背包的物品
```

---

## Items 部分

`items` 部分定义每个 mod 物品的最大堆叠数量。物品名称必须遵循 `ModName.ComponentName` 格式。

```yaml
items:
  MYVENDORNAME_mymod.MyComponent1:
    max_stack: 64
  MYVENDORNAME_mymod.MyComponent2:
    max_stack: 256
```

### 常见 max_stack 值

| 值 | 典型质量范围 | 示例 |
|-------|-------------------|----------|
| 1 | 唯一物品 | 工具（RockRake、OreScanner）、UraniumRod |
| 8 | 400-1000 kg | Crusher、SteamTurbine、FissionReactor、MiningDrill |
| 64 | 50-200 kg | Crafter、Container、Gyroscope、RTG、PilotSeat |
| 256 | 1-50 kg | Battery、Sensors、Junctions、FluidPort |
| 1024 | < 1 kg | 零件（Screw、Wire、Diode、Circuit） |
| 10000000 | 克级 | 原材料（Iron、Copper 等） |

一般规则是，配方输入的总质量应大致等于组件的质量。例如，一个 100 kg 的组件大约需要 100 kg 的材料来制作。

---

## Recipes 部分

`recipes` 部分是配方条目的列表。有三种类型：
- **Crafter 配方**：用于在 Crafter 中制作新物品
- **Crusher 配方**：用于将物品回收为原材料
- **Chemistry 配方**：用于在 Chemical Furnace 中满足特定温度条件时进行的化学反应

---

### Crafter 配方

Crafter 配方定义了如何制作物品。这些配方同时在 Crafter 机器和角色的内置制作菜单中有效。

```yaml
recipes:
  - label: MyComponent
    context: crafter
    time: 10
    input:
      ARCHEAN_parts.Casing: 50
      ARCHEAN_parts.Circuit: 1
      ARCHEAN_parts.Connector: 4
    output:
      MYVENDORNAME_mymod.MyComponent: 1
```

| 字段 | 描述 |
|-------|-------------|
| `label` | 在 Crafter UI 中显示的名称 |
| `context` | 必须为 `crafter` |
| `time` | 制作时间（秒） |
| `input` | 所需材料（物品：数量） |
| `output` | 生产的物品（物品：数量） |

---

### Crusher 配方

Crusher 配方定义了将物品放入 Crusher 时返回的原材料。

```yaml
recipes:
  - context: crusher
    input: MYVENDORNAME_mymod.MyComponent
    output:
      ARCHEAN_celestial.Iron: 5000
      ARCHEAN_celestial.Silicon: 1000
```

| 字段 | 描述 |
|-------|-------------|
| `context` | 必须为 `crusher` |
| `input` | 要回收的单个物品名称 |
| `output` | 回收的材料（物品：数量） |

- <font color="orange">Crusher 配方是**可选的**。默认情况下，Crusher 会自动将物品分解为 100% 的原始制作材料。只有当你想覆盖此默认行为时才需要添加 Crusher 配方。</font>
- `input` 是单个物品名称（不是映射）。

---

### Chemistry 配方

Chemistry 配方定义了在 Chemical Furnace 中满足特定温度条件时发生的反应。

```yaml
recipes:
  - context: chemistry
    temperature_min: 750
    temperature_max: 950
    input:
      O2: 0.128
      H2: 0.004
    output:
      H2O: 0.036
      MYVENDORNAME_mymod.MyCompound:
        stack: 100
```

| 字段 | 描述 |
|-------|-------------|
| `context` | 必须为 `chemistry` |
| `temperature_min` | 反应的最低温度（开尔文） |
| `temperature_max` | 反应的最高温度（开尔文） |
| `exothermic_energy` | （可选）反应释放的能量（J/mol） |
| `input` | 所需流体/材料 |
| `output` | 生产的流体/材料 |

---

## 完整示例

```yaml
items:
  MYVENDORNAME_mymod.MyComponent:
    max_stack: 64

recipes:
  - label: MyComponent
    context: crafter
    time: 10
    input:
      ARCHEAN_parts.Casing: 10
      ARCHEAN_parts.Circuit: 1
    output:
      MYVENDORNAME_mymod.MyComponent: 1

inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```

---

## 可用的基础游戏物品

### 原材料 (ARCHEAN_celestial)
可用作配方输入：
- `ARCHEAN_celestial.Aluminium`
- `ARCHEAN_celestial.Carbon`
- `ARCHEAN_celestial.Chrome`
- `ARCHEAN_celestial.Copper`
- `ARCHEAN_celestial.Gold`
- `ARCHEAN_celestial.Iron`
- `ARCHEAN_celestial.Lead`
- `ARCHEAN_celestial.Nickel`
- `ARCHEAN_celestial.Silicon`
- `ARCHEAN_celestial.Silver`
- `ARCHEAN_celestial.Sulfur`
- `ARCHEAN_celestial.Tin`
- `ARCHEAN_celestial.Titanium`
- `ARCHEAN_celestial.Tungsten`
- `ARCHEAN_celestial.Uranium`
- `ARCHEAN_celestial.Fluorite`

### 零件 (ARCHEAN_parts)
这些是配方中常用的中间物品：
- `ARCHEAN_parts.Screw`
- `ARCHEAN_parts.Plastic`
- `ARCHEAN_parts.Wire`
- `ARCHEAN_parts.Connector`
- `ARCHEAN_parts.Magnet`
- `ARCHEAN_parts.Diode`
- `ARCHEAN_parts.Capacitor`
- `ARCHEAN_parts.Panel`
- `ARCHEAN_parts.Disk`
- `ARCHEAN_parts.Casing`
- `ARCHEAN_parts.Circuit`
- `ARCHEAN_parts.GoldPlatedCircuit`
- `ARCHEAN_parts.Motor`
- `ARCHEAN_parts.LED`

### 流体

化学系统支持化学式。以下是游戏中常用的流体：

| 化学式 | 名称 | 用途 |
|---------|------|---------|
| `O2` | 氧气 | Electrolyser、Thrusters、制作 |
| `H2` | 氢气 | Electrolyser、Thrusters、制作 |
| `H2O` | 水 | Electrolyser、化学 |
| `CH4` | 甲烷 | Thrusters（燃料）、Sabatier Reactor |
| `CO2` | 二氧化碳 | Sabatier Reactor |
| `HF` | 氟化氢 | 铀加工 |
| `F2` | 氟气 | 铀加工 |

你可以使用标准化学式定义自定义分子（例如 `NH3`、`C2H6`）。分子质量根据原子质量正确计算，但自定义分子的液态密度是近似的。

---

## Creative 背包

你可以使你的 mod 物品在 Creative 模式重置时出现在玩家的背包中。这对于测试或不需要制作配方的物品很有用。

### 背包物品

在重置时向玩家的背包添加物品：

```yaml
inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```
