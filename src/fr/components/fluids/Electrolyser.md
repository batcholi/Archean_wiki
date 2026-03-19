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
L'Electrolyser necessite une alimentation electrique haute tension et consomme jusqu'a 10 kW en fonctionnement. Il produit de maniere lineairement proportionnelle a la quantite d'energie disponible, jusqu'a un maximum de 1 kg d'eau par seconde avec 10 kW de puissance.

Pour demarrer le processus d'electrolyse, connectez simplement une source d'eau a son port d'entree bleu. Cette source peut provenir d'un [fluid port](../fluids/FluidPort.md) immerge dans l'eau pour extraire directement l'eau de la mer, par exemple, ou d'un reservoir contenant de l'eau.

L'hydrogene et l'oxygene produits peuvent ensuite etre collectes respectivement depuis les ports de sortie jaune (H2) et cyan (O2).

### Production
L'Electrolyser peut traiter jusqu'a 1 kg d'eau par seconde, fournissant approximativement [0,9 kg d'oxygene et 0,1 kg d'hydrogene](# "O2:0.88kg / H2:0.11kg") par seconde.