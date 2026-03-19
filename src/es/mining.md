# Mining

La mineria en Archean es el proceso de localizar, recolectar y procesar recursos minerales encontrados en el terreno de los cuerpos celestes. Es la base del sistema de fabricacion - sin minerales, no puedes construir nada.

El proceso completo de mineria es: **Escanear -> Recolectar -> Triturar -> Fabricar**.

## Localizar minerales

Antes de recolectar rocas, primero deberias identificar donde se concentran los minerales valiosos.

El [Ore Scanner Tool](tools/OreScannerTool.md) es un dispositivo portatil que muestra un grafico en tiempo real de la densidad de minerales en la direccion a la que miras. Solo equipalo y mira a tu alrededor - es la forma mas rapida de explorar una ubicacion.

Para el escaneo automatizado, el componente [Ore Scanner](components/mining/OreScanner.md) puede controlarse a traves de [XenonCode](xenoncode/documentation.md) y devuelve datos de composicion como [objetos de texto clave-valor](xenoncode/documentation.md#key-value-objects).

---

## Recolectar rocas

Las rocas son pequenos objetos dispersos en la superficie de los cuerpos celestes. Varian en tamano, y **una roca mas grande da mas material** al recogerla.

### A mano
Sin ninguna herramienta equipada, presiona `LMB` para recoger una roca. Debes hacer clic de nuevo para cada roca.

### Rock Rake Tool
El [Rock Rake](tools/RockRakeTool.md) es la forma recomendada de recolectar rocas manualmente:

- **Mantener `LMB`**: Recoge rocas continuamente mientras las miras
- **`RMB`**: Inspeccionar una roca antes de recogerla - muestra su composicion y rendimiento

---

## Mineria automatizada -- Mining Drill

El [Mining Drill](components/mining/MiningDrill.md) extrae rocas del terreno automaticamente. Debe instalarse en una construccion anclada usando un [Ground Anchor](components/miscellaneous/GroundAnchor.md).

La eficiencia del Mining Drill disminuye con la profundidad - deberias **reubicarlo** periodicamente cuando la produccion baje. Consulta la pagina del [Mining Drill](components/mining/MiningDrill.md) para especificaciones detalladas.

---

## Composicion de las rocas

Cada roca tiene una **composicion** - un conjunto de elementos con sus respectivas densidades, determinadas por su ubicacion en el terreno. La composicion se representa como [objetos de texto clave-valor](xenoncode/documentation.md#key-value-objects):

`.Al{0.1500}.Fe{0.2000}.Si{0.6500}` - lo que significa 15% Aluminio, 20% Hierro, 65% Silicio.

Las rocas con **composicion identica** se apilan juntas en tu inventario. Composiciones diferentes ocupan ranuras separadas.

### Elementos

|Simbolo|Elemento|Simbolo|Elemento|
|---|---|---|---|
|Al|Aluminio|Ni|Niquel|
|C|Carbono|Si|Silicio|
|Cr|Cromo|Ag|Plata|
|Cu|Cobre|Sn|Estano|
|Au|Oro|Ti|Titanio|
|F|Fluorita|W|Tungsteno|
|Fe|Hierro|U|Uranio|
|Pb|Plomo|Ch|???|

---

## Procesamiento de rocas

Para convertir rocas en minerales utilizables, necesitas triturarlas. Hay dos formas de hacerlo:

### Procesamiento del avatar (inicio del juego)
Tu mochila tiene un **Item Processing Area** integrado (1 ranura) accesible desde la [interfaz de fabricacion](interfaces.md#item-processing-area). Coloca rocas en esta ranura y haz clic en **Crush** para convertirlas en minerales directamente desde tu inventario. Es lento pero no requiere infraestructura - es como obtienes tus primeros minerales en modo Adventure.

### Componente Crusher (automatizado)
El [Crusher](components/mining/Crusher.md) es un componente colocable para el procesamiento a gran escala. Convierte rocas en minerales proporcionalmente a su composicion. Por ejemplo, triturar 10 Kg de roca con 20% de Hierro produce 2000 g de mineral de Hierro.

Cuando las concentraciones son muy bajas, el Crusher acumula cantidades fraccionarias a traves de multiples rocas hasta que puede producir al menos 1 unidad - nada se pierde.

> El Crusher **no extrae** de su entrada - las rocas deben ser [enviadas](pushpull.md) hacia el. Consulta la pagina de [Push & Pull](pushpull.md) para mas detalles.

---

## Distribucion de recursos

La distribucion de minerales varia segun el cuerpo celeste, la altitud y la proximidad a caracteristicas volcanicas. Consulta [Earth](celestialbodies/earth.md) y [Moon](celestialbodies/moon.md) para mas detalles.

|Rareza|Elementos|Donde buscar|
|---|---|---|
|Comun|Si, Fe, C, Cu, Sn|En todas partes / sobre el nivel del mar|
|Poco comun|Al, Ag|Gran altitud (montanas)|
|Raro|Ni, Cr, Ti, W|Gran altitud / muy gran altitud|
|Muy raro|Au, Pb, U, F|Mar profundo / cerca de volcanes|

- Los **volcanes** aumentan el Hierro, el Plomo, y son la **unica fuente de Fluorita**

---

## Consejos practicos

- **Explora primero**: Usa el Ore Scanner Tool para encontrar un lugar rico en los minerales que necesitas antes de colocar infraestructura
- **Configuraciones tipicas**: Mining Drill -> Crusher -> Container, o Mining Drill -> Container -> [Conveyor](components/items/ItemConveyor.md) -> Crusher
- **Dimensionamiento**: 1 Crusher maneja hasta 4 Mining Drills a High Voltage
- **Reubica los Mining Drills** cuando la eficiencia baje significativamente
- **Rock Rake para inicio del juego**: Usalo para recolectar tu primer Hierro y fabricar tu camino hacia un Mining Drill
- **Verifica la composicion**: Haz clic derecho en las rocas con el Rock Rake para comprobar lo que contienen antes de recogerlas
