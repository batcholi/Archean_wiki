<p align="center">
  <img src="MiningDrill.png" />
</p>

|Component|`MiningDrill`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 100 cm|
|**Push/Pull Item**|Initiate Push|
#
---

# Description
El Mining Drill es un componente que permite perforar el terreno para extraer rocas que pueden triturarse para obtener minerales.

# Usage
Para funcionar, necesita estar instalado en una construcción que debe estar anclada al suelo usando un [Ground Anchor](../miscellaneous/GroundAnchor.md).
Necesitas conectarlo a un [Container](../storage/Container.md) o cualquier otro componente que acepte objetos, para recoger las rocas extraídas.

Dependiendo del tipo de energía, puede extraer rocas a diferentes velocidades.

|Energy|Power required|Speed|Depth|
|---|---|---|---|
|Low Voltage|10 kw|Hasta 10 rocas por segundo|0,01 metros por segundo|
|High Voltage|100kw|Hasta 100 rocas por segundo|0,1 metros por segundo|

## Obtención de datos
El Mining Drill permite obtener información sobre la composición en su posición en cualquier momento.
El valor devuelto es un objeto [Key-Value](../../xenoncode/documentation.md#key-value-objects) presentado en el siguiente formato, por ejemplo: `.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}`.
Esto significa que la posición contiene 12% de carbono, 5% de hierro, 3% de silicio y 80% de cobre.


## Eficiencia y agotamiento
La zona minada no es ilimitada, se agota gradualmente a medida que se profundiza y la eficiencia disminuye en consecuencia.
Tendrás que reubicarlo de vez en cuando.


### List of outputs
|Channel|Function|
|---|---|
|0|Composition|
|1|Depth|
|2|Efficiency|
|3|MiningRate|
|4|DrillingRate|

