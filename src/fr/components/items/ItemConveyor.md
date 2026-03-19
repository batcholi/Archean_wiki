<p align="center">
  <img src="ItemConveyor.png" />
</p>

|Component|`ItemConveyor`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 100 cm|
|**Push/Pull Item**|Initiate Push/Pull|
#
---

# Description
L'Item Conveyor est un composant qui permet de deplacer des objets d'un point a un autre. Il fonctionne en tirant les objets a l'entree et en les poussant a la sortie. Il peut etre utilise, par exemple, pour transporter des objets d'un conteneur a un autre.

# Usage
L'Item Conveyor necessite une alimentation basse tension, avec une consommation d'energie directement proportionnelle au debit d'objets deplaces.

Il peut etre configure soit via sa fenetre d'information (accessible avec la touche `V`), soit via son port de donnees.
Les options de configuration disponibles sont :

|Option|Value|Description|
|---|---|---|
|**Pull n items/sec**|1 to 1000|Nombre maximum d'objets a deplacer par seconde|
|**Pull x kg/sec**|0 to 1000 kg|Masse maximale d'objets a deplacer par seconde|
|**Filter**|text|Permet de filtrer un type d'objet specifique. Par exemple, si "Wire" est specifie, seuls les fils seront autorises a passer|

> - L'Item Conveyor ne peut filtrer qu'un seul type d'objet a la fois. Si vous devez deplacer plusieurs types d'objets, vous devrez utiliser plusieurs conveyors.
> - Le filtre est sensible a la casse.

### Liste des entrees
|Channel|Function|Value|
|---|---|---|
|0|ON|0 or 1|
|1|Pull n items/second|1 to 1000|
|2|Filter|text|
|3|Pull x kg/second|0 to 1000|
