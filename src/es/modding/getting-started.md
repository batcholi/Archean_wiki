# Getting Started

## Crear un Mod

Los mods se crean desde dentro del juego, en la pestana **Mods** bajo **Local Mods**.

### 1. Reservar un Vendor Name
Haz clic en **Reserve Vendor Name** para elegir un identificador de vendor unico. Este nombre debe tener entre **3 y 12 caracteres alfanumericos** y se convierte automaticamente a **MAYUSCULAS**. Este nombre es permanente y no puede cambiarse despues.

### 2. Crear un nuevo Mod
Una vez que tu vendor name este reservado, introduce un nombre de mod en el campo **Create New Mod**. El nombre del mod debe tener entre **3 y 12 caracteres alfanumericos** y se convierte automaticamente a **minusculas**. Haz clic en **Create New Mod** para generar la carpeta del mod.

## Estructura de carpetas del Mod

Despues de crear un mod, se genera la siguiente estructura de carpetas:

```
Archean/Archean-data/mods/
└── MYVENDOR_mymod/
    ├── config.yaml              <- Recetas de crafteo (opcional)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- Modelo 3D
    │   │   ├── main.xc (optional)                <- Script XenonCode
    │   │   └── MyComponent1.png                  <- Miniatura
    │   └── MyComponent2/
    │       ├── ...
```

Cada componente se encuentra en su propia subcarpeta dentro de `components/`. El nombre de la subcarpeta debe coincidir con el nombre del Entity Root definido en Blender.

> Un mod puede contener multiples componentes.

## Crear un componente

Un componente requiere como minimo un **modelo 3D** exportado desde Blender. El scripting con XenonCode y las recetas de crafteo son opcionales.

| Paso | Descripcion | Pagina |
|------|-------------|------|
| **Modelo 3D** (requerido) | Crear y exportar el modelo 3D usando el plugin de Archean para Blender | [Modelado 3D con Blender](blender.md) |
| **Script XenonCode** (opcional) | Agregar comportamiento con un script `main.xc`: pantallas, animaciones, fisicas, audio, puertos... | [Funcionalidad con XenonCode](xenoncode.md) |
| **Recetas de crafteo** (opcional) | Definir como se craftea, recicla o procesa tu componente a traves de `config.yaml` | [Recetas de crafteo](config.md) |

## Publishing

Una vez que tu mod este listo, puedes publicarlo en Steam Workshop directamente desde la pestana **Local Mods** haciendo clic en **Publish** en tu mod. El prefijo de vendor del mod debe coincidir con tu vendor name reservado.
