<p align="center">
  <img src="ChemicalFurnace.png" />
</p>

|Component|`ChemicalFurnace`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|150 x 200 x 200 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
|**Push/Pull Item**|Accept Push / Initiate Push|
#
---

# Description
Le composant Chemical Furnace chauffe les fluides et les objets, generalement pour effectuer des reactions chimiques.

# Usage
Il necessite une alimentation electrique pour fonctionner. Sa consommation d'energie varie en fonction de la temperature cible et du contenu chauffe, et peut atteindre jusqu'a **5 MW** dans les conditions les plus exigeantes.

La Chemical Furnace est egalement equipee d'un ecran tactile permettant :
- D'afficher la temperature actuelle
- De definir manuellement une temperature cible

### Liste des entrees
|Channel|Function|Range|
|---|---|---|
|0|Target Temperature (K)|number|
|1|Purge|0 or 1|

### Liste des sorties
|Channel|Function|Type|
|---|---|---|
|0|Current Temperature (K)|number|
