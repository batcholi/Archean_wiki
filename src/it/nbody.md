# Fisica N-Body

## Introduzione
Archean supporta due tipi di fisica per le entita situate al di fuori dell'atmosfera di un corpo celeste:

- **Fisica a gravita dominante (predefinita)**: Il corpo celeste con la maggiore influenza gravitazionale influenzera l'entita.
- **Fisica N-Body**: Tutti i corpi celesti influenzeranno l'entita.

## Perche la fisica N-Body non e abilitata per impostazione predefinita?
La **fisica N-Body** offre una simulazione piu realistica, per i giocatori con conoscenze avanzate di fisica spaziale che desiderano una sfida aggiuntiva. Nella realta, le agenzie spaziali si affidano a supercomputer per calcolare le traiettorie di satelliti e sonde e regolarle secondo necessita. In *Archean*, i giocatori devono eseguire questi calcoli manualmente, vincolati dalla potenza di calcolo limitata di un computer **Xenoncode**.

Un problema unico in *Archean* e la vicinanza della Luna alla Terra durante quell'era, che rende quasi impossibile ottenere un'orbita stabile attorno alla Terra senza essere fortemente influenzati dalla gravita lunare. Tuttavia, con la **fisica a gravita dominante**, i giocatori possono concentrarsi sulla gravita terrestre e ignorare l'influenza della Luna quando sono in orbita attorno alla Terra.

## Configurazione
Per abilitare la fisica N-Body, devi modificare il file `Archean-data/server/ARCHEAN_celestial.ini` e impostare il valore di `nbody` su `yes`.

---
## Informazioni aggiuntive
Quando si utilizza la fisica N-Body, non raccomandiamo l'uso del [NavInstrument](/components/navigation/NavInstrument.md) che e progettato per funzionare nativamente con la fisica a gravita dominante. E possibile usarlo con la fisica N-Body, ma restituira informazioni imprecise e la tua orbita non sara stabile.

