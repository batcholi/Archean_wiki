<p align="center">
    <img src="ConstructorTool.png" />
</p>

|Item|`ConstructorTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
The Constructor Tool is the primary tool used for building in Archean. It enables you to create new builds, add or remove frames, and place blocks of various shapes.

# Build Modes
Press **C** to open the radial menu and select a build mode:

|Mode|Description|
|---|---|
|**Frame**|Create and modify the structural frame (steel beams)|
|**Cube**|Place cubic blocks|
|**Slope**|Place slope/ramp blocks|
|**Corner**|Place corner blocks|
|**Pyramid**|Place pyramid blocks|
|**InvCorner**|Place inverted corner blocks|
|**Wall / Platform**|Place flat wall or floor panels|

# Materials
When placing blocks (not frames), use the **scroll wheel** while holding **C** to select the material.

## Material Masses

| Material | Mass per unit |
|----------|---------------|
| Composite | 0.25 kg |
| Aluminium | 0.5 kg |
| Steel | 1 kg |
| Glass | 1 kg |
| Concrete | 10 kg |
| Lead | 150 kg |

> **Note:** Steel Beams (frames) weigh **10 kg** each.

### How Block Mass is Calculated
The base unit is a **25×25×25 cm** cube. A block's total mass depends on:

1. **Size**: Larger blocks contain more units (e.g., a 50×50×50 cm block = 8 units)
2. **Shape**: Non-cubic shapes (slopes, corners, pyramids, inverted corners) weigh **50%** of their cubic equivalent since they occupy less volume
3. **Material**: Each material has a different mass per unit (see table above)

**Formula:** `Mass = units × shape_factor × material_mass`
- `units` = (size_x) × (size_y) × (size_z) in 25cm increments
- `shape_factor` = 1.0 for cubes, 0.5 for other shapes

### Why Masses Don't Match Reality
The masses are intentionally simplified:
- Values are **rounded** for readability
- Blocks are not 100% solid — they represent structural panels with internal framework, not solid chunks of material

# Usage

## Frame Mode

### Creating a New Build
Hold **left-click** for one second then release. A new build will be created with a single 3x3x3 metallic frame.

> **Tip:** Hold **Shift** while creating to align the new frame with the ground and set it as static (anchored).

### Creating a Build in Space
When in space near an existing build, you can create a new build that will spawn **5 meters in front of you**. The new build is created as a child of the nearest root build. This also works with the [Blueprint Tool](BlueprintTool.md).

### Adding Frames
Aim at an existing frame face and quick press **left-click**.

### Removing Frames
Aim at an existing frame face while holding **right-click**, then quick press **left-click**.

### Adding Individual Beams
Aim at an existing frame where the beam would be while holding **Shift**, then quick press **left-click**.

### Removing Individual Beams
Aim at an existing frame beam while holding **Shift** and **right-click**, then quick press **left-click**.

## Block Modes (Cube, Slope, Corner, Pyramid, InvCorner)

### Adding Blocks
1. Aim at a block or beam
2. Press **left-click** to place the block
3. Use the **scroll wheel** to rotate it (except for cubes)
4. Hold **left-click** and drag to resize
5. Use the **scroll wheel** while holding **left-click** to resize in the other dimension

> **Pro Tip:** The drag/resize plane is determined by the block face normal you're aiming at. The scroll wheel scales towards that normal, while dragging scales across the other two axes.

> **Tip:** Hold **Shift** before pressing **left-click** to copy the block you're aiming at or logically add the next block.

### Removing Blocks
Aim at any block while holding **right-click**, then quick press **left-click**.

## Wall / Platform Mode

### Adding Walls
Aim at a frame face and quick press **left-click**.

> **Tip:** Hold **Shift** to use the other logical frame face you're aiming at.

> **Tip:** Hold **Shift** while placing to snap to the ground and create a static platform directly in front of you.

### Removing Walls
Aim at any wall while holding **right-click**, then quick press **left-click**.

# Symmetry Mode
The Constructor Tool supports symmetry building, allowing you to build mirrored structures automatically. 

Symmetry can be enabled via the build's **GetInfo** menu (press **V** on any frame). When enabled:
- All frame and block operations are mirrored across the symmetry axis
- The symmetry axis position can be adjusted with **0.125m precision**, allowing mirror placement at the center of blocks

# Adventure Mode
In adventure mode, you need the required materials in your inventory:
- **Steel Beams** for frames
- **Block items** (Composite, Concrete, Steel, etc.) for blocks

The tool will show how many materials are required for each operation.

---

> **Tip:** Enable tooltips through the **F1** menu for context-sensitive help while using the Constructor Tool.
