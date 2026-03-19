# Push & Pull

在 Archean 中，物品和流体不会自行移动。两个组件之间的每次传输都遵循 **Push/Pull** 模型：一方必须主动发起操作，另一方必须接受操作。

理解这个系统对于构建功能性设施至关重要。每个组件的 wiki 页面都在顶部的信息表中标明了其 Push/Pull 模式。

## 三种角色

### Initiate
**发起**操作的组件主动启动传输。它会向连接到其输出端的组件推送物品/流体，或从连接到其输入端的组件拉取。

### Accept
**接受**操作的组件是被动的。它可以接收推送或响应拉取，但永远不会自行发起传输。

### Forward
**转发**操作的组件将操作传递到另一端。它不存储任何东西——只是将推送或拉取操作从一个端口转发到另一个端口。

> 转发器是透明的：如果某物推送到 Bridge 的一端，Bridge 就会推送到另一端连接的组件。拉取同理。

## 工作原理

- **Push**：源端将物品/流体发送到目标端。源端决定发送*什么*以及*何时*发送。
- **Pull**：目标端从源端请求物品/流体。目标端决定获取*什么*以及*何时*获取。

只有当一方**发起**、另一方**接受**（或转发到接受方）时，连接才能工作。两个被动组件连接在一起永远不会传输任何东西。

---

## 常见错误

考虑以下配置：**Mining Drill → Container → Crusher**

Drill **发起推送**，所以石头到达了 Container。但 Container 只能**接受**——它永远不会主动推出任何东西。而 Crusher 也只**接受推送**——它不会从 Container 拉取。结果：石头在 Container 中堆积，没有任何东西到达 Crusher。

### 解决方案

**Mining Drill → Crusher → Container**
Drill 推送石头到 Crusher，Crusher 接受并加工它们，然后将产生的矿石推送到 Container。

**Mining Drill → Container → Item Conveyor → Crusher → Container**
[Item Conveyor](components/items/ItemConveyor.md) 是一个**发起者**——它主动从第一个 Container 拉取并推送到 Crusher。当您想要缓冲石头或控制流量时，这很有用。

---

## 阅读组件页面

每个组件页面都在信息表中显示其 Push/Pull 模式：

| 模式 | 含义 |
|---|---|
| `Initiate Push` | 主动推送到其输出端 |
| `Initiate Pull` | 主动从其输入端拉取 |
| `Initiate Push/Pull` | 主动执行两者 |
| `Accept Push` | 被动接收推送 |
| `Accept Pull` | 被动响应拉取 |
| `Accept Push/Pull` | 被动接受两者 |
| `Accept Push/Pull -> Forwards action to other side` | 转发操作到另一端 |

某些组件兼具多种角色——例如，Crusher 在其输入端**接受推送**（石头进入），在其输出端**发起推送**（矿石输出）。
