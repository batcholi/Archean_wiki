# Crafting Recipes

## Introduction

Чтобы сделать ваши моддированные компоненты доступными для крафта в игре, вам нужно создать файл `config.yaml` в корне папки вашего мода. Этот файл определяет:
- **Items**: Максимальный размер стопки для каждого предмета
- **Recipes**: Как создавать (Crafter), перерабатывать (Crusher) или химически обрабатывать (Chemical Furnace) ваши предметы
- **Creative Inventory**: Предметы, появляющиеся в инвентаре игрока при сбросе в творческом режиме

## Mod Folder Structure

Мод — это папка, содержащая все ваши пользовательские компоненты. Вот ожидаемая структура:

```
Archean/Archean-data/mods/
└── MYVENDORNAME_mymod/
    ├── config.yaml              <- Crafting recipes (this page)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- 3D model
    │   │   ├── main.xc (optional)                <- XenonCode script
    │   │   └── MyComponent1.png                  <- Thumbnail
    │   └── MyComponent2/
    │       ├── MyComponent2 (.bin, .gltf, etc.)
    │       ├── main.xc (optional)
    │       └── MyComponent2.png
```

> **Важно**: Файл `config.yaml` должен быть размещён в корне папки мода, а не внутри подпапки `components`.

## File Structure

Файл `config.yaml` имеет следующие разделы:

```yaml
items:
  # Define max stack sizes for your items

recipes:
  # Define crafting, recycling, and chemistry recipes

inventory_creative_backpack:
  # Items added to backpack when resetting in Creative mode
```

---

## Items Section

Раздел `items` определяет максимальный размер стопки для каждого из ваших моддированных предметов. Имя предмета должно следовать формату `ModName.ComponentName`.

```yaml
items:
  MYVENDORNAME_mymod.MyComponent1:
    max_stack: 64
  MYVENDORNAME_mymod.MyComponent2:
    max_stack: 256
```

### Common max_stack Values

| Значение | Типичный диапазон масс | Примеры |
|-------|-------------------|----------|
| 1 | Уникальные предметы | Инструменты (RockRake, OreScanner), UraniumRod |
| 8 | 400-1000 кг | Crusher, SteamTurbine, FissionReactor, MiningDrill |
| 64 | 50-200 кг | Crafter, Container, Gyroscope, RTG, PilotSeat |
| 256 | 1-50 кг | Battery, Sensors, Junctions, FluidPort |
| 1024 | < 1 кг | Детали (Screw, Wire, Diode, Circuit) |
| 10000000 | Граммы | Сырьё (Iron, Copper и т.д.) |

Как общее правило, суммарная масса ингредиентов рецепта должна приблизительно соответствовать массе компонента. Например, компонент массой 100 кг должен требовать примерно 100 кг материалов для крафта.

---

## Recipes Section

Раздел `recipes` — это список записей рецептов. Существует три типа:
- **Crafter recipes**: Для крафта новых предметов в Crafter
- **Crusher recipes**: Для переработки предметов обратно в сырьё
- **Chemistry recipes**: Для химических реакций в Chemical Furnace

---

### Crafter Recipes

Рецепт крафта определяет, как создать предмет. Эти рецепты работают как в машине Crafter, так и во встроенном меню крафта аватара.

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

| Поле | Описание |
|-------|-------------|
| `label` | Отображаемое имя в интерфейсе Crafter |
| `context` | Должно быть `crafter` |
| `time` | Время крафта в секундах |
| `input` | Необходимые материалы (предмет: количество) |
| `output` | Производимые предметы (предмет: количество) |

---

### Crusher Recipes

Рецепт переработки определяет, какое сырьё возвращается при помещении предмета в Crusher.

```yaml
recipes:
  - context: crusher
    input: MYVENDORNAME_mymod.MyComponent
    output:
      ARCHEAN_celestial.Iron: 5000
      ARCHEAN_celestial.Silicon: 1000
```

| Поле | Описание |
|-------|-------------|
| `context` | Должно быть `crusher` |
| `input` | Имя одного предмета для переработки |
| `output` | Возвращаемые материалы (предмет: количество) |

- <font color="orange">Рецепты Crusher **опциональны**. По умолчанию Crusher автоматически разлагает предметы на 100% их сырьевых материалов крафта. Добавляйте рецепт Crusher только если хотите переопределить это поведение по умолчанию.</font>
- `input` — это имя одного предмета (не маппинг).

---

### Chemistry Recipes

Рецепты химии определяют реакции, происходящие в Chemical Furnace при соблюдении определённых температурных условий.

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

| Поле | Описание |
|-------|-------------|
| `context` | Должно быть `chemistry` |
| `temperature_min` | Минимальная температура (Кельвин) для реакции |
| `temperature_max` | Максимальная температура (Кельвин) для реакции |
| `exothermic_energy` | (Опционально) Энергия, выделяемая реакцией (Дж/моль) |
| `input` | Необходимые жидкости/материалы |
| `output` | Производимые жидкости/материалы |

---

## Complete Example

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

## Available Base Game Items

### Raw Materials (ARCHEAN_celestial)
Могут использоваться как ингредиенты рецептов:
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
Промежуточные предметы, часто используемые в рецептах:
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

Система химии поддерживает химические формулы. Вот наиболее часто используемые жидкости в игре:

| Формула | Название | Применение |
|---------|------|---------|
| `O2` | Oxygen | Electrolyser, Thrusters, Crafting |
| `H2` | Hydrogen | Electrolyser, Thrusters, Crafting |
| `H2O` | Water | Electrolyser, Chemistry |
| `CH4` | Methane | Thrusters (fuel), Sabatier Reactor |
| `CO2` | Carbon Dioxide | Sabatier Reactor |
| `HF` | Hydrogen Fluoride | Uranium processing |
| `F2` | Fluorine | Uranium processing |

Вы можете определять пользовательские молекулы, используя стандартные химические формулы (например, `NH3`, `C2H6`). Молекулярная масса рассчитывается корректно из атомных масс, но плотность жидкости для пользовательских молекул является приблизительной.

---

## Creative Inventory

Вы можете сделать так, чтобы ваши моддированные предметы появлялись в инвентаре игрока при сбросе в творческом режиме. Это полезно для тестирования или для предметов, не требующих рецептов крафта.

### Backpack Items

Добавление предметов в рюкзак игрока при сбросе:

```yaml
inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```
