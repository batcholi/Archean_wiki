# Extraction minière

L'extraction minière dans Archean est le processus de localisation, de collecte et de traitement des ressources minérales trouvées dans le terrain des corps célestes. C'est le fondement du système de fabrication — sans minerais, vous ne pouvez rien construire.

Le pipeline complet d'extraction est : **Scanner → Collecter → Broyer → Fabriquer**.

## Localiser les minerais

Avant de collecter des roches, vous devez d'abord identifier où les minerais précieux sont concentrés.

L'[Ore Scanner Tool](tools/OreScannerTool.md) est un appareil portatif qui affiche un graphique en temps réel de la densité de minerai dans la direction que vous regardez. Équipez-le et regardez autour de vous — c'est le moyen le plus rapide de prospecter un emplacement.

Pour un scan automatisé, le composant [Ore Scanner](components/mining/OreScanner.md) peut être contrôlé via [XenonCode](xenoncode/documentation.md) et retourne les données de composition sous forme d'[objets texte clé-valeur](xenoncode/documentation.md#key-value-objects).

---

## Collecter des roches

Les roches sont de petits objets dispersés à la surface des corps célestes. Elles varient en taille, et **une plus grosse roche donne plus de matériaux** lorsqu'elle est ramassée.

### À la main
Sans outil équipé, appuyez sur `LMB` pour ramasser une roche. Vous devez cliquer à nouveau pour chaque roche.

### Rock Rake Tool
Le [Rock Rake](tools/RockRakeTool.md) est la méthode recommandée pour collecter les roches manuellement :

- **Maintenir `LMB`** : Ramasse les roches en continu en les regardant
- **`RMB`** : Inspecter une roche avant de la ramasser — affiche sa composition et son rendement

---

## Extraction automatisée — Mining Drill

Le [Mining Drill](components/mining/MiningDrill.md) extrait les roches du terrain automatiquement. Il doit être installé sur une construction ancrée à l'aide d'un [Ground Anchor](components/miscellaneous/GroundAnchor.md).

L'efficacité du Mining Drill diminue avec la profondeur — vous devriez le **déplacer** régulièrement lorsque la production baisse. Consultez la page du [Mining Drill](components/mining/MiningDrill.md) pour les spécifications détaillées.

---

## Composition des roches

Chaque roche a une **composition** — un ensemble d'éléments avec leurs densités respectives, déterminé par son emplacement sur le terrain. La composition est représentée sous forme d'[objets texte clé-valeur](xenoncode/documentation.md#key-value-objects) :

`.Al{0.1500}.Fe{0.2000}.Si{0.6500}` — signifiant 15 % d'Aluminium, 20 % de Fer, 65 % de Silicium.

Les roches avec une **composition identique** s'empilent dans votre inventaire. Les compositions différentes occupent des emplacements séparés.

### Éléments

|Symbole|Élément|Symbole|Élément|
|---|---|---|---|
|Al|Aluminium|Ni|Nickel|
|C|Carbone|Si|Silicium|
|Cr|Chrome|Ag|Argent|
|Cu|Cuivre|Sn|Étain|
|Au|Or|Ti|Titane|
|F|Fluorite|W|Tungstène|
|Fe|Fer|U|Uranium|
|Pb|Plomb|Ch|???|

---

## Traitement des roches

Pour transformer les roches en minerais utilisables, vous devez les broyer. Il existe deux méthodes :

### Traitement par l'avatar (Début de partie)
Votre sac à dos possède une **zone de traitement d'objets** intégrée (1 emplacement) accessible depuis l'[interface de fabrication](interfaces.md#zone-de-traitement-dobjets). Placez des roches dans cet emplacement et cliquez sur **Crush** pour les convertir en minerais directement depuis votre inventaire. C'est lent mais ne nécessite aucune infrastructure — c'est ainsi que vous obtenez vos premiers minerais en mode Adventure.

### Composant Crusher (Automatisé)
Le [Crusher](components/mining/Crusher.md) est un composant plaçable pour le traitement à grande échelle. Il convertit les roches en minerais proportionnellement à leur composition. Par exemple, broyer 10 Kg de roche avec 20 % de Fer produit 2000 g de minerai de Fer.

Lorsque les concentrations sont très faibles, le Crusher accumule les quantités fractionnaires sur plusieurs roches jusqu'à pouvoir produire au moins 1 unité — rien n'est perdu.

> Le Crusher ne **tire pas** depuis son entrée — les roches doivent lui être [poussées](pushpull.md). Consultez la page [Push & Pull](pushpull.md) pour plus de détails.

---

## Distribution des ressources

La distribution des minerais varie selon le corps céleste, l'altitude et la proximité des formations volcaniques. Consultez les pages [Earth](celestialbodies/earth.md) et [Moon](celestialbodies/moon.md) pour plus de détails.

|Rareté|Éléments|Où chercher|
|---|---|---|
|Commun|Si, Fe, C, Cu, Sn|Partout / au-dessus du niveau de la mer|
|Peu commun|Al, Ag|Haute altitude (montagnes)|
|Rare|Ni, Cr, Ti, W|Haute altitude / très haute altitude|
|Très rare|Au, Pb, U, F|Fonds marins / près des volcans|

- Les **volcans** augmentent le Fer, le Plomb, et sont la **seule source de Fluorite**

---

## Conseils pratiques

- **Prospectez d'abord** : Utilisez l'Ore Scanner Tool pour trouver un emplacement riche en minerais dont vous avez besoin avant de placer des infrastructures
- **Configurations typiques** : Mining Drill → Crusher → Container, ou Mining Drill → Container → [Conveyor](components/items/ItemConveyor.md) → Crusher
- **Dimensionnement** : 1 Crusher gère jusqu'à 4 Mining Drills en High Voltage
- **Déplacez les Mining Drills** quand l'efficacité baisse significativement
- **Rock Rake pour le début de partie** : Utilisez-le pour collecter vos premiers minerais de Fer et fabriquer votre chemin jusqu'à un Mining Drill
- **Vérifiez la composition** : Faites un clic droit sur les roches avec le Rock Rake pour vérifier leur contenu avant de les ramasser
