<p align="center">
    <img src="ConstructorTool.png" />
</p>

|Item|`ConstructorTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
El Constructor Tool es la herramienta principal utilizada para construir en Archean. Te permite crear nuevas construcciones, agregar o eliminar marcos, y colocar bloques de varias formas.

# Build Modes
Presiona **C** para abrir el menu radial y seleccionar un modo de construccion:

|Modo|Descripcion|
|---|---|
|**Frame**|Crear y modificar el marco estructural (vigas de acero)|
|**Cube**|Colocar bloques cubicos|
|**Slope**|Colocar bloques en rampa|
|**Corner**|Colocar bloques de esquina|
|**Pyramid**|Colocar bloques piramidales|
|**InvCorner**|Colocar bloques de esquina invertida|
|**Triangle**|Colocar paneles de malla triangular|
|**Wall / Platform**|Colocar paneles planos de pared o suelo|
|**Strut**|Colocar vigas estructurales de acero delgadas|

# Materials
Al colocar bloques (no marcos), usa la **rueda del raton** mientras mantienes **C** para seleccionar el material.

## Material Masses

| Material | Masa por unidad |
|----------|---------------|
| Composite | 0.25 kg |
| Aluminium | 0.5 kg |
| Steel | 1 kg |
| Glass | 1 kg |
| Concrete | 10 kg |
| Lead | 150 kg |

> **Nota:** Las vigas de acero (marcos) pesan **10 kg** cada una.

### Como se calcula la masa de los bloques
La unidad base es un cubo de **25x25x25 cm**. La masa total de un bloque depende de:

1. **Tamano**: Los bloques mas grandes contienen mas unidades (ej., un bloque de 50x50x50 cm = 8 unidades)
2. **Forma**: Las formas no cubicas (rampas, esquinas, piramides, esquinas invertidas) pesan un **50%** de su equivalente cubico ya que ocupan menos volumen
3. **Material**: Cada material tiene una masa por unidad diferente (ver tabla anterior)

**Formula:** `Mass = units x shape_factor x material_mass`
- `units` = (size_x) x (size_y) x (size_z) en incrementos de 25cm
- `shape_factor` = 1.0 para cubos y paredes, 0.5 para rampas, esquinas, piramides y esquinas invertidas. Los triangulos tienen un coste variable basado en su area.

### Por que las masas no coinciden con la realidad
Las masas estan intencionalmente simplificadas:
- Los valores estan **redondeados** para facilitar la lectura
- Los bloques no son 100% solidos — representan paneles estructurales con armazon interno, no trozos macizos de material

# Removing Elements
Para eliminar cualquier elemento (bloque, triangulo, viga o pared), apunta hacia el mientras mantienes **clic derecho**, luego presiona rapidamente **clic izquierdo**. Esto funciona desde cualquier modo de construccion.

> La eliminacion de marcos tiene sus propios controles (ver Frame Mode a continuacion).

# Usage

## Frame Mode

### Creating a New Build
Manten **clic izquierdo** durante un segundo y luego suelta. Se creara una nueva construccion con un unico marco metalico de 3x3x3.

> **Consejo:** Manten **Shift** mientras creas para alinear el nuevo marco con el suelo y establecerlo como estatico (anclado).

### Creating a Build in Space
Cuando estes en el espacio cerca de una construccion existente, puedes crear una nueva construccion que aparecera **5 metros frente a ti**. La nueva construccion se crea como hija de la construccion raiz mas cercana. Esto tambien funciona con el [Blueprint Tool](BlueprintTool.md).

### Adding Frames
Apunta a una cara de un marco existente y presiona rapidamente **clic izquierdo**.

### Removing Frames
Apunta a una cara de un marco existente mientras mantienes **clic derecho**, luego presiona rapidamente **clic izquierdo**.

### Adding Individual Beams
Apunta a un marco existente donde iria la viga mientras mantienes **Shift**, luego presiona rapidamente **clic izquierdo**.

### Removing Individual Beams
Apunta a una viga de un marco existente mientras mantienes **Shift** y **clic derecho**, luego presiona rapidamente **clic izquierdo**.

## Block Modes (Cube, Slope, Corner, Pyramid, InvCorner)

### Adding Blocks
1. Apunta a un bloque o viga
2. Presiona **clic izquierdo** para colocar el bloque
3. Usa la **rueda del raton** para rotarlo (excepto para cubos)
4. Manten **clic izquierdo** y arrastra para redimensionar
5. Usa la **rueda del raton** mientras mantienes **clic izquierdo** para redimensionar en la otra dimension

> **Consejo Pro:** El plano de arrastre/redimensionado esta determinado por la normal de la cara del bloque al que apuntas. La rueda del raton escala hacia esa normal, mientras que arrastrar escala a traves de los otros dos ejes.

> **Consejo:** Manten **Shift** antes de presionar **clic izquierdo** para copiar el bloque al que apuntas o agregar logicamente el siguiente bloque.

## Triangle Mode

El modo Triangle te permite colocar paneles de malla triangular que se ajustan a la cuadricula de construccion. Estos paneles son utiles para crear formas curvas, superficies aerodinamicas o cualquier geometria no rectangular.

### Placing Triangles
1. Haz clic en **3 puntos de la cuadricula** (vertices de bloques existentes, triangulos o vigas) para crear un triangulo
2. Alternativamente, haz clic en un **borde existente** para comenzar con 2 vertices preseleccionados, y solo necesitaras un clic mas
3. Usa la **rueda del raton** durante la colocacion para **invertir la direccion de la normal** (controla que lado del triangulo mira hacia afuera)
4. Manten **Shift** en una cara de bloque alineada con los ejes para un ajuste de **precision de sub-cuadricula** a la cuadricula completa de 25 cm
5. Presiona **clic derecho** para deshacer el ultimo vertice colocado

> Los triangulos se ajustan a los vertices de bloques, otros triangulos y extremos de vigas. El alcance maximo es de 4 m por eje.

### Materials
Manten **C** y usa la **rueda del raton** para seleccionar el material. Los triangulos soportan los mismos materiales que los bloques.

### Smooth Shading
Presiona **X** mientras apuntas a un triangulo para alternar el sombreado suave en todos los triangulos conectados del mismo grupo. El sombreado suave se aplica usando un algoritmo de relleno por inundacion: se propaga a traves de **bordes compartidos** a todos los triangulos adyacentes que forman una superficie continua.

Para que el sombreado suave funcione correctamente:
- Los vertices de los triangulos deben **alinearse exactamente** en la cuadricula — los triangulos vecinos necesitan compartir las mismas posiciones de vertices
- Los grupos separados de triangulos (no conectados por bordes compartidos) se tratan como **grupos de suavizado independientes** — alternar el suavizado en un grupo no afecta a otro

> El sombreado suave tambien respeta el modo de simetria.

## Strut Mode

Los Struts son vigas estructurales de acero delgadas que conectan dos puntos de la cuadricula. Son utiles para crear cerchas, antenas, andamios o elementos estructurales ligeros.

### Placing Struts
1. Haz clic en **2 puntos de la cuadricula** para crear un strut entre ellos
2. Los struts se ajustan a los vertices de bloques, triangulos y otros struts
3. Presiona **clic derecho** para deshacer el primer vertice colocado

> El alcance maximo es de 4 m por eje. En modo aventura, los struts requieren objetos **Steel Rod**.

### Subdivision Snapping
Manten **Shift** mientras apuntas a un strut existente para ajustarte a los puntos de subdivision a lo largo de el. Usa la **rueda del raton** mientras mantienes **Shift** para cambiar el paso de subdivision:

|Tamanos de paso|
|---|
|1 m|
|50 cm|
|25 cm (por defecto)|
|10 cm|
|5 cm|

Esto permite colocar nuevos struts o triangulos a intervalos precisos a lo largo de un strut existente.

## Wall / Platform Mode

### Adding Walls
Apunta a una cara de marco y presiona rapidamente **clic izquierdo**.

> **Consejo:** Manten **Shift** para usar la otra cara logica del marco al que apuntas.

> **Consejo:** Manten **Shift** mientras colocas para ajustar al suelo y crear una plataforma estatica directamente frente a ti.

# Symmetry Mode
El Constructor Tool soporta construccion simetrica, permitiendote construir estructuras reflejadas automaticamente.

La simetria se puede activar a traves del menu **GetInfo** de la construccion (presiona **V** en cualquier marco). Cuando esta activada:
- Todas las operaciones de marcos y bloques se reflejan a traves del eje de simetria
- La posicion del eje de simetria se puede ajustar con **precision de 0.125m**, permitiendo la colocacion del espejo en el centro de los bloques

# Adventure Mode
En modo aventura, necesitas los materiales requeridos en tu inventario:
- **Steel Beams** para marcos
- **Block items** (Composite, Concrete, Steel, etc.) para bloques

La herramienta mostrara cuantos materiales se necesitan para cada operacion.

---

> **Consejo:** Activa las descripciones emergentes a traves del menu **F1** para obtener ayuda contextual mientras usas el Constructor Tool.
