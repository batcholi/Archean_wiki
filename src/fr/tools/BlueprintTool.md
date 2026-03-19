<p align="center">
    <img src="BlueprintTool.png" />
</p>

|Item|`BlueprintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Le Blueprint Tool vous permet de sauvegarder une copie d'une construction. Les blueprints sont sauvegardés dans le dossier `(Client Settings)/blueprints` au format `.json`, un par blueprint avec son nom respectif.

Avec ce système, vous pouvez transférer vos constructions vers d'autres mondes ou serveurs, les partager avec des amis ou simplement dupliquer une construction.

# Usage

## Scanner une construction
1. **Clic gauche** pour entrer en mode Scan (portée : 100 mètres)
2. Visez la construction que vous souhaitez sauvegarder
3. **Maintenez le clic gauche** pendant une seconde pour scanner et sauvegarder le blueprint
4. Entrez un nom dans la boîte de dialogue

### Mettre à jour un blueprint existant
Pour mettre à jour un blueprint existant, entrez simplement le même nom exact qu'un blueprint existant. Le bouton **Create** se changera en **Update**, vous permettant d'écraser la version précédente tout en préservant l'identifiant Steam Workshop s'il a été publié.

## Faire apparaître un blueprint
1. **Clic droit** pour ouvrir l'interface des blueprints
2. Utilisez la **barre de recherche** pour filtrer les blueprints par nom
3. Sélectionnez un blueprint depuis l'onglet **Local** ou **Steam Workshop**
4. Cliquez sur **Spawn** pour entrer en mode placement

### Contrôles de placement

#### Placement libre (nouvelle construction)
| Action | Contrôle |
|--------|---------|
| Confirmer l'apparition | **Maintenir clic gauche** (2 secondes) |
| Tourner | **Molette de la souris** |
| Accrocher au sol et définir comme statique | **Maintenir Shift** |
| Annuler | **Clic droit** |

#### Sur une construction existante
En visant une construction existante, **appuyez brièvement sur le clic gauche** pour attacher le blueprint et entrer en **mode Gizmo** :

| Action | Contrôle |
|--------|---------|
| Translater / Tourner | **Poignées du Gizmo** (glisser) |
| Basculer le regard souris | **Clic droit** |
| Confirmer l'apparition | **Maintenir clic gauche** loin du gizmo (2 secondes), ou bouton **Spawn** |
| Annuler | **Clic droit** (quand pas en mode regard souris) |

### Apparition dans l'espace
En étant dans l'espace près d'une construction existante, vous pouvez faire apparaître des blueprints de la même manière que pour [créer une nouvelle construction](ConstructorTool.md#creating-a-build-in-space).

## Steam Workshop
- Cliquez sur **Publish** à côté d'un blueprint local pour le publier sur le Steam Workshop
- Un outil de capture d'écran intégré est disponible lors de la publication

# Notes
- En mode Adventure, les objets requis sont affichés avec leur statut (vert = disponible, rouge = manquant, orange = mod non actif)
- Si un [OwnerPad](../components/miscellaneous/OwnerPad.md) a été ajouté, vous devez avoir la permission "Build" pour sauvegarder un blueprint
