<p align="center">
    <img src="BlueprintTool.png" />
</p>

|Item|`BlueprintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Blueprint Tool 允许你保存建筑的副本。Blueprint 以 `.json` 格式保存在 `(Client Settings)/blueprints` 文件夹中，每个 Blueprint 一个文件，以其名称命名。

通过此系统，你可以将建筑转移到其他世界或服务器，与朋友分享，或简单地复制一个建筑。

# Usage

## 扫描建筑
1. **左键**进入扫描模式（范围：100 米）
2. 瞄准你想保存的建筑
3. **按住左键**一秒钟以扫描并保存 Blueprint
4. 在弹出对话框中输入名称

### 更新现有 Blueprint
要更新现有 Blueprint，只需输入与现有 Blueprint 完全相同的名称。**Create** 按钮将变为 **Update**，允许你覆盖先前版本，同时保留已发布的 Steam Workshop ID。

## 生成 Blueprint
1. **右键**打开 Blueprint 界面
2. 使用**搜索栏**按名称筛选 Blueprint
3. 从 **Local** 或 **Steam Workshop** 标签页选择一个 Blueprint
4. 点击 **Spawn** 进入放置模式

### 放置控制

#### 自由放置（新建筑）
| 操作 | 控制 |
|--------|---------|
| 确认生成 | **按住左键**（2 秒） |
| 旋转 | **鼠标滚轮** |
| 吸附到地面并设为静态 | **按住 Shift** |
| 取消 | **右键** |

#### 在现有建筑上
瞄准现有建筑时，**快速按左键**可附加 Blueprint 并进入 **Gizmo 模式**：

| 操作 | 控制 |
|--------|---------|
| 平移 / 旋转 | **Gizmo 手柄**（拖动） |
| 切换鼠标视角 | **右键** |
| 确认生成 | **在 Gizmo 外按住左键**（2 秒），或 **Spawn** 按钮 |
| 取消 | **右键**（不在鼠标视角模式时） |

### 在太空中生成
在太空中靠近现有建筑时，你可以像[创建新建筑](ConstructorTool.md#creating-a-build-in-space)一样生成 Blueprint。

## Steam Workshop
- 点击本地 Blueprint 旁边的 **Publish** 将其上传到 Steam Workshop
- 发布时有内置的截图工具可用

# Notes
- 在冒险模式中，所需物品会显示其状态（绿色 = 可用，红色 = 缺少，橙色 = mod 未激活）
- 如果已添加 [OwnerPad](../components/miscellaneous/OwnerPad.md)，你必须拥有 "Build" 权限才能保存 Blueprint
