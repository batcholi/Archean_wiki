<p align="center">
  <img src="PilotSeat.png" />
</p>

|Component|`PilotSeat`|
|---|---|
|**Module**|`ARCHEAN_avatar`|
|**Mass**|50 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|75 x 75 x 175 cm|
#
---

# Description
Der Pilot Seat ermöglicht es einem Spieler, eine Komponente zu steuern (Werte auf verschiedenen Channels zu senden), indem er die zugewiesenen Fahrzeugsteuerungen einer Tastatur, eines Controllers oder eines Joysticks verwendet.

# Usage
Drücken Sie `R`, um sich in den Sitz zu setzen.
Drücken Sie `R`, um den Sitz zu verlassen.

> Sie können **Taste zum Verlassen des Sitzes gedrückt halten** in den Spieleinstellungen aktivieren, wenn Sie das alte Verhalten bevorzugen, R eine Sekunde lang gedrückt zu halten.

> Während Sie sitzen, können Sie mit der `R`-Taste zu einem anderen nahegelegenen Sitz wechseln, ohne den aktuellen Sitz verlassen zu müssen.
> Beim Verlassen eines Sitzes merkt sich das Spiel, wo Sie sich relativ zum Build befanden, als Sie den Sitz betraten, und dort werden Sie beim Verlassen platziert.

## Configuration
Im Informationsfenster des Pilot Seat, zugänglich mit der `V`-Taste:

| Option | Description |
|--------|-------------|
| **Smooth Controls** | Glättet Tastatureingaben für Spieler ohne Joystick |
| **Emit user token on Channel 0** | Sendet den Token des Benutzers auf Channel 0 anstatt `1` (standardmäßig aktiviert) |

Der User-Token kann mit einem [HUD Controller](../miscellaneous/HudController.md) verwendet werden, um zu identifizieren, welcher Benutzer sitzt.

### List of outputs
|Channel|Function|Range|
|---|---|---|
|0|Using|1 oder der Token des im Pilot Seat sitzenden Benutzers, ansonsten 0|
|1|Backward/Forward|-1.0 to +1.0|
|2|Left/Right|-1.0 to +1.0|
|3|Down/Up|-1.0 to +1.0|
|4|Pitch|-1.0 to +1.0|
|5|Roll|-1.0 to +1.0|
|6|Yaw|-1.0 to +1.0|
|7|Main Thrust|0.0 to 1.0|
|8|Aux 1|0 or 1|
|9|Aux 2|0 or 1|
|10|Aux 3|0 or 1|
|11|Aux 4|0 or 1|
|12|Aux 5|0 or 1|
|13|Aux 6|0 or 1|
|14|Aux 7|0 or 1|
|15|Aux 8|0 or 1|
|16|Aux 9|0 or 1|
|17|Aux 0|0 or 1|

> Wenn ein [OwnerPad](../miscellaneous/OwnerPad.md) vorhanden ist, benötigen Sie die Berechtigung "`Sit`", um sich in den Sitz zu setzen, und `Interact`, um die Steuerungen zu verwenden.
