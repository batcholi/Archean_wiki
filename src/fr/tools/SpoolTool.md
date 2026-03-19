<p align="center">
  <img src="SpoolTool.png" />
</p>

|Item|`SpoolTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Le Spool Tool est utilisé pour placer des câbles et des tuyaux qui connectent les composants entre eux, permettant le transfert de données, d'énergie, d'objets ou de fluides.

# Types de bobines
Appuyez sur **C** pour ouvrir le menu de sélection des bobines. Il existe 5 types de bobines disponibles :

<p align="center">
  <img src="../consumables/dataspool.png" />
  <img src="../consumables/lowvoltagespool.png" />
  <img src="../consumables/highvoltagespool.png" />
  <img src="../consumables/fluidspool.png" />
  <img src="../consumables/itemconduitspool.png" />
</p>

|Type|Couleur|Utilisation|
|---|---|---|
|**Data Cable**|Bleu|Connecter les ports de données pour le transfert d'informations|
|**Low Voltage Cable**|Rouge|Connecter les ports d'alimentation basse tension|
|**High Voltage Cable**|Orange|Connecter les ports d'alimentation haute tension|
|**Fluid Pipe**|Gris|Connecter les ports de fluides pour le transfert de liquides/gaz|
|**Item Conduit**|Gris foncé|Connecter les ports d'objets pour le transfert d'objets|

Chaque type de bobine ne peut connecter que des ports compatibles. Les bobines peuvent être empilées dans votre inventaire et la longueur restante est affichée sur chaque objet bobine.

# Usage

## Sélectionner le type de bobine
Appuyez sur **C** pour ouvrir le menu de sélection des bobines et choisir le type de câble que vous souhaitez placer.

## Créer un câble (connecter deux composants)
1. Visez le connecteur d'un composant et faites un **clic gauche** pour démarrer le câble
2. Cliquez pour ajouter des points intermédiaires afin de modeler le tracé du câble
3. Visez le connecteur de destination et faites un **clic gauche** pour compléter la connexion

Pendant la création du câble :
- **Clic droit** supprime le dernier point placé (ou annule s'il n'y a pas de points)
- La **molette de la souris** parcourt les différentes routes alternatives de tracé automatique
- Maintenez **Shift** pour accrocher les câbles aux surfaces des composants
- Maintenez **X** pour placer le câble sur la face intérieure des blocs/composants

## Tracé automatique
Le Spool Tool dispose d'un tracé automatique qui suggère des routes de câble. Utilisez la **molette de la souris** lors du placement pour parcourir les différentes permutations de routes.

## Créer un câble flexible
Pour connecter des composants sur des constructions différentes :
1. Démarrez le câble sur une construction
2. Terminez-le sur le composant d'une autre construction

Cela crée un **câble flexible** qui :
- Lie physiquement les deux constructions ensemble
- Est contraint par le moteur physique
- N'a pas de limite de force (ne se détachera pas)
- Est affecté par la gravité

Vous pouvez également créer un câble flexible entre deux composants de la **même construction** en maintenant **X**.

## Supprimer un câble
Maintenez le **clic droit** puis appuyez brièvement sur le **clic gauche** sur un câble existant pour le supprimer.

## Peindre les câbles
Utilisez le [Paint Tool](PaintTool.md) pour personnaliser l'apparence des câbles :
- La peinture normale change la couleur du câble
- Maintenez **Shift** pour un effet rayé
- Maintenez **X** pour remplacer la couleur sur tous les câbles correspondants
- Combinez les deux pour des rayures transparentes

---

> **Astuces :**
> - Si un câble refuse d'être créé, il se peut que vous n'ayez pas assez de longueur restante dans votre bobine
> - Les câbles n'ont pas de limite de transfert ni de perte liée à la longueur
> - Les câbles ne déterminent pas la direction du transfert
> - Un câble ne peut pas être modifié une fois placé - vous devez le supprimer et le recréer
> - Les câbles flexibles affectent davantage les performances que les câbles normaux - privilégiez les câbles normaux lorsque c'est possible
> - Les outils peuvent utiliser des objets provenant de conteneurs externes en plaçant l'outil dans ce conteneur
