# Bergbau

Bergbau in Archean ist der Prozess des Lokalisierens, Sammelns und Verarbeitens von mineralischen Ressourcen, die im Terrain von Himmelskörpern vorkommen. Er ist die Grundlage des Herstellungssystems -- ohne Erze kannst du nichts bauen.

Die vollständige Bergbau-Pipeline ist: **Scannen → Sammeln → Zerkleinern → Herstellen**.

## Erze lokalisieren

Bevor du Steine sammelst, solltest du zunächst identifizieren, wo wertvolle Erze konzentriert sind.

Das [Ore Scanner Tool](tools/OreScannerTool.md) ist ein Handgerät, das ein Echtzeit-Diagramm der Erzdichte in der Blickrichtung anzeigt. Rüste es einfach aus und schau dich um -- es ist die schnellste Methode, einen Standort zu erkunden.

Für automatisiertes Scannen kann die [Ore Scanner](components/mining/OreScanner.md)-Komponente über [XenonCode](xenoncode/documentation.md) gesteuert werden und liefert Zusammensetzungsdaten als [Key-Value-Textobjekte](xenoncode/documentation.md#key-value-objects).

---

## Steine sammeln

Steine sind kleine Objekte, die auf der Oberfläche von Himmelskörpern verstreut sind. Sie variieren in der Größe, und **ein größerer Stein liefert mehr Material** beim Aufsammeln.

### Von Hand
Ohne ein ausgerüstetes Werkzeug drücke `LMB`, um einen Stein aufzuheben. Du musst für jeden Stein erneut klicken.

### Rock Rake Tool
Das [Rock Rake](tools/RockRakeTool.md) ist die empfohlene Methode zum manuellen Sammeln von Steinen:

- **`LMB` gedrückt halten**: Sammelt kontinuierlich Steine auf, während du sie anschaust
- **`RMB`**: Einen Stein vor dem Aufheben inspizieren -- zeigt seine Zusammensetzung und Ausbeute

---

## Automatisierter Bergbau -- Mining Drill

Der [Mining Drill](components/mining/MiningDrill.md) extrahiert automatisch Steine aus dem Terrain. Er muss auf einer verankerten Konstruktion mit einem [Ground Anchor](components/miscellaneous/GroundAnchor.md) installiert werden.

Die Effizienz des Bohrers nimmt mit der Tiefe ab -- du solltest ihn **regelmäßig versetzen**, wenn die Ausbeute sinkt. Siehe die [Mining Drill](components/mining/MiningDrill.md)-Seite für detaillierte Spezifikationen.

---

## Steinzusammensetzung

Jeder Stein hat eine **Zusammensetzung** -- eine Menge von Elementen mit ihren jeweiligen Dichten, bestimmt durch seinen Standort auf dem Terrain. Die Zusammensetzung wird als [Key-Value-Textobjekte](xenoncode/documentation.md#key-value-objects) dargestellt:

`.Al{0.1500}.Fe{0.2000}.Si{0.6500}` -- bedeutet 15% Aluminium, 20% Eisen, 65% Silizium.

Steine mit **identischer Zusammensetzung** stapeln sich in deinem Inventar. Unterschiedliche Zusammensetzungen belegen separate Plätze.

### Elemente

|Symbol|Element|Symbol|Element|
|---|---|---|---|
|Al|Aluminium|Ni|Nickel|
|C|Kohlenstoff|Si|Silizium|
|Cr|Chrom|Ag|Silber|
|Cu|Kupfer|Sn|Zinn|
|Au|Gold|Ti|Titan|
|F|Fluorit|W|Wolfram|
|Fe|Eisen|U|Uran|
|Pb|Blei|Ch|???|

---

## Steine verarbeiten

Um Steine in nutzbare Erze umzuwandeln, musst du sie zerkleinern. Dafür gibt es zwei Möglichkeiten:

### Avatar-Verarbeitung (Frühspiel)
Dein Rucksack hat einen integrierten **Item Processing Area** (1 Platz), der über die [Herstellungsoberfläche](interfaces.md#item-processing-area) zugänglich ist. Lege Steine in diesen Platz und klicke auf **Crush**, um sie direkt aus deinem Inventar in Erze umzuwandeln. Dies ist langsam, erfordert aber keine Infrastruktur -- so erhältst du deine ersten Erze im Adventure-Modus.

### Crusher-Komponente (Automatisiert)
Der [Crusher](components/mining/Crusher.md) ist eine platzierbare Komponente für Großverarbeitung. Er wandelt Steine proportional zu ihrer Zusammensetzung in Erze um. Zum Beispiel: Das Zerkleinern von 10 kg Stein mit 20% Eisen ergibt 2000 g Eisenerz.

Wenn die Konzentrationen sehr niedrig sind, akkumuliert der Crusher Bruchteile über mehrere Steine hinweg, bis er mindestens 1 Einheit produzieren kann -- nichts geht verloren.

> Der Crusher **zieht nicht** aus seinem Eingang -- Steine müssen zu ihm [gepusht](pushpull.md) werden. Siehe die [Push & Pull](pushpull.md)-Seite für weitere Details.

---

## Ressourcenverteilung

Die Erzverteilung variiert je nach Himmelskörper, Höhe und Nähe zu vulkanischen Merkmalen. Siehe [Earth](celestialbodies/earth.md) und [Moon](celestialbodies/moon.md) für Details.

|Seltenheit|Elemente|Wo suchen|
|---|---|---|
|Häufig|Si, Fe, C, Cu, Sn|Überall / über dem Meeresspiegel|
|Ungewöhnlich|Al, Ag|Große Höhe (Berge)|
|Selten|Ni, Cr, Ti, W|Große Höhe / sehr große Höhe|
|Sehr selten|Au, Pb, U, F|Tiefsee / nahe Vulkanen|

- **Vulkane** erhöhen Eisen, Blei und sind die **einzige Quelle von Fluorit**

---

## Praktische Tipps

- **Zuerst erkunden**: Verwende das Ore Scanner Tool, um einen ergiebigen Standort zu finden, bevor du Infrastruktur aufbaust
- **Typische Aufbauten**: Mining Drill → Crusher → Container, oder Mining Drill → Container → [Conveyor](components/items/ItemConveyor.md) → Crusher
- **Dimensionierung**: 1 Crusher verarbeitet bis zu 4 Mining Drills bei High Voltage
- **Bohrer versetzen**, wenn die Effizienz deutlich nachlässt
- **Rock Rake für das Frühspiel**: Verwende es, um dein erstes Eisen zu sammeln und dich bis zum Mining Drill hochzuarbeiten
- **Zusammensetzung prüfen**: Rechtsklicke Steine mit dem Rock Rake, um ihren Inhalt vor dem Aufheben zu prüfen
