<p align="center">
  <img src="ActiveRadiator.png" />
</p>

|Component|`ActiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|40 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
L'Active Radiator est un composant concu pour refroidir les fluides qui le traversent. Il est equipe d'un ventilateur qui ameliore considerablement l'echange de chaleur avec l'environnement lorsqu'il est active.

# Usage
Le radiateur necessite :
- Une alimentation electrique
- Une entree de donnees pour activer son ventilateur.

Sans alimentation, sa capacite de refroidissement est tres limitee. Lorsqu'il est alimente et active, il equilibre lentement la temperature entre les fluides en circulation et l'environnement.

Il consomme en permanence 100 Watts lorsqu'il est alimente.

### Liste des sorties
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|

