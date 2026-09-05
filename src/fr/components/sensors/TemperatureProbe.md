<p align="center">
  <img src="TemperatureProbe.png" />
</p>

|Composant|`TemperatureProbe`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Masse**|250 g|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|10 x 10 x 1 cm|
#
---

# Description
Le Temperature Probe est un composant qui mesure la température du bloc ou du panneau sur lequel il est fixé.

# Usage
Une fois fixé sur votre build, il peut être connecté à un Computer pour récupérer la température du matériau au point de contact de sa pointe. La température est fournie en Kelvin, rafraîchie toutes les 0,2 s. Il indique 0 s'il ne touche aucun bloc ni panneau.

Au-dessus de 1350 K, la sonde s'endommage. Une sonde entièrement endommagée indique 0 et peut être réparée.

### Liste des sorties
|Canal|Fonction|Valeur|
|---|---|---|
|0|Temperature|Kelvin|
