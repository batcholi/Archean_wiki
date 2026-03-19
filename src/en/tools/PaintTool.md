<p align="center">
    <img src="PaintTool.png" />
</p>

|Item|`PaintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
The Paint Tool allows you to paint blocks, cables, labels and components with custom colors and surface finishes.

# Usage

## Controls
| Action | Control |
|--------|---------|
| Paint face | **Left-click** |
| Paint whole block (all faces) | **Shift** + **Left-click** |
| Pick color from block | **Right-click** |
| Replace color across entire build | **X** + **Left-click** |

## Color Palettes
The Paint Tool uses a palette system to save and organize your colors.

### Palette Management
- **Create**: Create a new empty palette
- **Copy**: Duplicate the current palette with a new name
- **Delete**: Remove the current palette

### Adding Colors
Click the **+** button in the palette to add a new color slot.

## Color Picker
The bottom section of the interface contains:

1. **RGB Color Picker**: Select any color using the hue bar and saturation/value square
2. **Gamma Preview**: Shows how the color will appear in-game with your gamma settings

## Surface Materials
Each color can have a different surface finish:

| Material | Appearance |
|----------|------------|
| **Matte** | Rough, non-reflective surface |
| **Glossy** | Smooth, shiny surface |
| **Metal** | Rough metallic surface |
| **Chrome** | Mirror-like metallic surface |
| **Transparent** | See-through (for glass effects) |

## Replace Color
Hold **X** and **Left-click** on any painted surface to replace that color across the entire build. This works on:
- **Blocks**: Replaces all blocks sharing the same color index
- **Pipes/Cables**: Replaces all pipes matching the same color
- **Components**: Replaces all components of the same type and material

## Symmetry Painting
When the build has [symmetry mode](ConstructorTool.md) enabled, the Paint Tool automatically paints the mirrored block as well. This applies to:
- Single face painting
- Whole block painting (**Shift**)

If the block is on the symmetry plane, the mirrored face on the same block is painted instead.

> **Note**: Replace color (**X**) always affects the entire build regardless of symmetry, so symmetry is not applied in that mode.

# Notes
- Painting a block applies color **per face** (use Shift for all faces)
- Cables have additional customization options, see [Spool](../consumables/Spool.md#painting-cables)
