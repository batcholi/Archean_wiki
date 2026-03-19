# Aérodynamique

Archean simule des forces aérodynamiques qui s'appliquent automatiquement à tout véhicule se déplaçant dans un milieu fluide — que ce soit l'air ou l'eau. Ces forces comprennent la **traînée** (résistance au mouvement), la **portance** (force perpendiculaire générée par les surfaces fines) et la **flottabilité** (force ascendante due au déplacement de fluide). Comprendre ces systèmes est essentiel pour concevoir des aéronefs, bateaux, sous-marins et toute autre création mobile efficace.

## Fonctionnement

### Milieu fluide

Le moteur physique interroge l'environnement à chaque point pertinent de votre véhicule pour déterminer les propriétés locales du fluide :

| Propriété | Description | Valeurs d'exemple |
|----------|-------------|----------------|
| **Densité** (kg/m³) | Masse par unité de volume du fluide | Air au niveau de la mer : ~1.2, Eau : ~1000 |
| **Viscosité** (kg/(m·s)) | Résistance à l'écoulement au sein du fluide | Utilisée pour la détection de l'eau et l'amortissement |

- Dans l'**air**, la densité diminue avec l'altitude. Plus l'altitude est élevée, moins il y a de traînée et de portance.
- Dans l'**eau**, la densité est environ 800 fois supérieure à celle de l'air — les forces aérodynamiques sont considérablement plus fortes.
- Dans l'**espace** (vide), la densité est de 0 — aucune force aérodynamique ne s'applique.

> Les forces aérodynamiques ne s'activent que lorsque la vitesse d'un véhicule dépasse **0.1 m/s**. En dessous de ce seuil, les forces ne sont pas calculées.

### Traînée

La traînée est la force qui s'oppose au mouvement d'un véhicule à travers un fluide. Elle agit dans la **direction opposée** à la vitesse.

La force de traînée sur chaque surface exposée suit l'équation aérodynamique standard :

**F = ½ × C<sub>d</sub> × ρ × v² × A**

| Symbole | Signification | Valeur |
|--------|---------|-------|
| C<sub>d</sub> | Coefficient de traînée | **0.4** pour les surfaces de blocs |
| ρ | Densité du fluide (kg/m³) | Dépend de l'environnement |
| v | Vitesse relative à la surface (m/s) | Vitesse du véhicule + vitesse de rotation en ce point |
| A | Surface frontale exposée (m²) | Perpendiculaire à la vitesse, mise à l'échelle par le ratio d'occupation |

Points clés :
- La traînée augmente avec le **carré** de la vitesse — doubler votre vitesse quadruple la traînée
- Seules les **surfaces exposées** contribuent à la traînée (voir [Occultation](#occultation-et-surfaces-exposées))
- La force est calculée **par surface**, à la position de chaque surface, ce qui signifie que la traînée peut aussi induire un **couple** (rotation) si elle est appliquée hors du centre

### Portance

La portance est générée automatiquement par les **structures fines et plates** — comme les ailes ou les ailerons — que le moteur physique détecte en fonction de la géométrie.

Une surface est classée comme **surface de portance** lorsque toutes les conditions suivantes sont remplies :

| Condition | Seuil |
|-----------|-----------|
| Épaisseur (dimension la plus courte) | < **0.3 m** |
| Largeur (dimension intermédiaire) | ≥ **longueur / 4** |
| Longueur (dimension la plus longue) | ≥ **4 m** |

Lorsqu'une surface de portance est détectée :
- Le **coefficient de portance** dépend de l'angle d'attaque : `C_l = sin(|angle_d_attaque| × π/2)`
- Le **coefficient de traînée** est très faible : seulement **0.01** (contre 0.4 pour les surfaces normales)
- La force de portance est perpendiculaire à la vitesse, poussant le véhicule dans la direction de la normale à la surface

> Pour construire des ailes qui génèrent de la portance, utilisez des arrangements plats de blocs d'au moins **4 mètres de long** et de **moins de 0.3 mètre d'épaisseur**. Les pentes peuvent être utilisées pour façonner les bords d'attaque et de fuite.

### Flottabilité

La flottabilité est la force ascendante exercée sur un objet immergé ou partiellement immergé. Elle s'oppose à la gravité et dépend de la quantité de fluide que les blocs du véhicule déplacent.

**F<sub>flottabilité</sub> = V<sub>déplacé</sub> × ρ<sub>fluide</sub> × g**

| Symbole | Signification |
|--------|---------|
| V<sub>déplacé</sub> | Volume déplacé (volume du bloc × `volumeDisplacementRatio`) |
| ρ<sub>fluide</sub> | Densité du fluide au point d'échantillonnage |
| g | Accélération gravitationnelle (direction opposée) |

- Le moteur échantillonne **au moins 16 points aléatoires** sur tous les colliders pour gérer l'**immersion partielle** en douceur
- La contribution de chaque bloc dépend du `volumeDisplacementRatio` de son matériau (voir [Matériaux](#matériaux))
- La flottabilité est appliquée à chaque point d'échantillonnage, de sorte qu'un véhicule peut s'incliner en cas d'immersion inégale

## Blocs et formes

### Formes de blocs

Les différentes formes de blocs ont des **ratios d'occupation** différents, qui affectent directement les calculs de traînée :

| Forme | Ratio d'occupation | Multiplicateur de masse |
|-------|----------------|-----------------|
| **Cube** | 1.0 | 1.0× |
| **Pente** | 0.5 | 0.5× |
| **Coin** | 0.5 | 0.5× |
| **Pyramide** | 0.5 | 0.5× |
| **Coin inversé** | 0.5 | 0.5× |

Le ratio d'occupation met à l'échelle la surface de traînée calculée — un bloc en pente face au vent produit environ **la moitié de la traînée** d'un cube à la même position.

### Matériaux

Chaque matériau de bloc possède des propriétés physiques différentes qui affectent l'aérodynamique, la flottabilité et la masse :

| Matériau | Masse (kg/unité de bloc) | Ratio de déplacement de volume | Friction |
|----------|---------------------|--------------------------|----------|
| **Composite** | 0.25 | 0.20 × occupation | 0.05 |
| **Béton** | 10.0 | 0.25 × occupation | 0.50 |
| **Acier** | 1.0 | 0.01 × occupation | 0.20 |
| **Aluminium** | 0.5 | 0.01 × occupation | 0.20 |
| **Verre** | 1.0 | 0.02 × occupation | 0.10 |
| **Plomb** | 150.0 | 1.00 × occupation | 0.20 |

Le **ratio de déplacement de volume** détermine combien un bloc contribue à la flottabilité et sa visibilité pour la détection des surfaces aérodynamiques :
- Le **Plomb** (1.0) déplace entièrement le fluide — force de flottabilité maximale mais aussi très lourd, donc il coule
- L'**Acier/Aluminium** (0.01) déplacent à peine le fluide — ils ne contribuent presque pas à la flottabilité
- Le **Composite** (0.2) offre un équilibre modéré entre flottabilité et légèreté

### Occultation et surfaces exposées

Le système aérodynamique utilise le **raycasting** pour déterminer quelles surfaces sont réellement exposées au flux d'air :

1. Pour chaque collider de bloc, le moteur identifie la surface faisant face à la direction de la vitesse
2. Un rayon est lancé depuis cette surface vers l'extérieur dans la direction de la vitesse
3. Si le rayon touche un autre bloc du même véhicule, cette surface est considérée comme **occultée** et ne contribue **pas** à la traînée ou à la portance
4. Seules les surfaces véritablement exposées génèrent des forces aérodynamiques

Cela signifie :
- Les **blocs internes** à l'intérieur d'une coque n'ajoutent pas de traînée — seule l'enveloppe extérieure compte
- Un **véhicule compact** avec moins de faces exposées a moins de traînée qu'une structure étalée
- Quand un groupe de blocs a un ratio d'occupation inférieur à **0.9**, le système examine récursivement les blocs enfants individuels pour trouver les surfaces réellement exposées

> C'est un point d'optimisation important : deux véhicules avec la même forme extérieure mais des structures internes différentes subiront la **même** traînée aérodynamique. Remplissez les intérieurs librement sans vous soucier de la traînée supplémentaire.

### Poutres de cadre

Les poutres de cadre (les barres structurelles aux bords des cadres) ont un **ratio de déplacement de volume de 0**. Cela signifie :

- Elles ne produisent **aucune traînée**
- Elles ne produisent **aucune portance**
- Elles ne produisent **aucune flottabilité**
- Elles servent uniquement de géométrie de collision structurelle

> Les poutres de cadre sont aérodynamiquement invisibles. Utilisez-les librement pour la structure interne sans affecter les performances aérodynamiques de votre véhicule.

## Composants aérodynamiques

### Aileron

L'[Aileron](components/miscellaneous/Aileron.md) est une surface de contrôle qui se défléchit pour créer des forces perpendiculaires au flux d'air. Il est utilisé pour diriger les aéronefs et les embarcations.

- **Entrée** : une valeur entre `-1.0` et `+1.0` via son port de données, contrôlant la rotation de -45° à +45°
- **Force** : proportionnelle à la densité du fluide × vitesse² × angle de déflexion
- **Ne calcule pas l'occultation** — contrairement aux blocs, l'Aileron génère toujours sa pleine force indépendamment de la géométrie environnante

> Comme les Ailerons ignorent l'occultation, vous pouvez les **cacher à l'intérieur des ailes** faites de blocs. Les blocs auront leurs surfaces occultées (réduisant la traînée), tandis que les Ailerons produisent toujours leur pleine force de contrôle.

### Propeller

Le [Propeller](components/propulsion/Propeller.md) génère de la poussée en faisant tourner des pales dans un milieu fluide. Il fonctionne aussi bien dans l'air que dans l'eau.

Physique clé :
- **Poussée** = ½ × ρ × A<sub>disque</sub> × v<sub>effective</sub>² × 0.4
- **Traînée sur les pales** = ½ × ρ × viscosité × A<sub>disque</sub> × v<sub>effective</sub>² × 10.0
- **Effet de sol** : lorsqu'un Propeller est proche du sol et orienté vers le bas, la poussée augmente jusqu'à **+50 %** (dans un rayon de 3× le rayon des pales par rapport au terrain)
- **Précession gyroscopique** : les Propellers en rotation résistent aux changements d'orientation, créant un couple perpendiculaire à l'axe de rotation — comme de vrais gyroscopes
- La poussée maximale est plafonnée à **100 000 N**

### Thruster & RCS

Les [Thrusters](components/propulsion/thruster/SmallThruster.md) chimiques génèrent de la poussée par combustion de carburant et ne sont **pas affectés** par l'aérodynamique externe pour leur rendement de poussée — ils fonctionnent de la même manière dans l'atmosphère et dans le vide.

Les propulseurs [RCS](components/propulsion/RCS.md) (Reaction Control System), en revanche, subissent une **atténuation atmosphérique** :

**atténuation = max(e<sup>-ρ×4</sup>, 0.01)**

| Environnement | Densité (ρ) | Atténuation | Poussée effective |
|-------------|-------------|-------------|-----------------|
| Vide | 0 | 100 % | Pleine poussée |
| Air (niveau de la mer) | ~1.2 | ~99.2 % | Quasi pleine |
| Eau | ~1000 | ~1 % | Presque aucune poussée |

> Les propulseurs RCS sont conçus pour les manoeuvres spatiales. Dans les atmosphères denses ou l'eau, leur efficacité chute considérablement.

## Physique aquatique

Lorsqu'un véhicule entre dans l'eau, le moteur physique applique des effets d'amortissement supplémentaires au-delà de la traînée standard :

### Détection de l'eau

Le moteur détecte l'eau en mesurant la **viscosité** de l'environnement. Une viscosité comprise entre **0.0000151** et **0.000999** kg/(m·s) est classée comme de l'eau.

### Effets d'amortissement aquatique

| Effet | Description |
|--------|-------------|
| **Suppression de la vitesse verticale** | La vitesse verticale est réduite au fil du temps, simulant la résistance de l'eau au mouvement vertical |
| **Amortissement du tangage et du roulis** | La rotation autour des axes horizontaux est amortie proportionnellement au degré d'immersion du véhicule |
| **Amortissement du lacet** | La rotation autour de l'axe vertical est amortie à **la moitié** du taux du tangage/roulis |

Le **facteur d'immersion** est calculé à partir de la viscosité moyenne : `immergé = clamp(pow(viscosité × 1000, 0.1), 0.5, 1.0)`

> L'eau stabilise naturellement les véhicules. Un véhicule partiellement immergé résistera au chavirement grâce à l'amortissement du tangage/roulis. Cela rend les bateaux intrinsèquement plus stables que les aéronefs.

## Stabilité angulaire à haute vitesse

À des vitesses supérieures à **10 m/s**, le moteur physique applique un amortissement angulaire artificiel qui simule l'accumulation de pression sur les surfaces du véhicule :

**ω -= ω × min(1, ρ) × clamp(Δt × |v| / 25, 0, 0.025)**

Cela signifie :
- Les **véhicules plus rapides** sont plus stables en rotation
- Les **fluides plus denses** (eau > air) fournissent une stabilisation plus forte
- Cela empêche les véhicules de tournoyer de manière incontrôlable à haute vitesse
- Dans l'eau à haute viscosité, un facteur d'amortissement angulaire supplémentaire est appliqué

## Conseils de conception

### Réduire la traînée
- **Minimisez la surface exposée** — une forme compacte et profilée crée moins de traînée
- Utilisez des **pentes, coins et biseaux** sur les bords d'attaque et les nez au lieu de faces de cubes plates
- Les **blocs internes n'ajoutent pas de traînée** — seule l'enveloppe extérieure compte, remplissez les intérieurs selon vos besoins
- Les poutres de cadre sont aérodynamiquement invisibles — utilisez-les librement pour la structure interne

### Construire des ailes efficaces
- Les ailes doivent mesurer **au moins 4 mètres de long**, **moins de 0.3 mètre d'épaisseur**
- Une envergure plus large (largeur ≥ longueur/4) garantit que la surface est classée comme surface de portance plutôt que surface de traînée

### Conception d'embarcations
- Les **blocs Composite** (ratio 0.2) offrent le meilleur rapport flottabilité/poids pour flotter
- L'**Acier et l'Aluminium** (ratio 0.01) contribuent à peine à la flottabilité — utilisez-les avec parcimonie dans les bateaux
- Le **Plomb** (ratio 1.0) déplace le plus de fluide, mais à 150 kg par unité il coulera rapidement
- L'amortissement aquatique stabilise naturellement votre embarcation — les coques larges et plates sont les plus stables

### Placement des Propellers
- L'**effet de sol** augmente la poussée jusqu'à 50 % à proximité du terrain — utile pour la conception d'aéroglisseurs
- Les Propellers génèrent un **couple gyroscopique** — des paires de Propellers contrarotatifs annulent cet effet
- Les Propellers fonctionnent dans l'air et dans l'eau, adaptant leur poussée en fonction de la densité et de la viscosité du fluide
