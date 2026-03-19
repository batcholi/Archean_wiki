<p align="center">
  <img src="FluidPump.png" />
</p>

|Component|`FluidPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
La Fluid Pump es un componente utilizado para transferir fluido hasta 1 kg por segundo. A diferencia de las turbo pumps, funciona con energía de bajo voltaje y reacciona instantáneamente a las entradas de control, permitiendo una gestión de fluidos altamente reactiva.

# Usage
## Alimentación eléctrica
Para usar la bomba, necesita estar alimentada con bajo voltaje. Consume hasta 1 kW cuando funciona a máxima velocidad.

## Datos
El puerto de datos permite controlar la velocidad de la bomba enviando un valor entre `-1` y `1`.
Cuando la bomba está conectada a un ordenador, también puede obtener el caudal actual.

> Al enviar un valor negativo, la bomba funcionará efectivamente en reversa.
