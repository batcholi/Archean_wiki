<p align="center">
  <img src="SmallHinge.png" />
</p>

|Component|`SmallHinge`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Das Small Hinge ist eine Komponente, die einen baubaren Block auf einem Scharnier enthält.

> <font color="green"> *Diese Komponente steht im Zusammenhang mit der Druckbeaufschlagung von Builds. Weitere Informationen finden Sie auf der Seite [Pressurization](../../pressurization.md).*</font>

# Usage
Das Small Hinge arbeitet nur im Servo-Modus.

Wenn Sie mit V das Informationsinterface öffnen, gibt es zwei mögliche Konfigurationen:
- `Max Rotation Speed` bestimmt die maximale Drehgeschwindigkeit in Umdrehungen pro Sekunde.
- `Acceleration` bestimmt die Rate (in Umdrehungen pro Sekunde pro Sekunde), mit der das Scharnier beschleunigt, um seine maximale Drehgeschwindigkeit zu erreichen, bevor es abbremst, um seine Zielposition zu erreichen.

Das Gerät dreht sich auf eine präzise Position, die durch die über seinen Datenport empfangenen Daten bestimmt wird. Es akzeptiert normalisierte Werte zwischen `-1.0` und `+1.0`, die Drehungen von `-90°` bzw. `+90°` entsprechen.

> - Builds, die auf einem beweglichen Teil installiert sind, können nicht mit einem übergeordneten oder gleichrangigen Build kollidieren. Sie können nur mit dem Terrain oder anderen separaten Builds kollidieren.
> - Um das Small Hinge zu zerstören, müssen Sie unbedingt alle darin enthaltenen untergeordneten Blöcke/Komponenten entfernen.
### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s|

![SmallPivotDemo](hinge.gif)
