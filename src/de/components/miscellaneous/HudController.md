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

Der HUD Controller ist eine Komponente, die das Erstellen eines HUD ermöglicht und es auf dem Bildschirm des Spielers anzeigt, wenn dieser es abonniert. Er ermöglicht zum Beispiel das Erstellen einer oder mehrerer benutzerdefinierter Oberflächen auf Builds.

# Usage
Wenn Sie einen HUD Controller auf Ihrem Build platzieren, hat er zwei Buttons:
- **Code**:
	- Öffnet die XenonCode-IDE, in der Sie den Code für das HUD schreiben können. Weitere Informationen zum Erstellen von HUDs finden Sie im Abschnitt [HUD](../../xenoncode/hud.md).
- **Active**: 
	- Ermöglicht das Abonnieren oder Abbestellen des HUD Controllers.

> Wenn die IDE geöffnet ist, sind Sie automatisch beim HUD Controller abonniert, solange die IDE geöffnet bleibt.

## Control via its data port
### Usage with a [Pilot Seat](../controllers/PilotSeat.md)
Das Abonnement des HUD Controllers kann auch über seinen Datenport mit einem [Pilot Seat](../controllers/PilotSeat.md) erfolgen, der die einzigartige Fähigkeit hat, eine eindeutige Kennung (Token) auf seinem Kanal 0 (Using) zu senden. Sie können einen [Pilot Seat](../controllers/PilotSeat.md) direkt mit dem Datenport des HUD Controllers verbinden, sodass Sie beim Sitzen im [Pilot Seat](../controllers/PilotSeat.md) das HUD abonnieren und beim Verlassen abbestellen.

Sie können auch einen [Pilot Seat](../controllers/PilotSeat.md) verwenden, der mit einem [Computer](../computers/Computer.md) verbunden ist, um den HUD Controller zu abonnieren. In diesem Fall müssen Sie Kanal 0 (Using) des [Pilot Seat](../controllers/PilotSeat.md) verwenden, um den Token an den Datenport des HUD Controllers zu senden.

> - Stellen Sie sicher, dass die Einstellung `Emit user token on Channel 0` im Informationsfenster des [Pilot Seat](../controllers/PilotSeat.md) aktiviert ist, das über die `V`-Taste zugänglich ist. Dies stellt sicher, dass der Token des Benutzers auf Kanal 0 des [Pilot Seat](../controllers/PilotSeat.md) übertragen wird, anstelle einer `0` oder `1`.
> - Wir empfehlen, den Token nicht abzurufen und Dinge damit fest zu codieren. Der Token wird jedes Mal neu generiert, wenn der Spieler sich mit dem Server verbindet, aus Sicherheitsgründen. Wenn ein böswilliger Spieler den Token eines anderen Spielers erhält, könnte er ihn verwenden, um ohne dessen Wissen beliebige Inhalte auf dem HUD dieses Spielers anzuzeigen.

### HUD Controller for server administrators
Der HUD Controller kann auch verwendet werden, um ein HUD zu erstellen, das für alle Spieler auf dem Server sichtbar ist.
Dazu muss ein Administrator einfach ein [OwnerPad](OwnerPad.md) auf dem Build platzieren, auf dem sich der HUD Controller befindet.

Verbinden Sie dann den HUD Controller mit einem [Computer](../computers/Computer.md) und senden Sie den Text `*` an Kanal 0 des HUD Controllers, um ihn anzuweisen, alle Tokens zu abonnieren.

> **Hinweis**: Wenn ein Serveradministrator einen HUD Controller für alle Spieler erstellt, kann dieser nicht deaktiviert werden. Daher muss darauf geachtet werden, keinen HUD Controller zu erstellen, der für die Spieler störend sein könnte.
