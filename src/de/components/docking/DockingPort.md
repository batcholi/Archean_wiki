<p align="center">
  <img src="DockingPort.png" />
</p>

|Component|`DockingPort`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|50 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|50 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
Der Docking Port ist eine Komponente, die es ermöglicht, zwei Builds miteinander zu verbinden. Die Verbindung ermöglicht die Übertragung von Daten, Energie, Fluiden und **Gegenständen** zwischen den verbundenen Builds, schränkt sie aber auch physikalisch aneinander ein. Sie sind fest miteinander verbunden.

# Usage
Der Docking Port benötigt keine Stromversorgung.
Der separate Datenanschluss ermöglicht die Steuerung des Docking Ports, während die anderen Anschlüsse den Anschluss verschiedener Kabel ermöglichen, die Daten, Energie oder Fluide zum/vom anderen Docking Port übertragen.

### Transfer Mode
Der Docking Port kann in zwei Übertragungsmodi betrieben werden, konfigurierbar über das GetInfo-Menü (`V`-Taste):
- **Fluid Mode** (Standard): Überträgt Fluide zwischen angedockten Ports
- **Item Mode**: Überträgt Gegenstände zwischen angedockten Ports

> Beide Docking Ports müssen auf denselben Modus eingestellt sein, damit Übertragungen funktionieren.

> Der Docking Port kann nur an einen anderen Docking Port angedockt werden.

### Usage with aliases
Die Verwendung von Standard-Aliassen ist für beide Anschlüsse gleichzeitig nicht möglich, da das Objekt nur ein einzelnes Alias-Feld in seinem Informationsfenster (`V`) anzeigt. Ebenso zeigt der [Router](../computers/Router.md) nur ein einzelnes Alias-Feld pro Komponente an.
Um Datenanschlüsse separat mit Aliassen zu verwenden, müssen Sie eine [Data Bridge](../computers/DataBridge.md) oder [Data Junction](../computers/DataJunction.md) verwenden. Dies ermöglicht es Ihnen, diesen Objekten Aliasse zuzuweisen anstatt den Docking-Anschlüssen.

### List of outputs
|Channel|Function|
|---|---|
|0|Is Docked

### List of inputs
|Channel|Function
|---|---|
|0|Arm/Disarm Docking

