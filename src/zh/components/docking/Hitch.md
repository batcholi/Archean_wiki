<p align="center">
  <img src="Hitch.png" />
</p>

|Component|`Hitch`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description  
Hitch 组件将两个建造在一个固定点连接在一起，同时允许围绕连接点自由旋转。连接后，载具在位置上保持锁定，但可以围绕铰接点相对彼此自由旋转。

# Usage  

Hitch 有一个**数据端口**用于控制其状态。  
当两个 Hitch 组件被激活（启用）并靠近时，它们会自动连接。
可以随时通过停用任一组件来断开连接。

> - 出于性能原因，铰接的建造之间不处理碰撞。游戏使用服务器端物理引擎，在近距离载具之间持续检测碰撞的代价太高。未来的更新可能允许玩家在所有铰接轴上定义约束以模拟物理限制，例如防止拖车旋转超过一定角度以避免穿模到牵引车中。

### List of inputs
|Channel|Function|value|
|---|---|---|
|0|Arm/Disarm Docking|0 or 1|

### List of outputs
|Channel|Function|value|
|---|---|---|
|0|Is Docked|0 or 1|
