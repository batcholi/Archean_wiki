<p align="center">
  <img src="RCS.png" />
</p>

|Component|`RCS`|
|---|---|
|**Module**|`ARCHEAN_rcs`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
El sistema de control de reacción (RCS) consiste en propulsores de gas frío utilizados principalmente para controlar la orientación y posición de una nave espacial. También se usa para ajustes finos durante el acoplamiento de naves. El RCS consiste en varios pequeños propulsores que pueden activarse/desactivarse individualmente y rápidamente para proporcionar un control preciso.

# Usage
El RCS puede alimentarse con diversos fluidos, lo que afectará su rendimiento dependiendo de su densidad y presión. Puede controlarse mediante un ordenador u otro dispositivo para ajustar el empuje y la dirección.

No realiza ningún tipo de combustión.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Nozzle 0 (Center)|0.0 to 1.0|
|1|Nozzle 1|0.0 to 1.0|
|2|Nozzle 2|0.0 to 1.0|
|3|Nozzle 3|0.0 to 1.0|
|4|Nozzle 4|0.0 to 1.0|
