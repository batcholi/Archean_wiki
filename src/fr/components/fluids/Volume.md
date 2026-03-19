<p align="center">
  <img src="Volume.png" />
</p>

|Component|`Volume`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
Le composant Volume, lorsqu'il est ajoute a une construction, calcule et definit automatiquement le volume qu'il occupe. Cette fonctionnalite peut etre utilisee pour :
- Concevoir des reservoirs de carburant de forme personnalisee.
- Assurer la pressurisation de cabines pour des environnements specifiques (par ex., sous-marins, fusees).
- Creer des dirigeables...
- ...

> <font color="green"><strong> Ce composant est lie a la pressurisation des constructions, veuillez consulter la page [Pressurization](../../pressurization.md) pour plus d'informations.</strong></font>

# Usage
Le composant Volume est simple d'utilisation et ne necessite aucune configuration particuliere. Il suffit de l'ajouter a une construction et de cliquer sur le bouton `Scan` pour detecter automatiquement le volume du compartiment scelle dans lequel il est place. Notez qu'il ne calcule que le volume du compartiment dans lequel il se trouve, et non la construction entiere. Vous devrez ajouter un composant Volume distinct pour chaque compartiment que vous souhaitez pressuriser.

Ce composant peut afficher deux etats :
- `Airtight` : L'etat devient vert si le compartiment est completement scelle.
- `Leak` : L'etat devient rouge si le compartiment n'est pas etanche.

L'ecran du Volume affiche uniquement le volume du compartiment scelle en metres cubes (m³). Pour des informations plus detaillees, vous pouvez acceder a sa fenetre d'information en appuyant sur la touche `V`. Les donnees disponibles incluent :
- `Volume capacity (m³)` : La capacite totale du volume scelle.
- `Contents Mass (kg)` : La masse totale du contenu present dans le volume.
- `Pressure (kPa)` : La pression a l'interieur du compartiment scelle.
- `Liquid Level (%)` : Le pourcentage de remplissage en liquide.
- `Composition` : La distribution des differents fluides en pourcentages normalises.

En mode Creatif, des boutons supplementaires apparaissent pour permettre de remplir ou de vider le volume.


### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Level|0 to 1|
|1|Volume (m³)|number|
|2|State|text|

