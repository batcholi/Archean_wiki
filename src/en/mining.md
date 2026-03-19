# Mining

Mining in Archean is the process of locating, collecting, and processing mineral resources found in the terrain of celestial bodies. It is the foundation of the crafting system — without ores, you can't build anything.

The complete mining pipeline is: **Scan → Collect → Crush → Craft**.

## Locating Ores

Before collecting rocks, you should first identify where valuable ores are concentrated.

The [Ore Scanner Tool](tools/OreScannerTool.md) is a handheld device that displays a real-time graph of ore density in the direction you're facing. Just equip it and look around — it's the fastest way to scout a location.

For automated scanning, the [Ore Scanner](components/mining/OreScanner.md) component can be controlled via [XenonCode](xenoncode/documentation.md) and returns composition data as [key-value text objects](xenoncode/documentation.md#key-value-objects).

---

## Collecting Rocks

Rocks are small objects scattered on the surface of celestial bodies. They vary in size, and **a bigger rock gives more material** when picked up.

### By Hand
Without any tool equipped, press `LMB` to pick up a rock. You must click again for each rock.

### Rock Rake Tool
The [Rock Rake](tools/RockRakeTool.md) is the recommended way to collect rocks manually:

- **Hold `LMB`**: Continuously picks up rocks as you look at them
- **`RMB`**: Inspect a rock before picking it up — shows its composition and yield

---

## Automated Mining — Mining Drill

The [Mining Drill](components/mining/MiningDrill.md) extracts rocks from the terrain automatically. It must be installed on an anchored build using a [Ground Anchor](components/miscellaneous/GroundAnchor.md).

The drill's efficiency decreases with depth — you should **relocate it** periodically when output drops. See the [Mining Drill](components/mining/MiningDrill.md) page for detailed specifications.

---

## Rock Composition

Every rock has a **composition** — a set of elements with their respective densities, determined by its location on the terrain. Composition is represented as [key-value text objects](xenoncode/documentation.md#key-value-objects):

`.Al{0.1500}.Fe{0.2000}.Si{0.6500}` — meaning 15% Aluminium, 20% Iron, 65% Silicon.

Rocks with **identical composition** stack together in your inventory. Different compositions occupy separate slots.

### Elements

|Symbol|Element|Symbol|Element|
|---|---|---|---|
|Al|Aluminium|Ni|Nickel|
|C|Carbon|Si|Silicon|
|Cr|Chrome|Ag|Silver|
|Cu|Copper|Sn|Tin|
|Au|Gold|Ti|Titanium|
|F|Fluorite|W|Tungsten|
|Fe|Iron|U|Uranium|
|Pb|Lead|Ch|???|

---

## Processing Rocks

To turn rocks into usable ores, you need to crush them. There are two ways to do this:

### Avatar Processing (Early Game)
Your backpack has a built-in **Item Processing Area** (1 slot) accessible from the [crafting interface](interfaces.md#item-processing-area). Place rocks in this slot and click **Crush** to convert them into ores directly from your inventory. This is slow but requires no infrastructure — it's how you get your first ores in Adventure mode.

### Crusher Component (Automated)
The [Crusher](components/mining/Crusher.md) is a placeable component for large-scale processing. It converts rocks into ores proportionally to their composition. For example, crushing 10 Kg of rock with 20% Iron yields 2000 g of Iron ore.

When concentrations are very low, the Crusher accumulates fractional amounts across multiple rocks until it can produce at least 1 unit — nothing is lost.

> The Crusher does **not pull** from its input — rocks must be [pushed](pushpull.md) to it. See the [Push & Pull](pushpull.md) page for more details.

---

## Resource Distribution

Ore distribution varies by celestial body, altitude, and proximity to volcanic features. See [Earth](celestialbodies/earth.md) and [Moon](celestialbodies/moon.md) for details.

|Rarity|Elements|Where to look|
|---|---|---|
|Common|Si, Fe, C, Cu, Sn|Everywhere / above sea level|
|Uncommon|Al, Ag|High altitude (mountains)|
|Rare|Ni, Cr, Ti, W|High altitude / very high altitude|
|Very Rare|Au, Pb, U, F|Deep sea / near volcanoes|

- **Volcanoes** boost Iron, Lead, and are the **only source of Fluorite**

---

## Practical Tips

- **Scout first**: Use the Ore Scanner Tool to find a spot rich in the ores you need before placing infrastructure
- **Typical setups**: Mining Drill → Crusher → Container, or Mining Drill → Container → [Conveyor](components/items/ItemConveyor.md) → Crusher
- **Sizing**: 1 Crusher handles up to 4 Mining Drills at High Voltage
- **Relocate drills** when efficiency drops significantly
- **Rock Rake for early game**: Use it to gather your first Iron and craft your way to a Mining Drill
- **Check composition**: Right-click rocks with the Rock Rake to check what they contain before picking them up
