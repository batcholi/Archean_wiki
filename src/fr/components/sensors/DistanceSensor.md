<p align="center">
  <img src="DistanceSensor.png" />
</p>

|Component|`DistanceSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Le capteur de distance est un telemetre laser qui mesure la distance a la surface la plus proche (terrain ou construction). Il peut detecter aussi bien le terrain que les colliders d'autres constructions dans une portee configurable.

# Usage
Une fois place sur votre construction, il necessite une connexion basse tension et une connexion de donnees pour fonctionner. Le capteur emet un rayon le long de sa face avant. Lorsque l'entree "Show Laser" est activee, un faisceau laser rouge visible est affiche jusqu'a la surface detectee.

### Portee et scan multi-tick
La portee par defaut est de 1000m (un seul tick, resultat instantane). La portee peut etre etendue jusqu'a 25 000m via le canal d'entree "Max Range". Lorsque la portee depasse 1000m, le scan du terrain est reparti sur plusieurs ticks du serveur (128 etapes de terrain par tick) :

|Range|Ticks|Delay|
|---|---|---|
|1,000 m|1|instantane|
|5,000 m|5|~200 ms|
|10,000 m|10|~400 ms|
|25,000 m|25|~1 s|

> La detection des entites (constructions) est toujours instantanee quelle que soit la portee. Seul le tracage du terrain est reparti sur plusieurs ticks.

### Liste des entrees
|Channel|Function|Value|
|---|---|---|
|0|On/Off|number (≠ 0 = on)|
|1|Show Laser|number (≠ 0 = on)|
|2|Max Range|number (meters, 1000-25000, default 1000)|

### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Distance|number (meters, -1 if out of range)|

>- Lorsqu'il est inactif ou hors de portee, la sortie est -1.
>- Le capteur ne detecte pas sa propre construction.
>- Le capteur peut detecter les avatars.
