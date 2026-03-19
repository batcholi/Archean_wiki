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
El Vehicle Physics Sensor es un componente que proporciona información sobre el estado físico del vehículo, masa, tamaño, centro de masa y fuerza G.

# Usage
Una vez colocado en tu construcción, el sensor puede conectarse a un ordenador para obtener información sobre la física del vehículo. Aquí está la información que puedes obtener:
- Active Physics: Indica si la física está activa o no.
- Mass: La masa del vehículo.
- Size (X,Y,Z): El tamaño del cuadro delimitador del vehículo.
- Center of Mass (X,Y,Z): La posición del centro de masa relativa a la posición del sensor.
- G-force (X,Y,Z): La fuerza G relativa a la orientación del sensor.

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
