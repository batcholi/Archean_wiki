# Pour commencer

## Créer un Mod

Les mods sont créés depuis le jeu, dans l'onglet **Mods** sous **Local Mods**.

### 1. Réserver un Vendor Name
Cliquez sur **Reserve Vendor Name** pour choisir un identifiant de vendeur unique. Ce nom doit comporter **3 à 12 caractères alphanumériques** et est automatiquement converti en **MAJUSCULES**. Ce nom est permanent et ne peut pas être modifié ultérieurement.

### 2. Créer un nouveau Mod
Une fois votre vendor name réservé, entrez un nom de mod dans le champ **Create New Mod**. Le nom du mod doit comporter **3 à 12 caractères alphanumériques** et est automatiquement converti en **minuscules**. Cliquez sur **Create New Mod** pour générer le dossier du mod.

## Structure du dossier de Mod

Après avoir créé un mod, la structure de dossiers suivante est générée :

```
Archean/Archean-data/mods/
└── MYVENDOR_mymod/
    ├── config.yaml              <- Recettes de fabrication (optionnel)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- Modèle 3D
    │   │   ├── main.xc (optional)                <- Script XenonCode
    │   │   └── MyComponent1.png                  <- Miniature
    │   └── MyComponent2/
    │       ├── ...
```

Chaque composant réside dans son propre sous-dossier à l'intérieur de `components/`. Le nom du sous-dossier doit correspondre au nom de l'Entity Root défini dans Blender.

> Un mod peut contenir plusieurs composants.

## Créer un composant

Un composant nécessite au minimum un **modèle 3D** exporté depuis Blender. Le scripting XenonCode et les recettes de fabrication sont optionnels.

| Étape | Description | Page |
|-------|-------------|------|
| **Modèle 3D** (requis) | Créer et exporter le modèle 3D avec le plugin Archean pour Blender | [Modélisation 3D avec Blender](blender.md) |
| **Script XenonCode** (optionnel) | Ajouter des comportements avec un script `main.xc` : écrans, animations, physique, audio, ports... | [Fonctionnalités avec XenonCode](xenoncode.md) |
| **Recettes de fabrication** (optionnel) | Définir comment votre composant est fabriqué, recyclé ou transformé via `config.yaml` | [Recettes de fabrication](config.md) |

## Publication

Une fois votre mod prêt, vous pouvez le publier sur le Steam Workshop directement depuis l'onglet **Local Mods** en cliquant sur **Publish** sur votre mod. Le préfixe vendor du mod doit correspondre à votre vendor name réservé.
