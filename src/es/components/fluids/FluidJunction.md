<p align="center">
  <img src="FluidJunction.png" />
</p>

|Component|`FluidJunction`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
El Fluid Junction es un componente que permite la separación o combinación de fluidos.

# Usage
El Fluid Junction transfiere fluidos con la lógica mostrada en la imagen de ejemplo a continuación. Los puertos en la cara que contiene 4 puertos solo se comunican con el puerto en la cara que contiene solo uno.

Cuando el fluido entra por el puerto único inferior, se distribuye entre los cuatro puertos superiores según la capacidad de aceptación de los componentes conectados. Si todos los puertos están abiertos, el fluido se divide equitativamente. Sin embargo, si uno o más puertos están cerrados (por ejemplo, debido a una [Fluid Valve](./FluidValve.md)), la cantidad total de fluido se redistribuye solo entre los puertos restantes que aún pueden recibir el flujo.

<p align="center">
  <img src="diagrFluidJunction.png" />
</p>
