<p align="center">
  <img src="LinearTrack.png" />
</p>

|Component|`LinearTrack`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Der Linear Track ist eine Komponente, die einen baubaren beweglichen Block enthält. Er ist dafür konzipiert, die lineare Verschiebung von Objekten auf einem Build zu ermöglichen. Er kann sich nur entlang einer automatisch erstellten Schiene auf der Bewegungsachse des Blocks verschieben.

> <font color="green"> *Diese Komponente steht im Zusammenhang mit der Druckbeaufschlagung von Builds. Weitere Informationen finden Sie auf der Seite [Pressurization](../../pressurization.md).*</font>

# Usage
Der Linear Track kann in zwei Modi arbeiten: Servo (Standard) und Velocity. Um zwischen den Modi zu wechseln, drücken Sie die V-Taste, um das Informationsinterface der Komponente zu öffnen.

In diesem Interface gibt es zusätzliche Konfigurationsmöglichkeiten:
- `Max Speed` bestimmt die maximale Geschwindigkeit in Metern pro Sekunde.
- `Acceleration` bestimmt die Rate, mit der der Linear Track beschleunigt, um seine maximale Geschwindigkeit zu erreichen.
- `Override limits` ermöglicht bei Aktivierung das manuelle Festlegen der minimalen und maximalen Positionsgrenzen anstelle der automatisch berechneten Werte basierend auf dem verfügbaren Schienenplatz.

## Tracks
Die Schienen für die Linear Track-Komponente werden automatisch entlang ihrer Achse erstellt und aktualisiert. Sie werden auf normalen Blöcken beliebigen Typs erstellt. Um die Schiene zu beenden, muss die Linie unterbrochen werden. Zum Beispiel mit einem anderen Block darauf oder durch eine Lücke entlang der Schiene.

## Servo Mode
Im Servo-Modus bewegt sich das Gerät zu einer präzisen Position, die durch die über seinen Datenport empfangenen Daten bestimmt wird. Es akzeptiert alle Werte und reagiert entsprechend im Bereich zwischen Minimum und Maximum. Wenn also eine Zahl größer oder kleiner empfangen wird, bewegt es sich in die entsprechende Min/Max-Position.

## Velocity Mode
Im Velocity-Modus arbeitet das Gerät kontinuierlich in der durch die Daten seines Ports angegebenen Richtung und akzeptiert Werte zwischen `-1.0` und `+1.0`, um Geschwindigkeit und Bewegungsrichtung zu bestimmen. `1.0` bedeutet maximale Geschwindigkeit.

> - Builds, die auf einem beweglichen Teil installiert sind, können nicht mit einem übergeordneten oder gleichrangigen Build kollidieren. Sie können nur mit dem Terrain oder anderen separaten Builds kollidieren.
> - Um den Linear Track zu zerstören, müssen Sie unbedingt alle darin enthaltenen untergeordneten Blöcke/Komponenten entfernen.
> - Der Linear Track hat einen maximalen Verfahrbereich von -250m bis +250m (500m insgesamt).


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Position|meters|
|1|Speed|m/s|
|2|Minimum Position|meters|
|3|Maximum Position|meters|

![LinearTrackDemo](lineartrack.gif)
