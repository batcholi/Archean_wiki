<p align="center">
  <img src="ownerpad.webp" />
</p>

|Component|`OwnerPad`|
|---|---|
|**Module**|`ARCHEAN_ownership`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
El OwnerPad es un dispositivo de seguridad versátil que garantiza la protección de las construcciones contra posibles acciones maliciosas.

Además de su función de seguridad, permite guardar el estado de una construcción o vehículo (Posición, Velocidad, Nivel de batería, interruptores...).
Con esta funcionalidad, es posible revertir instantáneamente a ese estado con un solo clic.

# Usage
### Botón SAVE & RESET
El botón `SAVE` guarda la posición de una construcción así como el estado de sus componentes, mientras que el botón `RESET` restablece la construcción al estado en que se encontraba cuando se guardó por última vez.

### Botón ROLES
Los roles permiten autorizar/prohibir acciones en una construcción, como se muestra en la imagen de ejemplo. Están diseñados para garantizar la seguridad de tus construcciones contra cualquier acción maliciosa de otros jugadores.
Cuando colocas un OwnerPad en una construcción, si no hay otro OwnerPad presente, te conviertes en el propietario de esa construcción.

Por defecto, todos los permisos están configurados en `@Everyone`, haciendo la construcción completamente pública.
Además de `@Everyone` y `dksm (OWNER)` en el ejemplo, se mostrará la lista de todos los jugadores conectados, permitiéndote asignar roles a los jugadores que elijas.

Un botón `Give Ownership` está presente junto a cada jugador conectado para transferir la propiedad al jugador que elijas. Entonces no tendrás derechos sobre la construcción hasta que el nuevo propietario te otorgue roles.

![OwnerPadDemo](RolesUI.png)

### Control mediante el puerto de datos
El OwnerPad tiene un puerto de datos para permitir el control desde un ordenador o de forma remota a través de un Beacon, por ejemplo.
Debes enviar un texto en el canal 0 que contenga la palabra clave `"save"` o `"reset"` según la acción que desees realizar.

Debes enviar un texto vacío `""` para restablecer el estado antes de poder enviar otro comando.
