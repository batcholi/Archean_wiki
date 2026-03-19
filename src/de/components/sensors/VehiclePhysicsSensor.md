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
Der Vehicle Physics Sensor ist eine Komponente, die Informationen über den physikalischen Zustand des Fahrzeugs liefert: Masse, Größe, Schwerpunkt und G-Kraft.

# Usage
Sobald er auf Ihrem Build platziert ist, kann der Sensor mit einem Computer verbunden werden, um Informationen über die Physik des Fahrzeugs abzurufen. Hier sind die abrufbaren Informationen:
- Active Physics: Gibt an, ob die Physik aktiv ist oder nicht.
- Mass: Die Masse des Fahrzeugs.
- Size (X,Y,Z): Die Begrenzungsgröße des Fahrzeugs.
- Center of Mass (X,Y,Z): Die Position des Schwerpunkts relativ zur Sensorposition.
- G-force (X,Y,Z): Die G-Kraft relativ zur Ausrichtung des Sensors.

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
