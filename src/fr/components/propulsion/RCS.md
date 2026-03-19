<p align="center">
  <img src="RCS.png" />
</p>

|Component|`RCS`|
|---|---|
|**Module**|`ARCHEAN_rcs`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Le systeme de controle de reaction (RCS) est compose de propulseurs a gaz froid principalement utilises pour controler l'orientation et la position d'un vaisseau spatial. Il est egalement utilise pour les ajustements fins lors de l'amarrage de vaisseaux spatiaux. Le RCS est compose de plusieurs petits propulseurs qui peuvent etre individuellement et rapidement actives/desactives pour fournir un controle precis.

# Usage
Le RCS peut etre alimente par divers fluides, ce qui affectera ses performances en fonction de leur densite et de leur pression. Il peut etre controle par un ordinateur ou un autre dispositif pour ajuster la poussee et la direction.

Il n'effectue aucune combustion.

### Liste des entrees
|Channel|Function|Range|
|---|---|---|
|0|Nozzle 0 (Center)|0.0 to 1.0|
|1|Nozzle 1|0.0 to 1.0|
|2|Nozzle 2|0.0 to 1.0|
|3|Nozzle 3|0.0 to 1.0|
|4|Nozzle 4|0.0 to 1.0|
