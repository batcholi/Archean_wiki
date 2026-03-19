<p align="center">
  <img src="ItemConveyor.png" />
</p>

|Component|`ItemConveyor`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 100 cm|
|**Push/Pull Item**|Initiate Push/Pull|
#
---

# Description
El Item Conveyor es un componente que permite mover objetos de un punto a otro. Funciona extrayendo objetos en la entrada y empujándolos en la salida. Puede usarse, por ejemplo, para transportar objetos de un contenedor a otro.

# Usage
El Item Conveyor requiere energía de bajo voltaje, con un consumo directamente proporcional al flujo de objetos que se mueven.

Puede configurarse a través de su ventana de información (accesible con la tecla `V`) o a través de su puerto de datos.
Las opciones de configuración disponibles son:

|Option|Value|Description|
|---|---|---|
|**Pull n items/sec**|1 to 1000|Número máximo de objetos a mover por segundo|
|**Pull x kg/sec**|0 to 1000 kg|Masa máxima de objetos a mover por segundo|
|**Filter**|text|Permite filtrar un tipo específico de objeto. Por ejemplo, si se especifica "Wire", solo se permitirá el paso de cables|

> - El Item Conveyor solo puede filtrar un tipo de objeto a la vez. Si necesitas mover varios tipos de objetos, deberás usar varios conveyors.
> - El filtro distingue entre mayúsculas y minúsculas.

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|ON|0 or 1|
|1|Pull n items/second|1 to 1000|
|2|Filter|text|
|3|Pull x kg/second|0 to 1000|
