<p align="center">
  <img src="Hitch.png" />
</p>

|Composant|`Hitch`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Masse**|10 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|50 x 50 x 50 cm|
#
---

# Description
Le composant Hitch connecte deux constructions ensemble en un point fixe, tout en permettant une liberté de rotation complète autour de l'articulation. Une fois connectés, les véhicules restent verrouillés en position mais sont libres de tourner l'un par rapport à l'autre autour de l'attelage.

# Usage

Le Hitch possède un **port de données** qui contrôle son état.
Lorsque deux composants Hitch sont activés (armés) et se trouvent à proximité, ils se connectent automatiquement.
La connexion peut être rompue à tout moment en désactivant l'un ou l'autre des composants.

> - Pour des raisons de performance, les collisions ne sont pas traitées entre les constructions attelées. Le jeu utilise la physique côté serveur, et vérifier continuellement les collisions entre des véhicules proches serait trop coûteux. Une mise à jour future pourrait permettre aux joueurs de définir des contraintes sur tous les axes de l'attelage pour simuler des limites physiques, par exemple empêcher une remorque de tourner au-delà d'un certain angle pour éviter qu'elle ne traverse son tracteur.

### Liste des entrées
|Canal|Fonction|Valeur|
|---|---|---|
|0|Armer/Désarmer l'amarrage|0 ou 1|

### Liste des sorties
|Canal|Fonction|Valeur|
|---|---|---|
|0|Est amarré|0 ou 1|
