<p align="center">
  <img src="PassiveRadiator.png" />
</p>

|Component|`PassiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
El Passive Radiator es un componente utilizado para enfriar lentamente los fluidos intercambiando calor con el entorno o irradiándolo al espacio. No requiere energía.

# Usage
Su eficiencia de enfriamiento depende de:
- La temperatura ambiente
- La densidad del entorno circundante

El intercambio de calor ocurre mediante conducción (mejorada con mayor densidad) y radiación.
Cuando un fluido circula a través de él, su temperatura tiende a igualarse con la temperatura del componente.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|

