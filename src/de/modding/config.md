# Crafting-Rezepte

## Einleitung

Um deine Mod-Komponenten im Spiel herstellbar zu machen, musst du eine `config.yaml`-Datei im Stammverzeichnis deines Mod-Ordners erstellen. Diese Datei definiert:
- **Items**: Die maximale Stapelgröße für jedes Item
- **Rezepte**: Wie man deine Items herstellt (Crafter), recycelt (Crusher) oder chemisch verarbeitet (Chemical Furnace)
- **Kreativ-Inventar**: Items, die im Inventar des Spielers erscheinen, wenn im Kreativmodus zurückgesetzt wird

## Mod-Ordnerstruktur

Ein Mod ist ein Ordner, der alle deine benutzerdefinierten Komponenten enthält. Hier ist die erwartete Struktur:

```
Archean/Archean-data/mods/
└── MYVENDORNAME_mymod/
    ├── config.yaml              <- Crafting-Rezepte (diese Seite)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- 3D-Modell
    │   │   ├── main.xc (optional)                <- XenonCode-Skript
    │   │   └── MyComponent1.png                  <- Vorschaubild
    │   └── MyComponent2/
    │       ├── MyComponent2 (.bin, .gltf, etc.)
    │       ├── main.xc (optional)
    │       └── MyComponent2.png
```

> **Wichtig**: Die `config.yaml`-Datei muss im Stammverzeichnis deines Mod-Ordners platziert werden, nicht innerhalb des `components`-Unterordners.

## Dateistruktur

Die `config.yaml`-Datei hat folgende Abschnitte:

```yaml
items:
  # Define max stack sizes for your items

recipes:
  # Define crafting, recycling, and chemistry recipes

inventory_creative_backpack:
  # Items added to backpack when resetting in Creative mode
```

---

## Items-Abschnitt

Der `items`-Abschnitt definiert die maximale Stapelgröße für jedes deiner Mod-Items. Der Item-Name muss dem Format `ModName.ComponentName` folgen.

```yaml
items:
  MYVENDORNAME_mymod.MyComponent1:
    max_stack: 64
  MYVENDORNAME_mymod.MyComponent2:
    max_stack: 256
```

### Übliche max_stack-Werte

| Wert | Typischer Massebereich | Beispiele |
|-------|-------------------|----------|
| 1 | Einzigartige Items | Tools (RockRake, OreScanner), UraniumRod |
| 8 | 400-1000 kg | Crusher, SteamTurbine, FissionReactor, MiningDrill |
| 64 | 50-200 kg | Crafter, Container, Gyroscope, RTG, PilotSeat |
| 256 | 1-50 kg | Battery, Sensors, Junctions, FluidPort |
| 1024 | < 1 kg | Parts (Screw, Wire, Diode, Circuit) |
| 10000000 | Gramm | Rohmaterialien (Iron, Copper, etc.) |

Als allgemeine Regel sollte die Gesamtmasse der Rezepteingaben ungefähr der Masse der Komponente entsprechen. Zum Beispiel sollte eine 100 kg schwere Komponente ungefähr 100 kg an Materialien zur Herstellung benötigen.

---

## Rezepte-Abschnitt

Der `recipes`-Abschnitt ist eine Liste von Rezepteinträgen. Es gibt drei Typen:
- **Crafter-Rezepte**: Zum Herstellen neuer Items im Crafter
- **Crusher-Rezepte**: Zum Recyceln von Items zurück in Rohmaterialien
- **Chemie-Rezepte**: Für chemische Reaktionen im Chemical Furnace

---

### Crafter-Rezepte

Ein Crafter-Rezept definiert, wie ein Item hergestellt wird. Diese Rezepte funktionieren sowohl in der Crafter-Maschine als auch im integrierten Crafting-Menü des Avatars.

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

| Feld | Beschreibung |
|-------|-------------|
| `label` | Anzeigename in der Crafter-Oberfläche |
| `context` | Muss `crafter` sein |
| `time` | Herstellungszeit in Sekunden |
| `input` | Benötigte Materialien (Item: Menge) |
| `output` | Hergestellte Items (Item: Menge) |

---

### Crusher-Rezepte

Ein Crusher-Rezept definiert, welche Rohmaterialien zurückgegeben werden, wenn ein Item in den Crusher gelegt wird.

```yaml
recipes:
  - context: crusher
    input: MYVENDORNAME_mymod.MyComponent
    output:
      ARCHEAN_celestial.Iron: 5000
      ARCHEAN_celestial.Silicon: 1000
```

| Feld | Beschreibung |
|-------|-------------|
| `context` | Muss `crusher` sein |
| `input` | Einzelner Item-Name zum Recyceln |
| `output` | Gewonnene Materialien (Item: Menge) |

- <font color="orange">Crusher-Rezepte sind **optional**. Standardmäßig zerlegt der Crusher Items automatisch in 100% ihrer Crafting-Rohmaterialien. Füge nur ein Crusher-Rezept hinzu, wenn du dieses Standardverhalten überschreiben möchtest.</font>
- Der `input` ist ein einzelner Item-Name (kein Mapping).

---

### Chemie-Rezepte

Chemie-Rezepte definieren Reaktionen, die im Chemical Furnace stattfinden, wenn bestimmte Temperaturbedingungen erfüllt sind.

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

| Feld | Beschreibung |
|-------|-------------|
| `context` | Muss `chemistry` sein |
| `temperature_min` | Mindesttemperatur (Kelvin) für die Reaktion |
| `temperature_max` | Höchsttemperatur (Kelvin) für die Reaktion |
| `exothermic_energy` | (Optional) Freigesetzte Energie durch die Reaktion (J/mol) |
| `input` | Benötigte Fluide/Materialien |
| `output` | Erzeugte Fluide/Materialien |

---

## Vollständiges Beispiel

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

## Verfügbare Basisspiel-Items

### Rohmaterialien (ARCHEAN_celestial)
Diese können als Rezepteingaben verwendet werden:
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

### Teile (ARCHEAN_parts)
Dies sind Zwischenprodukte, die häufig in Rezepten verwendet werden:
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

### Fluide

Das Chemiesystem unterstützt chemische Formeln. Hier sind die häufig verwendeten Fluide im Spiel:

| Formel | Name | Verwendet in |
|---------|------|---------|
| `O2` | Sauerstoff | Electrolyser, Thrusters, Crafting |
| `H2` | Wasserstoff | Electrolyser, Thrusters, Crafting |
| `H2O` | Wasser | Electrolyser, Chemie |
| `CH4` | Methan | Thrusters (Treibstoff), Sabatier Reactor |
| `CO2` | Kohlendioxid | Sabatier Reactor |
| `HF` | Fluorwasserstoff | Uranverarbeitung |
| `F2` | Fluor | Uranverarbeitung |

Du kannst benutzerdefinierte Moleküle mit Standard-Summenformeln definieren (z.B. `NH3`, `C2H6`). Die Molekülmasse wird korrekt aus den Atommassen berechnet, aber die Flüssigkeitsdichte für benutzerdefinierte Moleküle ist angenähert.

---

## Kreativ-Inventar

Du kannst deine Mod-Items im Inventar des Spielers erscheinen lassen, wenn er im Kreativmodus zurücksetzt. Dies ist nützlich zum Testen oder für Items, die keine Crafting-Rezepte benötigen.

### Rucksack-Items

Items zum Rucksack des Spielers beim Zurücksetzen hinzufügen:

```yaml
inventory_creative_backpack:
  - MYVENDORNAME_mymod.MyComponent
```
