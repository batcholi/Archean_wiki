<p align="center">
  <img src="SteamTurbine.png" />
</p>

|Composant|`SteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Masse**|500 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|150 x 200 x 200 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Le composant SteamTurbine convertit l'énergie thermique de la vapeur chaude en énergie électrique.

# Usage
Il fonctionne en injectant de la vapeur d'eau chaude dans son entrée de fluide. Plus la vapeur est chaude et plus le débit est élevé, plus il peut produire d'énergie.

À pleine capacité, il peut délivrer jusqu'à environ **27 mégawatts**.

Une connexion de sortie de fluide est nécessaire. Sans cela, la turbine ne pourra pas expulser la vapeur et ne produira aucune énergie.

- Température minimale de fonctionnement : 373 K
- Température effective maximale : 650 K (fonctionnement optimal)
- Débit maximal : 100 kg/s

L'énergie générée est directement délivrée sur une sortie électrique haute tension.

Lorsque la puissance n'est pas entièrement consommée, elle contournera automatiquement la turbine pour la maintenir à une vitesse de rotation maximale.
Cet effet fera que le fluide de sortie ne refroidira pas autant.

### Liste des sorties
|Canal|Fonction|Type|
|---|---|---|
|0|Puissance énergétique potentielle (watts)|nombre|
