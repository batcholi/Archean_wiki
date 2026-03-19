# Interfaces & Inventory Management

Esta pagina cubre todos los sistemas de interfaz de usuario en Archean, incluyendo la gestion del inventario, los atajos y la manipulacion de ventanas.

---

## Inventarios del avatar

El jugador tiene acceso a dos inventarios personales:

### Belt

El **belt** es la barra de herramientas de acceso rapido en la parte inferior de la pantalla.

- Contiene **9 ranuras** para herramientas y objetos
- Selecciona objetos usando las teclas **1** a **9**
- Las rocas recolectadas van primero al belt, luego desbordan a la mochila
- El objeto activo muestra un contorno verde

### Backpack

El **backpack** es tu almacenamiento principal de inventario.

- Abrir/cerrar con **Tab**
- En modo Adventure: **48 ranuras**
- En modo Creative: ranuras ilimitadas con objetos prellenados
- Tiene una **barra de busqueda** para filtrar objetos por nombre
- La masa de los objetos afecta tu velocidad de movimiento en modo Adventure

---

## Sistema de mano

La **mano** es tu objeto seleccionado/activo actualmente.

| Accion | Descripcion |
|--------|-------------|
| **Teclas numericas (1-9)** | Seleccionar ranura del belt como activa |
| **Doble clic** en cualquier objeto | Seleccionarlo como activo (funciona desde cualquier inventario abierto) |

Cuando una herramienta esta en tu mano, puedes usarla con:
- **Clic izquierdo** (funcion principal)
- **Clic derecho** (funcion secundaria)
- **Mantener C** para configurar la herramienta
- **Mantener X** para modo especial

---

## Interaccion con componentes

Presiona **F** para interactuar con el componente o pantalla al que apuntas (abrir inventarios, presionar botones, alternar interruptores, ajustar palancas, hacer clic en pantallas...).

Ademas, puedes hacer **clic izquierdo** directamente en los componentes:

| Condicion | Comportamiento |
|-----------|----------------|
| **Raton libre** (sin control de camara) | Clic en cualquier componente visible para interactuar |
| **Control de camara sin objeto activo** | Clic para interactuar con el componente en tu mira |
| **Control de camara con objeto activo** | El clic izquierdo es usado por la herramienta - la interaccion con componentes esta desactivada |

> **Nota:** La interaccion con clic izquierdo te permite presionar botones o alternar interruptores sin necesidad de guardar tu herramienta - simplemente libera tu raton o vacia tu mano.

---

## Manipulacion de objetos

### Arrastrar y soltar

| Accion | Descripcion |
|--------|-------------|
| **Arrastrar objeto** | Mover objeto entre ranuras o inventarios |
| **Soltar fuera del inventario** | Soltar objeto en el suelo (crea una caja) |

### Apilar y dividir

Mientras arrastras una pila de objetos:

| Accion | Descripcion |
|--------|-------------|
| **Clic derecho** | Soltar **1** objeto de la pila |
| **Shift + Clic derecho** | Soltar la **mitad** de la pila |
| **Soltar sobre el mismo tipo de objeto** | Apilar objetos juntos (si hay espacio) |

### Transferencia rapida

| Accion | Descripcion |
|--------|-------------|
| **Shift + Clic izquierdo** | Mover rapidamente un objeto a otro inventario abierto |

Esto funciona entre tu mochila y cualquier contenedor abierto. Los objetos intentaran apilarse con objetos existentes del mismo tipo primero.

---

## Fabricacion

Abre tu mochila (**Tab**) para acceder a la interfaz de fabricacion en el lado izquierdo.

### Acciones de fabricacion

| Modo | Botones disponibles |
|------|---------------------|
| **Por defecto** | **+1** y **+10** |
| **Mantener Shift** | **+50** y **+max** (basado en los recursos disponibles) |

Haz clic en un ingrediente para expandir y ver sub-recetas (fabricacion recursiva).

### Requisitos de fabricacion

- Los ingredientes solidos deben estar en tu mochila (o en cualquier inventario abierto)
- Los fluidos (H2O, H2, O2) deben proporcionarse a traves de **botes** en las ranuras de fluidos dedicadas en la parte inferior de la ventana de fabricacion
- Puedes fabricar usando recursos de cualquier inventario abierto - los ingredientes se mueven automaticamente a tu mochila

### Item Processing Area

El Item Processing Area (1 ranura) se usa para **procesar objetos**, no para fabricar. Por ejemplo:
- Triturar rocas en minerales (inicio del juego en modo Adventure)

### Ranuras de fluidos

En la parte inferior de la ventana de fabricacion, puedes ver tus niveles de fluidos: **Water**, **Hydrogen** y **Oxygen**.

- Tu avatar tiene un **tanque de agua integrado** que se llena automaticamente cuando tus pies tocan el agua (oceano, lago)
- El interruptor de **electrolisis** convierte el agua en hidrogeno y oxigeno para las recetas de fabricacion que los requieran

---

## Inventarios externos (Containers)

Interactua con un [Container](components/storage/Container.md) usando **F** para abrir su inventario.

### Uso de herramientas desde Containers

Algunas herramientas pueden operar directamente desde dentro de un Container:

1. Coloca la herramienta en el Container
2. **Doble clic** en la herramienta para activarla
3. La herramienta usara recursos del Container en lugar de tu mochila

> **Consejo:** Si tienes un objeto de un Container seleccionado en tu mano, presionar **Tab** abrira automaticamente tanto tu mochila como el Container de origen.

Esto es especialmente util cuando los recursos son demasiado pesados para llevar en tu avatar:
- **Constructor Tool** - construir usando componentes almacenados en el Container
- **Destructor Tool** - los componentes destruidos van al Container
- **Spool Tool** - usar carretes de cable del Container
- **Blueprint Tool** - generar vehiculos en modo Adventure con todos los componentes requeridos en el Container
- **Rock Rake Tool** - las rocas recolectadas van al Container

### Limites de distancia

Los inventarios abiertos tienen una distancia maxima de interaccion:
- **Containers**: 100 metros
- **Cajas soltadas**: 10 metros

Cuando te alejas mas alla del limite, los objetos se vuelven **grises** y no se puede interactuar con ellos. La ventana del inventario se cerrara automaticamente si te alejas demasiado.

### Fabricacion desde inventarios abiertos

Cuando un Container esta abierto, el sistema de fabricacion del avatar puede tomar ingredientes de el automaticamente. Esto te permite fabricar objetos usando recursos almacenados en Containers sin transferirlos manualmente a tu mochila.

---

## Colocar componentes en el suelo

Algunos componentes pueden colocarse directamente en el terreno sin necesidad de una estructura de construccion existente.

1. Selecciona el componente en tu mano
2. Apunta al suelo (dentro de **10 metros**)
3. **Clic izquierdo** para colocarlo

| Accion | Descripcion |
|--------|-------------|
| **Clic izquierdo** | Colocar el componente |
| **Mantener Shift + Rueda del raton** | Rotar el componente |

El componente se alineara automaticamente con la direccion de la gravedad local. Se crea una nueva construccion para contener el componente.

---

## Gestion de ventanas

### Fijar ventanas de inventario

Muchas ventanas de almacenamiento pueden **fijarse** para mantenerlas abiertas:
- Containers
- Computer (HDD Bay, IDE)
- Ranuras de combustible del Fission Reactor
- TrashCan
- Cajas de objetos soltados

| Accion | Descripcion |
|--------|-------------|
| **Clic en icono de pin** | Fijar la ventana |
| **Clic en X** | Cerrar y desfijar la ventana |
| **ESC** | Ocultar todas las ventanas fijadas |
| **Tab** | Traer de vuelta las ventanas fijadas ocultas |

### Ventanas GetInfo

Presiona **V** mientras apuntas a un componente para abrir su ventana de informacion. Este sistema funciona por separado de la fijacion de inventario:

| Accion | Descripcion |
|--------|-------------|
| **Clic en icono de pin** | Mantener la ventana abierta |
| **Clic en X** | Cerrar y desfijar la ventana |

- Se pueden fijar multiples ventanas GetInfo simultaneamente
- Las ventanas fijadas muestran **valores actualizados en tiempo real**
- **ESC no afecta** las ventanas GetInfo

Esto es util para monitorear multiples componentes a la vez (por ejemplo, niveles de bateria, presiones de tanques, lecturas de sensores).
