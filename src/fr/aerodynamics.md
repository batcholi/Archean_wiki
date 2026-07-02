# Aérodynamique

Archean simule des forces aérodynamiques réalistes, dignes d'un simulateur de vol, sur tout véhicule se déplaçant dans un fluide — air ou eau. Le moteur produit de la **portance**, de la **traînée**, de la **stabilité**, de l'**autorité de contrôle**, de la **flottabilité** et même un **échauffement de rentrée**, le tout à partir de la **forme** réelle de votre construction. Il n'existe pas de « blocs d'aile » spéciaux ni de statistiques cachées : si ça ressemble à une aile et que c'est placé comme une aile, ça vole comme une aile.

## Fonctionnement

### Le champ de forme (modèle de section transversale)

Lorsque vous terminez l'édition d'une construction, le moteur prend un **instantané de sa forme extérieure** en la balayant depuis les six directions des axes (comme une cubemap), puis transforme le résultat en un ensemble de petites parcelles de surface. Chaque parcelle connaît sa position, la direction qu'elle expose, son aire et — surtout — **la profondeur du corps derrière elle** (sa section transversale).

Cet instantané est **mis en cache** et n'est reconstruit que lorsque la construction change (ajout/retrait de blocs, mouvement d'une surface de contrôle, ou dégâts subis). La physique de vol par image ne fait que lire les parcelles en cache, si bien que le coût reste **borné quelle que soit la complexité du véhicule** — un avion de ligne de 300 mètres avec des centaines de colliders se pilote aussi efficacement qu'un petit chasseur. La résolution du balayage s'adapte automatiquement à la taille du véhicule.

Trois promesses en découlent — et le moteur les tient **exactement**, pas approximativement :

- **La façon dont vous bâtissez une forme ne change jamais sa manière de voler — seule la forme finale compte.** Une aile de 10 × 10 × 1 faite d'un seul grand bloc ou d'une centaine de petits donne un résultat **strictement identique** : les mêmes forces et les mêmes moments, jusqu'au dernier chiffre. La subdivision, le nombre de blocs et la manière dont la géométrie est découpée ou fusionnée sont totalement invisibles pour l'écoulement — seuls comptent la silhouette extérieure et la section transversale.
- **L'air et l'eau relèvent de la même physique — il n'y a pas de « voie eau » séparée.** Le modèle échantillonne la **densité du fluide à chaque surface** et l'injecte dans les *mêmes* équations de portance et de traînée. L'air, la ligne de flottaison et l'eau profonde ne sont que des points d'une seule échelle continue de densité, si bien qu'une aile devient progressivement un hydrofoil en s'immergeant — rien ne bascule.
- **Le matériau est invisible pour le vol.** Acier, aluminium, composite — une plaque plate reste une plaque plate. **Le matériau n'affecte que la masse et la flottabilité, jamais la portance ni la traînée** — il change l'*équilibrage* de l'avion, pas sa *façon de voler*.

> Seule la **coque extérieure** est balayée. Les blocs intérieurs ne sont jamais exposés au flux d'air : ils n'ajoutent **aucune** traînée aérodynamique ni aucun coût — et comme le modèle lit l'épaisseur de matière solide derrière une surface (une cavité scellée compte comme du corps plein), une forme creuse vole exactement comme sa version pleine. Remplissez vos intérieurs, ou évidez-les, librement ; cela ne change jamais la façon dont l'engin vole.

### Portance

Une surface génère de la **portance** (se comporte comme une aile) lorsque sa **section transversale est mince** — la profondeur avant-arrière de matière solide à cette surface est faible par rapport à la taille du véhicule. Une aile est mince de haut en bas mais large en envergure et en corde, donc elle porte. Un fuselage est profond dans toutes les directions, donc il ne fait que traîner.

- La portance suit une **courbe de portance réaliste** : elle augmente avec l'angle d'attaque, puis **décroche** au-delà d'environ **15°**, après quoi la portance chute et la traînée grimpe fortement — comme un véritable profil d'aile.
- La portance est **bi-face** : une aile exposée à l'air sur ses deux faces produit toute sa portance ; une aile dont le dessous est plaqué contre le fuselage porte quand même, à puissance réduite.
- **Les surfaces distinctes portent chacune pour leur propre compte.** Un empennage bidérive, des ailes superposées (biplan) ou une dérive alignée derrière une autre sur le même axe sont lues comme les surfaces minces distinctes qu'elles sont — l'espace d'air entre elles n'est pas compté comme du corps plein, si bien que chacune d'elles fonctionne.
- La portance est calculée **à l'emplacement de chaque surface**, ce qui produit naturellement les bons moments de **tangage, roulis et lacet** autour de votre centre de masse.

> **Pour faire une aile, faites-la géométriquement mince.** Une voilure large et plate de seulement un ou deux blocs d'épaisseur portera. Une aile épaisse et profonde ne fera surtout que traîner. La façon de la subdiviser ou son matériau n'importent pas — seule la section transversale compte.

### Traînée

La traînée provient de plusieurs sources physiques, combinées automatiquement :

| Source | Description |
|--------|-------------|
| **Traînée de forme (pression)** | La poussée de l'air sur les surfaces face au flux. Croît avec le **carré de la vitesse**. |
| **Frottement de peau** | Le frottement de l'air le long des surfaces parallèles au flux (basé sur le nombre de Reynolds). Dominant pour les grands corps lents. |
| **Traînée induite** | La traînée inévitable qui accompagne la portance — plus de portance signifie plus de traînée induite. |

Le comportement nouveau clé est le **profilage basé sur la finesse**. Le moteur mesure à quel point chaque surface est **élancée** — jusqu'où le corps s'étend *le long* du flux par rapport à sa minceur *en travers* :

- Une forme **élancée** (un nez pointu, le bord d'attaque tranchant d'une aile, un long fuselage mince avançant) garde le flux attaché et a une traînée de forme **très faible**.
- Une forme **émoussée** (un cube, une plaque plate placée de côté comme un aérofrein, un nez épaté) a une traînée de forme **maximale**.

C'est purement géométrique — cela lit la section transversale réelle de votre construction, donc profiler votre nez et vos bords paie vraiment.

> Utilisez des pentes, des coins et des biseaux pour effiler les nez et les bords d'attaque/de fuite. Une forme profilée peut avoir **un dixième** de la traînée de forme d'une forme émoussée de même taille frontale.

### Compressibilité (haute vitesse)

Le modèle tient compte des régimes. À l'approche et au-delà de la **vitesse du son** (qui dépend de la température de l'air), la pression sur les surfaces orientées vers l'avant augmente dans le régime transsonique et supersonique, et **la portance des ailes s'estompe en supersonique** (vous comptez davantage sur la portance du corps et la déflexion des gouvernes). Le vol à Mach élevé devient nettement plus lourd et moins réactif, comme il se doit.

### Stabilité — émergente, non scriptée

Il n'y a **aucun amortissement artificiel** du type « garder le nez vers l'avant ». La stabilité est un résultat réel et émergent de l'emplacement de vos surfaces :

- Un **stabilisateur horizontal** monté derrière le centre de masse rencontre le flux d'air sous un angle dès que le nez pique ou cabre, générant une **force de rappel** qui ramène le nez. C'est une **stabilité en tangage** automatique.
- Un **stabilisateur vertical** (dérive) fait de même pour le **lacet** dès que le véhicule dérape.
- L'**amortissement en rotation** (résistance à la vrille) émerge aussi naturellement — les surfaces éloignées du centre de masse se déplacent vite dans l'air quand le véhicule tourne, et les forces qui en résultent s'opposent à la rotation.

Comme c'est de la vraie physique, **la stabilité statique dépend de votre centre de masse**. Un avion est stable quand son **centre de masse se situe au niveau ou légèrement en avant du centre de portance de l'aile**, et instable quand la masse est trop en arrière — exactement comme un vrai avion (et un vrai modèle réduit). Voir [Bien voler](#bien-voler) ci-dessous.

> L'ancienne stabilisation angulaire artificielle à haute vitesse a **disparu** pour les constructions utilisant ce modèle. Si votre avion semble nerveux ou refuse de se stabiliser, c'est un problème d'**équilibrage**, pas le moteur qui vous combat : déplacez de la masse vers l'avant ou ajoutez de la surface de queue.

### Surfaces de contrôle et autorité

Les surfaces de contrôle (les [Ailerons](components/miscellaneous/Aileron.md) utilisés comme ailerons, gouvernes de profondeur ou de direction) sont montées sur charnières et **se défléchissent en temps réel**. Le moteur réévalue l'aérodynamique d'une surface défléchie **à son angle courant à chaque image**, si bien que :

- Une gouverne de profondeur braquée change immédiatement le flux d'air sur l'empennage et fait tanguer l'avion.
- L'autorité dépend de l'**aire** de la surface, de sa **distance au centre de masse** (bras de levier) et de **densité de l'air × vitesse²**.

> **Pour un contrôle puissant :** faites des surfaces de contrôle **grandes** et montez-les **loin du centre de masse**. Une gouverne de profondeur tout au bout de la queue a bien plus d'autorité en tangage qu'une près de l'aile. Un air plus rapide et plus dense donne plus d'autorité — les commandes mollissent à basse vitesse et haute altitude.

### Aérodynamique sensible aux dégâts

Les dégâts de combat changent la façon dont une surface vole. À mesure qu'un panneau est déformé ou troué (et de plus en plus à mesure qu'il est détruit) :

- Il **perd sa portance** — une aile détruite cesse de voler.
- Il **perd son profilage et sa récupération de pression**, et **traîne davantage** (il génère un sillage turbulent).

Comme la portance et la traînée sont calculées par surface, les **dégâts asymétriques** ont le bon effet : une aile criblée d'un côté à la fois fait **rouler** l'avion (perte de portance de ce côté) et le fait **lacer** (traînée supplémentaire de ce côté). Les conceptions symétriques et redondantes survivent mieux au combat.

### Flottabilité

La flottabilité est la force ascendante sur les blocs immergés, calculée par collider à partir du volume de fluide déplacé par chaque bloc.

**F<sub>flottabilité</sub> = V<sub>déplacé</sub> × ρ<sub>fluide</sub> × g**

- Le volume déplacé de chaque bloc = son volume × le **ratio de déplacement volumique** de son matériau (voir [Matériaux](#matériaux)).
- Les blocs endommagés perdent presque toute leur flottabilité.
- La flottabilité est appliquée là où se trouvent réellement les blocs, donc une immersion inégale incline le navire — un effet d'auto-redressement pour les coques bien formées.

### Eau

L'eau n'est **pas un cas particulier**. Le modèle échantillonne la **densité du fluide à chaque surface** — air au-dessus de la ligne de flottaison, eau en dessous, avec une transition continue — de sorte que le *même* modèle de portance et de traînée produit simplement des forces bien plus grandes sous l'eau, où le fluide est **~800× plus dense** que l'air. Rien n'est codé en dur pour le fait « d'être dans l'eau » :

- Une aile devient un **hydrofoil** : elle porte et traîne sous l'eau exactement comme dans l'air, mais bien plus fortement. **Les gouvernes continuent de fonctionner sous l'eau**, si bien qu'un sous-marin se dirige avec les mêmes ailerons et empennages qu'un avion.
- **La traînée est énorme** et croît avec le carré de la vitesse : un corps qui entre dans l'eau décélère brutalement et une coque flottante est naturellement retenue au lieu de jaillir hors de l'eau — sans aucun amortissement artificiel.
- **L'amortissement en rotation** provient directement du même modèle : les surfaces éloignées du centre de masse se déplacent vite dans le fluide dense quand l'engin tourne ou bascule, de sorte que bateaux et sous-marins se stabilisent naturellement.

> Comme les forces augmentent avec la densité, **toucher l'eau à grande vitesse est un véritable impact**. Un plat à grande vitesse charge toute la face de contact bien au-delà de ce que la structure peut encaisser et la **déforme ou la détruit**, exactement comme un choc contre un sol dur — alors entrez dans l'eau avec un angle faible et ralentissez d'abord.

### Échauffement de rentrée

Se déplacer vite dans l'air chauffe les surfaces orientées vers l'avant vers la **température d'arrêt (de récupération)**, qui croît avec le carré de la vitesse. C'est doux en supersonique mais **explosif aux vitesses de rentrée**, et chaque matériau se consume au-delà de sa propre limite thermique — donc un bouclier thermique, un angle de rentrée raide mais survivable, et la perte de vitesse en haute altitude comptent tous.

## Blocs et matériaux

### Matériaux

Le choix du matériau affecte la **masse** et la **flottabilité** — donc l'**équilibrage** — mais **pas la portance ni la traînée** :

| Matériau | Masse (par unité de bloc) | Déplacement volumique (flottabilité) |
|----------|---------------------------|--------------------------------------|
| **Composite** | 0.25 | 0.20 × occupation |
| **Béton** | 10.0 | 0.25 × occupation |
| **Acier** | 1.0 | 0.01 × occupation |
| **Aluminium** | 0.5 | 0.01 × occupation |
| **Verre** | 1.0 | 0.02 × occupation |
| **Plomb** | 150.0 | 1.00 × occupation |
| **Titane** | 0.6 | 0.01 × occupation |

- Le **Plomb** est dense et déplace tout — idéal comme **lest de nez** pour ramener votre centre de masse vers l'avant (ou comme lest de quille dans un bateau), mais il coule.
- Le **Composite** est léger avec un déplacement modéré — le meilleur flotteur polyvalent.
- L'**Acier/Aluminium/Titane** déplacent à peine le fluide — solides et légers, mais ne contribuent presque pas à la flottabilité.

> Comme le matériau ne change pas l'aérodynamique, vous choisissez les matériaux pour la **solidité, le poids, la résistance à la chaleur et l'équilibrage** — pas pour les performances de vol.

### Formes de blocs

Les pentes, coins et pyramides occupent une demi-case et sont plus légers. Sur le plan aérodynamique, ils comptent parce qu'ils permettent d'**effiler** les surfaces — transformant une face émoussée et traînante en une face élancée et profilée. Utilisez-les sur les nez et les bords d'aile.

### Poutres de cadre

Les poutres de cadre (les barres structurelles aux bords des cadres) sont **aérodynamiquement invisibles** — aucune portance, aucune traînée, aucune flottabilité. Utilisez-les librement comme structure interne.

## Composants aérodynamiques

### Aileron

L'[Aileron](components/miscellaneous/Aileron.md) est une surface de contrôle articulée utilisée comme aileron, gouverne de profondeur ou de direction. L'entrée est une valeur de `-1.0` à `+1.0` (rotation de −45° à +45°) via son port de données.

- Il calcule sa **propre** force de contrôle et est **exclu du champ de forme principal**, donc il ne se compte jamais deux fois et délivre toujours sa pleine autorité même entouré de structure.
- Vous pouvez bâtir la partie fixe d'une aile ou d'un empennage en blocs (gérés par le champ) et placer des **ailerons au bord de fuite** pour le contrôle.

### Propeller

Le [Propeller](components/propulsion/Propeller.md) (hélice) génère une poussée dans l'air ou l'eau et est exclu du champ de forme (il a son propre modèle). Comportements clés : la poussée dépend de la densité du fluide et de l'aire du disque ; l'**effet de sol** augmente la poussée jusqu'à **+50 %** près du terrain ; les pales en rotation créent une résistance **gyroscopique** à la réorientation ; la poussée est plafonnée à **100 000 N**.

### Thruster et RCS

Les [Thrusters](components/propulsion/thruster/SmallThruster.md) chimiques ne sont pas affectés par l'aérodynamique et fonctionnent de la même façon en atmosphère et dans le vide. Les [RCS](components/propulsion/RCS.md) perdent presque toute leur efficacité dans les fluides denses (atténuation ≈ e<sup>−ρ×4</sup>) — ils sont faits pour l'espace.

## Bien voler

### Construire des ailes

- Faites l'aile **géométriquement mince** — une voilure large et plate d'un ou deux blocs d'épaisseur. Section plus mince = portance plus propre.
- Donnez-lui de l'**envergure et de la corde** ; une aile longue et large porte plus et décroche plus en douceur.
- Le **matériau et le nombre de blocs n'importent pas** pour la portance — construisez pour la solidité et le poids.
- Effilez les **bords d'attaque et de fuite** avec des pentes pour réduire la traînée.

### Équilibrer pour un vol stable

C'est la chose la plus importante pour un avion qui vole bien :

- Gardez le **centre de masse au niveau ou légèrement en avant des ailes**. Ajoutez de la masse dense (par ex. du **plomb** ou des composants lourds) vers le **nez** pour l'amener en avant — les vrais avions portent leur moteur à l'avant pour exactement cette raison.
- Un avion **trop chargé de l'arrière** (masse trop en arrière) est instable : il tangue et lace de façon divergente et est épuisant à piloter.
- Montez des **stabilisateurs horizontaux** bien en arrière du centre de masse pour la stabilité en tangage, et une **dérive** pour la stabilité en lacet. Plus de surface de queue et une queue plus longue = plus de stabilité.
- Si une construction refuse de se calmer, **déplacez de la masse vers l'avant** ou **ajoutez de la surface de queue** avant d'accuser les commandes.

### Autorité de contrôle

- Des surfaces de contrôle plus grandes, montées **plus loin du centre de masse**, donnent plus d'autorité.
- Placez les **gouvernes de profondeur tout au bout de la queue** pour le tangage, les **gouvernes de direction sur la dérive** pour le lacet, les **ailerons en bout d'aile** pour le roulis.
- L'autorité chute à **basse vitesse** et **haute altitude** (air raréfié) — gardez de la vitesse à l'approche.

### Réduire la traînée

- **Profilez** les nez et les bords avec des pentes — les formes élancées traînent beaucoup moins.
- Gardez le véhicule **compact** ; les structures étalées présentent plus d'aire frontale.
- Les **blocs intérieurs sont gratuits** — seule la coque extérieure est balayée, donc l'aménagement interne n'ajoute jamais de traînée.

### Embarcations

- Utilisez le **composite** pour la coque (meilleur rapport flottabilité/poids) ; utilisez le **plomb au fond de la quille** pour la stabilité.
- Les coques **larges et plates** sont les plus stables — l'amortissement de l'eau fait le reste.
- L'**acier/aluminium** flottent à peine ; utilisez-les au-dessus de la ligne de flottaison.

### Survivre au combat

- **Symétrie et redondance :** des dégâts d'aile asymétriques vous font *rouler* et *lacer*, donc dupliquez les surfaces portantes et de contrôle critiques des deux côtés.
- Attendez-vous à ce qu'une aile endommagée **perde de la portance et traîne davantage** — gardez de la vitesse et de l'altitude en réserve.

### Performances

Le champ de forme est mis en cache et n'est reconstruit que lorsque la construction change ou subit des dégâts, et son coût est borné quelles que soient la taille ou le nombre de blocs. Vous ne payez jamais de pénalité par image pour le détail ou le remplissage intérieur — alors construisez aussi grand et détaillé que vous le souhaitez.
