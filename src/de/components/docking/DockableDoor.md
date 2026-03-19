<p align="center">
  <img src="DockableDoor.png" />
</p>

|Component|`DockableDoor`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|400 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|250 x 250 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
Die Dockable Door ist eine große Tür, die an eine ähnliche Tür andocken kann, um zwei Builds miteinander zu verbinden. Das Andocken ermöglicht die Übertragung von Daten, Energie und Fluiden zwischen den verbundenen Builds, schränkt aber auch die beiden Builds physikalisch aneinander ein. Sie sind fest miteinander verbunden.

> - Dockable Doors können nur auf der Fläche von Rahmen installiert werden.
> - Die Dockable Door kann nur an eine andere Dockable Door angedockt werden.
> - <font color="green"> *Diese Komponente steht im Zusammenhang mit der Druckbeaufschlagung von Builds. Weitere Informationen finden Sie auf der Seite [Pressurization](../../pressurization.md).*</font>

# Usage
Um ordnungsgemäß zu funktionieren, muss die Dockable Door über Niederspannung mit Strom versorgt werden. Sie verbraucht 20 Watt im Ruhezustand und bis zu 250 Watt, wenn die Türen in Bewegung sind.

Die Innenseite der Tür verfügt über zwei Panels zur Interaktion mit der Tür oder zur Übertragung von Daten, Energie oder Fluiden durch den Docking-Anschluss.

Hier ist ein Bild, das die beiden Panels illustriert.
- Das grüne Panel dient zur Interaktion mit der Tür, zur Stromversorgung und zur Fernsteuerung über einen Datenanschluss. (Die folgende Tabelle zeigt die Eingänge/Ausgänge des Datenanschlusses)
- Das blaue Panel dient zum Anschluss verschiedener Kabel, die Daten, Energie oder Fluide zur/von der anderen angedockten Tür übertragen.

![DockableDoorDemo](DockableDoorExample.png)

### Usage with aliases
Die Verwendung von Standard-Aliassen ist für beide Anschlüsse gleichzeitig nicht möglich, da das Objekt nur ein einzelnes Alias-Feld in seinem Informationsfenster (`V`) anzeigt. Ebenso zeigt der [Router](../computers/Router.md) nur ein einzelnes Alias-Feld pro Komponente an.
Um Datenanschlüsse separat mit Aliassen zu verwenden, müssen Sie eine [Data Bridge](../computers/DataBridge.md) oder [Data Junction](../computers/DataJunction.md) verwenden. Dies ermöglicht es Ihnen, diesen Objekten Aliasse zuzuweisen anstatt den Docking-Anschlüssen.

### List of inputs
|Channel|Function|
|---|---|
|0|Close/Open Door|
|1|Arm/Disarm Dock|

### List of outputs
|Channel|Function|
|---|---|
|0|Door State|
|1|Dock State|
