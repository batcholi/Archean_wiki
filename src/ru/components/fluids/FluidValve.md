<p align="center">
  <img src="FluidValve.png" />
</p>

|Component|`FluidValve`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|accept Push/Pull -> forwards action to other side|
#
---

# Description
Fluid Valve — компонент, позволяющий управлять потоком жидкости, проходящей через него.

# Usage
По умолчанию клапан закрыт и блокирует прохождение жидкости. Для управления потоком отправьте сигнал данных от `0 (Закрыт)` до `1 (Открыт)`.

Клапан выводит температуру проходящей через него жидкости на канале 0.
