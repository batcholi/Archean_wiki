# Interfaces & Inventory Management

This page covers all the user interface systems in Archean, including inventory management, shortcuts, and window manipulation.

---

## Avatar Inventories

The player has access to two personal inventories:

### Belt

The **belt** is the quick-access toolbar at the bottom of the screen.

- Contains **9 slots** for tools and items
- Select items using keys **1** through **9**
- Rocks collected automatically go to the belt first, then overflow to the backpack
- Active item shows a green outline

### Backpack

The **backpack** is your main inventory storage.

- Open/close with **Tab**
- In Adventure mode: **48 slots**
- In Creative mode: unlimited slots with pre-filled items
- Has a **search bar** to filter items by name
- Mass of items affects your movement speed in Adventure mode

---

## Hand System

The **Hand** is your currently selected/active item.

| Action | Description |
|--------|-------------|
| **Number keys (1-9)** | Select belt slot as active |
| **Double-click** on any item | Select it as active (works from any open inventory) |

When a tool is in your hand, you can use it with:
- **Left-click** (primary function)
- **Right-click** (secondary function)
- **Hold C** to configure the tool
- **Hold X** for special mode

---

## Component Interaction

Press **F** to interact with the component or screen you are aiming at (open inventories, press buttons, toggle switches, adjust levers, click on screens...).

Additionally, you can **left-click** on components directly:

| Condition | Behavior |
|-----------|----------|
| **Free mouse** (no mouse look) | Click on any visible component to interact |
| **Mouse look without active item** | Click to interact with the component in your crosshair |
| **Mouse look with active item** | Left-click is used by the tool — component interaction is disabled |

> **Note:** Left-click interaction allows you to press buttons or toggle switches without needing to put your tool away — simply free your mouse or empty your hand.

---

## Item Manipulation

### Drag & Drop

| Action | Description |
|--------|-------------|
| **Drag item** | Move item between slots or inventories |
| **Drop outside inventory** | Drop item on the ground (creates a Box) |

### Stacking & Splitting

While dragging an item stack:

| Action | Description |
|--------|-------------|
| **Right-click** | Drop **1** item from the stack |
| **Shift + Right-click** | Drop **half** the stack |
| **Drop on same item type** | Stack items together (if space allows) |

### Quick Transfer

| Action | Description |
|--------|-------------|
| **Shift + Left-click** | Quickly move item to another open inventory |

This works between your backpack and any open container. Items will attempt to stack with existing items of the same type first.

---

## Crafting

Open your backpack (**Tab**) to access the crafting interface on the left side.

### Crafting Actions

| Mode | Available Buttons |
|------|-------------------|
| **Default** | **+1** and **+10** |
| **Hold Shift** | **+50** and **+max** (based on available resources) |

Click on an ingredient to expand and see sub-recipes (recursive crafting).

### Crafting Requirements

- Solid ingredients must be in your backpack (or any open inventory)
- Fluids (H₂O, H₂, O₂) must be provided via **canisters** in the dedicated fluid slots at the bottom of the crafting window
- You can craft using resources from any open inventory - ingredients are automatically moved to your backpack

### Item Processing Area

The Item Processing Area (1 slot) is used for **processing items**, not crafting. For example:
- Crushing rocks into ores (early game in Adventure mode)

### Fluid Slots

At the bottom of the crafting window, you can see your fluid levels: **Water**, **Hydrogen**, and **Oxygen**.

- Your avatar has an **integrated water tank** that fills automatically when your feet touch water (ocean, lake)
- **Electrolysis** toggle converts water into hydrogen and oxygen for crafting recipes that require them

---

## External Inventories (Containers)

Interact with a [Container](components/storage/Container.md) using **F** to open its inventory.

### Using Tools from Containers

Some tools can operate directly from inside a container:

1. Place the tool in the container
2. **Double-click** the tool to activate it
3. The tool will use resources from the container instead of your backpack

> **Tip:** If you have an item from a container selected in your hand, pressing **Tab** will automatically open both your backpack and the source container.

This is especially useful when resources are too heavy to carry on your avatar:
- **Constructor Tool** - build using components stored in the container
- **Destructor Tool** - destroyed components go into the container
- **Spool Tool** - use cable spools from the container
- **Blueprint Tool** - spawn vehicles in Adventure mode with all required components in the container
- **Rock Rake Tool** - collected rocks go into the container

### Distance Limits

Open inventories have a maximum interaction distance:
- **Containers**: 100 meters
- **Dropped Boxes**: 10 meters

When you move beyond the limit, items become **grayed out** and cannot be interacted with. The inventory window will automatically close if you move too far away.

### Crafting from Open Inventories

When a container is open, the avatar's crafting system can pull ingredients from it automatically. This allows you to craft items using resources stored in containers without manually transferring them to your backpack.

---

## Placing Components on the Ground

Some components can be placed directly on the terrain without needing an existing build structure.

1. Select the component in your hand
2. Aim at the ground (within **10 meters**)
3. **Left-click** to place it

| Action | Description |
|--------|-------------|
| **Left-click** | Place the component |
| **Hold Shift + Mouse wheel** | Rotate the component |

The component will automatically align to the local gravity direction. A new build is created to hold the component.

---

## Window Management

### Pinning Inventory Windows

Many storage windows can be **pinned** to keep them open:
- Containers
- Computer (HDD Bay, IDE)
- Fission Reactor fuel slots
- Trash Cans
- Dropped item Boxes

| Action | Description |
|--------|-------------|
| **Click pin icon** (📌) | Pin the window |
| **Click X** | Close and unpin the window |
| **ESC** | Hide all pinned windows |
| **Tab** | Bring back hidden pinned windows |

### GetInfo Windows

Press **V** while aiming at a component to open its information window. This system works separately from inventory pinning:

| Action | Description |
|--------|-------------|
| **Click pin icon** (📌) | Keep the window open |
| **Click X** | Close and unpin the window |

- Multiple GetInfo windows can be pinned simultaneously
- Pinned windows show **real-time updated values**
- **ESC does not affect** GetInfo windows

This is useful for monitoring multiple components at once (e.g., battery levels, tank pressures, sensor readings).