<p align="center">
  <img src="DistanceSensor.png" />
</p>

|Component|`DistanceSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
El sensor de distancia es un telémetro láser que mide la distancia a la superficie más cercana (terreno o construcción). Puede detectar tanto el terreno como los colliders de otras construcciones dentro de un rango configurable.

# Usage
Una vez colocado en tu construcción, requiere una conexión de energía de bajo voltaje y una conexión de datos para funcionar. El sensor dispara un rayo a lo largo de su cara frontal. Cuando la entrada "Show Laser" está activada, se muestra un rayo láser rojo visible hasta la superficie detectada.

### Rango y escaneo multi-tick
El rango predeterminado es 1000m (un solo tick, resultado instantáneo). El rango puede extenderse hasta 25.000m mediante el canal de entrada "Max Range". Cuando el rango excede 1000m, el escaneo del terreno se divide en múltiples ticks del servidor (128 pasos de terreno por tick):

|Range|Ticks|Delay|
|---|---|---|
|1,000 m|1|instant|
|5,000 m|5|~200 ms|
|10,000 m|10|~400 ms|
|25,000 m|25|~1 s|

> La detección de entidades (construcciones) es siempre instantánea independientemente del rango. Solo el trazado del terreno se divide en ticks.

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|On/Off|number (≠ 0 = on)|
|1|Show Laser|number (≠ 0 = on)|
|2|Max Range|number (meters, 1000-25000, default 1000)|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Distance|number (meters, -1 if out of range)|

>- Cuando está inactivo o fuera de rango, la salida es -1.
>- El sensor no detecta su propia construcción.
>- El sensor puede detectar avatares.
