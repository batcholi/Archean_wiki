<p align="center">
  <img src="DieselGenerator.png" />
</p>

|Component|`DieselGenerator`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|250 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push/Pull|
#
---

# Description
El Diesel Generator es un grupo electrógeno que quema combustible líquido para producir energía de alta tensión.
Puede entregar hasta **150 kW** y su combustible de referencia es el dodecano (C12H26).

# Usage
Conecta una fuente de combustible a su puerto de fluido, baja tensión para el motor de arranque, y envía 1 a su puerto de datos para ponerlo en marcha.

El motor de arranque consume 1000 vatios de baja tensión solo durante el arranque. Con combustible disponible, el motor arranca en menos de un segundo.

La energía producida se entrega en la salida de alta tensión. El consumo de combustible sigue la carga: unos 10 g/s a plena potencia y el 27 % de ese valor al ralentí.

El motor respira aire ambiente por su toma de aire y expulsa sus gases de escape por su salida. Los puertos de aire y de escape permiten conectar tuberías en su lugar; una toma de aire conectada sustituye al aire ambiente. La potencia disponible disminuye con la cantidad de oxígeno del aire.

El motor se cala si le falta oxígeno, si su escape está bloqueado o si el combustible falta durante más de un segundo. Tras un calado, envía 0 y luego 1 al puerto de datos para reiniciarlo.

Tolera hasta un 55 % de contaminación del combustible (agua, hidrocarburos pesados) sin desgaste. Por encima de eso, se desgasta.

> **Consejo:** para convertir el Oil Shale en combustible utilizable, cocínalo en un Chemical Furnace entre **600 K y 700 K**.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Run|0 or 1|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Load|0.0 to 1.0|
|1|RPM|rpm|
|2|Fuel flow|kg/s|
|3|Running|0 or 1|
|4|State|"Off", "Starting", "Running", "Stalled", "Destroyed"|
