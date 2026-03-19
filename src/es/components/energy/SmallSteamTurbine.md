<p align="center">
  <img src="SmallSteamTurbine.png" />
</p>

|Component|`SmallSteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|75 x 75 x 150 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
El componente Small Steam Turbine es una versión compacta de la [Steam Turbine](SteamTurbine.md), diseñada para convertir la energía térmica del vapor caliente en energía eléctrica.

# Usage
Funciona inyectando vapor de agua caliente en su entrada de fluido. Cuanto más caliente sea el vapor y mayor el caudal, más energía puede producir.

A plena capacidad, puede entregar hasta aproximadamente **270 kilovatios**.

Como cualquier turbina de vapor, se requiere una conexión de salida de fluido para evacuar el vapor. Sin ella, la turbina no producirá energía.

- Temperatura mínima de operación: 373 K
- Temperatura efectiva máxima: 650 K (operación óptima)
- Caudal máximo: 1 kg/s

La energía generada se entrega directamente a una salida eléctrica de alto voltaje.

Cuando la energía no se consume completamente, se derivará automáticamente la turbina para mantenerla a una velocidad de rotación máxima.
Este efecto causará que el fluido de salida no se enfríe tanto.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Potential Energy output (watts)|number|
