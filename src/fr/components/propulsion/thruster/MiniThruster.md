<p align="center">
  <img src="MiniThruster.png" />
</p>

|Component|`MiniThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Le Mini Thruster genere de la poussee par la combustion de carburant liquide avec de l'oxygene liquide.
Il peut utiliser aussi bien le CH4 (methane) que le H2 (hydrogene) comme carburant, mais il necessite un melange pre-mixe carburant-comburant.
Il peut produire jusqu'a 18 KN de poussee a partir d'un debit de 1 Kg/s de LOX et H2 pre-melanges.

# Usage
Connectez un comburant et un carburant a haut debit aux ports de fluide, de la basse tension pour l'allumage, et envoyez 1 dans le port de donnees pour allumer.

Lorsque le carburant est du H2, le ratio de flux optimal est de 8:1 (LOX:H2) et un ratio inferieur a 1:1 peut entrainer une extinction (pas de combustion).
Lorsque le carburant est du CH4, le ratio de flux optimal est de 4:1 (LOX:CH4) et un ratio inferieur a 1:1 peut entrainer une extinction (pas de combustion).

L'allumeur n'a pas besoin d'etre maintenu une fois la combustion amorcee, bien qu'il soit judicieux de le laisser actif en cas d'extinction.
L'allumage consomme 100 watts en continu lorsqu'il est actif.

### Liste des entrees
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|

### Liste des sorties
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|
