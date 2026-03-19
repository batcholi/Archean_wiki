<p align="center">
  <img src="OreScannerTool.png" />
</p>

|Item|`OreScannerTool`|
|---|---|
|**Module**|`ARCHEAN_celestial`|

# Description
Le Ore Scanner Tool est un appareil portable qui affiche la composition minérale dans la direction que vous visez. Il montre un graphique en temps réel de la densité de minerai en fonction de la distance, vous permettant de localiser les gisements de minerai avant de miner.

Cet outil est différent du [composant OreScanner](../components/mining/OreScanner.md) - alors que le composant est destiné à être monté sur des véhicules et contrôlé via XenonCode, le Ore Scanner Tool fournit une interface visuelle immédiate pour le joueur.

# Usage

## Utilisation de base
1. Équipez le Ore Scanner Tool depuis votre inventaire
2. Pointez dans la direction que vous souhaitez scanner
3. L'outil affiche un graphique montrant les concentrations de minerai dans cette direction

## Interface
La fenêtre du scanner affiche :
- **Sélecteur de distance** : Choisissez la portée du scan (100m, 250m, 500m ou 1000m)
- **Cases à cocher des minerais** : Sélectionnez les minerais à afficher sur le graphique
- **Graphique** : Montre la densité de minerai (axe Y) en fonction de la distance (axe X)

## Types de minerais
Le scanner peut détecter les minerais suivants :

|Symbole|Élément|Couleur|
|---|---|---|
|Al|Aluminium|Argent/Gris clair|
|C|Carbone|Noir|
|Cr|Chrome|Gris métallique|
|Cu|Cuivre|Orange|
|Au|Or|Jaune doré|
|F|Fluorite|Violet|
|Fe|Fer|Brun rouille|
|Pb|Plomb|Gris foncé|
|Ni|Nickel|Gris verdâtre|
|Si|Silicium|Bleu foncé|
|Ag|Argent|Argent brillant|
|Sn|Étain|Grisâtre|
|Ti|Titane|Bleuté|
|W|Tungstène|Gris foncé|
|U|Uranium|Vert|

## Conseils de scan
- La direction du scan est basée sur la composante horizontale de votre direction de vue
- Le graphique se met à jour automatiquement lorsque vous vous déplacez ou changez de direction
- Sélectionnez plusieurs minerais pour comparer leurs emplacements
- Le fer (Fe) est sélectionné par défaut car c'est la ressource la plus courante

---

> **Note :** Le Ore Scanner Tool nécessite d'être sur un corps céleste avec des données de terrain. Il ne fonctionnera pas dans l'espace ou dans des environnements sans données de composition de terrain.
