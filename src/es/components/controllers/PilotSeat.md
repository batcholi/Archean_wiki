<p align="center">
  <img src="PilotSeat.png" />
</p>

|Component|`PilotSeat`|
|---|---|
|**Module**|`ARCHEAN_avatar`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|75 x 75 x 175 cm|
#
---

# Description
El Pilot Seat permite a un jugador controlar (enviar valores en diferentes canales) un componente usando los controles de vehículo asignados desde un teclado, mando o joystick.

# Usage
Presiona `R` para sentarte en el asiento.
Presiona `R` para salir del asiento.

> Puedes activar **Hold key to Exit Seat** en los ajustes del juego si prefieres el comportamiento anterior de mantener R durante un segundo.

> Mientras estás sentado, puedes moverte a otro asiento cercano sin necesidad de salir del asiento actual usando la tecla `R`.
> Al salir de un asiento, recuerda dónde estabas en relación a la construcción cuando entraste, y ahí es donde aparecerás al salir.

## Configuration
En la ventana de información del Pilot Seat accesible con la tecla `V`:

| Option | Description |
|--------|-------------|
| **Smooth Controls** | Suaviza las entradas del teclado para jugadores sin joystick |
| **Emit user token on Channel 0** | Envía el token del usuario en el Canal 0 en lugar de `1` (activado por defecto) |

El token de usuario puede usarse con un [HUD Controller](../miscellaneous/HudController.md) para identificar qué usuario está sentado.

### List of outputs
|Channel|Function|Range|
|---|---|---|
|0|Using|1 o el token del usuario sentado en el Pilot Seat, de lo contrario 0|
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

> Si un [OwnerPad](../miscellaneous/OwnerPad.md) está presente, debes tener el permiso "`Sit`" para sentarte en el asiento e `Interact` para usar los controles.
