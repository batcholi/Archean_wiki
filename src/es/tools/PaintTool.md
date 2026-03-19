<p align="center">
    <img src="PaintTool.png" />
</p>

|Item|`PaintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
El Paint Tool te permite pintar bloques, cables, etiquetas y componentes con colores personalizados y acabados de superficie.

# Usage

## Controls
| Accion | Control |
|--------|---------|
| Pintar cara | **Clic izquierdo** |
| Pintar bloque completo (todas las caras) | **Shift** + **Clic izquierdo** |
| Seleccionar color de un bloque | **Clic derecho** |
| Reemplazar color en toda la construccion | **X** + **Clic izquierdo** |

## Color Palettes
El Paint Tool utiliza un sistema de paletas para guardar y organizar tus colores.

### Palette Management
- **Create**: Crear una nueva paleta vacia
- **Copy**: Duplicar la paleta actual con un nuevo nombre
- **Delete**: Eliminar la paleta actual

### Adding Colors
Haz clic en el boton **+** en la paleta para agregar un nuevo espacio de color.

## Color Picker
La seccion inferior de la interfaz contiene:

1. **RGB Color Picker**: Selecciona cualquier color usando la barra de tono y el cuadrado de saturacion/valor
2. **Gamma Preview**: Muestra como aparecera el color en el juego con tu configuracion de gamma

## Surface Materials
Cada color puede tener un acabado de superficie diferente:

| Material | Apariencia |
|----------|------------|
| **Matte** | Superficie rugosa, no reflectante |
| **Glossy** | Superficie lisa y brillante |
| **Metal** | Superficie metalica rugosa |
| **Chrome** | Superficie metalica tipo espejo |
| **Transparent** | Translucida (para efectos de vidrio) |

## Replace Color
Manten **X** y haz **clic izquierdo** en cualquier superficie pintada para reemplazar ese color en toda la construccion. Esto funciona en:
- **Bloques**: Reemplaza todos los bloques que comparten el mismo indice de color
- **Tuberias/Cables**: Reemplaza todas las tuberias que coinciden con el mismo color
- **Componentes**: Reemplaza todos los componentes del mismo tipo y material

## Symmetry Painting
Cuando la construccion tiene el [modo de simetria](ConstructorTool.md) activado, el Paint Tool automaticamente pinta tambien el bloque reflejado. Esto se aplica a:
- Pintura de cara individual
- Pintura de bloque completo (**Shift**)

Si el bloque esta en el plano de simetria, se pinta la cara reflejada en el mismo bloque.

> **Nota**: Reemplazar color (**X**) siempre afecta a toda la construccion independientemente de la simetria, por lo que la simetria no se aplica en ese modo.

# Notes
- Pintar un bloque aplica color **por cara** (usa Shift para todas las caras)
- Los cables tienen opciones de personalizacion adicionales, consulta [Spool](../consumables/Spool.md#painting-cables)
