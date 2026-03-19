<p align="center">
  <img src="SpotLight.png" />
</p>

|Component|`SpotLight`|
|---|---|
|**Module**|`ARCHEAN_light`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Le SpotLight est un composant qui permet d'eclairer une grande zone avec un angle maximum de 120°. Il est particulierement adapte pour etre place sur des vehicules comme phare.

# Usage
Le SpotLight doit etre alimente en basse tension et consomme jusqu'a 1000 W selon la puissance definie dans son menu d'information accessible via la touche `V`.

Les couleurs du SpotLight peuvent etre modifiees via son menu d'information ou via son port de donnees.

### Liste des entrees
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|