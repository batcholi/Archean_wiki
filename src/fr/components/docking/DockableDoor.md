<p align="center">
  <img src="DockableDoor.png" />
</p>

|Composant|`DockableDoor`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Masse**|400 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|250 x 250 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
La DockableDoor est une grande porte qui peut s'amarrer à une porte similaire pour connecter deux constructions ensemble. L'amarrage permet le transfert de données, d'énergie et de fluides entre les constructions connectées, mais contraint également les deux constructions ensemble en termes de physique. Elles sont solidaires l'une de l'autre.

> - Les DockableDoor ne peuvent être installées que sur la face des cadres.
> - La DockableDoor ne peut s'amarrer qu'à une autre DockableDoor.
> - <font color="green"> *Ce composant est lié à la pressurisation des constructions, veuillez consulter la page [Pressurization](../../pressurization.md) pour plus d'informations.*</font>

# Usage
Pour fonctionner correctement, la DockableDoor doit être alimentée en basse tension. Elle consomme 20 watts lorsqu'elle est inactive et jusqu'à 250 watts lorsque les portes sont en mouvement.

Le côté intérieur de la porte possède deux panneaux pour interagir avec la porte ou transférer des données, de l'énergie ou des fluides à travers le port d'amarrage.

Voici une image illustrant les deux panneaux.
- Le panneau en vert sert à interagir avec la porte, l'alimenter et la contrôler à distance via un port de données. (Le tableau ci-dessous indique les entrées/sorties du port de données)
- Le panneau en bleu sert à connecter divers câbles qui transféreront des données, de l'énergie ou des fluides vers/depuis l'autre porte amarrée.

![DockableDoorDemo](DockableDoorExample.png)

### Utilisation avec les alias
L'utilisation d'alias par défaut n'est pas possible pour les deux ports simultanément car l'objet n'affichera qu'un seul champ d'alias dans sa fenêtre d'information (`V`). De même, le [Router](../computers/Router.md) n'affiche qu'un seul champ d'alias par composant.
Pour utiliser séparément les ports de données avec des alias, vous devez utiliser un [Data Bridge](../computers/DataBridge.md) ou une [DataJunction](../computers/DataJunction.md). Cela vous permet d'attribuer des alias à ces objets au lieu des ports d'amarrage.

### Liste des entrées
|Canal|Fonction|
|---|---|
|0|Fermer/Ouvrir la porte|
|1|Armer/Désarmer l'amarrage|

### Liste des sorties
|Canal|Fonction|
|---|---|
|0|État de la porte|
|1|État de l'amarrage|
