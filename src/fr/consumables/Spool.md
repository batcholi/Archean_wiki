<p align="center">
  <img src="dataspool.png" />
  <img src="lowvoltagespool.png" />
  <img src="highvoltagespool.png" />
  <img src="fluidspool.png" />
  <img src="itemconduitspool.png" />
</p>

|Item|`Spool`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Longueur**|100 m|

# Description
Les différentes bobines permettent de connecter les composants pour transférer des données, de l'énergie, des objets ou des fluides.

# Usage
## Créer un câble (connecter deux composants)
La création d'un câble commence et se termine sur un connecteur de composant.

Le placement des câbles est totalement libre et permet d'ajouter autant de points que vous le souhaitez (tant que la longueur restante de votre bobine le permet) pour personnaliser sa forme. Pendant la création d'un câble, si vous avez placé plusieurs points, vous pouvez supprimer des points en utilisant le `clic droit` pour affiner le placement ou annuler complètement la création du câble s'il n'y a plus de points existants.

- Les câbles peuvent être empilés sur d'autres câbles existants et sur les composants. (Pour l'accrocher à la surface d'un composant, vous devez maintenir la touche `Shift`).
- Vous pouvez placer le câble sur la face intérieure du bloc/composant en maintenant la touche `X`.

## Créer un câble flexible
Vous pouvez vouloir connecter des composants de différentes constructions ensemble temporairement ou simplement attacher deux constructions ensemble.
Cela créera effectivement un câble flexible.
Les deux constructions seront effectivement liées ensemble et contraintes par le moteur physique.
Il n'y a pas de limite de force, les câbles ne se détacheront pas.
Vous pouvez également ajouter un câble flexible entre deux composants de la même construction en maintenant `X`, pour obtenir un câble droit (peut-être légèrement courbé) qui sera affecté par la gravité.

## Supprimer un câble
Vous pouvez supprimer un câble avec un `clic droit` tant que l'outil dans votre main est la bobine de câble appropriée.

## Peindre les câbles
Vous pouvez peindre les câbles en utilisant le [Paint Tool](../tools/PaintTool.md) comme vous le feriez avec des blocs.
Les câbles offrent deux options de personnalisation supplémentaires :
- `Shift` pour peindre un câble et le rendre transparent
- `X` pour peindre un câble normalement avec un effet rayé

Vous pouvez également combiner les deux effets en maintenant les deux touches enfoncées.

---
>- *Lors de la création de votre câble, s'il refuse d'être créé, il est probable que vous n'ayez pas assez de longueur disponible dans votre bobine actuelle pour créer le câble.*
>- *Les câbles n'ont pas de limite de transfert ni de perte liée à la longueur.*
>- *Les câbles ne déterminent pas la direction de ce qu'ils transportent.*
>- *Un câble ne peut pas être modifié une fois placé, vous devez le supprimer.*
>- *Les câbles flexibles affecteront significativement les performances, tandis que les câbles normaux n'affecteront pas du tout les performances même si vous en avez des milliers dans une construction. Essayez de privilégier l'utilisation de câbles normaux lorsque c'est possible.*
