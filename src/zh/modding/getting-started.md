# Getting Started

## 创建 Mod

Mod 是在游戏内创建的，位于 **Mods** 标签页下的 **Local Mods** 中。

### 1. 预留 Vendor 名称
点击 **Reserve Vendor Name** 来选择一个唯一的供应商标识符。此名称必须为 **3 到 12 个字母数字字符**，并会自动转换为**大写**。此名称是永久性的，之后无法更改。

### 2. 创建新 Mod
预留 vendor 名称后，在 **Create New Mod** 字段中输入 mod 名称。Mod 名称必须为 **3 到 12 个字母数字字符**，并会自动转换为**小写**。点击 **Create New Mod** 生成 mod 文件夹。

## Mod 文件夹结构

创建 mod 后，将生成以下文件夹结构：

```
Archean/Archean-data/mods/
└── MYVENDOR_mymod/
    ├── config.yaml              <- 制作配方（可选）
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- 3D 模型
    │   │   ├── main.xc (optional)                <- XenonCode 脚本
    │   │   └── MyComponent1.png                  <- 缩略图
    │   └── MyComponent2/
    │       ├── ...
```

每个组件都在 `components/` 内有自己的子文件夹。子文件夹名称必须与 Blender 中定义的 Entity Root 名称匹配。

> 一个 mod 可以包含多个组件。

## 创建组件

组件至少需要一个从 Blender 导出的 **3D 模型**。XenonCode 脚本和制作配方是可选的。

| 步骤 | 描述 | 页面 |
|------|-------------|------|
| **3D 模型**（必需） | 使用 Archean Blender 插件创建和导出 3D 模型 | [使用 Blender 进行 3D 建模](blender.md) |
| **XenonCode 脚本**（可选） | 使用 `main.xc` 脚本添加行为：屏幕、动画、物理、音频、端口... | [使用 XenonCode 添加功能](xenoncode.md) |
| **制作配方**（可选） | 通过 `config.yaml` 定义组件的制作、回收或加工方式 | [制作配方](config.md) |

## 发布

mod 准备好后，你可以通过点击 **Local Mods** 标签页中 mod 上的 **Publish** 直接发布到 Steam Workshop。Mod 的 vendor 前缀必须与你预留的 vendor 名称匹配。
