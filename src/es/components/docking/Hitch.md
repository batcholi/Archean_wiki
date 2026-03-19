<p align="center">
  <img src="Hitch.png" />
</p>

|Component|`Hitch`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description
El componente Hitch conecta dos construcciones en un punto fijo, permitiendo total libertad de rotación alrededor de la articulación. Una vez conectados, los vehículos permanecen bloqueados en posición pero son libres de rotar entre sí alrededor del Hitch.

# Usage

El Hitch tiene un **puerto de datos** que controla su estado.
Cuando dos componentes Hitch están activados (armados) y se acercan lo suficiente, se conectan automáticamente.
La conexión puede romperse en cualquier momento desactivando cualquiera de los componentes.

> - Por razones de rendimiento, las colisiones no se procesan entre construcciones enganchadas. El juego usa física del lado del servidor, y verificar continuamente las colisiones entre vehículos en proximidad cercana sería demasiado costoso. Una futura actualización podría permitir a los jugadores definir restricciones en todos los ejes del Hitch para simular límites físicos, por ejemplo, evitar que un remolque rote más allá de cierto ángulo para no atravesar su tractor.

### List of inputs
|Channel|Function|value|
|---|---|---|
|0|Arm/Disarm Docking|0 or 1|

### List of outputs
|Channel|Function|value|
|---|---|---|
|0|Is Docked|0 or 1|
