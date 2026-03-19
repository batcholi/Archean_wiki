<p align="center">
  <img src="SmallHinge.png" />
</p>

|Component|`SmallHinge`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Le Small Hinge est un composant qui inclut un bloc constructible sur une charniere.

> <font color="green"> *Ce composant est lie a la pressurisation des constructions, veuillez consulter la page [Pressurization](../../pressurization.md) pour plus d'informations.*</font>

# Usage
Le Small Hinge fonctionne uniquement en mode servo.

Lorsque vous utilisez V pour ouvrir l'interface d'information, deux configurations sont possibles :
- `Max Rotation Speed` qui determine la vitesse de rotation maximale en rotations par seconde.
- `Acceleration` qui determine le taux (en rotations par seconde par seconde) auquel la charniere accelerera pour atteindre sa vitesse de rotation maximale avant de ralentir pour atteindre sa position cible.

Le dispositif tourne vers une position precise determinee par les donnees recues via son port de donnees. Il accepte des valeurs normalisees entre `-1.0` et `+1.0`, qui correspondent respectivement a des rotations de `-90°` et `+90°`.

> - Les constructions installees sur une partie mobile ne peuvent pas entrer en collision avec une construction parente ou soeur. Elles ne peuvent entrer en collision qu'avec le terrain ou d'autres constructions separees.
> - Pour detruire le Small Hinge, vous devez absolument retirer tous les blocs/composants enfants qu'il contient.
### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s|

![SmallPivotDemo](hinge.gif)
