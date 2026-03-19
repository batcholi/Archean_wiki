<p align="center">
  <img src="DensitySensor.png" />
</p>

|Component|`DensitySensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Der Density Sensor ist eine Komponente, die die Dichte und Zusammensetzung der Umgebung misst, in der er platziert ist.

# Usage
Sobald er auf Ihrem Build platziert ist, kann er zum Beispiel mit einem Computer verbunden werden, um die Dichte und Zusammensetzung der Umgebung abzurufen. Die Zusammensetzung wird als Key-Value-String angegeben.

### List of outputs
|Channel|Function|value|
|---|---|---|
|0|Density (kg/m³)|number|
|1|Composition|text|
