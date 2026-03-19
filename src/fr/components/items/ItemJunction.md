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
L'Item Junction est un composant qui permet la distribution ou l'agregation d'objets.
N'affecte pas l'empilement.

# Usage
L'Item Junction transfere les objets selon la logique illustree dans l'image d'exemple ci-dessous. Les ports situes sur la face contenant 4 ports communiquent uniquement avec le port situe sur la face qui n'en contient qu'un seul.

Lorsque les objets entrent par le port du bas de ce composant, ils utilisent une logique de distribution circulaire (round robin).


<p align="center">
  <img src="diagrFluidJunction.png" />
</p>