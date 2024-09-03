<p align="center">
  <img src="ownerpad.webp" />
</p>

|Component|`OwnerPad`|
|---|---|
|**Module**|`ARCHEAN_owner`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
The OwnerPad is a versatile security device that ensures the protection of builds against potential malicious actions.

In addition to its security function, it allows you to save the state of a build or vehicle (Position, Velocity, Battery Level, switches...).  
With this feature, it becomes possible to instantly revert to that state with a single click.

# Usage
### SAVE & RESET Button
The `SAVE` button saves the position of a build as well as the state of its components while the `RESET` button resets the build to the state it was in when last saved.

### ROLES Button
Roles allow you to authorize/forbid actions on a build, as shown in the example image. They are designed to ensure the security of your builds against any malicious actions by other players.
When you place an OwnerPad on a build, if no other OwnerPad is present, you become the owner of that build.

By default, all permissions are set to `@Everyone`, making the build completely public.  
In addition to `@Everyone` and `dksm (OWNER)` in the example, the list of all connected players will be displayed, allowing you to assign roles to the players of your choice.

A `Give Ownership` button is present next to each connected player to transfer ownership to the player of your choice. You will then have no rights on the build until the new owner grants you roles.

![OwnerPadDemo](RolesUI.png)

### Control via the data port
The OwnerPad has a data port to allow control from a computer or remotely via a beacon, for example.
You must send a text in channel 0 containing the keyword `"save"` or `"reset"` depending on the action you want to perform.

You must send an empty text `""` to reset the state before you can send another command.
