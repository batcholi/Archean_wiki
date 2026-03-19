# 使用 Blender 进行 3D 建模

## 插件安装

以下是两种在 Blender 中安装插件的方法。

### 方法 1：从 ZIP 安装

1. 前往插件仓库 [Archean Blender Plugin](https://github.com/batcholi/archean_blender_plugin)
2. 点击绿色的 "Code" 按钮并选择 "Download ZIP"
3. 打开 Blender
4. 在 Blender 中，前往 Edit > Preferences > Add-ons
5. 选择 "Install from Disk"，然后选择你下载的 ZIP 文件

   <img src="./blender-res/fromdisk.png"/>
6. 安装完成后，在插件列表中启用该插件。

### 方法 2：通过克隆仓库安装
1. 在系统上打开终端。
2. 通过运行以下命令将插件仓库克隆到 Blender 的插件文件夹中：
   ```bash
   git clone https://github.com/batcholi/archean_blender_plugin <addons_path>
   ```
3. 启动 Blender 并确认插件出现在插件列表中。
4. 如需要，启用该插件。

<font color="orange">Windows 用户：</font>安装 **Git** 并使用 `Git Bash` 来克隆仓库。在命令提示符 (CMD) 中，如果可执行文件路径未添加到环境变量，Git 将不会被识别。

---

## 插件概述

该插件为 Blender 添加了两个新元素：
1. 在 Object 模式的 "Add" 菜单中，新增了一个对象类型 **Archean Entity**，用于添加创建新组件的基础结构。

	<img src="./blender-res/menuAdd.png"/>

2. 在视口中，出现 **Archean** 菜单，包含各种设置。

	<img src="./blender-res/tabarchean.png"/>

## 使用插件

Archean 实体始终由特定结构组成。以下是其元素：

*标记为<font color="green">绿色</font>的项目是必需的，<font color="orange">橙色</font>的项目是可选的。*
- **<font color="green">Entity Root</font>**：实体的根对象。它对导出至关重要，必须始终存在。
- **<font color="green">Renderable</font>**：Entity Root 的子对象。这是在游戏中可见的对象。你可以有多个，但我们建议优化以尽可能减少。
- **<font color="orange">Collider</font>**：Entity Root 的子对象，定义碰撞区域。Collider 可以包含 6 到 8 个顶点。你可以在实体中放置多个碰撞体，但出于性能原因我们鼓励保持较少的数量。
- **<font color="orange">Adapter</font>**：Entity Root 的子对象，通常与 **Single Arrow** 组合使用，定义用于数据、电力、流体或物品线缆的连接点。
- **<font color="orange">Joint</font>**：Entity Root 的子对象，通常与 **Single Arrow** 组合使用，定义通过平移或旋转来动画化实体部分的关节点。Joint 成为其内包含的任何对象（包括其他 Joint）的父级。
- **<font color="orange">Target</font>**：Entity Root 的子对象，通常与 **Single Arrow** 组合使用，定义可用于通过 XenonCode 添加功能的位置和方向。

### 参数概述
根据你选择的是 Entity Root 还是其子对象，可用设置列表会有所不同。
#### Entity Root 菜单按钮
- **Export this Entity and Save**：将实体导出到 .blend 文件保存的文件夹，然后保存文件。
- **Generate Thumbnail**：生成实体的缩略图，用作游戏中的图标。
#### Entity Root 参数
- **Is Entity Root**：勾选此框将对象标记为 Entity Root。这将解锁实体特定的功能。
- **Mass (kg)**：实体的质量，单位为千克。
- **Airtight**：定义实体在 Archean 建造系统中是否气密。请记住，考虑的体积是碰撞体的体积，而非渲染对象的体积。如果导出时没有碰撞体，游戏会自动创建一个包围实体的碰撞体。
- **Base Plane is Minus Y**：默认情况下，实体的基础平面与 -Z 轴对齐。勾选此框可改为与 -Y 轴对齐。
- **Export Vertex UVs**：勾选此项以导出 UV 坐标。使用屏幕、纹理时尤为重要。

#### 子对象菜单按钮
- **Create Default Materials**：Archean 对实体、端口等使用特定的调色板。点击此按钮自动生成默认材质。
#### 子对象参数
- **Is Renderable**：标记此对象将在游戏中渲染。子参数 **Export Sharp Edges** 出现，允许你导出在 Blender 中标记为 "Sharp" 的边，使其在游戏中的全息图中显示为线框。
- **Is Joint**：将对象标记为关节。将出现子参数列表，用于启用旋转和平移约束。
- **Is Target**：将对象标记为可用于功能的目标。其位置和方向取决于用途。
- **Is Collider**：将对象标记为碰撞体。碰撞体必须简单，包含 6 到 8 个顶点。子参数 **Is Build Block** 出现，使碰撞体也可以作为建造方块，允许实体或方块在其上吸附并与 Archean 网格保持对齐。
- **Is Adapter**：将对象标记为数据、电力、流体或物品线缆的连接点。下拉子参数和 **Create Mesh** 按钮允许你直接生成连接器网格。

> Archean 开发团队通常依赖 **Single Arrow** 对象来处理适配器、关节和目标，因为它们只是一个位置和一个方向。

---

## 创建你的第一个实体

第一个重要步骤是在 3D 空间中正确定位。在 Archean 中，Y 轴是前/后，X 轴是左/右，Z 轴是上/下。

<img src="./blender-res/frontback.png"/>

1. 打开 Blender 并创建一个新场景。
2. 删除场景中当前的所有内容（默认有一个立方体、一个摄像机和一个灯光）。
3. 在 Object 模式的 "Add" 菜单中，添加一个新的 **Archean Entity**。

   此初始对象包含一个 **Entity Root** 和一个标记为 **Renderable** 的简单立方体。Entity Root 的名称是用于导出和游戏中的实体名称。

   > **Entity Root** 名称不能包含空格或特殊字符——仅字母数字字符。
4. 将立方体缩放为 `0.5 x 0.5 x 0.5`，即 `50 x 50 x 50 cm`，因为默认立方体太大。*（游戏中为 2 x 2 x 2 米。）*
5. 在继续之前保存项目到文件夹中，以便稍后导出实体。
   > - 将项目保存到你的组件文件夹：`Archean/Archean-data/mods/MYVENDOR_mymod/components/MyComponentName/`
   > - 参见 [Getting Started](getting-started.md) 了解如何创建 mod 并设置此文件夹结构。
   > - <font color="orange">一个 mod 可以包含多个组件，每个组件在自己的文件夹中。</font>
   > - <font color="red">/!\ 组件文件夹名称必须与 Entity Root 名称匹配。</font>

### 添加数据端口
在立方体的一个面上添加一个 **Single Arrow** 对象来创建数据端口。生成其网格，分配正确的材质，并将其加入主对象以避免创建单独的 renderable。因为端口通常使用平滑着色，对主对象应用 "Edge Split" 修改器以防止视觉伪影。

<video src="./blender-res/dataport.mp4" width="700" height="438" controls loop muted></video>

### 添加关节来旋转 Suzanne
在立方体顶部添加一个 **Single Arrow** 对象来定义关节点。将其标记为 **Is Joint** 并仅启用绕 Z 轴旋转。然后将关节的子对象——Suzanne（Blender 的猴头）和底座圆柱——设为其子级。

由于 Suzanne 可以完全旋转，将 **-360** 设为 **Low** 值，**0** 设为 **Neutral**（默认位置），**360** 设为 **High**。

<video src="./blender-res/joint.mp4" width="700" height="438" controls loop muted></video>

### 添加屏幕
作为示例，创建一个将作为屏幕基础的对象。首先分配一个看起来像显示器的材质，然后通过选择屏幕面来展开 UV，使其填充整个 UV 编辑器。

> 确保在 Entity Root 上启用 **Export Vertex UVs** 以导出 UV 坐标。
> 屏幕材质的外观由你决定；例如，你可以将玻璃表面变成屏幕。

<video src="./blender-res/screen.mp4" width="700" height="438" controls loop muted></video>

### 添加碰撞体
最后，添加一个定义实体碰撞区域的碰撞体。添加一个立方体，缩放以包围整个实体，并正确定位。将其标记为 **Is Collider** 并在视口中隐藏。

<video src="./blender-res/collider.mp4" width="700" height="438" controls loop muted></video>

### XenonCode 的端口管理
端口命名遵循特定约定，使其在 XenonCode 中易于识别。具体如下：
- 数据端口必须使用格式 `data.index` 命名为 **data**，如果只有一个则简单命名为 `data`。这种命名是必需的，以便在 XenonCode 中使用 `input.index` 和 `output.index` 访问。
  两个数据端口的示例：命名为 `data.0` 和 `data.1`。在 XenonCode 中，你将使用 `input.0` 和 `input.1` 访问它们。
  单个数据端口的示例：简单命名为 `data`。在 XenonCode 中，你将使用 `input.0` 和 `output.0` 访问。

- 所有其他端口类型（Power、Fluid、Item 等）没有特定的命名要求。它们声明的名称直接在 XenonCode 中使用。

### 生成缩略图和导出
一切配置完成后，生成缩略图并导出实体。
- 正确重命名 Entity Root。
- 确保 Suzanne 被标记为 Renderable。

<video src="./blender-res/suzanne.mp4" width="700" height="438" controls loop muted></video>

## 常见问题
### 为什么我有时在插件菜单中看到 "Fix now" 消息？
对象需要应用其缩放以避免导出问题。"Fix now" 按钮一次性为场景中的每个对象应用缩放。通常你可以通过使用 **Ctrl + A** 并选择 **Apply > Scale** 来应用对象的缩放以防止此消息。

### 缩略图方向不合适。如何更改？
旋转 Entity Root 来改变缩略图的取景方式。我们建议不要应用该旋转，以便你可以轻松将实体恢复到原始方向。只有在视觉效果发生变化时才需要重新生成缩略图。

### 为什么应该避免创建太多 Renderable？
Archean 的渲染引擎是 100% 光线追踪的，因此顶点数量影响不大。然而对象的数量对性能有直接影响。请记住 `Renderable 数量 = 每个实体的 renderable 数 * 实体数量`，范围大约在 100 km 半径内，取决于实体的最终大小。*（实体越大，渲染半径越大。）*

### 文本显示为纹理好还是网格好？
得益于光线追踪，网格文本通常性能更好且看起来更好，因为它提供更高的视觉质量且相比纹理消耗更少的 VRAM。

### 我习惯为游戏制作低多边形资产。我应该为 Archean 这样做吗？
完全不需要——你可以创建非常详细的模型。光线追踪提供极高的视觉质量。有趣的事实：Blender 可能会在 Archean 之前崩溃。尽情享受那些顶点吧！

### 官方组件使用什么颜色？
当你使用 **Create Default Materials** 生成材质时，**Color1** 是大多数组件上使用的白色，**Color2** 是金属灰色，**Body** 是黑色。其他材质的名称不言自明。
