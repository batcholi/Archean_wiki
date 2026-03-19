<p align="center">
    <img src="PaintTool.png" />
</p>

|Item|`PaintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Le Paint Tool vous permet de peindre des blocs, des câbles, des labels et des composants avec des couleurs et des finitions de surface personnalisées.

# Usage

## Contrôles
| Action | Contrôle |
|--------|---------|
| Peindre une face | **Clic gauche** |
| Peindre tout le bloc (toutes les faces) | **Shift** + **Clic gauche** |
| Sélectionner la couleur d'un bloc | **Clic droit** |
| Remplacer une couleur sur toute la construction | **X** + **Clic gauche** |

## Palettes de couleurs
Le Paint Tool utilise un système de palettes pour sauvegarder et organiser vos couleurs.

### Gestion des palettes
- **Create** : Créer une nouvelle palette vide
- **Copy** : Dupliquer la palette actuelle avec un nouveau nom
- **Delete** : Supprimer la palette actuelle

### Ajouter des couleurs
Cliquez sur le bouton **+** dans la palette pour ajouter un nouvel emplacement de couleur.

## Sélecteur de couleurs
La section inférieure de l'interface contient :

1. **Sélecteur de couleurs RGB** : Sélectionnez n'importe quelle couleur en utilisant la barre de teinte et le carré saturation/valeur
2. **Aperçu Gamma** : Montre comment la couleur apparaîtra en jeu avec vos paramètres gamma

## Matériaux de surface
Chaque couleur peut avoir une finition de surface différente :

| Matériau | Apparence |
|----------|------------|
| **Matte** | Surface rugueuse, non réfléchissante |
| **Glossy** | Surface lisse et brillante |
| **Metal** | Surface métallique rugueuse |
| **Chrome** | Surface métallique effet miroir |
| **Transparent** | Transparente (pour les effets de verre) |

## Remplacement de couleur
Maintenez **X** et **clic gauche** sur n'importe quelle surface peinte pour remplacer cette couleur sur toute la construction. Cela fonctionne sur :
- **Blocs** : Remplace tous les blocs partageant le même index de couleur
- **Tuyaux/Câbles** : Remplace tous les tuyaux correspondant à la même couleur
- **Composants** : Remplace tous les composants du même type et matériau

## Peinture en symétrie
Lorsque la construction a le [mode symétrie](ConstructorTool.md) activé, le Paint Tool peint automatiquement le bloc en miroir également. Cela s'applique à :
- La peinture d'une face unique
- La peinture du bloc entier (**Shift**)

Si le bloc se trouve sur le plan de symétrie, la face en miroir sur le même bloc est peinte à la place.

> **Note** : Le remplacement de couleur (**X**) affecte toujours la construction entière indépendamment de la symétrie, donc la symétrie n'est pas appliquée dans ce mode.

# Notes
- Peindre un bloc applique la couleur **par face** (utilisez Shift pour toutes les faces)
- Les câbles ont des options de personnalisation supplémentaires, voir [Spool](../consumables/Spool.md#painting-cables)
