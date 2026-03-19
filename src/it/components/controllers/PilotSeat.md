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
Il Pilot Seat consente a un giocatore di controllare (inviare valori su diversi canali) un componente utilizzando i controlli veicolo associati da tastiera, controller o joystick.

# Usage
Premi `R` per sederti sul sedile.
Premi `R` per uscire dal sedile.

> Puoi attivare **Tieni premuto il tasto per uscire dal sedile** nelle impostazioni di gioco se preferisci il vecchio comportamento di tenere premuto R per un secondo.

> Mentre sei seduto, puoi spostarti su un altro sedile vicino senza dover uscire dal sedile attuale usando il tasto `R`.
> Quando esci da un sedile, il gioco ricorda dove ti trovavi rispetto alla costruzione quando ti sei seduto, e quello sarà il punto in cui ti troverai quando uscirai.

## Configuration
Nella finestra informativa del Pilot Seat accessibile con il tasto `V`:

| Option | Description |
|--------|-------------|
| **Smooth Controls** | Attenua gli input da tastiera per i giocatori senza joystick |
| **Emit user token on Channel 0** | Invia il token dell'utente sul Canale 0 invece di `1` (attivato per impostazione predefinita) |

Il token utente può essere utilizzato con un [HUD Controller](../miscellaneous/HudController.md) per identificare quale utente è seduto.

### List of outputs
|Channel|Function|Range|
|---|---|---|
|0|Using|1 o il token dell'utente seduto nel Pilot Seat, altrimenti 0|
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

> Se è presente un [OwnerPad](../miscellaneous/OwnerPad.md), è necessario avere il permesso "`Sit`" per sedersi sul sedile e `Interact` per utilizzare i controlli.
