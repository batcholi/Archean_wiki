<p align="center">
  <img src="LinearTrack.png" />
</p>

|Component|`LinearTrack`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Le Linear Track est un composant qui inclut un bloc mobile constructible. Il est concu pour permettre la translation lineaire d'objets sur une construction. Il ne peut se deplacer que le long d'un rail automatiquement cree sur l'axe de mouvement du bloc.

> <font color="green"> *Ce composant est lie a la pressurisation des constructions, veuillez consulter la page [Pressurization](../../pressurization.md) pour plus d'informations.*</font>

# Usage
Le Linear Track peut fonctionner dans deux modes : Servo (par defaut) et Velocity. Pour basculer entre les modes, appuyez sur la touche V pour ouvrir l'interface d'information du composant.

Dans cette interface, des configurations supplementaires sont possibles :
- `Max Speed` qui determine la vitesse maximale en metres par seconde.
- `Acceleration` qui determine le taux auquel le Linear Track accelerera pour atteindre sa vitesse maximale.
- `Override limits` lorsqu'active, permet de definir manuellement les limites de position minimale et maximale au lieu d'utiliser les valeurs calculees automatiquement en fonction de l'espace disponible sur le rail.

## Rails
Les rails du composant Linear Track sont automatiquement crees et mis a jour le long de son axe. Ils sont crees au-dessus de blocs normaux de tout type. Pour terminer le rail, la ligne doit etre interrompue. Par exemple avec un autre bloc au-dessus ou en laissant un trou le long du rail.

## Servo Mode
En mode servo, le dispositif se deplace vers une position precise determinee par les donnees recues via son port de donnees. Il accepte toutes les valeurs et reagira en consequence dans la plage entre min et max. Ainsi, si un nombre superieur ou inferieur est recu, il se deplacera vers la position min/max correspondante.

## Velocity Mode
En mode velocity, le dispositif fonctionne en continu dans la direction indiquee par les donnees de son port, acceptant des valeurs entre `-1.0` et `+1.0` pour determiner sa vitesse et sa direction de deplacement. `1.0` correspond a la vitesse maximale.

> - Les constructions installees sur une partie mobile ne peuvent pas entrer en collision avec une construction parente ou soeur. Elles ne peuvent entrer en collision qu'avec le terrain ou d'autres constructions separees.
> - Pour detruire le Linear Track, vous devez absolument retirer tous les blocs/composants enfants qu'il contient.
> - Le Linear Track a une plage de deplacement maximale de -250m a +250m (500m au total).


### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Position|meters|
|1|Speed|m/s|
|2|Minimum Position|meters|
|3|Maximum Position|meters|

![LinearTrackDemo](lineartrack.gif)
