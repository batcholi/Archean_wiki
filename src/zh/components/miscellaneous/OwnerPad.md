<p align="center">
  <img src="ownerpad.webp" />
</p>

|Component|`OwnerPad`|
|---|---|
|**Module**|`ARCHEAN_ownership`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
OwnerPad 是一种多功能安全设备，用于保护建筑免受潜在的恶意操作。

除了其安全功能外，它还允许您保存建筑或载具的状态（位置、速度、电池电量、开关状态等）。  
通过此功能，您可以一键即时恢复到该状态。

# Usage
### SAVE & RESET Button
`SAVE` 按钮保存建筑的位置及其组件的状态，而 `RESET` 按钮将建筑重置为上次保存时的状态。

### ROLES Button
角色允许您授权/禁止对建筑的操作，如示例图所示。它们旨在确保您的建筑免受其他玩家的恶意行为。
当您在建筑上放置 OwnerPad 时，如果没有其他 OwnerPad 存在，您将成为该建筑的所有者。

默认情况下，所有权限设置为 `@Everyone`，使建筑完全公开。  
除了示例中的 `@Everyone` 和 `dksm (OWNER)` 外，所有已连接玩家的列表都会显示出来，允许您为选定的玩家分配角色。

每个已连接玩家旁边都有一个 `Give Ownership` 按钮，可以将所有权转让给您选择的玩家。之后，在新所有者授予您角色之前，您将没有该建筑的任何权限。

![OwnerPadDemo](RolesUI.png)

### Control via the data port
OwnerPad 有一个数据端口，允许从计算机或通过 Beacon 远程控制。
您必须在通道 0 中发送包含关键字 `"save"` 或 `"reset"` 的文本，取决于您要执行的操作。

在发送另一个命令之前，您必须先发送空文本 `""` 来重置状态。
