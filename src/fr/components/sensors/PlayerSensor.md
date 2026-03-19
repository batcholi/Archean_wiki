<p align="center">
  <img src="PlayerSensor.png" />
</p>

|Component|`PlayerSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Le PlayerSensor detecte les joueurs dans une zone de detection 3D configurable (boite englobante) relative a la position et l'orientation du capteur. Il renvoie des informations sur les joueurs detectes sous forme d'objet texte key-value.

# Usage
Une fois place sur votre construction, le PlayerSensor detectera tout joueur entrant dans sa zone de detection. La zone de detection est une boite 3D configurable via le menu de la touche `V`.

Le capteur renvoie les informations des joueurs sur le canal 0 sous forme d'objet texte key-value contenant :
- L'identifiant du joueur
- Le nom d'utilisateur
- La distance par rapport au capteur

### Configuration touche V
- **box_min** : Coordonnees minimales de la boite de detection (X, Y, Z) - Par defaut : -10, -10, -10
- **box_max** : Coordonnees maximales de la boite de detection (X, Y, Z) - Par defaut : +10, +10, +10

Les coordonnees de la boite de detection sont relatives a la position et l'orientation du capteur.

### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Detected players|key-value text|

### Format de sortie
La sortie est un objet texte key-value : `.p<playerID>{.username{<name>}.distance{<meters>}}`

