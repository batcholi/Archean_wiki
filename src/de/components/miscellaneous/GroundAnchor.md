<p align="center">
  <img src="GroundAnchor.png" />
</p>

|Component|`GroundAnchor`|
|---|---|
|**Module**|`ARCHEAN_anchor`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 100 x 100 cm|
#
---

# Description
Der Ground Anchor ist ein Gerät, das einen Build bei Aktivierung am Boden fixiert und jegliche Bewegung verhindert.

# Usage
Der Ground Anchor funktioniert ohne externe Stromversorgung. Sein Mechanismus basiert auf einem einfachen Wert: `0` für deaktiviert (nicht verankert) oder `1` für aktiviert (verankert) über seinen Datenport.

>- Um einen verankerten Build freizugeben, reicht es nicht aus, den Ground Anchor zu entfernen. Sie müssen entweder den aktuellen Ground Anchor entriegeln oder einen neuen Ground Anchor installieren, um die Physik des Builds zu reaktivieren, vorausgesetzt, es sind keine weiteren geerdeten Anker mehr vorhanden.
>- Wenn ein [OwnerPad](OwnerPad.md) vorhanden ist, wird die Verwendung des "Reset"-Buttons zum Bewegen des Builds NICHT durch den Ground Anchor verhindert.
>- Der Ground Anchor kann ein Fahrzeug nicht an einem anderen Fahrzeug verankern, er funktioniert nur auf Terrain.
