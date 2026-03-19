<p align="center">
  <img src="SmallSteamTurbine.png" />
</p>

|Composant|`SmallSteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Masse**|100 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|75 x 75 x 150 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Le composant SmallSteamTurbine est une version compacte de la [Steam Turbine](SteamTurbine.md), conçue pour convertir l'énergie thermique de la vapeur chaude en énergie électrique.

# Usage
Il fonctionne en injectant de la vapeur d'eau chaude dans son entrée de fluide. Plus la vapeur est chaude et plus le débit est élevé, plus il peut produire d'énergie.

À pleine capacité, il peut délivrer jusqu'à environ **270 kilowatts**.

Comme pour toute turbine à vapeur, une connexion de sortie de fluide est nécessaire pour évacuer la vapeur. Sans cela, la turbine ne produira aucune énergie.

- Température minimale de fonctionnement : 373 K
- Température effective maximale : 650 K (fonctionnement optimal)
- Débit maximal : 1 kg/s

L'énergie générée est directement délivrée sur une sortie électrique haute tension.

Lorsque la puissance n'est pas entièrement consommée, elle contournera automatiquement la turbine pour la maintenir à une vitesse de rotation maximale.
Cet effet fera que le fluide de sortie ne refroidira pas autant.

### Liste des sorties
|Canal|Fonction|Type|
|---|---|---|
|0|Puissance énergétique potentielle (watts)|nombre|
