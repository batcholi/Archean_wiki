<p align="center">
  <img src="RTG.png" />
</p>

|Composant|`RTG`|
|---|---|
|**Module**|`ARCHEAN_rtg`|
|**Masse**|50 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|50 x 50 x 100 cm|
#
---

# Description
Le générateur thermoélectrique à radio-isotopes (RTG) génère de l'énergie basse tension. Il peut fournir une puissance continue en fonction de la capacité de refroidissement de l'environnement.

# Usage
Connectez le RTG au composant qui nécessite de l'énergie basse tension pour fonctionner.

Le RTG possède deux ports électriques, ce qui vous permet de connecter deux composants simultanément ou de chaîner plusieurs RTG pour augmenter la puissance totale de sortie.

### Liste des sorties
|Canal|Fonction|
|---|---|
|0|Puissance générée (Watts)|
|1|Puissance de sortie (Watts)|

> - Le RTG peut générer jusqu'à **12 kW** de puissance. Sa sortie réelle dépend de la capacité de refroidissement de l'environnement (réduite à environ 6 kW dans le vide spatial). Il n'a aucun effet nocif sur le joueur ou l'environnement.
>
> - Si vous utilisez le RTG pour alimenter deux composants, la puissance totale distribuée sur les deux ports ne peut pas dépasser la puissance de sortie disponible du RTG.
>
> - Si l'un des deux composants veut consommer toute la puissance disponible du RTG, cela peut empêcher l'autre composant d'utiliser de la puissance. Il est préférable d'utiliser des jonctions d'alimentation dans ce cas, pour s'assurer que tous les composants soient alimentés en énergie de manière égale.


# How to produce Plutonium

## Processus de production du plutonium

|Étape|Entrées|Sorties|Température|
|---|---|---|---|
|Crusher|Uranium Ore : 1000 g|Uranium Powder (U) : 1000 g (U235 : 10%, U238 : 90%)|-|
|ChemicalFurnace (Yellow Cake - U₃O₈)|Uranium Powder (U) : 0,714 g, O₂ : 0,128 g|Yellow Cake (U₃O₈) : 0,842 g|750K - 950K|
|ChemicalFurnace (Uranium Dioxide - UO₂)|Yellow Cake (U₃O₈) : 0,842 g, H₂ : 0,004 g|Uranium Dioxide (UO₂) : 0,810 g, H₂O : 0,036 g|850K - 1050K|
|Crafter|Uranium Dioxide (UO₂) : 1000 g|Uranium Rod (U235 : 10%, U238 : 90%) : 1|-|
|Crusher|Uranium Rod|Plutonium Dioxide (PuO₂) : 1 g (Pu : 100%)|-|
|Crafter|Plutonium Dioxide (PuO₂) : 5000 g|Plutonium Pellet : 1|-|

> Il est recommandé d'utiliser de l'uranium faiblement enrichi (LEU) pour la production de plutonium. Le niveau d'enrichissement n'a aucun effet sur la quantité de plutonium obtenue.

---

# Additional Information
<font color="orange">
En réalité, le traitement du plutonium à partir de combustible nucléaire usé est une opération industrielle extrêmement complexe et exigeante, nécessitant des infrastructures avancées et des installations spécialisées. Pour cette raison, la récupération et le retraitement du plutonium ne sont actuellement pas pris en charge dans Archean.

Au lieu de cela, les RTG utilisent une forme simplifiée de plutonium spécifiquement produite pour la génération d'énergie. Bien que cette alternative reste plus facile à manipuler que le plutonium réel, sa production est intentionnellement plus difficile que dans les versions précédentes du jeu, rendant les RTG moins triviaux à obtenir tout en restant accessibles aux joueurs avancés.
</font>
