# Push & Pull

In Archean, gli oggetti e i fluidi non si muovono da soli. Ogni trasferimento tra due componenti segue un modello **Push/Pull**: un lato deve attivamente iniziare l'azione, e l'altro lato deve accettarla.

Comprendere questo sistema e essenziale per costruire configurazioni funzionali. La pagina wiki di ogni componente indica la sua modalita Push/Pull nella tabella informativa in alto.

## I tre ruoli

### Initiate
Un componente che **inizia** un'azione avvia attivamente il trasferimento. Inviera oggetti/fluidi a tutto cio che e connesso alla sua uscita, o preleva da tutto cio che e connesso al suo ingresso.

### Accept
Un componente che **accetta** un'azione e passivo. Puo ricevere un push o rispondere a un pull, ma non avviera mai un trasferimento da solo.

### Forward
Un componente che **inoltra** un'azione la passa all'altro lato. Non immagazzina nulla — semplicemente trasmette l'azione di push o pull da una porta all'altra.

> Gli inoltri sono trasparenti: se qualcosa esegue un push in un lato di un Bridge, il Bridge esegue un push in tutto cio che si trova dall'altro lato. Lo stesso vale per i pull.

## Come funziona

- **Push**: La sorgente invia oggetti/fluidi alla destinazione. La sorgente decide *cosa* e *quando* inviare.
- **Pull**: La destinazione richiede oggetti/fluidi dalla sorgente. La destinazione decide *cosa* e *quando* prelevare.

Una connessione funziona solo quando un lato **inizia** e l'altro lato **accetta** (o inoltra a qualcosa che accetta). Due componenti passivi connessi insieme non trasferiranno mai nulla.

---

## Un errore comune

Considera questa configurazione: **Mining Drill → Container → Crusher**

Il Drill **inizia il push**, quindi le rocce arrivano nel Container. Ma il Container **accetta** soltanto — non inviera mai nulla da solo. E il Crusher **accetta solo il push** — non preleva dal Container. Risultato: le rocce si accumulano nel Container e nulla raggiunge il Crusher.

### Soluzioni

**Mining Drill → Crusher → Container**
Il Drill invia le rocce al Crusher, che le accetta, le lavora e invia i minerali risultanti al Container.

**Mining Drill → Container → Item Conveyor → Crusher → Container**
L'[Item Conveyor](components/items/ItemConveyor.md) e un **iniziatore** — preleva attivamente dal primo Container e invia al Crusher. Questo e utile quando vuoi accumulare le rocce o controllare la velocita di flusso.

---

## Leggere le pagine dei componenti

Ogni pagina di componente mostra la sua modalita Push/Pull nella tabella informativa:

| Modalita | Significato |
|---|---|
| `Initiate Push` | Invia attivamente alla sua uscita |
| `Initiate Pull` | Preleva attivamente dal suo ingresso |
| `Initiate Push/Pull` | Esegue attivamente entrambi |
| `Accept Push` | Riceve passivamente i push |
| `Accept Pull` | Risponde passivamente ai pull |
| `Accept Push/Pull` | Fa passivamente entrambi |
| `Accept Push/Pull -> Forwards action to other side` | Trasmette le azioni attraverso |

Alcuni componenti combinano i ruoli — per esempio, il Crusher **accetta il push** sul suo ingresso (rocce in entrata) e **inizia il push** sulla sua uscita (minerali in uscita).
