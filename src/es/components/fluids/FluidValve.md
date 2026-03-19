<p align="center">
  <img src="FluidValve.png" />
</p>

|Component|`FluidValve`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|accept Push/Pull -> forwards action to other side|
#
---

# Description
La Fluid Valve es un componente que permite controlar el flujo de fluido que pasa a través de ella.

# Usage
Por defecto, la válvula está cerrada y bloquea el paso del fluido. Para controlar el flujo de fluido, envía una señal de datos entre `0 (Cerrada)` y `1 (Abierta)`.

La válvula emite la temperatura del fluido que circula a través de ella en el canal 0.