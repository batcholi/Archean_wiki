<p align="center">
  <img src="SmallTurboPump.png" />
</p>

|Component|`SmallTurboPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
La Small Turbo Pump es un componente utilizado para transferir fluido de alta densidad hasta 10 kg por segundo.

# Usage
## Alimentación eléctrica
Para usar la bomba, necesita estar alimentada con alto voltaje. Consume hasta 10 kw cuando funciona a máxima velocidad.

## Datos
El puerto de datos permite controlar la velocidad de la bomba enviando un valor entre `-1` y `1`.
Cuando la bomba está conectada a un ordenador, también puede obtener el caudal actual.

> Al enviar un valor negativo, la bomba funcionará efectivamente en reversa.
