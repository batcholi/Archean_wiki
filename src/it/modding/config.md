# Crafting Recipes

## Introduction

Per rendere i tuoi componenti moddati craftabili nel gioco, devi creare un file `config.yaml` nella radice della cartella della tua mod. Questo file definisce:
- **Items**: La dimensione massima dello stack per ogni oggetto
- **Recipes**: Come craftare (Crafter), riciclare (Crusher) o lavorare chimicamente (Chemical Furnace) i tuoi oggetti
- **Creative Inventory**: Oggetti che appaiono nell'inventario del giocatore quando si resetta in modalita' Creative

## Mod Folder Structure

Una mod e' una cartella che contiene tutti i tuoi componenti personalizzati. Ecco la struttura prevista:

```
Archean/Archean-data/mods/
└── MYVENDORNAME_mymod/
    ├── config.yaml              <- Ricette di crafting (questa pagina)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- Modello 3D
    │   │   ├── main.xc (optional)                <- Script XenonCode
    │   │   └── MyComponent1.png                  <- Miniatura
    │   └── MyComponent2/
    │       ├── MyComponent2 (.bin, .gltf, etc.)
    │       ├── main.xc (optional)
    │       └── MyComponent2.png
```

> **Importante**: Il file `config.yaml` deve essere posizionato nella radice della cartella della tua mod, non all'interno della sotto-cartella `components`.

## File Structure

Il file `config.yaml` ha le seguenti sezioni:

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

La sezione `items` definisce la dimensione massima dello stack per ciascuno dei tuoi oggetti moddati. Il nome dell'oggetto deve seguire il formato `ModName.ComponentName`.

```yaml
items:
  MYVENDORNAME_mymod.MyComponent1:
    max_stack: 64
  MYVENDORNAME_mymod.MyComponent2:
    max_stack: 256
```

### Common max_stack Values

| Valore | Range di massa tipico | Esempi |
|-------|-------------------|----------|
| 1 | Oggetti unici | Strumenti (RockRake, OreScanner), UraniumRod |
| 8 | 400-1000 kg | Crusher, SteamTurbine, FissionReactor, MiningDrill |
| 64 | 50-200 kg | Crafter, Container, Gyroscope, RTG, PilotSeat |
| 256 | 1-50 kg | Battery, Sensors, Junctions, FluidPort |
| 1024 | < 1 kg | Parti (Screw, Wire, Diode, Circuit) |
| 10000000 | Grammi | Materie prime (Iron, Copper, ecc.) |

Come regola generale, la massa totale degli input della ricetta dovrebbe approssimativamente corrispondere alla massa del componente. Per esempio, un componente da 100 kg dovrebbe richiedere circa 100 kg di materiali per essere craftato.

---

## Recipes Section

La sezione `recipes` e' una lista di voci di ricette. Ci sono tre tipi:
- **Ricette Crafter**: Per craftare nuovi oggetti nel Crafter
- **Ricette Crusher**: Per riciclare oggetti in materie prime
- **Ricette Chemistry**: Per reazioni chimiche nella Chemical Furnace

---

### Crafter Recipes

Una ricetta crafter definisce come craftare un oggetto. Queste ricette funzionano sia nella macchina Crafter che nel menu di crafting integrato dell'avatar.

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

| Campo | Descrizione |
|-------|-------------|
| `label` | Nome visualizzato nell'interfaccia del Crafter |
| `context` | Deve essere `crafter` |
| `time` | Tempo di crafting in secondi |
| `input` | Materiali richiesti (oggetto: quantita') |
| `output` | Oggetti prodotti (oggetto: quantita') |

---

### Crusher Recipes

Una ricetta crusher definisce quali materie prime vengono restituite quando un oggetto viene messo nel Crusher.

```yaml
recipes:
  - context: crusher
    input: MYVENDORNAME_mymod.MyComponent
    output:
      ARCHEAN_celestial.Iron: 5000
      ARCHEAN_celestial.Silicon: 1000
```

| Campo | Descrizione |
|-------|-------------|
| `context` | Deve essere `crusher` |
| `input` | Nome singolo dell'oggetto da riciclare |
| `output` | Materiali recuperati (oggetto: quantita') |

- <font color="orange">Le ricette crusher sono **opzionali**. Per default, il Crusher decompone automaticamente gli oggetti nel 100% delle loro materie prime di crafting. Aggiungi una ricetta crusher solo se vuoi sovrascrivere questo comportamento predefinito.</font>
- L'`input` e' un singolo nome di oggetto (non una mappatura).

---

### Chemistry Recipes

Le ricette chemistry definiscono reazioni che avvengono nella Chemical Furnace quando condizioni di temperatura specifiche sono soddisfatte.

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

| Campo | Descrizione |
|-------|-------------|
| `context` | Deve essere `chemistry` |
| `temperature_min` | Temperatura minima (Kelvin) per la reazione |
| `temperature_max` | Temperatura massima (Kelvin) per la reazione |
| `exothermic_energy` | (Opzionale) Energia rilasciata dalla reazione (J/mol) |
| `input` | Fluidi/materiali richiesti |
| `output` | Fluidi/materiali prodotti |

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
Queste possono essere usate come input delle ricette:
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
Questi sono oggetti intermedi comunemente usati nelle ricette:
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

Il sistema di chimica supporta formule chimiche. Ecco i fluidi comunemente usati nel gioco:

| Formula | Nome | Utilizzo |
|---------|------|---------|
| `O2` | Ossigeno | Electrolyser, Thrusters, Crafting |
| `H2` | Idrogeno | Electrolyser, Thrusters, Crafting |
| `H2O` | Acqua | Electrolyser, Chemistry |
| `CH4` | Metano | Thrusters (carburante), Sabatier Reactor |
| `CO2` | Anidride carbonica | Sabatier Reactor |
| `HF` | Acido fluoridrico | Lavorazione dell'uranio |
| `F2` | Fluoro | Lavorazione dell'uranio |

Puoi definire molecole personalizzate usando formule chimiche standard (es. `NH3`, `C2H6`). La massa molecolare viene calcolata correttamente dalle masse atomiche, ma la densita' del liquido per le molecole personalizzate e' approssimata.

---

## Creative Inventory

Puoi far apparire i tuoi oggetti moddati nell'inventario del giocatore quando resetta in modalita' Creative. Questo e' utile per il testing o per oggetti che non necessitano di ricette di crafting.

### Backpack Items

Aggiungi oggetti allo zaino del giocatore al reset:

```yaml
inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```
