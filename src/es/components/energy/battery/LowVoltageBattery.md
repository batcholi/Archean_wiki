<p align="center">
  <img src="LowVoltageBattery.png" />
</p>

|Component|`LowVoltageBattery`|
|---|---|
|**Module**|`ARCHEAN_battery`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description
- Voltaje: 44 a 52 voltios dependiendo de su estado de carga actual
- Corriente: 1000 amperios por puerto
- Capacidad total: 10 kWh
- Puertos eléctricos: 4
- Puerto de datos: 1 puerto para monitorización del estado de la batería

> **Reciclaje:** Al ser triturada, esta batería devuelve aproximadamente el **50%** de su coste de fabricación en minerales brutos.

# Usage
Con la batería proporcionando 1000 amperios por puerto, puedes obtener hasta 52 kW en cada puerto para alimentar componentes.

### List of outputs
|Channel|Function|
|---|---|
|0|Voltage|
|1|Max Capacity (Wh)|
|2|State of charge|
|3|Throughputs (watts)|
