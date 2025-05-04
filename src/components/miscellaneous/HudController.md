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

The HUD Controller is a component that allows creating a HUD and displaying it on the player's screen when they subscribe to it. For example, it enables creating one or more custom interfaces on builds.

# Usage
When you place a HUD Controller on your build, it has two buttons:
- **Code**:
	- Opens the XenonCode IDE, where you can write the code for the HUD. Refer to the [HUD](../../xenoncode/hud.md) section for more information on creating HUDs.
- **Active**: 
	- Allows subscribing or unsubscribing to the HUD Controller.

> When the IDE is open, you are automatically subscribed to the HUD Controller as long as the IDE remains open.

## Control via its data port
### Usage with a [Pilot Seat](../controllers/PilotSeat.md)
Subscription to the HUD Controller can also be done via its data port using a [Pilot Seat](../controllers/PilotSeat.md), which has the unique ability to send a unique identifier (Token) on its channel 0 (Using). You can connect a [Pilot Seat](../controllers/PilotSeat.md) directly to the HUD Controller's data port, allowing you to subscribe to the HUD Controller when seated in the [Pilot Seat](../controllers/PilotSeat.md) and unsubscribe when you leave it.

You can also use a [Pilot Seat](../controllers/PilotSeat.md) connected to a [Computer](../computers/Computer.md) to subscribe to the HUD Controller. In this case, you need to use channel 0 (Using) of the [Pilot Seat](../controllers/PilotSeat.md) to send the Token to the HUD Controller's data port. 

> - Make sure the `Emit user token on Channel 0` setting is enabled in the [Pilot Seat](../controllers/PilotSeat.md) information window, accessible with the `V` key. This ensures that the user's Token is transmitted on channel 0 of the [Pilot Seat](../controllers/PilotSeat.md) instead of a `0` or `1`.
> - We recommend not retrieving the Token and hardcoding things with it. The Token is regenerated each time the player connects to the server for security reasons. If a malicious player obtains another player's Token, they could use it to display anything on that player's HUD without their knowledge.

### HUD Controller for server administrators
The HUD Controller can also be used to create a HUD visible to all players on the server. 
To do this, an administrator simply needs to place an [OwnerPad](OwnerPad.md) on the build where the HUD Controller is located.

Then, connect the HUD Controller to a [Computer](../computers/Computer.md) and send the text `*` to channel 0 of the HUD Controller to instruct it to subscribe to all tokens.

> **Note**: When a server administrator creates a HUD Controller for all players, it cannot be disabled. Therefore, care must be taken not to create a HUD Controller that could be disruptive to players.
