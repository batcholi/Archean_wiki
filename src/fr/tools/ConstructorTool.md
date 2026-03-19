<p align="center">
    <img src="ConstructorTool.png" />
</p>

|Item|`ConstructorTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Le Constructor Tool est l'outil principal utilisé pour construire dans Archean. Il vous permet de créer de nouvelles constructions, d'ajouter ou de retirer des cadres, et de placer des blocs de formes variées.

# Build Modes
Appuyez sur **C** pour ouvrir le menu radial et sélectionner un mode de construction :

|Mode|Description|
|---|---|
|**Frame**|Créer et modifier la structure du cadre (poutres en acier)|
|**Cube**|Placer des blocs cubiques|
|**Slope**|Placer des blocs en pente/rampe|
|**Corner**|Placer des blocs d'angle|
|**Pyramid**|Placer des blocs pyramidaux|
|**InvCorner**|Placer des blocs d'angle inversé|
|**Triangle**|Placer des panneaux triangulaires|
|**Wall / Platform**|Placer des panneaux plats muraux ou de sol|
|**Strut**|Placer des poutres structurelles fines en acier|

# Materials
Lors du placement de blocs (pas de cadres), utilisez la **molette de la souris** tout en maintenant **C** pour sélectionner le matériau.

## Material Masses

| Material | Masse par unité |
|----------|---------------|
| Composite | 0.25 kg |
| Aluminium | 0.5 kg |
| Steel | 1 kg |
| Glass | 1 kg |
| Concrete | 10 kg |
| Lead | 150 kg |

> **Note :** Les poutres en acier (cadres) pèsent **10 kg** chacune.

### Comment la masse des blocs est calculée
L'unité de base est un cube de **25×25×25 cm**. La masse totale d'un bloc dépend de :

1. **Taille** : Les blocs plus grands contiennent plus d'unités (ex : un bloc de 50×50×50 cm = 8 unités)
2. **Forme** : Les formes non cubiques (pentes, angles, pyramides, angles inversés) pèsent **50%** de leur équivalent cubique car elles occupent moins de volume
3. **Matériau** : Chaque matériau a une masse par unité différente (voir le tableau ci-dessus)

**Formule :** `Mass = units × shape_factor × material_mass`
- `units` = (size_x) × (size_y) × (size_z) par incréments de 25 cm
- `shape_factor` = 1.0 pour les cubes et les murs, 0.5 pour les pentes, angles, pyramides et angles inversés. Les triangles ont un coût variable basé sur leur surface.

### Pourquoi les masses ne correspondent pas à la réalité
Les masses sont intentionnellement simplifiées :
- Les valeurs sont **arrondies** pour la lisibilité
- Les blocs ne sont pas 100% solides — ils représentent des panneaux structurels avec une ossature interne, pas des morceaux massifs de matériau

# Removing Elements
Pour retirer un élément (bloc, triangle, strut ou mur), visez-le tout en maintenant le **clic droit**, puis appuyez brièvement sur le **clic gauche**. Cela fonctionne depuis n'importe quel mode de construction.

> Le retrait de cadres a ses propres contrôles (voir le mode Frame ci-dessous).

# Usage

## Frame Mode

### Créer une nouvelle construction
Maintenez le **clic gauche** pendant une seconde puis relâchez. Une nouvelle construction sera créée avec un cadre métallique 3x3x3.

> **Astuce :** Maintenez **Shift** lors de la création pour aligner le nouveau cadre avec le sol et le définir comme statique (ancré).

### Créer une construction dans l'espace
En étant dans l'espace près d'une construction existante, vous pouvez créer une nouvelle construction qui apparaîtra **5 mètres devant vous**. La nouvelle construction est créée comme enfant de la construction racine la plus proche. Cela fonctionne aussi avec le [Blueprint Tool](BlueprintTool.md).

### Ajouter des cadres
Visez une face de cadre existante et appuyez brièvement sur le **clic gauche**.

### Retirer des cadres
Visez une face de cadre existante tout en maintenant le **clic droit**, puis appuyez brièvement sur le **clic gauche**.

### Ajouter des poutres individuelles
Visez un cadre existant à l'endroit où la poutre devrait être tout en maintenant **Shift**, puis appuyez brièvement sur le **clic gauche**.

### Retirer des poutres individuelles
Visez une poutre de cadre existante tout en maintenant **Shift** et le **clic droit**, puis appuyez brièvement sur le **clic gauche**.

## Block Modes (Cube, Slope, Corner, Pyramid, InvCorner)

### Ajouter des blocs
1. Visez un bloc ou une poutre
2. Appuyez sur le **clic gauche** pour placer le bloc
3. Utilisez la **molette de la souris** pour le faire pivoter (sauf pour les cubes)
4. Maintenez le **clic gauche** et glissez pour redimensionner
5. Utilisez la **molette de la souris** tout en maintenant le **clic gauche** pour redimensionner dans l'autre dimension

> **Astuce avancée :** Le plan de glissement/redimensionnement est déterminé par la normale de la face du bloc que vous visez. La molette redimensionne vers cette normale, tandis que le glissement redimensionne sur les deux autres axes.

> **Astuce :** Maintenez **Shift** avant d'appuyer sur le **clic gauche** pour copier le bloc que vous visez ou ajouter logiquement le bloc suivant.

## Triangle Mode

Le mode Triangle vous permet de placer des panneaux triangulaires qui s'accrochent à la grille de construction. Ces panneaux sont utiles pour créer des formes courbes, des surfaces aérodynamiques, ou toute géométrie non rectangulaire.

### Placer des triangles
1. Cliquez sur **3 points de grille** (sommets de blocs, triangles ou struts existants) pour créer un triangle
2. Alternativement, cliquez sur une **arête existante** pour commencer avec 2 sommets pré-sélectionnés, puis un seul clic supplémentaire est nécessaire
3. Utilisez la **molette de la souris** lors du placement pour **inverser la direction de la normale** (contrôle quel côté du triangle fait face à l'extérieur)
4. Maintenez **Shift** sur une face de bloc alignée aux axes pour un accrochage **sous-grille précis** à la grille complète de 25 cm
5. Appuyez sur le **clic droit** pour annuler le dernier sommet placé

> Les triangles s'accrochent aux sommets des blocs, des autres triangles et des extrémités des struts. L'envergure maximale est de 4 m par axe.

### Matériaux
Maintenez **C** et utilisez la **molette de la souris** pour sélectionner le matériau. Les triangles supportent tous les mêmes matériaux que les blocs.

### Smooth Shading
Appuyez sur **X** en visant un triangle pour activer/désactiver le smooth shading sur tous les triangles connectés dans le même groupe. Le smooth shading est appliqué par un algorithme de propagation : il se propage à travers les **arêtes partagées** vers tous les triangles adjacents formant une surface continue.

Pour que le smooth shading fonctionne correctement :
- Les sommets des triangles doivent **s'aligner exactement** sur la grille — les triangles voisins doivent partager les mêmes positions de sommets
- Les groupes de triangles séparés (non connectés par des arêtes partagées) sont traités comme des **groupes de lissage indépendants** — activer le lissage sur un groupe n'affecte pas les autres

> Le smooth shading respecte également le mode symétrie.

## Strut Mode

Les struts sont des poutres structurelles fines en acier qui connectent deux points de grille. Elles sont utiles pour créer des treillis, des antennes, des échafaudages ou des éléments structurels légers.

### Placer des struts
1. Cliquez sur **2 points de grille** pour créer un strut entre eux
2. Les struts s'accrochent aux sommets des blocs, des triangles et des autres struts
3. Appuyez sur le **clic droit** pour annuler le premier sommet placé

> L'envergure maximale est de 4 m par axe. En mode aventure, les struts nécessitent des objets **Steel Rod**.

### Subdivision Snapping
Maintenez **Shift** en visant un strut existant pour s'accrocher aux points de subdivision le long de celui-ci. Utilisez la **molette de la souris** tout en maintenant **Shift** pour changer le pas de subdivision :

|Pas disponibles|
|---|
|1 m|
|50 cm|
|25 cm (défaut)|
|10 cm|
|5 cm|

Cela permet de placer de nouveaux struts ou triangles à des intervalles précis le long d'un strut existant.

## Wall / Platform Mode

### Ajouter des murs
Visez une face de cadre et appuyez brièvement sur le **clic gauche**.

> **Astuce :** Maintenez **Shift** pour utiliser l'autre face logique du cadre que vous visez.

> **Astuce :** Maintenez **Shift** lors du placement pour s'accrocher au sol et créer une plateforme statique directement devant vous.

# Symmetry Mode
Le Constructor Tool supporte la construction en symétrie, vous permettant de construire des structures en miroir automatiquement.

La symétrie peut être activée via le menu **GetInfo** de la construction (appuyez sur **V** sur n'importe quel cadre). Lorsqu'elle est activée :
- Toutes les opérations sur les cadres et les blocs sont reflétées selon l'axe de symétrie
- La position de l'axe de symétrie peut être ajustée avec une **précision de 0.125m**, permettant un placement du miroir au centre des blocs

# Adventure Mode
En mode aventure, vous avez besoin des matériaux requis dans votre inventaire :
- **Steel Beams** pour les cadres
- **Block items** (Composite, Concrete, Steel, etc.) pour les blocs

L'outil affichera la quantité de matériaux nécessaire pour chaque opération.

---

> **Astuce :** Activez les infobulles via le menu **F1** pour obtenir une aide contextuelle lors de l'utilisation du Constructor Tool.
