<p align="center">
  <img src="TemperatureProbe.png" />
</p>

|Component|`TemperatureProbe`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|250 g|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|10 x 10 x 1 cm|
#
---

# Description
El Temperature Probe es un componente que mide la temperatura del bloque o panel al que está fijado.

# Usage
Una vez fijado en tu build, puede conectarse a un Computer para obtener la temperatura del material en el punto de contacto de su punta. La temperatura se proporciona en Kelvin y se actualiza cada 0,2 s. Indica 0 cuando no toca ningún bloque ni panel.

Por encima de 1350 K, la sonda se daña. Una sonda totalmente dañada indica 0 y puede repararse.

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Temperature|Kelvin|
