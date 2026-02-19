# Getting Started

## Creating a Mod

Mods are created from within the game, in the **Mods** tab under **Local Mods**.

### 1. Reserve a Vendor Name
Click **Reserve Vendor Name** to choose a unique vendor identifier. This name must be **3 to 12 alphanumeric characters** and is automatically converted to **UPPERCASE**. This name is permanent and cannot be changed later.

### 2. Create a New Mod
Once your vendor name is reserved, enter a mod name in the **Create New Mod** field. The mod name must be **3 to 12 alphanumeric characters** and is automatically converted to **lowercase**. Click **Create New Mod** to generate the mod folder.

## Mod Folder Structure

After creating a mod, the following folder structure is generated:

```
Archean/Archean-data/mods/
└── MYVENDOR_mymod/
    ├── config.yaml              <- Crafting recipes (optional)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- 3D model
    │   │   ├── main.xc (optional)                <- XenonCode script
    │   │   └── MyComponent1.png                  <- Thumbnail
    │   └── MyComponent2/
    │       ├── ...
```

Each component lives in its own subfolder inside `components/`. The subfolder name must match the Entity Root name defined in Blender.

> A mod can contain multiple components.

## Creating a Component

A component requires at minimum a **3D model** exported from Blender. XenonCode scripting and crafting recipes are optional.

| Step | Description | Page |
|------|-------------|------|
| **3D Model** (required) | Create and export the 3D model using the Archean Blender plugin | [3D modeling with Blender](blender.md) |
| **XenonCode Script** (optional) | Add behavior with a `main.xc` script: screens, animations, physics, audio, ports... | [Functionality with XenonCode](xenoncode.md) |
| **Crafting Recipes** (optional) | Define how your component is crafted, recycled, or processed via `config.yaml` | [Crafting Recipes](config.md) |

## Publishing

Once your mod is ready, you can publish it to the Steam Workshop directly from the **Local Mods** tab by clicking **Publish** on your mod. The mod's vendor prefix must match your reserved vendor name.
