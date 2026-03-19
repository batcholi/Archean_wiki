<p align="center">
  <img src="ItemJunction.png" />
</p>

|Component|`ItemJunction`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
|**Push/Pull Item**|Accept Push/Pull -> Forwards action to other side|
#
---
# Description
Item Junction — компонент, позволяющий распределять или объединять предметы.
Не влияет на стекирование.

# Usage
Item Junction передаёт предметы по логике, показанной на примере ниже. Порты на грани с четырьмя портами сообщаются только с портом на грани, содержащей один порт.

Когда предметы поступают через нижний порт этого компонента, они распределяются по принципу round robin.


<p align="center">
  <img src="diagrFluidJunction.png" />
</p>
