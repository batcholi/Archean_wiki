<p align="center">
  <img src="SmallPivot.png" />
</p>

|Component|`SmallPivot`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Das Small Pivot ist eine Komponente, die einen baubaren rotierenden Block enthält. Es ist dafür konzipiert, die Rotation von Objekten auf einem Build zu ermöglichen.

> <font color="green"> *Diese Komponente steht im Zusammenhang mit der Druckbeaufschlagung von Builds. Weitere Informationen finden Sie auf der Seite [Pressurization](../../pressurization.md).*</font>

# Usage
Das Small Pivot kann in zwei Modi arbeiten: Servo (Standard) und Velocity. Um zwischen den Modi zu wechseln, drücken Sie die V-Taste, um das Informationsinterface der Komponente zu öffnen.

In diesem Interface gibt es zwei zusätzliche Konfigurationsmöglichkeiten:
- `Max Rotation Speed` bestimmt die maximale Drehgeschwindigkeit in Umdrehungen pro Sekunde.
- `Acceleration` bestimmt die Rate (in Umdrehungen pro Sekunde pro Sekunde), mit der das Pivot beschleunigt, um seine maximale Drehgeschwindigkeit zu erreichen.

## Servo Mode
Im Servo-Modus dreht sich das Gerät auf eine präzise Position, die durch die über seinen Datenport empfangenen Daten bestimmt wird. Es akzeptiert normalisierte Werte zwischen `-1.0` und `+1.0`, die Drehungen von `-360°` und `+360°` entsprechen. Das bedeutet effektiv, dass die Werte `0.0`, `-1.0` und `+1.0` zur gleichen Servo-Position führen.

## Velocity Mode
Im Velocity-Modus arbeitet das Gerät kontinuierlich in der durch die Daten seines Ports angegebenen Richtung und akzeptiert Werte zwischen `-1.0` und `+1.0`, um Geschwindigkeit und Drehrichtung zu bestimmen. `1.0` bedeutet maximale Drehgeschwindigkeit.

> - Builds, die auf einem beweglichen Teil installiert sind, können nicht mit einem übergeordneten oder gleichrangigen Build kollidieren. Sie können nur mit dem Terrain oder anderen separaten Builds kollidieren.
> - Um das Small Pivot zu zerstören, müssen Sie unbedingt alle darin enthaltenen untergeordneten Blöcke/Komponenten entfernen.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s| 

![SmallPivotDemo](pivot.gif)
