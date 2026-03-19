# Druckbeaufschlagung

Die Druckbeaufschlagung in Archean ermöglicht es dir, abgedichtete Kompartimente zu erstellen, die Gase bei anderen Drücken als der umgebenden Umgebung halten können. Dies ist essentiell für den Bau von Raumschiffkabinen, U-Booten, Luftschiffen oder benutzerdefinierten Treibstofftanks.

## Funktionsweise

### Die Volume-Komponente

Die [Volume](components/fluids/Volume.md)-Komponente ist das Herzstück des Druckbeaufschlagungssystems. Wenn sie innerhalb einer Konstruktion platziert und gescannt wird, verwendet sie einen **voxelbasierten Algorithmus**, um die Grenzen des umschlossenen Raums zu erkennen.

1. **Scannen**: Klicke auf die `Scan`-Schaltfläche der Volume-Komponente, um den umgebenden Raum zu analysieren
2. **Ausbreitung**: Das System expandiert in alle Richtungen (X, Y, Z), bis es auf solide/luftdichte Blöcke trifft
3. **Status**:
   - **AIRTIGHT** (grün): Das Kompartiment ist vollständig abgedichtet
   - **LEAK** (rot): Es gibt eine Öffnung zur Außenwelt

> Jede Volume-Komponente erkennt nur das Kompartiment, in dem sie platziert ist. Du benötigst separate Volume-Komponenten für jedes isolierte Kompartiment.

### Luftdichte Komponenten

Nicht alle Komponenten dichten ein Volume ab. Nur Komponenten, die als **luftdicht** gekennzeichnet sind, wirken als Wände für die Druckbeaufschlagung. Dazu gehören:

| Kategorie | Luftdichte Komponenten |
|----------|---------------------|
| **Gelenke** | Small Hinge, Small Pivot, Linear Track |
| **Bridges** | Data Bridge, Fluid Bridge, Item Bridge, Low/High Voltage Bridge |
| **Junctions** | Fluid Junction, Item Junction |
| **Lagerung** | Container, Small Container |
| **Andocken** | Dockable Door |
| **Sonstiges** | Passive Radiator, Aileron, Mini Router... |

Reguläre Baublöcke (Rahmen, Paneele) sind standardmäßig ebenfalls luftdicht.

## Gelenke und Druckbeaufschlagung

Gelenke ([Small Hinge](components/joints/SmallHinge.md), [Small Pivot](components/joints/SmallPivot.md), [Linear Track](components/joints/LinearTrack.md)) haben ein besonderes Verhalten:

- **Wenn ausgerichtet** (Neutralstellung, Wert = 0): Das Gelenk ist luftdicht und dichtet das Volume ab
- **Wenn bewegt** (jede andere Position): Das Gelenk bricht die Abdichtung und verursacht ein Leck

Dies ermöglicht die Erstellung von **funktionalen Türen und Luken**:

1. Baue einen Türrahmen mit Blöcken
2. Platziere ein Small Hinge oder Small Pivot
3. Baue das Türpaneel auf dem beweglichen Teil des Gelenks
4. Wenn das Gelenk auf Position 0 zurückkehrt, wird das Kompartiment abgedichtet

> **Wichtig**: Wenn sich ein Gelenk bewegt, scannt die Volume-Komponente automatisch erneut, um zu erkennen, ob die Abdichtung gebrochen ist.

## Dockable Doors

Die [Dockable Door](components/docking/DockableDoor.md) verfügt über integriertes Druckmanagement:

- **Geschlossen**: Wirkt als luftdichte Abdichtung
- **Geöffnet**: Ermöglicht Gasaustausch zwischen:
  - Dem Innenkompartiment und der Außenumgebung (wenn nicht angedockt)
  - Zwei angedockten Kompartimenten (wenn mit einer anderen Dockable Door angedockt)

Wenn zwei Raumschiffe andocken und ihre Dockable Doors öffnen, mischen sich ihre Atmosphären und gleichen den Druck aus.

## Fluid Port -- Die zentrale Schnittstelle

Der [Fluid Port](components/fluids/FluidPort.md) ist die **essentielle Komponente** für die Interaktion mit druckbeaufschlagten Volumes. Er ist die einzige Möglichkeit, programmgesteuert Fluide in ein abgedichtetes Kompartiment einzuspeisen oder zu entnehmen.

### Funktionsweise

Der Fluid Port fungiert als **Brücke** zwischen dem Fluidsystem (Pumpen, Tanks, Rohre) und einem druckbeaufschlagten Volume:

- **Position ist wichtig**: Die Düse des Ports muss sich **physisch innerhalb** des druckbeaufschlagten Volumes befinden, um damit zu interagieren
- **Automatische Erkennung**: Er erkennt automatisch, ob er sich innerhalb eines gescannten Volumes oder in der Umgebungsatmosphäre befindet
- **Bidirektional**: Kann sowohl Fluide in ein Volume drücken als auch daraus entnehmen

### Physikalische Grenzen

Der Fluid Port hat fest kodierte physikalische Grenzen:

| Eigenschaft | Wert |
|----------|-------|
| **Maximale Durchflussrate** | 1,0 m³/s |
| **Durchflussberechnung** | Begrenzt durch `min(angeforderte_Masse / Dichte, 1,0 m³/s × deltaTime)` |

Das bedeutet:
- Dichte Fluide (Flüssigkeiten) übertragen mehr Masse pro Sekunde als leichte Fluide (Gase)
- Du kannst ein Volume nicht sofort füllen oder leeren -- es braucht Zeit
- Mehrere Fluid Ports können parallel verwendet werden, um die Gesamtdurchflussrate zu erhöhen

### Anwendungsszenarien

#### Benutzerdefinierten Treibstofftank füllen
1. Baue ein abgedichtetes Kompartiment mit einer Volume-Komponente
2. Platziere einen Fluid Port mit seiner Düse **innerhalb** des Volumes
3. Verbinde den Fluid Port mit einer Fluid Pump und einer Treibstoffquelle (Tank, Elektrolyseur usw.)
4. Die Pumpe drückt Treibstoff durch den Fluid Port in deinen benutzerdefinierten Tank

#### Aus einem Volume entnehmen
1. Platziere einen Fluid Port innerhalb des druckbeaufschlagten Volumes
2. Verbinde ihn mit einer Pumpe, die zum Ziehen konfiguriert ist
3. Die Fluidzusammensetzung innerhalb des Volumes wird proportional entnommen

#### Lebenserhaltung in der Kabine
1. Erstelle eine abgedichtete Kabine mit einer Volume-Komponente
2. Platziere einen Fluid Port innen für die Einspeisung einer atemfähigen Atmosphäre
3. Verbinde ihn mit einer Sauerstoffquelle und einer Pumpe
4. Verwende einen zweiten Fluid Port zum Ablassen von CO2 oder zur Druckhaltung

### Umgebungserkennung

Wenn der Fluid Port sich **nicht** innerhalb eines druckbeaufschlagten Volumes befindet, interagiert er mit der **Umgebungsatmosphäre**:
- Auf der Erde: Zieht atmosphärische Luft (N2, O2-Gemisch)
- Im Wasser: Zieht H2O
- Im Weltraum: Nichts zu ziehen (Vakuum)

Drücke `V` auf einen Fluid Port, um zu sehen:
- Aktuelle Umgebungsdichte (kg/m³)
- Umgebungszusammensetzung (Prozent nach Volumen)

## Gasphysik

Das Druckbeaufschlagungssystem simuliert realistisches Gasverhalten:

### Erfasste Eigenschaften
- **Druck** (Pascal/kPa)
- **Temperatur** (Kelvin)
- **Dichte** (kg/m³)
- **Zusammensetzung** (O2, N2, H2, CH4, H2O usw.)
- **Flüssigkeitsstand** (für die Lagerung von Flüssigkeiten)

### Gasaustausch
- Gase strömen von hohem Druck zu niedrigem Druck
- Die Übertragungsrate hängt von der Druckdifferenz und der Öffnungsgröße ab
- Die Temperatur wird beim Mischen von Gasen gemittelt

### Lecks
Wenn ein Kompartiment ein Leck hat:
- Gas entweicht in die Umgebung (oder dringt ein)
- Der Austausch setzt sich fort, bis sich die Drücke ausgleichen
- Im Weltraum (Vakuum) entweicht schließlich alles Gas

## Bautipps

### Eine abgedichtete Kabine erstellen

1. Baue einen umschlossenen Raum mit Blöcken auf allen Seiten
2. Platziere eine Volume-Komponente im Inneren
3. Klicke `Scan` -- wenn **AIRTIGHT** angezeigt wird, bist du fertig
4. Wenn **LEAK** angezeigt wird, suche nach Lücken in deiner Struktur

### Häufige Leckquellen

- Fehlende Blöcke in Ecken oder Kanten
- Gelenke, die nicht auf Position 0 stehen
- Geöffnete Dockable Doors
- Nicht-luftdichte Komponenten in Wänden

### Mehrere Kompartimente

Für komplexe Konstruktionen mit mehreren abgedichteten Bereichen:
- Platziere eine Volume-Komponente pro Kompartiment
- Jede verfolgt ihren eigenen Druck und ihre Zusammensetzung
- Verbundene Volumes (die sich einen Raum teilen) tauschen automatisch Gase untereinander aus

### Volumes als Treibstofftanks verwenden

Die Volume-Komponente kann jedes Fluid speichern, nicht nur atemfähige Luft:
- Fülle mit flüssigem O2, H2, CH4 oder H2O
- Verwende mit [Fluid Pumps](components/fluids/fluidPump/FluidPump.md) zur Treibstoffentnahme
- Die unregelmäßige Form deiner Konstruktion wird zur Form deines Tanks
