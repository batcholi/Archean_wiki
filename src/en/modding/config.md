# Crafting Recipes

## Introduction

To make your modded components craftable in the game, you need to create a `config.yaml` file at the root of your mod folder. This file defines:
- **Items**: The maximum stack size for each item
- **Recipes**: How to craft (Crafter), recycle (Crusher), or chemically process (Chemical Furnace) your items
- **Creative Inventory**: Items that appear in the player's inventory when resetting in Creative mode

## Mod Folder Structure

A mod is a folder containing all your custom components. Here's the expected structure:

```
Archean/Archean-data/mods/
└── MYVENDORNAME_mymod/
    ├── config.yaml              <- Crafting recipes (this page)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- 3D model
    │   │   ├── main.xc (optional)                <- XenonCode script
    │   │   └── MyComponent1.png                  <- Thumbnail
    │   └── MyComponent2/
    │       ├── MyComponent2 (.bin, .gltf, etc.)
    │       ├── main.xc (optional)
    │       └── MyComponent2.png
```

> **Important**: The `config.yaml` file must be placed at the root of your mod folder, not inside the `components` subfolder.

## File Structure

The `config.yaml` file has the following sections:

```yaml
items:
  # Define max stack sizes for your items

recipes:
  # Define crafting, recycling, and chemistry recipes

inventory_creative_backpack:
  # Items added to backpack when resetting in Creative mode
```

---

## Items Section

The `items` section defines the maximum stack size for each of your modded items. The item name must follow the format `ModName.ComponentName`.

```yaml
items:
  MYVENDORNAME_mymod.MyComponent1:
    max_stack: 64
  MYVENDORNAME_mymod.MyComponent2:
    max_stack: 256
```

### Common max_stack Values

| Value | Typical Mass Range | Examples |
|-------|-------------------|----------|
| 1 | Unique items | Tools (RockRake, OreScanner), UraniumRod |
| 8 | 400-1000 kg | Crusher, SteamTurbine, FissionReactor, MiningDrill |
| 64 | 50-200 kg | Crafter, Container, Gyroscope, RTG, PilotSeat |
| 256 | 1-50 kg | Battery, Sensors, Junctions, FluidPort |
| 1024 | < 1 kg | Parts (Screw, Wire, Diode, Circuit) |
| 10000000 | Grams | Raw materials (Iron, Copper, etc.) |

As a general rule, the total mass of recipe inputs should approximately match the component's mass. For example, a 100 kg component should require roughly 100 kg of materials to craft.

---

## Recipes Section

The `recipes` section is a list of recipe entries. There are three types:
- **Crafter recipes**: For crafting new items in the Crafter
- **Crusher recipes**: For recycling items back into raw materials
- **Chemistry recipes**: For chemical reactions in the Chemical Furnace

---

### Crafter Recipes

A crafter recipe defines how to craft an item. These recipes work both in the Crafter machine and in the avatar's built-in crafting menu.

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

| Field | Description |
|-------|-------------|
| `label` | Display name in the Crafter UI |
| `context` | Must be `crafter` |
| `time` | Crafting time in seconds |
| `input` | Required materials (item: quantity) |
| `output` | Produced items (item: quantity) |

---

### Crusher Recipes

A crusher recipe defines what raw materials are returned when an item is put in the Crusher.

```yaml
recipes:
  - context: crusher
    input: MYVENDORNAME_mymod.MyComponent
    output:
      ARCHEAN_celestial.Iron: 5000
      ARCHEAN_celestial.Silicon: 1000
```

| Field | Description |
|-------|-------------|
| `context` | Must be `crusher` |
| `input` | Single item name to recycle |
| `output` | Recovered materials (item: quantity) |

- <font color="orange">Crusher recipes are **optional**. By default, the Crusher automatically decomposes items into 100% of their raw crafting materials. Only add a crusher recipe if you want to override this default behavior.</font>
- The `input` is a single item name (not a mapping).

---

### Chemistry Recipes

Chemistry recipes define reactions that occur in the Chemical Furnace when specific temperature conditions are met.

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

| Field | Description |
|-------|-------------|
| `context` | Must be `chemistry` |
| `temperature_min` | Minimum temperature (Kelvin) for the reaction |
| `temperature_max` | Maximum temperature (Kelvin) for the reaction |
| `exothermic_energy` | (Optional) Energy released by the reaction (J/mol) |
| `input` | Required fluids/materials |
| `output` | Produced fluids/materials |

---

## Complete Example

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

## Available Base Game Items

### Raw Materials (ARCHEAN_celestial)
These can be used as recipe inputs:
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

### Parts (ARCHEAN_parts)
These are intermediate items commonly used in recipes:
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

### Fluids

The chemistry system supports chemical formulas. Here are the commonly used fluids in the game:

| Formula | Name | Used In |
|---------|------|---------|
| `O2` | Oxygen | Electrolyser, Thrusters, Crafting |
| `H2` | Hydrogen | Electrolyser, Thrusters, Crafting |
| `H2O` | Water | Electrolyser, Chemistry |
| `CH4` | Methane | Thrusters (fuel), Sabatier Reactor |
| `CO2` | Carbon Dioxide | Sabatier Reactor |
| `HF` | Hydrogen Fluoride | Uranium processing |
| `F2` | Fluorine | Uranium processing |

You can define custom molecules using standard chemical formulas (e.g., `NH3`, `C2H6`). Molecular mass is calculated correctly from atomic masses, but liquid density for custom molecules is approximated.

---

## Creative Inventory

You can make your modded items appear in the player's inventory when they reset in Creative mode. This is useful for testing or for items that don't need crafting recipes.

### Backpack Items

Add items to the player's backpack on reset:

```yaml
inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```
