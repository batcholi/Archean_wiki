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
La Fluid Junction e' un componente che permette la separazione o la combinazione dei fluidi.

# Usage
La Fluid Junction trasferisce i fluidi secondo la logica mostrata nell'immagine di esempio qui sotto. Le porte sulla faccia che contiene 4 porte comunicano solo con la porta sulla faccia che ne contiene una sola.

Quando il fluido entra attraverso la singola porta inferiore, viene distribuito tra le quattro porte superiori in base alla capacita' di accettazione dei componenti collegati. Se tutte le porte sono aperte, il fluido viene diviso equamente. Tuttavia, se una o piu' porte sono chiuse (ad esempio, a causa di una [Fluid Valve](./FluidValve.md)), la quantita' totale di fluido viene ridistribuita solo tra le porte rimanenti che possono ancora ricevere il flusso.

<p align="center">
  <img src="diagrFluidJunction.png" />
</p>
