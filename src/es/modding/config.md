# Recetas de crafteo

## Introduction

Para hacer tus componentes moddeados crafteables en el juego, necesitas crear un archivo `config.yaml` en la raiz de la carpeta de tu mod. Este archivo define:
- **Items**: El tamano maximo de pila para cada objeto
- **Recipes**: Como craftear (Crafter), reciclar (Crusher) o procesar quimicamente (Chemical Furnace) tus objetos
- **Creative Inventory**: Objetos que aparecen en el inventario del jugador al reiniciar en modo Creative

## Estructura de carpetas del Mod

Un mod es una carpeta que contiene todos tus componentes personalizados. Aqui esta la estructura esperada:

```
Archean/Archean-data/mods/
└── MYVENDORNAME_mymod/
    ├── config.yaml              <- Recetas de crafteo (esta pagina)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- Modelo 3D
    │   │   ├── main.xc (optional)                <- Script XenonCode
    │   │   └── MyComponent1.png                  <- Miniatura
    │   └── MyComponent2/
    │       ├── MyComponent2 (.bin, .gltf, etc.)
    │       ├── main.xc (optional)
    │       └── MyComponent2.png
```

> **Importante**: El archivo `config.yaml` debe colocarse en la raiz de la carpeta de tu mod, no dentro de la subcarpeta `components`.

## Estructura del archivo

El archivo `config.yaml` tiene las siguientes secciones:

```yaml
items:
  # Define max stack sizes for your items

recipes:
  # Define crafting, recycling, and chemistry recipes

inventory_creative_backpack:
  # Items added to backpack when resetting in Creative mode
```

---

## Seccion Items

La seccion `items` define el tamano maximo de pila para cada uno de tus objetos moddeados. El nombre del objeto debe seguir el formato `ModName.ComponentName`.

```yaml
items:
  MYVENDORNAME_mymod.MyComponent1:
    max_stack: 64
  MYVENDORNAME_mymod.MyComponent2:
    max_stack: 256
```

### Valores comunes de max_stack

| Valor | Rango de masa tipico | Ejemplos |
|-------|-------------------|----------|
| 1 | Objetos unicos | Tools (RockRake, OreScanner), UraniumRod |
| 8 | 400-1000 kg | Crusher, SteamTurbine, FissionReactor, MiningDrill |
| 64 | 50-200 kg | Crafter, Container, Gyroscope, RTG, PilotSeat |
| 256 | 1-50 kg | Battery, Sensors, Junctions, FluidPort |
| 1024 | < 1 kg | Parts (Screw, Wire, Diode, Circuit) |
| 10000000 | Gramos | Materias primas (Iron, Copper, etc.) |

Como regla general, la masa total de las entradas de la receta deberia coincidir aproximadamente con la masa del componente. Por ejemplo, un componente de 100 kg deberia requerir aproximadamente 100 kg de materiales para craftearlo.

---

## Seccion Recipes

La seccion `recipes` es una lista de entradas de recetas. Hay tres tipos:
- **Recetas de Crafter**: Para craftear nuevos objetos en el Crafter
- **Recetas de Crusher**: Para reciclar objetos de vuelta a materias primas
- **Recetas de Chemistry**: Para reacciones quimicas en el Chemical Furnace

---

### Recetas de Crafter

Una receta de crafter define como craftear un objeto. Estas recetas funcionan tanto en la maquina Crafter como en el menu de crafteo integrado del avatar.

```yaml
recipes:
  - label: MyComponent
    context: crafter
    time: 10
    input:
      ARCHEAN_parts.Casing: 50
      ARCHEAN_parts.Circuit: 1
      ARCHEAN_parts.Connector: 4
    output:
      MYVENDORNAME_mymod.MyComponent: 1
```

| Campo | Descripcion |
|-------|-------------|
| `label` | Nombre visible en la UI del Crafter |
| `context` | Debe ser `crafter` |
| `time` | Tiempo de crafteo en segundos |
| `input` | Materiales requeridos (objeto: cantidad) |
| `output` | Objetos producidos (objeto: cantidad) |

---

### Recetas de Crusher

Una receta de crusher define que materias primas se devuelven cuando un objeto se pone en el Crusher.

```yaml
recipes:
  - context: crusher
    input: MYVENDORNAME_mymod.MyComponent
    output:
      ARCHEAN_celestial.Iron: 5000
      ARCHEAN_celestial.Silicon: 1000
```

| Campo | Descripcion |
|-------|-------------|
| `context` | Debe ser `crusher` |
| `input` | Nombre del objeto unico a reciclar |
| `output` | Materiales recuperados (objeto: cantidad) |

- <font color="orange">Las recetas de Crusher son **opcionales**. Por defecto, el Crusher descompone automaticamente los objetos en el 100% de sus materias primas de crafteo. Solo agrega una receta de crusher si deseas sobreescribir este comportamiento predeterminado.</font>
- El `input` es un unico nombre de objeto (no un mapeo).

---

### Recetas de Chemistry

Las recetas de quimica definen reacciones que ocurren en el Chemical Furnace cuando se cumplen condiciones especificas de temperatura.

```yaml
recipes:
  - context: chemistry
    temperature_min: 750
    temperature_max: 950
    input:
      O2: 0.128
      H2: 0.004
    output:
      H2O: 0.036
      MYVENDORNAME_mymod.MyCompound:
        stack: 100
```

| Campo | Descripcion |
|-------|-------------|
| `context` | Debe ser `chemistry` |
| `temperature_min` | Temperatura minima (Kelvin) para la reaccion |
| `temperature_max` | Temperatura maxima (Kelvin) para la reaccion |
| `exothermic_energy` | (Opcional) Energia liberada por la reaccion (J/mol) |
| `input` | Fluidos/materiales requeridos |
| `output` | Fluidos/materiales producidos |

---

## Ejemplo completo

```yaml
items:
  MYVENDORNAME_mymod.MyComponent:
    max_stack: 64

recipes:
  - label: MyComponent
    context: crafter
    time: 10
    input:
      ARCHEAN_parts.Casing: 10
      ARCHEAN_parts.Circuit: 1
    output:
      MYVENDORNAME_mymod.MyComponent: 1

inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```

---

## Objetos del juego base disponibles

### Raw Materials (ARCHEAN_celestial)
Estos pueden usarse como entradas de recetas:
- `ARCHEAN_celestial.Aluminium`
- `ARCHEAN_celestial.Carbon`
- `ARCHEAN_celestial.Chrome`
- `ARCHEAN_celestial.Copper`
- `ARCHEAN_celestial.Gold`
- `ARCHEAN_celestial.Iron`
- `ARCHEAN_celestial.Lead`
- `ARCHEAN_celestial.Nickel`
- `ARCHEAN_celestial.Silicon`
- `ARCHEAN_celestial.Silver`
- `ARCHEAN_celestial.Sulfur`
- `ARCHEAN_celestial.Tin`
- `ARCHEAN_celestial.Titanium`
- `ARCHEAN_celestial.Tungsten`
- `ARCHEAN_celestial.Uranium`
- `ARCHEAN_celestial.Fluorite`

### Parts (ARCHEAN_parts)
Estos son objetos intermedios comunmente usados en recetas:
- `ARCHEAN_parts.Screw`
- `ARCHEAN_parts.Plastic`
- `ARCHEAN_parts.Wire`
- `ARCHEAN_parts.Connector`
- `ARCHEAN_parts.Magnet`
- `ARCHEAN_parts.Diode`
- `ARCHEAN_parts.Capacitor`
- `ARCHEAN_parts.Panel`
- `ARCHEAN_parts.Disk`
- `ARCHEAN_parts.Casing`
- `ARCHEAN_parts.Circuit`
- `ARCHEAN_parts.GoldPlatedCircuit`
- `ARCHEAN_parts.Motor`
- `ARCHEAN_parts.LED`

### Fluids

El sistema de quimica soporta formulas quimicas. Aqui estan los fluidos comunmente usados en el juego:

| Formula | Nombre | Usado en |
|---------|------|---------|
| `O2` | Oxygen | Electrolyser, Thrusters, Crafting |
| `H2` | Hydrogen | Electrolyser, Thrusters, Crafting |
| `H2O` | Water | Electrolyser, Chemistry |
| `CH4` | Methane | Thrusters (fuel), Sabatier Reactor |
| `CO2` | Carbon Dioxide | Sabatier Reactor |
| `HF` | Hydrogen Fluoride | Uranium processing |
| `F2` | Fluorine | Uranium processing |

Puedes definir moleculas personalizadas usando formulas quimicas estandar (ej., `NH3`, `C2H6`). La masa molecular se calcula correctamente a partir de las masas atomicas, pero la densidad liquida para moleculas personalizadas es aproximada.

---

## Creative Inventory

Puedes hacer que tus objetos moddeados aparezcan en el inventario del jugador cuando reinician en modo Creative. Esto es util para pruebas o para objetos que no necesitan recetas de crafteo.

### Backpack Items

Agrega objetos a la mochila del jugador al reiniciar:

```yaml
inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```
