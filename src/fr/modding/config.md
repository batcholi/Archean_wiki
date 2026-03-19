# Recettes de fabrication

## Introduction

Pour rendre vos composants moddés fabricables dans le jeu, vous devez créer un fichier `config.yaml` à la racine du dossier de votre mod. Ce fichier définit :
- **Items** : La taille maximale de pile pour chaque objet
- **Recipes** : Comment fabriquer (Crafter), recycler (Crusher) ou transformer chimiquement (Chemical Furnace) vos objets
- **Creative Inventory** : Les objets qui apparaissent dans l'inventaire du joueur lors de la réinitialisation en mode Creative

## Structure du dossier de Mod

Un mod est un dossier contenant tous vos composants personnalisés. Voici la structure attendue :

```
Archean/Archean-data/mods/
└── MYVENDORNAME_mymod/
    ├── config.yaml              <- Recettes de fabrication (cette page)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- Modèle 3D
    │   │   ├── main.xc (optional)                <- Script XenonCode
    │   │   └── MyComponent1.png                  <- Miniature
    │   └── MyComponent2/
    │       ├── MyComponent2 (.bin, .gltf, etc.)
    │       ├── main.xc (optional)
    │       └── MyComponent2.png
```

> **Important** : Le fichier `config.yaml` doit être placé à la racine du dossier de votre mod, pas dans le sous-dossier `components`.

## Structure du fichier

Le fichier `config.yaml` contient les sections suivantes :

```yaml
items:
  # Define max stack sizes for your items

recipes:
  # Define crafting, recycling, and chemistry recipes

inventory_creative_backpack:
  # Items added to backpack when resetting in Creative mode
```

---

## Section Items

La section `items` définit la taille maximale de pile pour chacun de vos objets moddés. Le nom de l'objet doit suivre le format `ModName.ComponentName`.

```yaml
items:
  MYVENDORNAME_mymod.MyComponent1:
    max_stack: 64
  MYVENDORNAME_mymod.MyComponent2:
    max_stack: 256
```

### Valeurs courantes de max_stack

| Valeur | Plage de masse typique | Exemples |
|--------|----------------------|----------|
| 1 | Objets uniques | Tools (RockRake, OreScanner), UraniumRod |
| 8 | 400-1000 kg | Crusher, SteamTurbine, FissionReactor, MiningDrill |
| 64 | 50-200 kg | Crafter, Container, Gyroscope, RTG, PilotSeat |
| 256 | 1-50 kg | Battery, Sensors, Junctions, FluidPort |
| 1024 | < 1 kg | Parts (Screw, Wire, Diode, Circuit) |
| 10000000 | Grammes | Matières premières (Iron, Copper, etc.) |

En règle générale, la masse totale des ingrédients d'une recette devrait correspondre approximativement à la masse du composant. Par exemple, un composant de 100 kg devrait nécessiter environ 100 kg de matériaux pour être fabriqué.

---

## Section Recipes

La section `recipes` est une liste d'entrées de recettes. Il existe trois types :
- **Recettes Crafter** : Pour fabriquer de nouveaux objets dans le Crafter
- **Recettes Crusher** : Pour recycler des objets en matières premières
- **Recettes Chemistry** : Pour les réactions chimiques dans le Chemical Furnace

---

### Recettes Crafter

Une recette Crafter définit comment fabriquer un objet. Ces recettes fonctionnent à la fois dans la machine Crafter et dans le menu de fabrication intégré de l'avatar.

```yaml
recipes:
  - label: MyComponent
    context: crafter
    time: 10
    input:
      ARCHEAN_parts.Casing: 50
      ARCHEAN_parts.Circuit: 1
      ARCHEAN_parts.Connector: 4
    output:
      MYVENDORNAME_mymod.MyComponent: 1
```

| Champ | Description |
|-------|-------------|
| `label` | Nom affiché dans l'interface du Crafter |
| `context` | Doit être `crafter` |
| `time` | Temps de fabrication en secondes |
| `input` | Matériaux requis (objet : quantité) |
| `output` | Objets produits (objet : quantité) |

---

### Recettes Crusher

Une recette Crusher définit quelles matières premières sont récupérées lorsqu'un objet est placé dans le Crusher.

```yaml
recipes:
  - context: crusher
    input: MYVENDORNAME_mymod.MyComponent
    output:
      ARCHEAN_celestial.Iron: 5000
      ARCHEAN_celestial.Silicon: 1000
```

| Champ | Description |
|-------|-------------|
| `context` | Doit être `crusher` |
| `input` | Nom unique de l'objet à recycler |
| `output` | Matériaux récupérés (objet : quantité) |

- <font color="orange">Les recettes Crusher sont **optionnelles**. Par défaut, le Crusher décompose automatiquement les objets en 100% de leurs matières premières de fabrication. N'ajoutez une recette Crusher que si vous souhaitez remplacer ce comportement par défaut.</font>
- L'`input` est un nom d'objet unique (pas un mapping).

---

### Recettes Chemistry

Les recettes Chemistry définissent les réactions qui se produisent dans le Chemical Furnace lorsque des conditions de température spécifiques sont remplies.

```yaml
recipes:
  - context: chemistry
    temperature_min: 750
    temperature_max: 950
    input:
      O2: 0.128
      H2: 0.004
    output:
      H2O: 0.036
      MYVENDORNAME_mymod.MyCompound:
        stack: 100
```

| Champ | Description |
|-------|-------------|
| `context` | Doit être `chemistry` |
| `temperature_min` | Température minimale (Kelvin) pour la réaction |
| `temperature_max` | Température maximale (Kelvin) pour la réaction |
| `exothermic_energy` | (Optionnel) Énergie libérée par la réaction (J/mol) |
| `input` | Fluides/matériaux requis |
| `output` | Fluides/matériaux produits |

---

## Exemple complet

```yaml
items:
  MYVENDORNAME_mymod.MyComponent:
    max_stack: 64

recipes:
  - label: MyComponent
    context: crafter
    time: 10
    input:
      ARCHEAN_parts.Casing: 10
      ARCHEAN_parts.Circuit: 1
    output:
      MYVENDORNAME_mymod.MyComponent: 1

inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```

---

## Objets disponibles dans le jeu de base

### Matières premières (ARCHEAN_celestial)
Celles-ci peuvent être utilisées comme ingrédients de recettes :
- `ARCHEAN_celestial.Aluminium`
- `ARCHEAN_celestial.Carbon`
- `ARCHEAN_celestial.Chrome`
- `ARCHEAN_celestial.Copper`
- `ARCHEAN_celestial.Gold`
- `ARCHEAN_celestial.Iron`
- `ARCHEAN_celestial.Lead`
- `ARCHEAN_celestial.Nickel`
- `ARCHEAN_celestial.Silicon`
- `ARCHEAN_celestial.Silver`
- `ARCHEAN_celestial.Sulfur`
- `ARCHEAN_celestial.Tin`
- `ARCHEAN_celestial.Titanium`
- `ARCHEAN_celestial.Tungsten`
- `ARCHEAN_celestial.Uranium`
- `ARCHEAN_celestial.Fluorite`

### Pièces (ARCHEAN_parts)
Ce sont des objets intermédiaires couramment utilisés dans les recettes :
- `ARCHEAN_parts.Screw`
- `ARCHEAN_parts.Plastic`
- `ARCHEAN_parts.Wire`
- `ARCHEAN_parts.Connector`
- `ARCHEAN_parts.Magnet`
- `ARCHEAN_parts.Diode`
- `ARCHEAN_parts.Capacitor`
- `ARCHEAN_parts.Panel`
- `ARCHEAN_parts.Disk`
- `ARCHEAN_parts.Casing`
- `ARCHEAN_parts.Circuit`
- `ARCHEAN_parts.GoldPlatedCircuit`
- `ARCHEAN_parts.Motor`
- `ARCHEAN_parts.LED`

### Fluides

Le système de chimie supporte les formules chimiques. Voici les fluides couramment utilisés dans le jeu :

| Formule | Nom | Utilisé dans |
|---------|-----|-------------|
| `O2` | Oxygène | Electrolyser, Thrusters, Fabrication |
| `H2` | Hydrogène | Electrolyser, Thrusters, Fabrication |
| `H2O` | Eau | Electrolyser, Chemistry |
| `CH4` | Méthane | Thrusters (carburant), Sabatier Reactor |
| `CO2` | Dioxyde de carbone | Sabatier Reactor |
| `HF` | Fluorure d'hydrogène | Traitement de l'uranium |
| `F2` | Fluor | Traitement de l'uranium |

Vous pouvez définir des molécules personnalisées en utilisant les formules chimiques standard (ex. `NH3`, `C2H6`). La masse moléculaire est correctement calculée à partir des masses atomiques, mais la densité liquide des molécules personnalisées est approximée.

---

## Inventaire Creative

Vous pouvez faire apparaître vos objets moddés dans l'inventaire du joueur lorsqu'il se réinitialise en mode Creative. Ceci est utile pour les tests ou pour les objets qui n'ont pas besoin de recettes de fabrication.

### Objets du sac à dos

Ajoutez des objets au sac à dos du joueur lors de la réinitialisation :

```yaml
inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```
