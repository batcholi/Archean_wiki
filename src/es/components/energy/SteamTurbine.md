<p align="center">
  <img src="SteamTurbine.png" />
</p>

|Component|`SteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|150 x 200 x 200 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
El componente Steam Turbine convierte la energía térmica del vapor caliente en energía eléctrica.

# Usage
Funciona inyectando vapor de agua caliente en su entrada de fluido. Cuanto más caliente sea el vapor y mayor el caudal, más energía puede producir.

A plena capacidad, puede entregar hasta aproximadamente **27 megavatios**.

Se requiere una conexión de salida de fluido. Sin ella, la turbina no podrá expulsar el vapor y no producirá energía.

- Temperatura mínima de operación: 373 K
- Temperatura efectiva máxima: 650 K (operación óptima)
- Caudal máximo: 100 kg/s

La energía generada se entrega directamente a una salida eléctrica de alto voltaje.

Cuando la energía no se consume completamente, se derivará automáticamente la turbina para mantenerla a una velocidad de rotación máxima.
Este efecto causará que el fluido de salida no se enfríe tanto.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Potential Energy output (watts)|number|
