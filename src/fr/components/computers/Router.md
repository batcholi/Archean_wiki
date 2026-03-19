<p align="center">
  <img src="Router.png" />
</p>

|Composant|`Router`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Masse**|20 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|100 x 100 x 25 cm|
#
---

# Description
Un Router est un dispositif utilisé pour connecter différents composants à un réseau. Son principal avantage est la possibilité de connecter un nombre pratiquement illimité de composants, tous contrôlables par un ou plusieurs ordinateurs sur le réseau. En revanche, la capacité d'un ordinateur individuel à se connecter à des composants est limitée par son nombre de ports disponibles.

Chaque Router est équipé de 30 ports de données. Ils peuvent être chaînés pour augmenter le nombre total de ports disponibles, multipliant ainsi les ports par le nombre de routeurs connectés ensemble.

Il nécessite une alimentation basse tension pour fonctionner et consomme 50 watts.

> - Il n'est pas possible d'avoir plusieurs réseaux de routeurs séparés connectés à différents ports du même ordinateur. Un ordinateur ne peut interfacer qu'avec un seul réseau de routeurs unifié, mais ce réseau peut inclure un nombre illimité de routeurs chaînés.

# Usage
Lorsque le Router est alimenté et connecté à des composants, il permet d'attribuer des alias aux composants via une interface visuelle tridimensionnelle, qui pourront ensuite être utilisés pour identifier ces composants depuis le code informatique.

Vous pouvez ouvrir l'interface du Router avec la touche `F`.

L'interface se présente sous la forme d'un environnement 3D (voir l'image ci-dessous) dans lequel vous pouvez naviguer en maintenant le `clic droit de la souris`, en utilisant les touches de déplacement standard `ZQSD`, `CTRL/ESPACE` pour descendre/monter, et `Maj` pour accélérer le déplacement.

Les composants sont positionnés à leur position 3D réelle les uns par rapport aux autres dans la construction, et incluront tous les composants connectés de tous les routeurs de la chaîne.

![Router](routerillus1.png)

Chaque composant affiche une étiquette où vous pouvez saisir l'alias qui sera utilisé ultérieurement sur un ordinateur. Pour apprendre à utiliser les alias, consultez la page du XenonCode IDE.

Il est possible d'attribuer un alias à un composant directement en affichant sa fenêtre d'information avec la touche `V`, comme illustré dans l'exemple ci-dessous.

![Router](routerillus2.png)

# Controlling multiple components with a single alias
Dans certaines situations, il peut être pratique de contrôler plusieurs composants servant le même objectif avec un seul alias. Pour cela, ajoutez simplement un astérisque `*` à la fin de l'alias dans les nodes/Xenoncode. Par exemple, si vous construisez un avion et avez quatre ailerons sur l'aile gauche, vous pouvez les nommer ainsi :
- `leftAileron1`
- `leftAileron2`
- `leftAileron3`
- `leftAileron4`

Vous pouvez ensuite les contrôler en utilisant l'alias `leftAileron*`. L'astérisque `*` permet de sélectionner tous les composants dont l'alias commence par `leftAileron`.

# Additional information:
- Les routeurs qui communiquent directement avec un ordinateur doivent être alimentés, les autres routeurs de la chaîne n'ont pas besoin d'alimentation. Cela permet également d'utiliser un [MiniRouter](MiniRouter.md) comme s'il s'agissait d'un [Data Bridge](DataBridge.md) (sans alimentation), mais contrairement au [DataBridge](DataBridge.md), il est capable de résoudre les alias et les références d'écran.

- Pour le routage de données, un Router doit absolument être connecté à un ordinateur ou à un autre Router. Vous ne pouvez pas avoir ce type de configuration `Computer > DataBridge/DataJunction > Router`.
