# Interfaces & Gestion de l'inventaire

Cette page couvre tous les systèmes d'interface utilisateur dans Archean, y compris la gestion de l'inventaire, les raccourcis et la manipulation des fenêtres.

---

## Inventaires de l'avatar

Le joueur a accès à deux inventaires personnels :

### Ceinture

La **ceinture** est la barre d'accès rapide en bas de l'écran.

- Contient **9 emplacements** pour les outils et objets
- Sélectionnez les objets avec les touches **1** à **9**
- Les roches collectées vont d'abord dans la ceinture, puis débordent dans le sac à dos
- L'objet actif affiche un contour vert

### Sac à dos

Le **sac à dos** est votre stockage d'inventaire principal.

- Ouvrir/fermer avec **Tab**
- En mode Adventure : **48 emplacements**
- En mode Creative : emplacements illimités avec objets pré-remplis
- Possède une **barre de recherche** pour filtrer les objets par nom
- La masse des objets affecte votre vitesse de déplacement en mode Adventure

---

## Système de main

La **Main** est votre objet actuellement sélectionné/actif.

| Action | Description |
|--------|-------------|
| **Touches numériques (1-9)** | Sélectionner un emplacement de la ceinture comme actif |
| **Double-clic** sur un objet | Le sélectionner comme actif (fonctionne depuis n'importe quel inventaire ouvert) |

Lorsqu'un outil est dans votre main, vous pouvez l'utiliser avec :
- **Clic gauche** (fonction principale)
- **Clic droit** (fonction secondaire)
- **Maintenir C** pour configurer l'outil
- **Maintenir X** pour le mode spécial

---

## Interaction avec les composants

Appuyez sur **F** pour interagir avec le composant ou l'écran que vous visez (ouvrir des inventaires, appuyer sur des boutons, basculer des interrupteurs, ajuster des leviers, cliquer sur des écrans...).

De plus, vous pouvez **cliquer gauche** directement sur les composants :

| Condition | Comportement |
|-----------|----------|
| **Souris libre** (pas de regard souris) | Cliquez sur n'importe quel composant visible pour interagir |
| **Regard souris sans objet actif** | Cliquez pour interagir avec le composant dans votre viseur |
| **Regard souris avec objet actif** | Le clic gauche est utilisé par l'outil — l'interaction avec les composants est désactivée |

> **Note :** L'interaction par clic gauche vous permet d'appuyer sur des boutons ou basculer des interrupteurs sans avoir besoin de ranger votre outil — il suffit de libérer votre souris ou de vider votre main.

---

## Manipulation des objets

### Glisser-déposer

| Action | Description |
|--------|-------------|
| **Glisser un objet** | Déplacer un objet entre les emplacements ou les inventaires |
| **Déposer hors de l'inventaire** | Lâcher l'objet au sol (crée une Box) |

### Empilage & Séparation

En glissant une pile d'objets :

| Action | Description |
|--------|-------------|
| **Clic droit** | Déposer **1** objet de la pile |
| **Shift + Clic droit** | Déposer **la moitié** de la pile |
| **Déposer sur le même type d'objet** | Empiler les objets ensemble (si l'espace le permet) |

### Transfert rapide

| Action | Description |
|--------|-------------|
| **Shift + Clic gauche** | Déplacer rapidement un objet vers un autre inventaire ouvert |

Cela fonctionne entre votre sac à dos et n'importe quel conteneur ouvert. Les objets tenteront d'abord de s'empiler avec les objets existants du même type.

---

## Fabrication

Ouvrez votre sac à dos (**Tab**) pour accéder à l'interface de fabrication sur le côté gauche.

### Actions de fabrication

| Mode | Boutons disponibles |
|------|-------------------|
| **Par défaut** | **+1** et **+10** |
| **Maintenir Shift** | **+50** et **+max** (selon les ressources disponibles) |

Cliquez sur un ingrédient pour le développer et voir les sous-recettes (fabrication récursive).

### Conditions de fabrication

- Les ingrédients solides doivent être dans votre sac à dos (ou tout inventaire ouvert)
- Les fluides (H₂O, H₂, O₂) doivent être fournis via des **bidons** dans les emplacements de fluides dédiés en bas de la fenêtre de fabrication
- Vous pouvez fabriquer en utilisant les ressources de n'importe quel inventaire ouvert — les ingrédients sont automatiquement déplacés vers votre sac à dos

### Zone de traitement d'objets

La zone de traitement d'objets (1 emplacement) est utilisée pour le **traitement d'objets**, pas la fabrication. Par exemple :
- Broyer des roches en minerais (début de partie en mode Adventure)

### Emplacements de fluides

En bas de la fenêtre de fabrication, vous pouvez voir vos niveaux de fluides : **Eau**, **Hydrogène** et **Oxygène**.

- Votre avatar possède un **réservoir d'eau intégré** qui se remplit automatiquement lorsque vos pieds touchent l'eau (océan, lac)
- Le bouton **Électrolyse** convertit l'eau en hydrogène et oxygène pour les recettes de fabrication qui en nécessitent

---

## Inventaires externes (Conteneurs)

Interagissez avec un [Container](components/storage/Container.md) en utilisant **F** pour ouvrir son inventaire.

### Utiliser des outils depuis les conteneurs

Certains outils peuvent fonctionner directement depuis l'intérieur d'un conteneur :

1. Placez l'outil dans le conteneur
2. **Double-cliquez** sur l'outil pour l'activer
3. L'outil utilisera les ressources du conteneur au lieu de votre sac à dos

> **Astuce :** Si vous avez un objet d'un conteneur sélectionné dans votre main, appuyer sur **Tab** ouvrira automatiquement votre sac à dos et le conteneur source.

C'est particulièrement utile lorsque les ressources sont trop lourdes à transporter sur votre avatar :
- **Constructor Tool** - construire en utilisant les composants stockés dans le conteneur
- **Destructor Tool** - les composants détruits vont dans le conteneur
- **Spool Tool** - utiliser les bobines de câble du conteneur
- **Blueprint Tool** - faire apparaître des véhicules en mode Adventure avec tous les composants requis dans le conteneur
- **Rock Rake Tool** - les roches collectées vont dans le conteneur

### Limites de distance

Les inventaires ouverts ont une distance d'interaction maximale :
- **Conteneurs** : 100 mètres
- **Boîtes lâchées** : 10 mètres

Lorsque vous dépassez la limite, les objets deviennent **grisés** et ne peuvent plus être manipulés. La fenêtre d'inventaire se fermera automatiquement si vous vous éloignez trop.

### Fabriquer depuis les inventaires ouverts

Lorsqu'un conteneur est ouvert, le système de fabrication de l'avatar peut automatiquement puiser les ingrédients depuis celui-ci. Cela vous permet de fabriquer des objets en utilisant les ressources stockées dans les conteneurs sans les transférer manuellement dans votre sac à dos.

---

## Placer des composants au sol

Certains composants peuvent être placés directement sur le terrain sans avoir besoin d'une structure de construction existante.

1. Sélectionnez le composant dans votre main
2. Visez le sol (à moins de **10 mètres**)
3. **Clic gauche** pour le placer

| Action | Description |
|--------|-------------|
| **Clic gauche** | Placer le composant |
| **Maintenir Shift + Molette** | Faire pivoter le composant |

Le composant s'alignera automatiquement sur la direction de la gravité locale. Une nouvelle construction est créée pour accueillir le composant.

---

## Gestion des fenêtres

### Épingler les fenêtres d'inventaire

De nombreuses fenêtres de stockage peuvent être **épinglées** pour rester ouvertes :
- Conteneurs
- Computer (baie HDD, IDE)
- Emplacements de combustible du Fission Reactor
- Trash Cans
- Boîtes d'objets lâchés

| Action | Description |
|--------|-------------|
| **Cliquer sur l'icône épingle** (📌) | Épingler la fenêtre |
| **Cliquer sur X** | Fermer et désépingler la fenêtre |
| **ESC** | Masquer toutes les fenêtres épinglées |
| **Tab** | Réafficher les fenêtres épinglées masquées |

### Fenêtres GetInfo

Appuyez sur **V** en visant un composant pour ouvrir sa fenêtre d'information. Ce système fonctionne indépendamment de l'épinglage d'inventaire :

| Action | Description |
|--------|-------------|
| **Cliquer sur l'icône épingle** (📌) | Garder la fenêtre ouverte |
| **Cliquer sur X** | Fermer et désépingler la fenêtre |

- Plusieurs fenêtres GetInfo peuvent être épinglées simultanément
- Les fenêtres épinglées affichent des **valeurs mises à jour en temps réel**
- **ESC n'affecte pas** les fenêtres GetInfo

C'est utile pour surveiller plusieurs composants à la fois (par exemple, niveaux de batterie, pressions des réservoirs, relevés de capteurs).
