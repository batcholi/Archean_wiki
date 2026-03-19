<p align="center">
  <img src="BigTurboPump.png" />
</p>

|Component|`BigTurboPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 150 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
La Big Turbo Pump est un composant utilise pour transferer des fluides a haute densite jusqu'a 100 kg par seconde.

# Usage
## Alimentation electrique
Pour utiliser la pompe, elle doit etre alimentee en haute tension. Elle consomme jusqu'a 100 kW a pleine vitesse.

## Donnees
Le port de donnees permet de controler la vitesse de la pompe en envoyant une valeur entre `-1` et `1`.
Lorsque la pompe est connectee a un ordinateur, il est egalement possible de recuperer le debit actuel.

> Lorsqu'une valeur negative est envoyee, la pompe fonctionne effectivement en sens inverse.
