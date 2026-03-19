<p align="center">
  <img src="ActiveRadiator.png" />
</p>

|Component|`ActiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|40 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
El Active Radiator es un componente diseñado para enfriar los fluidos que circulan a través de él. Está equipado con un ventilador que mejora considerablemente el intercambio de calor con el entorno cuando se activa.

# Usage
El radiador requiere:
- Una fuente de alimentación eléctrica
- Una entrada de datos para activar su ventilador.

Sin energía, su capacidad de enfriamiento es muy limitada. Cuando está alimentado y activado, iguala lentamente la temperatura entre los fluidos circulantes y el entorno.

Consume continuamente 100 vatios cuando está alimentado.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|
