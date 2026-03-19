<p align="center">
  <img src="BigThruster.png" />
</p>

|Component|`BigThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Le Big Thruster genere de la poussee par la combustion de carburant liquide avec de l'oxygene liquide.
Il peut utiliser aussi bien le CH4 (methane) que le H2 (hydrogene) comme carburant.
Il utilise une tuyere aerospike radiale et est tres efficace pour convertir l'energie de combustion directement en poussee.
Il peut produire jusqu'a 1,8 MN de poussee a partir d'un debit de 100 Kg/s de LOX et 12,5 Kg/s de H2.

# Usage
Connectez un comburant et un carburant a haut debit aux ports de fluide, de la haute tension pour l'allumage, et envoyez 1 dans le port de donnees pour allumer.

L'allumage initial ne se produira que lorsque le debit est entre 1 g/s et 50 kg/s, que ce soit pour le carburant ou le comburant.

Lorsque le carburant est du H2, le ratio de flux optimal est de 8:1 (LOX:H2) et un ratio inferieur a 1:1 peut entrainer une extinction (pas de combustion).
Lorsque le carburant est du CH4, le ratio de flux optimal est de 4:1 (LOX:CH4) et un ratio inferieur a 1:1 peut entrainer une extinction (pas de combustion).

L'allumeur n'a pas besoin d'etre maintenu une fois la combustion amorcee, bien qu'il soit judicieux de le laisser actif en cas d'extinction.
L'allumage consomme 1000 watts en continu lorsqu'il est actif.

La tuyere du Big Thruster peut pivoter (gimbal) avec une variation de -10 a +10 degres sur deux axes.

### Liste des entrees
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|
|1|Gimbal X|-1.0 to +1.0|
|2|Gimbal Z|-1.0 to +1.0|

### Liste des sorties
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|

> Si votre reservoir de carburant est pre-melange, vous n'avez pas besoin d'utiliser les deux ports de fluide.
