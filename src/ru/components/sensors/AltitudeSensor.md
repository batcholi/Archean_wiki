<p align="center">
  <img src="AltitudeSensor.png" />
</p>

|Component|`AltitudeSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Altitude Sensor передаёт через порт данных высоту между позицией датчика и землёй или центром небесного тела.

# Usage
После установки на постройку его можно подключить, например, к компьютеру для получения высоты в метрах. Ориентация датчика высоты не влияет на его работу.

### List of outputs
|Channel|Function|
|---|---|
|0|Absolute Altitude|
|1|Above Terrain|

>- В режиме "Above Terrain" вода не считается рельефом.
>- Датчик высоты работает только в среде небесного тела.
