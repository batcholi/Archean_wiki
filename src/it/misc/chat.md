# Chat e comandi

## Sistema di chat
La chat permette ai giocatori di comunicare tra loro. Per chattare con gli altri giocatori, premi `Invio` per aprire la chat, poi digita il tuo messaggio e premi `Invio` di nuovo per inviarlo.
> - Hai la possibilita di copiare un messaggio semplicemente cliccandoci sopra con il `tasto sinistro del mouse`. I messaggi su piu righe sono pienamente supportati.
> - La lunghezza massima di un messaggio e limitata a 800 caratteri.
> - Le conversazioni in chat vengono registrate nel file di log del server.

### Cronologia dei comandi
Quando la chat e aperta, usa i **tasti freccia Su/Giu** per scorrere i comandi inseriti in precedenza. Un popup visivo appare sopra la casella di input mostrando fino a 20 voci recenti. Puoi anche cliccare su qualsiasi voce per selezionarla.

> **Nota:** Se i suggerimenti dei comandi sono visibili (completamento automatico), i tasti freccia navigano tra i suggerimenti. La navigazione nella cronologia riprende quando non ci sono suggerimenti visualizzati.

## Comandi
I comandi ti permettono di eseguire azioni specifiche digitandoli nella chat, preceduti da un `/`. Sono disponibili diversi comandi, alcuni dei quali sono riservati agli amministratori.

#### Lista dei comandi disponibili per tutti i giocatori:
- `/clear` - Cancella i messaggi visualizzati nella chat.
- `/help` - Mostra la lista dei comandi disponibili e i loro effetti.
- `/list` - Mostra la lista dei giocatori connessi.
- `/info` - Mostra informazioni sul server. *(Nome del server, carico CPU, tick al secondo (25 tick/s e il valore ideale per un server stabile))*

#### Lista dei comandi disponibili per gli amministratori:
- `/save` - Salva lo stato attuale del gioco.
- `/setspawn <username>` - Imposta il punto di spawn per un utente specifico.
- `/give [<stack>] [<moduleName>.]<itemType> [<inventoryAlias|username>]` - Fornisce oggetti a un giocatore. Se non viene specificato un username, gli oggetti vengono dati a te stesso.
- `/kick <username|id>` - Espelle un giocatore dal server.
- `/ban <username|id>` - Banna un giocatore dal server.
- `/timeadd [-]<hours>` - Aggiunge o sottrae tempo nel gioco.
