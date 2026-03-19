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
Der Altitude Sensor sendet die Höhe zwischen der Sensorposition und dem Boden oder dem Zentrum des Himmelskörpers über seinen Datenport.

# Usage
Sobald er auf Ihrem Build platziert ist, kann er zum Beispiel mit einem Computer verbunden werden, um die Höhe in Metern abzurufen. Die Ausrichtung des Altitude Sensors hat keinen Einfluss auf seine Funktion.

### List of outputs
|Channel|Function|
|---|---|
|0|Absolute Altitude|
|1|Above Terrain|

>- Im Modus "Above Terrain" wird Wasser nicht als Terrain betrachtet.
>- Der Altitude Sensor funktioniert nur in der Umgebung eines Himmelskörpers.
