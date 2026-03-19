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
Le Passive Radiator est un composant utilise pour refroidir lentement les fluides en echangeant de la chaleur avec l'environnement ou en la rayonnant dans l'espace. Il ne necessite aucune alimentation electrique.

# Usage
Son efficacite de refroidissement depend de :
- La temperature ambiante
- La densite de l'environnement environnant

L'echange de chaleur se fait par conduction (ameliore avec une densite plus elevee) et par rayonnement.
Lorsqu'un fluide le traverse, sa temperature tend a s'equilibrer avec la temperature du composant.

### Liste des sorties
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|

