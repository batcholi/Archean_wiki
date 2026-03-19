<p align="center">
  <img src="FluidJunction.png" />
</p>

|Component|`FluidJunction`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
Fluid Junction — компонент, позволяющий разделять или объединять потоки жидкостей.

# Usage
Fluid Junction передаёт жидкости по логике, показанной на примере ниже. Порты на грани с четырьмя портами сообщаются только с портом на грани, содержащей один порт.

Когда жидкость поступает через единственный нижний порт, она распределяется между четырьмя верхними портами в зависимости от пропускной способности подключённых компонентов. Если все порты открыты, жидкость делится поровну. Однако если один или несколько портов закрыты (например, с помощью [Fluid Valve](./FluidValve.md)), общий объём жидкости перераспределяется только между оставшимися портами, способными принять поток.

<p align="center">
  <img src="diagrFluidJunction.png" />
</p>
