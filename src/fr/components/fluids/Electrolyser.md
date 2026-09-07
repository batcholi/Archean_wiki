<p align="center">
  <img src="Electrolyser.png" />
</p>

|Component|`Electrolyser`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
L'Electrolyser est un composant qui permet la dissociation de l'eau en hydrogene et en oxygene.

# Usage
L'Electrolyser nécessite une alimentation électrique haute tension et consomme jusqu'à 16 MW en fonctionnement. Il produit de manière linéairement proportionnelle à l'énergie disponible, jusqu'à un maximum de 1 kg d'eau par seconde à 16 MW, soit environ 40 kWh par kg d'hydrogène. Il lui faut au moins 1 kW pour fonctionner : en dessous de ce seuil, il ne produit rien.

Pour demarrer le processus d'electrolyse, connectez simplement une source d'eau a son port d'entree bleu. Cette source peut provenir d'un [fluid port](../fluids/FluidPort.md) immerge dans l'eau pour extraire directement l'eau de la mer, par exemple, ou d'un reservoir contenant de l'eau.

L'hydrogene et l'oxygene produits peuvent ensuite etre collectes respectivement depuis les ports de sortie jaune (H2) et cyan (O2).

### Production
L'Electrolyser peut traiter jusqu'a 1 kg d'eau par seconde, fournissant approximativement [0,9 kg d'oxygene et 0,1 kg d'hydrogene](# "O2:0.88kg / H2:0.11kg") par seconde.

Quand les deux réservoirs de sortie sont pleins, l'Electrolyser se met au repos à 50 W et redémarre de lui-même dès que l'un d'eux accepte à nouveau du gaz.

### Liste des entrées
|Canal|Fonction|Plage|
|---|---|---|
|0|Consigne de puissance, fraction des 16 MW nominaux (0 = arrêt, 1 = tout ce que la source offre)|0.0 à 1.0|

### Liste des sorties
|Canal|Fonction|
|---|---|
|0|Puissance consommée (Watts)|
|1|Eau traitée (kg/s)|
|2|Hydrogène produit (kg/s)|
|3|Oxygène produit (kg/s)|
