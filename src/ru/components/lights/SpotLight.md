<p align="center">
  <img src="SpotLight.png" />
</p>

|Component|`SpotLight`|
|---|---|
|**Module**|`ARCHEAN_light`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
SpotLight — компонент, позволяющий освещать большую область с максимальным углом 120°. Особенно подходит для установки на транспортные средства в качестве фары.

# Usage
SpotLight должен быть подключён к низковольтному питанию и потребляет до 1000 Вт в зависимости от мощности, установленной в информационном меню, доступном по клавише `V`.

Цвет прожектора можно изменить через информационное меню или через порт данных.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|
