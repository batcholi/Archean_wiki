<p align="center">
  <img src="Gyroscope.png" />
</p>

|Component| `Gyroscope`|
|---|---|
|**Module**|`ARCHEAN_gyroscope`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 100 cm|
#
---

# Description
Le gyroscope est un composant qui, lorsqu'il est alimente et actif, amortit sa vitesse angulaire. Il est principalement utilise pour stabiliser un vehicule ou arreter le moment angulaire en apesanteur.

# Alimentation electrique
Le Gyroscope est alimente en **haute tension**. Il consomme plus d'energie au demarrage puis reduit progressivement sa consommation a mesure qu'il atteint la vitesse de rotation demandee via le port de donnees.

# Usage
Pour demarrer le gyroscope, il doit recevoir une valeur entre `0.0` et `1.0` dans son port de donnees pour diminuer/augmenter sa vitesse de rotation, augmentant ainsi son effet stabilisant.

Le gyroscope permet d'orienter manuellement un vehicule via son port de donnees en exploitant le couple induit des roues inertielles a l'interieur. Il agira en fonction de son orientation et de sa vitesse de rotation.

### Liste des entrees
|Channel|Function|range|
|---|---|---|
|0|Speed| 0.0 to 1.0|
|1|Control| -1.0 to +1.0|

### Liste des sorties
|Channel|Function|range|
|---|---|---|
|0|Rotation Speed| 0.0 to 10.0 rot/s|

>Un gyroscope a un effet limite par rapport au poids de la construction. Vous pouvez augmenter le nombre de gyroscopes pour augmenter l'effet stabilisant.
