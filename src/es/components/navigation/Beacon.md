<p align="center">
  <img src="Beacon.png" />
</p>

|Component|`Beacon`|
|---|---|
|**Module**|`ARCHEAN_beacon`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
El Beacon es un componente que permite transmitir y/o recibir datos de/hacia otros Beacons.

# Usage
Para funcionar, un Beacon necesita estar alimentado con energía de bajo voltaje y consumirá 10 vatios durante su funcionamiento.
Puede configurarse para transmitir y/o recibir datos usando los puertos de datos o su interfaz de configuración accesible mediante la tecla `V`.

Al colocar un Beacon, aparece una flecha en el holograma para indicar la dirección de localización del Beacon.

## Interfaz de configuración
- `Transmit Data`: Permite enviar datos de tipo `número/texto`.
- `Transmit Frequency`: Permite ajustar la frecuencia de transmisión.
- `Receive Frequency`: Permite ajustar la frecuencia de recepción.
#### Información
- `Last Received Distance`: Muestra la distancia en metros desde el último Beacon del que recibió datos.
- `Last Received Direction`: Muestra la dirección (x,y,z) desde el último Beacon del que recibió datos.
- `Last Received Data`: Muestra los últimos datos recibidos.
- `Is Receiving`: Muestra si el Beacon está recibiendo datos actualmente.

## Puerto de datos
El Beacon tiene un puerto de datos que permite usarlo desde un ordenador u otros componentes.

### List of outputs
|Channel|Function|Range|
|---|---|---|
|0|Data|number or text|
|1|Distance|number (meters)|
|2|Direction X|-1.0 to +1.0|
|3|Direction Y|-1.0 to +1.0|
|4|Direction Z|-1.0 to +1.0|
|5|Is Receiving|0 or 1|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Transmit Data|number or text|
|1|Transmit Frequency|number or text|
|2|Receive Frequency|number or text|

> Información:
>- No hay límite de distancia para las comunicaciones entre Beacons, aunque el más cercano tendrá prioridad si varios Beacons emiten en la misma frecuencia.
>- La señal de un Beacon no se ve afectada por obstáculos.

> Consejos:
>- El Beacon solo puede transmitir un dato a la vez, ya sea un número o texto. Pero puedes usar el sistema de [Key-Value objects](../../xenoncode/documentation.md#key-value-objects) para transmitir tantos datos como necesites.
