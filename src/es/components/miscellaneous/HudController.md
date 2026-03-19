<p align="center">
  <img src="HudController.png" />
</p>

|Component|`HudController`|
|---|---|
|**Module**|`ARCHEAN_hud`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description

El HUD Controller es un componente que permite crear un HUD y mostrarlo en la pantalla del jugador cuando se suscribe a él. Por ejemplo, permite crear una o más interfaces personalizadas en las construcciones.

# Usage
Cuando colocas un HUD Controller en tu construcción, tiene dos botones:
- **Code**:
	- Abre el IDE de XenonCode, donde puedes escribir el código para el HUD. Consulta la sección [HUD](../../xenoncode/hud.md) para más información sobre la creación de HUDs.
- **Active**: 
	- Permite suscribirse o cancelar la suscripción al HUD Controller.

> Cuando el IDE está abierto, te suscribes automáticamente al HUD Controller mientras el IDE permanezca abierto.

## Control mediante su puerto de datos
### Uso con un [Pilot Seat](../controllers/PilotSeat.md)
La suscripción al HUD Controller también puede hacerse a través de su puerto de datos usando un [Pilot Seat](../controllers/PilotSeat.md), que tiene la capacidad única de enviar un identificador único (Token) en su canal 0 (Using). Puedes conectar un [Pilot Seat](../controllers/PilotSeat.md) directamente al puerto de datos del HUD Controller, permitiéndote suscribirte al HUD Controller cuando estés sentado en el [Pilot Seat](../controllers/PilotSeat.md) y cancelar la suscripción cuando lo abandones.

También puedes usar un [Pilot Seat](../controllers/PilotSeat.md) conectado a un [Computer](../computers/Computer.md) para suscribirte al HUD Controller. En este caso, necesitas usar el canal 0 (Using) del [Pilot Seat](../controllers/PilotSeat.md) para enviar el Token al puerto de datos del HUD Controller.

> - Asegúrate de que la configuración `Emit user token on Channel 0` esté activada en la ventana de información del [Pilot Seat](../controllers/PilotSeat.md), accesible con la tecla `V`. Esto garantiza que el Token del usuario se transmita en el canal 0 del [Pilot Seat](../controllers/PilotSeat.md) en lugar de un `0` o `1`.
> - Recomendamos no obtener el Token ni codificarlo de forma fija. El Token se regenera cada vez que el jugador se conecta al servidor por razones de seguridad. Si un jugador malintencionado obtiene el Token de otro jugador, podría usarlo para mostrar cualquier cosa en el HUD de ese jugador sin su conocimiento.

### HUD Controller para administradores del servidor
El HUD Controller también puede usarse para crear un HUD visible para todos los jugadores del servidor.
Para ello, un administrador simplemente necesita colocar un [OwnerPad](OwnerPad.md) en la construcción donde se encuentra el HUD Controller.

Luego, conecta el HUD Controller a un [Computer](../computers/Computer.md) y envía el texto `*` al canal 0 del HUD Controller para indicarle que se suscriba a todos los tokens.

> **Nota**: Cuando un administrador del servidor crea un HUD Controller para todos los jugadores, no puede desactivarse. Por lo tanto, hay que tener cuidado de no crear un HUD Controller que pueda ser molesto para los jugadores.
