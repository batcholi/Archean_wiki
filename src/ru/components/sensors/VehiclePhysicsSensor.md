<p align="center">
    <img src="VehiclePhysicsSensor.png" />
</p>

|Component|`VehiclePhysicsSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**| 1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#

---

# Description
Vehicle Physics Sensor — компонент, предоставляющий информацию о физическом состоянии транспортного средства: масса, размер, центр масс и перегрузка.

# Usage
После установки на постройку датчик можно подключить к компьютеру для получения информации о физике транспортного средства. Доступная информация:
- Active Physics: указывает, активна ли физика.
- Mass: масса транспортного средства.
- Size (X,Y,Z): габаритные размеры транспортного средства.
- Center of Mass (X,Y,Z): положение центра масс относительно позиции датчика.
- G-force (X,Y,Z): перегрузка относительно ориентации датчика.

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Active Physics|0 or 1|
|1|Mass|kg|
|2|Size X|meters|
|3|Size Y|meters|
|4|Size Z|meters|
|5|Center of Mass X|meters|
|6|Center of Mass Y|meters|
|7|Center of Mass Z|meters|
|8|G-force X|G|
|9|G-force Y|G|
|10|G-force Z|G|
