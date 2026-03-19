# Pressurisation

La pressurisation dans Archean vous permet de créer des compartiments étanches pouvant contenir des gaz à des pressions différentes de l'environnement extérieur. C'est essentiel pour construire des cabines de vaisseaux spatiaux, des sous-marins, des dirigeables ou des réservoirs de carburant personnalisés.

## Fonctionnement

### Le composant Volume

Le composant [Volume](components/fluids/Volume.md) est au coeur du système de pressurisation. Lorsqu'il est placé à l'intérieur d'une construction et scanné, il utilise un **algorithme basé sur les voxels** pour détecter les limites de l'espace clos.

1. **Scan** : Cliquez sur le bouton `Scan` du composant Volume pour analyser l'espace environnant
2. **Propagation** : Le système s'étend dans toutes les directions (X, Y, Z) jusqu'à rencontrer des blocs solides/étanches
3. **État** :
   - **AIRTIGHT** (vert) : Le compartiment est complètement scellé
   - **LEAK** (rouge) : Il y a une ouverture vers l'extérieur

> Chaque composant Volume ne détecte que le compartiment dans lequel il est placé. Vous avez besoin de composants Volume séparés pour chaque compartiment isolé.

### Composants étanches

Tous les composants ne scellent pas un volume. Seuls les composants marqués comme **étanches** agissent comme parois pour la pressurisation. Ceux-ci incluent :

| Catégorie | Composants étanches |
|----------|---------------------|
| **Articulations** | Small Hinge, Small Pivot, Linear Track |
| **Bridges** | Data Bridge, Fluid Bridge, Item Bridge, Low/High Voltage Bridge |
| **Jonctions** | Fluid Junction, Item Junction |
| **Stockage** | Container, Small Container |
| **Amarrage** | Dockable Door |
| **Autres** | Passive Radiator, Aileron, Mini Router... |

Les blocs de construction standard (cadres, panneaux) sont également étanches par défaut.

## Articulations et pressurisation

Les articulations ([Small Hinge](components/joints/SmallHinge.md), [Small Pivot](components/joints/SmallPivot.md), [Linear Track](components/joints/LinearTrack.md)) ont un comportement spécial :

- **En position alignée** (position neutre, valeur = 0) : L'articulation est étanche et scelle le volume
- **En mouvement** (toute autre position) : L'articulation rompt le scellement, causant une fuite

Cela vous permet de créer des **portes et trappes fonctionnelles** :

1. Construisez un cadre de porte avec des blocs
2. Placez un Small Hinge ou Small Pivot
3. Construisez le panneau de porte sur la partie mobile de l'articulation
4. Quand l'articulation revient à la position 0, le compartiment se scelle

> **Important** : Lorsqu'une articulation bouge, le composant Volume re-scanne automatiquement pour détecter si le scellement est rompu.

## Dockable Doors

La [Dockable Door](components/docking/DockableDoor.md) intègre la gestion de la pressurisation :

- **Fermée** : Agit comme un scellement étanche
- **Ouverte** : Permet le transfert de gaz entre :
  - Le compartiment intérieur et l'environnement extérieur (si non amarré)
  - Deux compartiments amarrés (si amarré avec une autre Dockable Door)

Lorsque deux vaisseaux s'amarrent et ouvrent leurs Dockable Doors, leurs atmosphères se mélangent et les pressions s'équilibrent.

## Fluid Port - L'interface clé

Le [Fluid Port](components/fluids/FluidPort.md) est le **composant essentiel** pour interagir avec les volumes pressurisés. C'est le seul moyen d'injecter ou d'extraire programmatiquement des fluides d'un compartiment scellé.

### Fonctionnement

Le Fluid Port agit comme un **pont** entre le système de fluides (pompes, réservoirs, tuyaux) et un volume pressurisé :

- **La position compte** : La buse du port doit être **physiquement à l'intérieur** du volume pressurisé pour interagir avec lui
- **Détection automatique** : Il détecte automatiquement s'il se trouve à l'intérieur d'un volume scanné ou dans l'environnement ambiant
- **Bidirectionnel** : Peut à la fois pousser des fluides dans un volume et en extraire

### Limitations physiques

Le Fluid Port a des limites physiques codées en dur :

| Propriété | Valeur |
|----------|-------|
| **Débit maximal** | 1.0 m³/s |
| **Calcul du débit** | Limité par `min(masse_demandée / densité, 1.0 m³/s × deltaTime)` |

Cela signifie :
- Les fluides denses (liquides) transfèrent plus de masse par seconde que les fluides légers (gaz)
- Vous ne pouvez pas remplir ou vider instantanément un volume - cela prend du temps
- Plusieurs Fluid Ports peuvent être utilisés en parallèle pour augmenter le débit total

### Scénarios d'utilisation

#### Remplir un réservoir de carburant personnalisé
1. Construisez un compartiment scellé avec un composant Volume
2. Placez un Fluid Port avec sa buse **à l'intérieur** du volume
3. Connectez le Fluid Port à une Fluid Pump et une source de carburant (réservoir, électrolyseur, etc.)
4. La pompe pousse le carburant à travers le Fluid Port dans votre réservoir personnalisé

#### Extraire d'un volume
1. Placez un Fluid Port à l'intérieur du volume pressurisé
2. Connectez-le à une pompe configurée pour tirer
3. La composition du fluide à l'intérieur du volume est extraite proportionnellement

#### Support vie de cabine
1. Créez une cabine scellée avec un composant Volume
2. Placez un Fluid Port à l'intérieur pour injecter une atmosphère respirable
3. Connectez à une source d'oxygène et une pompe
4. Utilisez un second Fluid Port pour évacuer le CO2 ou maintenir la pression

### Détection de l'environnement

Lorsque le Fluid Port n'est **pas** à l'intérieur d'un volume pressurisé, il interagit avec l'**environnement ambiant** :
- Sur Terre : Aspire l'air atmosphérique (mélange N2, O2)
- Dans l'eau : Aspire du H2O
- Dans l'espace : Rien à aspirer (vide)

Appuyez sur `V` sur un Fluid Port pour voir :
- La densité actuelle de l'environnement (kg/m³)
- La composition de l'environnement (pourcentage en volume)

## Physique des gaz

Le système de pressurisation simule un comportement réaliste des gaz :

### Propriétés suivies
- **Pression** (Pascals/kPa)
- **Température** (Kelvin)
- **Densité** (kg/m³)
- **Composition** (O2, N2, H2, CH4, H2O, etc.)
- **Niveau de liquide** (pour le stockage de liquides)

### Transfert de gaz
- Les gaz circulent de la haute pression vers la basse pression
- Le taux de transfert dépend de la différence de pression et de la taille de l'ouverture
- La température est moyennée lorsque les gaz se mélangent

### Fuites
Lorsqu'un compartiment a une fuite :
- Le gaz s'échappe vers (ou entre depuis) l'environnement
- Le transfert continue jusqu'à l'égalisation des pressions
- Dans l'espace (vide), tout le gaz finira par s'échapper

## Conseils de construction

### Créer une cabine étanche

1. Construisez un espace clos avec des blocs sur tous les côtés
2. Placez un composant Volume à l'intérieur
3. Cliquez sur `Scan` - s'il affiche **AIRTIGHT**, c'est terminé
4. S'il affiche **LEAK**, vérifiez les espaces dans votre structure

### Sources de fuites courantes

- Blocs manquants dans les coins ou les bords
- Articulations qui ne sont pas à la position 0
- Dockable Doors ouvertes
- Composants non étanches placés dans les murs

### Compartiments multiples

Pour des constructions complexes avec plusieurs zones scellées :
- Placez un composant Volume par compartiment
- Chacun suivra sa propre pression et composition
- Les volumes connectés (partageant un espace) transféreront automatiquement les gaz entre eux

### Utiliser les volumes comme réservoirs de carburant

Le composant Volume peut stocker n'importe quel fluide, pas seulement de l'air respirable :
- Remplissez avec du O2 liquide, H2, CH4 ou H2O
- Utilisez avec des [Fluid Pumps](components/fluids/fluidPump/FluidPump.md) pour extraire le carburant
- La forme irrégulière de votre construction devient la forme de votre réservoir
