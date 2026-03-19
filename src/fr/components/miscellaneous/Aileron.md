<p align="center">
  <img src="Aileron.png" />
</p>

|Component|`Aileron`|
|---|---|
|**Module**|`ARCHEAN_aileron`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
#
---

# Description
L'Aileron est un dispositif qui influence l'aerodynamique d'une construction.

Son efficacite est etroitement liee a la densite du milieu dans lequel il opere, que ce soit dans l'atmosphere (avion...) ou dans l'eau (bateau...).

# Usage
L'Aileron ne necessite aucune energie pour fonctionner, seulement une valeur entre `-1.0` et `+1.0` via son port de donnees.

>- Les ailerons ne calculent pas les occlusions comme les blocs. Cela permet d'optimiser l'efficacite de vol d'un vehicule en les cachant dans des surfaces plus grandes, comme a l'interieur des ailes.
