# Pressurization

La presurizacion en Archean te permite crear compartimentos sellados que pueden contener gases a diferentes presiones que el entorno circundante. Esto es esencial para construir cabinas de naves espaciales, submarinos, dirigibles o tanques de combustible personalizados.

## Como funciona

### El componente Volume

El componente [Volume](components/fluids/Volume.md) es el nucleo del sistema de presurizacion. Cuando se coloca dentro de una construccion y se escanea, utiliza un **algoritmo basado en voxeles** para detectar los limites del espacio cerrado.

1. **Escaneo**: Haz clic en el boton `Scan` del componente Volume para analizar el espacio circundante
2. **Propagacion**: El sistema se expande en todas las direcciones (X, Y, Z) hasta que encuentra bloques solidos/hermeticos
3. **Estado**:
   - **AIRTIGHT** (verde): El compartimento esta completamente sellado
   - **LEAK** (rojo): Hay una abertura hacia el exterior

> Cada componente Volume solo detecta el compartimento en el que esta colocado. Necesitas componentes Volume separados para cada compartimento aislado.

### Componentes hermeticos

No todos los componentes sellan un volumen. Solo los componentes marcados como **hermeticos** actuan como paredes para la presurizacion. Estos incluyen:

| Categoria | Componentes hermeticos |
|-----------|----------------------|
| **Joints** | Small Hinge, Small Pivot, Linear Track |
| **Bridges** | Data Bridge, Fluid Bridge, Item Bridge, Low/High Voltage Bridge |
| **Junctions** | Fluid Junction, Item Junction |
| **Storage** | Container, Small Container |
| **Docking** | Dockable Door |
| **Otros** | Passive Radiator, Aileron, Mini Router... |

Los bloques de construccion regulares (marcos, paneles) tambien son hermeticos por defecto.

## Articulaciones y presurizacion

Las articulaciones ([Small Hinge](components/joints/SmallHinge.md), [Small Pivot](components/joints/SmallPivot.md), [Linear Track](components/joints/LinearTrack.md)) tienen un comportamiento especial:

- **Cuando estan alineadas** (posicion neutral, valor = 0): La articulacion es hermetica y sella el volumen
- **Cuando se mueven** (cualquier otra posicion): La articulacion rompe el sello, causando una fuga

Esto te permite crear **puertas y escotillas funcionales**:

1. Construye un marco de puerta con bloques
2. Coloca un Small Hinge o Small Pivot
3. Construye el panel de la puerta en la parte movil de la articulacion
4. Cuando la articulacion vuelve a la posicion 0, el compartimento se sella

> **Importante**: Cuando una articulacion se mueve, el componente Volume re-escanea automaticamente para detectar si el sello se ha roto.

## Dockable Doors

El [Dockable Door](components/docking/DockableDoor.md) tiene gestion de presurizacion integrada:

- **Cerrada**: Actua como un sello hermetico
- **Abierta**: Permite la transferencia de gas entre:
  - El compartimento interior y el entorno exterior (si no esta acoplada)
  - Dos compartimentos acoplados (si esta acoplada con otro Dockable Door)

Cuando dos naves espaciales se acoplan y abren sus Dockable Doors, sus atmosferas se mezclan y ecualizan la presion.

## Fluid Port - La interfaz clave

El [Fluid Port](components/fluids/FluidPort.md) es el **componente esencial** para interactuar con volumenes presurizados. Es la unica forma de inyectar o extraer fluidos de un compartimento sellado de forma programatica.

### Como funciona

El Fluid Port actua como un **puente** entre el sistema de fluidos (bombas, tanques, tuberias) y un volumen presurizado:

- **La posicion importa**: La boquilla del puerto debe estar **fisicamente dentro** del volumen presurizado para interactuar con el
- **Deteccion automatica**: Detecta automaticamente si esta dentro de un volumen escaneado o en el entorno ambiental
- **Bidireccional**: Puede tanto empujar fluidos hacia como extraer fluidos de un volumen

### Limitaciones fisicas

El Fluid Port tiene limites fisicos codificados:

| Propiedad | Valor |
|-----------|-------|
| **Tasa de flujo maxima** | 1.0 m3/s |
| **Calculo de flujo** | Limitado por `min(masa_solicitada / densidad, 1.0 m3/s x deltaTiempo)` |

Esto significa:
- Los fluidos densos (liquidos) transfieren mas masa por segundo que los fluidos ligeros (gases)
- No puedes llenar o vaciar un volumen instantaneamente - toma tiempo
- Se pueden usar multiples Fluid Ports en paralelo para aumentar la tasa de flujo total

### Escenarios de uso

#### Llenar un tanque de combustible personalizado
1. Construye un compartimento sellado con un componente Volume
2. Coloca un Fluid Port con su boquilla **dentro** del volumen
3. Conecta el Fluid Port a un Fluid Pump y una fuente de combustible (tanque, electrolizador, etc.)
4. La bomba empuja combustible a traves del Fluid Port hacia tu tanque personalizado

#### Extraer de un Volume
1. Coloca un Fluid Port dentro del volumen presurizado
2. Conectalo a una bomba configurada para extraer
3. La composicion del fluido dentro del volumen se extrae proporcionalmente

#### Soporte vital de cabina
1. Crea una cabina sellada con un componente Volume
2. Coloca un Fluid Port dentro para inyectar atmosfera respirable
3. Conecta a una fuente de oxigeno y una bomba
4. Usa un segundo Fluid Port para ventilar CO2 o mantener la presion

### Deteccion del entorno

Cuando el Fluid Port **no** esta dentro de un volumen presurizado, interactua con el **entorno ambiental**:
- En la Tierra: Extrae aire atmosferico (mezcla de N2, O2)
- En el agua: Extrae H2O
- En el espacio: Nada que extraer (vacio)

Presiona `V` en un Fluid Port para ver:
- Densidad actual del entorno (kg/m3)
- Composicion del entorno (porcentaje por volumen)

## Fisica de gases

El sistema de presurizacion simula el comportamiento realista de los gases:

### Propiedades rastreadas
- **Presion** (Pascales/kPa)
- **Temperatura** (Kelvin)
- **Densidad** (kg/m3)
- **Composicion** (O2, N2, H2, CH4, H2O, etc.)
- **Nivel de liquido** (para almacenar liquidos)

### Transferencia de gas
- Los gases fluyen de alta presion a baja presion
- La tasa de transferencia depende de la diferencia de presion y el tamano de la abertura
- La temperatura se promedia cuando los gases se mezclan

### Fugas
Cuando un compartimento tiene una fuga:
- El gas escapa hacia (o entra desde) el entorno
- La transferencia continua hasta que las presiones se igualan
- En el espacio (vacio), todo el gas eventualmente escapara

## Consejos de construccion

### Crear una cabina sellada

1. Construye un espacio cerrado con bloques en todos los lados
2. Coloca un componente Volume dentro
3. Haz clic en `Scan` - si muestra **AIRTIGHT**, esta listo
4. Si muestra **LEAK**, busca huecos en tu estructura

### Fuentes comunes de fugas

- Bloques faltantes en esquinas o bordes
- Articulaciones que no estan en la posicion 0
- Dockable Doors abiertas
- Componentes que no son hermeticos colocados en las paredes

### Multiples compartimentos

Para construcciones complejas con multiples areas selladas:
- Coloca un componente Volume por compartimento
- Cada uno rastreara su propia presion y composicion
- Los volumenes conectados (compartiendo espacio) transferiran automaticamente gases entre ellos

### Usar Volumes como tanques de combustible

El componente Volume puede almacenar cualquier fluido, no solo aire respirable:
- Llenar con O2 liquido, H2, CH4 o H2O
- Usar con [Fluid Pumps](components/fluids/fluidPump/FluidPump.md) para extraer combustible
- La forma irregular de tu construccion se convierte en la forma de tu tanque
