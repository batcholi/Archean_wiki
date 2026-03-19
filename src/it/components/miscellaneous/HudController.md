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

L'HUD Controller e' un componente che permette di creare un HUD e visualizzarlo sullo schermo del giocatore quando si iscrive ad esso. Ad esempio, consente di creare una o piu' interfacce personalizzate sulle costruzioni.

# Usage
Quando si posiziona un HUD Controller sulla costruzione, ha due pulsanti:
- **Code**:
	- Apre l'IDE XenonCode, dove e' possibile scrivere il codice per l'HUD. Consultare la sezione [HUD](../../xenoncode/hud.md) per maggiori informazioni sulla creazione di HUD.
- **Active**: 
	- Permette di iscriversi o disiscriversi dall'HUD Controller.

> Quando l'IDE e' aperto, ci si iscrive automaticamente all'HUD Controller fintanto che l'IDE rimane aperto.

## Control via its data port
### Usage with a [Pilot Seat](../controllers/PilotSeat.md)
L'iscrizione all'HUD Controller puo' essere effettuata anche tramite la sua porta dati utilizzando un [Pilot Seat](../controllers/PilotSeat.md), che ha la capacita' unica di inviare un identificatore univoco (Token) sul suo canale 0 (Using). E' possibile collegare un [Pilot Seat](../controllers/PilotSeat.md) direttamente alla porta dati dell'HUD Controller, consentendo di iscriversi all'HUD Controller quando si e' seduti nel [Pilot Seat](../controllers/PilotSeat.md) e di disiscriversi quando lo si lascia.

E' anche possibile utilizzare un [Pilot Seat](../controllers/PilotSeat.md) collegato a un [Computer](../computers/Computer.md) per iscriversi all'HUD Controller. In questo caso, e' necessario utilizzare il canale 0 (Using) del [Pilot Seat](../controllers/PilotSeat.md) per inviare il Token alla porta dati dell'HUD Controller.

> - Assicurarsi che l'impostazione `Emit user token on Channel 0` sia abilitata nella finestra informativa del [Pilot Seat](../controllers/PilotSeat.md), accessibile con il tasto `V`. Questo garantisce che il Token dell'utente venga trasmesso sul canale 0 del [Pilot Seat](../controllers/PilotSeat.md) invece di un `0` o `1`.
> - Si raccomanda di non recuperare il Token e di non codificarlo in modo fisso. Il Token viene rigenerato ogni volta che il giocatore si connette al server per motivi di sicurezza. Se un giocatore malintenzionato ottiene il Token di un altro giocatore, potrebbe usarlo per visualizzare qualsiasi cosa sull'HUD di quel giocatore senza che ne sia a conoscenza.

### HUD Controller for server administrators
L'HUD Controller puo' anche essere utilizzato per creare un HUD visibile a tutti i giocatori sul server.
Per farlo, un amministratore deve semplicemente posizionare un [OwnerPad](OwnerPad.md) sulla costruzione dove si trova l'HUD Controller.

Quindi, collegare l'HUD Controller a un [Computer](../computers/Computer.md) e inviare il testo `*` al canale 0 dell'HUD Controller per istruirlo a iscriversi a tutti i token.

> **Nota**: Quando un amministratore del server crea un HUD Controller per tutti i giocatori, non puo' essere disabilitato. Pertanto, bisogna fare attenzione a non creare un HUD Controller che possa disturbare i giocatori.
