<p align="center">
  <img src="SlopeLight.png" />
</p>

|Component|`SlopeLight`|
|---|---|
|**Module**|`ARCHEAN_light`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---
# Description
Le SlopeLight est un composant d'eclairage compact concu pour s'adapter aux pentes. Il emet de la lumiere avec un angle de faisceau par defaut de 120°.

# Usage
Le SlopeLight doit etre alimente en basse tension et consomme jusqu'a 1000 W selon la puissance definie dans son menu d'information accessible via la touche `V`.

La couleur et l'angle de la lumiere peuvent etre configures via le menu d'information (touche `V`) ou via son port de donnees.

### Liste des entrees
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|

### Configuration touche V
- **Max Power** : Reglable de 0 a 1000 W (par defaut : 200 W)
- **Angle** : Reglable de 20° a 120°
- **RGB** : Selecteur de couleur pour la couleur de la lumiere
