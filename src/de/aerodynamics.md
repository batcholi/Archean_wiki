# Aerodynamik

Archean simuliert aerodynamische Kräfte, die automatisch auf jedes Fahrzeug wirken, das sich durch ein fluides Medium bewegt -- sei es Luft oder Wasser. Diese Kräfte umfassen **Luftwiderstand** (Widerstand gegen Bewegung), **Auftrieb** (senkrechte Kraft durch dünne Oberflächen) und **Schwimmkraft** (Auftriebskraft durch Flüssigkeitsverdrängung). Das Verständnis dieser Systeme ist entscheidend für den Entwurf effizienter Flugzeuge, Boote, U-Boote und aller anderen beweglichen Konstruktionen.

## Funktionsweise

### Fluides Medium

Die Physik-Engine ermittelt an jedem relevanten Punkt deines Fahrzeugs die lokalen Fluideigenschaften:

| Eigenschaft | Beschreibung | Beispielwerte |
|-------------|-------------|----------------|
| **Dichte** (kg/m³) | Masse pro Volumen des Fluids | Luft auf Meereshöhe: ~1,2, Wasser: ~1000 |
| **Viskosität** (kg/(m·s)) | Fließwiderstand innerhalb des Fluids | Wird zur Wassererkennung und Dämpfung verwendet |

- In **Luft** nimmt die Dichte mit der Höhe ab. Größere Höhe bedeutet weniger Luftwiderstand und Auftrieb.
- In **Wasser** ist die Dichte etwa 800× größer als in Luft -- aerodynamische Kräfte sind dramatisch stärker.
- Im **Weltraum** (Vakuum) ist die Dichte 0 -- es wirken keinerlei aerodynamische Kräfte.

> Aerodynamische Kräfte werden erst aktiviert, wenn die Geschwindigkeit eines Fahrzeugs **0,1 m/s** überschreitet. Unterhalb dieser Schwelle werden keine Kräfte berechnet.

### Luftwiderstand

Luftwiderstand ist die Kraft, die der Bewegung eines Fahrzeugs durch ein Fluid entgegenwirkt. Er wirkt in **entgegengesetzter Richtung** der Geschwindigkeit.

Die Widerstandskraft auf jeder exponierten Oberfläche folgt der Standard-Aerodynamikgleichung:

**F = ½ × C<sub>d</sub> × ρ × v² × A**

| Symbol | Bedeutung | Wert |
|--------|---------|-------|
| C<sub>d</sub> | Widerstandsbeiwert | **0,4** für Blockoberflächen |
| ρ | Fluiddichte (kg/m³) | Abhängig von der Umgebung |
| v | Relative Geschwindigkeit an der Oberfläche (m/s) | Fahrzeuggeschwindigkeit + Rotationsgeschwindigkeit an diesem Punkt |
| A | Exponierte Stirnfläche (m²) | Senkrecht zur Geschwindigkeit, skaliert nach Belegungsverhältnis |

Wichtige Punkte:
- Der Luftwiderstand wächst mit dem **Quadrat** der Geschwindigkeit -- eine Verdopplung der Geschwindigkeit vervierfacht den Widerstand
- Nur **exponierte Oberflächen** tragen zum Widerstand bei (siehe [Verdeckung](#verdeckung-und-exponierte-oberflächen))
- Die Kraft wird **pro Oberfläche** an der Position jeder Oberfläche berechnet, was bedeutet, dass Widerstand auch ein **Drehmoment** (Rotation) erzeugen kann, wenn er außermittig angreift

### Auftrieb

Auftrieb wird automatisch von **dünnen, flachen Strukturen** erzeugt -- wie Tragflächen oder Flossen -- die die Physik-Engine basierend auf der Geometrie erkennt.

Eine Oberfläche wird als **Auftriebsfläche** klassifiziert, wenn alle folgenden Bedingungen erfüllt sind:

| Bedingung | Schwellenwert |
|-----------|-----------|
| Dicke (kürzeste Dimension) | < **0,3 m** |
| Breite (mittlere Dimension) | ≥ **Länge / 4** |
| Länge (längste Dimension) | ≥ **4 m** |

Wenn eine Auftriebsfläche erkannt wird:
- Der **Auftriebsbeiwert** hängt vom Anstellwinkel ab: `C_l = sin(|Anstellwinkel| × π/2)`
- Der **Widerstandsbeiwert** ist sehr niedrig: nur **0,01** (im Vergleich zu 0,4 für reguläre Oberflächen)
- Die Auftriebskraft wirkt senkrecht zur Geschwindigkeit und drückt das Fahrzeug in Richtung der Oberflächennormalen

> Um Tragflächen zu bauen, die Auftrieb erzeugen, verwende flache Anordnungen von Blöcken, die mindestens **4 Meter lang** und **weniger als 0,3 Meter dick** sind. Schrägen können verwendet werden, um Vorder- und Hinterkanten zu formen.

### Schwimmkraft

Schwimmkraft ist die nach oben gerichtete Kraft, die auf ein eingetauchtes oder teilweise eingetauchtes Objekt wirkt. Sie wirkt der Schwerkraft entgegen und hängt davon ab, wie viel Fluid die Blöcke des Fahrzeugs verdrängen.

**F<sub>Schwimmkraft</sub> = V<sub>verdrängt</sub> × ρ<sub>Fluid</sub> × g**

| Symbol | Bedeutung |
|--------|---------|
| V<sub>verdrängt</sub> | Verdrängtes Volumen (Blockvolumen × `volumeDisplacementRatio`) |
| ρ<sub>Fluid</sub> | Fluiddichte am Messpunkt |
| g | Gravitationsbeschleunigung (entgegengesetzte Richtung) |

- Die Engine misst an **mindestens 16 zufälligen Punkten** über alle Kollider, um **teilweises Eintauchen** gleichmäßig zu behandeln
- Der Beitrag jedes Blocks hängt vom `volumeDisplacementRatio` seines Materials ab (siehe [Materialien](#materialien))
- Schwimmkraft wird an jedem Messpunkt angewandt, sodass ein Fahrzeug bei ungleichmäßigem Eintauchen kippen kann

## Blöcke und Formen

### Blockformen

Verschiedene Blockformen haben unterschiedliche **Belegungsverhältnisse**, die die Widerstandsberechnung direkt beeinflussen:

| Form | Belegungsverhältnis | Massenmultiplikator |
|------|----------------|-----------------|
| **Würfel** | 1,0 | 1,0× |
| **Schräge** | 0,5 | 0,5× |
| **Ecke** | 0,5 | 0,5× |
| **Pyramide** | 0,5 | 0,5× |
| **Inverse Ecke** | 0,5 | 0,5× |

Das Belegungsverhältnis skaliert die berechnete Widerstandsfläche -- ein Schrägenblock, der dem Wind zugewandt ist, erzeugt ungefähr **den halben Widerstand** eines Würfels an derselben Position.

### Materialien

Jedes Blockmaterial hat unterschiedliche physikalische Eigenschaften, die Aerodynamik, Schwimmkraft und Masse beeinflussen:

| Material | Masse (kg/Blockeinheit) | Volumenverdrängungsverhältnis | Reibung |
|----------|---------------------|--------------------------|----------|
| **Composite** | 0,25 | 0,20 × Belegung | 0,05 |
| **Concrete** | 10,0 | 0,25 × Belegung | 0,50 |
| **Steel** | 1,0 | 0,01 × Belegung | 0,20 |
| **Aluminium** | 0,5 | 0,01 × Belegung | 0,20 |
| **Glass** | 1,0 | 0,02 × Belegung | 0,10 |
| **Lead** | 150,0 | 1,00 × Belegung | 0,20 |

Das **Volumenverdrängungsverhältnis** bestimmt, wie stark ein Block zur Schwimmkraft beiträgt und wie sichtbar er für die aerodynamische Oberflächenerkennung ist:
- **Lead** (1,0) verdrängt das Fluid vollständig -- maximale Schwimmkraft, aber auch sehr schwer, sodass es sinkt
- **Steel/Aluminium** (0,01) verdrängen kaum Fluid -- sie tragen fast keine Schwimmkraft bei
- **Composite** (0,2) bietet ein moderates Gleichgewicht zwischen Schwimmkraft und geringem Gewicht

### Verdeckung und exponierte Oberflächen

Das aerodynamische System verwendet **Raycasting**, um zu bestimmen, welche Oberflächen tatsächlich dem Luftstrom ausgesetzt sind:

1. Für jeden Block-Kollider identifiziert die Engine die Oberfläche, die in Geschwindigkeitsrichtung zeigt
2. Ein Strahl wird von dieser Oberfläche nach außen in Geschwindigkeitsrichtung gesendet
3. Wenn der Strahl einen anderen Block desselben Fahrzeugs trifft, gilt diese Oberfläche als **verdeckt** und trägt **nicht** zum Widerstand oder Auftrieb bei
4. Nur tatsächlich exponierte Oberflächen erzeugen aerodynamische Kräfte

Das bedeutet:
- **Innere Blöcke** innerhalb einer Hülle erzeugen keinen Widerstand -- nur die äußere Schale zählt
- Ein **kompaktes Fahrzeug** mit weniger exponierten Flächen hat weniger Widerstand als eine ausgebreitete Struktur
- Wenn eine Blockgruppe ein Belegungsverhältnis unter **0,9** hat, untersucht das System rekursiv die einzelnen Unterblöcke, um die tatsächlich exponierten Oberflächen zu finden

> Dies ist ein wichtiger Optimierungspunkt: Zwei Fahrzeuge mit der gleichen äußeren Form, aber unterschiedlichen inneren Strukturen erfahren den **gleichen** aerodynamischen Widerstand. Fülle Innenräume frei, ohne dir Sorgen über zusätzlichen Widerstand zu machen.

### Frame Beams

Frame Beams (die Strukturbalken an den Kanten von Rahmen) haben ein **Volumenverdrängungsverhältnis von 0**. Das bedeutet:

- Sie erzeugen **keinen Widerstand**
- Sie erzeugen **keinen Auftrieb**
- Sie erzeugen **keine Schwimmkraft**
- Sie dienen nur als strukturelle Kollisionsgeometrie

> Frame Beams sind aerodynamisch unsichtbar. Verwende sie frei für die interne Struktur, ohne die aerodynamische Leistung deines Fahrzeugs zu beeinflussen.

## Aerodynamische Komponenten

### Aileron

Das [Aileron](components/miscellaneous/Aileron.md) ist eine Steuerfläche, die sich ablenkt, um Kräfte senkrecht zum Luftstrom zu erzeugen. Es wird zur Steuerung von Flugzeugen und Wasserfahrzeugen verwendet.

- **Eingang**: ein Wert zwischen `-1,0` und `+1,0` über seinen Datenanschluss, der die Drehung von -45° bis +45° steuert
- **Kraft**: proportional zu Fluiddichte × Geschwindigkeit² × Auslenkungswinkel
- **Berechnet keine Verdeckung** -- im Gegensatz zu Blöcken erzeugt das Aileron immer seine volle Kraft, unabhängig von der umgebenden Geometrie

> Da Ailerons die Verdeckung ignorieren, kannst du sie **in Tragflächen aus Blöcken verstecken**. Die Blöcke werden ihre Oberflächen verdeckt haben (was den Widerstand reduziert), während die Ailerons weiterhin ihre volle Steuerkraft erzeugen.

### Propeller

Der [Propeller](components/propulsion/Propeller.md) erzeugt Schub, indem er Rotorblätter durch ein fluides Medium dreht. Er funktioniert sowohl in Luft als auch in Wasser.

Wichtige Physik:
- **Schub** = ½ × ρ × A<sub>Scheibe</sub> × v<sub>effektiv</sub>² × 0,4
- **Blattwiderstand** = ½ × ρ × Viskosität × A<sub>Scheibe</sub> × v<sub>effektiv</sub>² × 10,0
- **Bodeneffekt**: Wenn ein Propeller nahe am Boden ist und nach unten zeigt, erhöht sich der Schub um bis zu **+50%** (innerhalb des 3-fachen Blattradius vom Terrain)
- **Gyroskopische Präzession**: Rotierende Propeller widerstehen Änderungen der Ausrichtung und erzeugen ein Drehmoment senkrecht zur Rotationsachse -- genau wie echte Gyroskope
- Maximaler Schub ist auf **100.000 N** begrenzt

### Thruster & RCS

Chemische [Thruster](components/propulsion/thruster/SmallThruster.md) erzeugen Schub durch Verbrennung von Treibstoff und werden für ihren Schubausstoß **nicht** von externer Aerodynamik beeinflusst -- sie funktionieren in der Atmosphäre und im Vakuum gleich.

[RCS](components/propulsion/RCS.md) (Reaction Control System) Triebwerke erfahren jedoch **atmosphärische Abschwächung**:

**Abschwächung = max(e<sup>-ρ×4</sup>, 0,01)**

| Umgebung | Dichte (ρ) | Abschwächung | Effektiver Schub |
|----------|-------------|-------------|-----------------|
| Vakuum | 0 | 100% | Voller Schub |
| Luft (Meereshöhe) | ~1,2 | ~99,2% | Nahezu voll |
| Wasser | ~1000 | ~1% | Fast kein Schub |

> RCS-Triebwerke sind für Weltraummanöver konzipiert. In dichten Atmosphären oder Wasser sinkt ihre Wirksamkeit drastisch.

## Wasserphysik

Wenn ein Fahrzeug ins Wasser eintaucht, wendet die Physik-Engine zusätzliche Dämpfungseffekte über den Standard-Luftwiderstand hinaus an:

### Wassererkennung

Die Engine erkennt Wasser durch Messung der **Viskosität** der Umgebung. Eine Viskosität zwischen **0,0000151** und **0,000999** kg/(m·s) wird als Wasser klassifiziert.

### Wasserdämpfungseffekte

| Effekt | Beschreibung |
|--------|-------------|
| **Vertikale Geschwindigkeitsunterdrückung** | Die vertikale Geschwindigkeit wird über die Zeit reduziert und simuliert den Wasserwiderstand gegen vertikale Bewegung |
| **Nick- und Rolldämpfung** | Die Rotation um horizontale Achsen wird proportional zum Eintauchgrad des Fahrzeugs gedämpft |
| **Gierdämpfung** | Die Rotation um die vertikale Achse wird mit **halber** Rate der Nick-/Rolldämpfung gedämpft |

Der **Eintauchfaktor** wird aus der durchschnittlichen Viskosität berechnet: `eingetaucht = clamp(pow(Viskosität × 1000, 0.1), 0.5, 1.0)`

> Wasser stabilisiert Fahrzeuge natürlich. Ein teilweise eingetauchtes Fahrzeug widersteht dem Kippen aufgrund der Nick-/Rolldämpfung. Das macht Boote von Natur aus stabiler als Flugzeuge.

## Hochgeschwindigkeits-Winkelstabilität

Bei Geschwindigkeiten über **10 m/s** wendet die Physik-Engine eine künstliche Winkeldämpfung an, die den Druckaufbau auf den Fahrzeugoberflächen simuliert:

**ω -= ω × min(1, ρ) × clamp(Δt × |v| / 25, 0, 0.025)**

Das bedeutet:
- **Schnellere Fahrzeuge** sind rotationsstabiler
- **Dichtere Fluide** (Wasser > Luft) bieten stärkere Stabilisierung
- Dies verhindert, dass Fahrzeuge bei hohen Geschwindigkeiten unkontrolliert taumeln
- In Wasser mit hoher Viskosität wird ein zusätzlicher Winkeldämpfungsfaktor angewandt

## Design-Tipps

### Widerstand reduzieren
- **Minimiere die exponierte Oberfläche** -- eine kompakte, stromlinienförmige Form erzeugt weniger Widerstand
- Verwende **Schrägen, Ecken und Fasen** an Vorderkanten und Nasen statt flacher Würfelflächen
- **Innere Blöcke erzeugen keinen Widerstand** -- nur die äußere Schale zählt, also fülle Innenräume nach Bedarf
- Frame Beams sind aerodynamisch unsichtbar -- verwende sie frei für die interne Struktur

### Effektive Tragflächen bauen
- Tragflächen müssen **mindestens 4 Meter lang** und **weniger als 0,3 Meter dick** sein
- Eine größere Spannweite (Breite ≥ Länge/4) stellt sicher, dass die Oberfläche als Auftriebsfläche statt als Widerstandsfläche klassifiziert wird

### Wasserfahrzeug-Design
- **Composite-Blöcke** (Verhältnis 0,2) bieten das beste Schwimmkraft-zu-Gewicht-Verhältnis zum Schwimmen
- **Steel und Aluminium** (Verhältnis 0,01) tragen kaum zur Schwimmkraft bei -- verwende sie sparsam in Booten
- **Lead** (Verhältnis 1,0) verdrängt das meiste Fluid, sinkt aber mit 150 kg pro Einheit schnell ab
- Wasserdämpfung stabilisiert dein Fahrzeug natürlich -- breite, flache Rümpfe sind am stabilsten

### Propellerplatzierung
- **Bodeneffekt** erhöht den Schub um bis zu 50% nahe am Terrain -- nützlich für Hovercraftdesigns
- Propeller erzeugen **gyroskopisches Drehmoment** -- gegenläufige Propellerpaare heben diesen Effekt auf
- Propeller funktionieren sowohl in Luft als auch in Wasser und passen ihren Schub basierend auf Fluiddichte und Viskosität an
