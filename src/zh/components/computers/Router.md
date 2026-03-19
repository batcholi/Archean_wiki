<p align="center">
  <img src="Router.png" />
</p>

|Component|`Router`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
#
---

# Description
Router 是一种用于将不同组件连接到网络的设备。其主要优势是能够连接几乎无限数量的组件，所有组件都可由网络上的一台或多台计算机控制。相比之下，单台计算机连接组件的能力受到其可用端口数量的限制。

每个 Router 配备 30 个数据端口。它们可以链式连接以增加可用端口总数，从而将端口数乘以链接在一起的 Router 数量。

它需要低压电源才能运行，功耗为 50 瓦。

> - 不能将多个独立的 Router 网络连接到同一台计算机的不同端口。一台计算机只能与一个统一的 Router 网络接口，但该网络可以包含无限数量的链式 Router。

# Usage
当 Router 通电并连接到组件时，它允许通过三维可视化界面为组件分配别名，这些别名稍后可用于从计算机代码中识别这些组件。

您可以使用 `F` 键打开 Router 界面。

该界面以 3D 环境形式呈现（见下图），您可以在其中按住 `鼠标右键` 导航，使用标准移动键 `WASD`，`CONTROL/SPACE` 下降/上升，`Shift` 加速移动。

组件按照它们在建造中的实际 3D 相对位置放置，并将包括链中所有 Router 连接的所有组件。

![Router](routerillus1.png)

每个组件显示一个标签，您可以在其中输入稍后将在计算机上使用的别名。要了解如何使用别名，请参阅 XenonCode IDE 页面。

也可以通过使用 `V` 键显示组件的信息窗口来直接为其分配别名，如下例所示。

![Router](routerillus2.png)

# Controlling multiple components with a single alias
在某些情况下，使用单个别名控制多个具有相同用途的组件可能很实用。为此，只需在节点/XenonCode 中的别名末尾添加星号 `*`。例如，如果您正在建造一架飞机，左翼有四个副翼，您可以按如下方式命名：
- `leftAileron1`
- `leftAileron2`
- `leftAileron3`
- `leftAileron4`

然后您可以使用别名 `leftAileron*` 来控制它们。星号 `*` 允许您选择所有别名以 `leftAileron` 开头的组件。

# Additional information:
- 与计算机直接通信的 Router 必须通电，链中的其他 Router 不需要电源。这也允许将 [MiniRouter](MiniRouter.md) 当作 [Data Bridge](DataBridge.md)（无需电源）使用，但与 [DataBridge](DataBridge.md) 不同的是，它实际上能够解析别名和屏幕引用。

- 对于数据路由，Router 必须直接连接到计算机或另一个 Router。不能使用这种模式：`Computer > DataBridge/DataJunction > Router`。
