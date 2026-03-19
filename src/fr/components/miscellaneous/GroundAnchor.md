<p align="center">
  <img src="GroundAnchor.png" />
</p>

|Component|`GroundAnchor`|
|---|---|
|**Module**|`ARCHEAN_anchor`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 100 x 100 cm|
#
---

# Description
Le Ground Anchor est un dispositif qui verrouille une construction au sol lorsqu'il est active, empechant tout mouvement.

# Usage
Le Ground Anchor fonctionne sans necessiter d'alimentation externe. Son mecanisme repose sur une simple valeur, `0` pour desactive (non ancre) ou `1` pour active (ancre) via son port de donnees.

>- Pour liberer une construction ancree, retirer le Ground Anchor ne suffit pas. Vous devez soit desancrer le Ground Anchor actuel, soit installer un nouveau Ground Anchor pour reactiver la physique de la construction, a condition qu'il n'y ait plus aucun ancrage actif attache.
>- Si un [OwnerPad](OwnerPad.md) est present, utiliser le bouton "Reset" pour deplacer la construction ne sera PAS empeche par le Ground Anchor.
>- Le Ground Anchor ne peut pas ancrer un vehicule a un autre vehicule, il ne fonctionne que sur les terrains.
