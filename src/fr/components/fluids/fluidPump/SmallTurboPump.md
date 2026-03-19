<p align="center">
  <img src="SmallTurboPump.png" />
</p>

|Component|`SmallTurboPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
La Small Turbo Pump est un composant utilise pour transferer des fluides a haute densite jusqu'a 10 kg par seconde.

# Usage
## Alimentation electrique
Pour utiliser la pompe, elle doit etre alimentee en haute tension. Elle consomme jusqu'a 10 kW a pleine vitesse.

## Donnees
Le port de donnees permet de controler la vitesse de la pompe en envoyant une valeur entre `-1` et `1`.
Lorsque la pompe est connectee a un ordinateur, il est egalement possible de recuperer le debit actuel.

> Lorsqu'une valeur negative est envoyee, la pompe fonctionne effectivement en sens inverse.
