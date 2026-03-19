<p align="center">
  <img src="ItemJunction.png" />
</p>

|Component|`ItemJunction`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
|**Push/Pull Item**|Accept Push/Pull -> Forwards action to other side|
#
---
# Description
El Item Junction es un componente que permite la distribución o agregación de objetos.
No afecta al apilamiento.

# Usage
El Item Junction transfiere objetos con la lógica mostrada en la imagen de ejemplo a continuación. Los puertos en la cara que contiene 4 puertos solo se comunican con el puerto en la cara que contiene solo uno.

Cuando los objetos entran por el puerto inferior de este componente, utilizan una lógica round robin para distribuirse.


<p align="center">
  <img src="diagrFluidJunction.png" />
</p>