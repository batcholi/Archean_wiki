# N-Body Physics

## 简介
Archean 支持两种适用于天体大气层外实体的物理模式：

- **主引力物理（默认）**：对实体影响最大的天体引力将作用于该实体。
- **N-Body Physics**：所有天体的引力都将作用于该实体。

## 为什么 N-Body Physics 默认未启用？
**N-Body Physics** 提供了更真实的模拟，适合具有高级太空物理知识、希望获得额外挑战的玩家。现实中，航天机构依靠超级计算机来计算卫星和探测器的轨迹并根据需要进行调整。在 *Archean* 中，玩家必须手动执行这些计算，受限于 **XenonCode** 计算机有限的算力。

*Archean* 中的一个特殊问题是，在那个时代月球距地球非常近，使得在不受月球引力严重影响的情况下实现稳定的地球轨道几乎不可能。然而，使用**主引力物理**模式，玩家可以在地球轨道上专注于地球引力而忽略月球的影响。

## 配置
要启用 N-Body Physics，您需要修改文件 `Archean-data/server/ARCHEAN_celestial.ini`，将 `nbody` 的值设置为 `yes`。

---
## 附加信息
使用 N-Body Physics 时，我们不建议使用 [NavInstrument](/components/navigation/NavInstrument.md)，因为它是为主引力物理模式原生设计的。虽然可以在 N-Body Physics 下使用它，但它会返回不准确的信息，您的轨道将不稳定。
