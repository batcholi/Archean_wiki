<p align="center">
    <img src="BlueprintTool.png" />
</p>

|Item|`BlueprintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
El Blueprint Tool te permite guardar una copia de una construccion. Los blueprints se guardan en la carpeta `(Client Settings)/blueprints` en formato `.json`, uno por blueprint con su nombre respectivo.

Con este sistema, puedes transferir tus construcciones a otros mundos o servidores, compartirlas con amigos o simplemente duplicar una construccion.

# Usage

## Scanning a Build
1. **Clic izquierdo** para entrar en el modo de escaneo (alcance: 100 metros)
2. Apunta a la construccion que deseas guardar
3. **Manten clic izquierdo** durante un segundo para escanear y guardar el blueprint
4. Introduce un nombre en el cuadro de dialogo emergente

### Updating an Existing Blueprint
Para actualizar un blueprint existente, simplemente introduce exactamente el mismo nombre que un blueprint existente. El boton **Create** cambiara a **Update**, permitiendote sobrescribir la version anterior conservando el ID de Steam Workshop si fue publicado.

## Spawning a Blueprint
1. **Clic derecho** para abrir la interfaz de blueprints
2. Usa la **barra de busqueda** para filtrar blueprints por nombre
3. Selecciona un blueprint de la pestana **Local** o **Steam Workshop**
4. Haz clic en **Spawn** para entrar en el modo de colocacion

### Placement Controls

#### Free Placement (new build)
| Accion | Control |
|--------|---------|
| Confirmar aparicion | **Manten clic izquierdo** (2 segundos) |
| Rotar | **Rueda del raton** |
| Ajustar al suelo y establecer como estatico | **Manten Shift** |
| Cancelar | **Clic derecho** |

#### On an Existing Build
Cuando apuntas a una construccion existente, **presiona rapidamente clic izquierdo** para adjuntar el blueprint y entrar en el **modo Gizmo**:

| Accion | Control |
|--------|---------|
| Trasladar / Rotar | **Controles del Gizmo** (arrastrar) |
| Alternar vista del raton | **Clic derecho** |
| Confirmar aparicion | **Manten clic izquierdo** lejos del gizmo (2 segundos), o boton **Spawn** |
| Cancelar | **Clic derecho** (cuando no estas en vista del raton) |

### Spawning in Space
Cuando estes en el espacio cerca de una construccion existente, puedes generar blueprints de la misma manera que [crear una nueva construccion](ConstructorTool.md#creating-a-build-in-space).

## Steam Workshop
- Haz clic en **Publish** junto a un blueprint local para subirlo a Steam Workshop
- Una herramienta de captura de pantalla integrada esta disponible al publicar

# Notes
- En modo Adventure, los objetos requeridos se muestran con su estado (verde = disponible, rojo = faltante, naranja = mod no activo)
- Si se ha anadido un [OwnerPad](../components/miscellaneous/OwnerPad.md), debes tener el permiso "Build" para guardar un blueprint
