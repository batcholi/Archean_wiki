<p align="center">
  <img src="AltitudeSensor.png" />
</p>

|Component|`AltitudeSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Le capteur d'altitude envoie l'altitude entre la position du capteur et le sol ou le centre du corps celeste via son port de donnees.

# Usage
Une fois place sur votre construction, il peut etre connecte a un ordinateur, par exemple, pour recuperer l'altitude en metres. L'orientation du capteur d'altitude n'a aucun impact sur son fonctionnement.

### Liste des sorties
|Channel|Function|
|---|---|
|0|Absolute Altitude|
|1|Above Terrain|

>- En mode "Above Terrain", l'eau n'est pas consideree comme du terrain.
>- Le capteur d'altitude ne fonctionne que dans l'environnement d'un corps celeste.
