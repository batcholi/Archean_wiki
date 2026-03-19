# XenonCode IDE
Il **XenonCode IDE** e' un'interfaccia che permette di creare/modificare script e programmi per controllare componenti e sistemi. E' basato sul linguaggio di programmazione **XenonCode**, scritto appositamente per questo gioco.

## Features
- **Text Editor**: Un editor di testo con evidenziazione della sintassi per scrivere script/programmi.
- **Node Editor**: Un sistema di programmazione alternativo basato su nodi visuali per creare script in modo visuale e intuitivo.
- **Console**: Una console per visualizzare informazioni, messaggi di debug e di errore.
- **Toolbar**: Una barra degli strumenti per creare/eliminare script/programmi, riavviare il sistema e accedere alla documentazione disponibile nella pagina [Archean](archean.md).

---
## Using the IDE on computers
Il pulsante `CODE` sui computer permette di accedere all'IDE. Da li', puoi iniziare a scrivere script e programmi per controllare componenti e sistemi.

### IDE Library
L'IDE include una funzionalita' Library che permette di salvare e riutilizzare localmente file XenonCode su diversi computer. Questo e' utile per condividere funzioni comuni, script di utilita' o template tra piu' computer di gioco senza dover copiare e incollare manualmente il codice.

### Additional information specific to computers
#### [Computer](../components/computers/Computer.md)
Il computer ha uno schermo touch integrato e un BIOS con interfaccia grafica che visualizza le informazioni di sistema e i programmi disponibili sul disco rigido all'avvio. Puoi selezionare un programma da eseguire puntandolo e premendo il tasto `F`.

#### [Mini Computer](../components/computers/MiniComputer.md)
Il MiniComputer e' piu' piccolo del Computer e non ha uno schermo touch ne' un BIOS visuale. Eseguira' nativamente il primo programma creato sul disco rigido.

## Interface
L'interfaccia del XenonCode IDE funziona molto come un normale IDE che i programmatori usano, tranne che invece di avere una gerarchia di file, tutti i file nel HDD del computer virtuale saranno sempre aperti come schede.
Le schede possono essere spostate e agganciate dentro e fuori dall'IDE, affiancate, sovrapposte, ecc.
Puoi avere piu' IDE (cioe' da piu' computer di gioco) aperti contemporaneamente nel gioco, anche se non possono essere agganciati/affiancati tra loro.

## Creating a custom BIOS
E' possibile personalizzare il BIOS del computer creando un file chiamato `main.xc`. Questo file e' il primo ad essere eseguito quando un computer si avvia. Puoi usarlo per modificare l'aspetto del BIOS o per caricare automaticamente un programma o eseguire direttamente qualsiasi tipo di codice.

## Programs vs Files
Un Programma e' un file che puo' essere caricato usando `load_program()`, e il suo nome terminera' in `*.main.xc` (non devi aggiungerlo nel nome, scrivi solo il prefisso).
Un File deve essere incluso all'interno di un programma, non puo' essere caricato come programma autonomo, ma puo' essere un BIOS personalizzato quando denominato esattamente `main.xc` senza alcun prefisso.
I Programmi possono essere scritti sia con il sistema Node che con codice puro, mentre i file normali possono essere scritti solo in codice puro.
I Programmi possono fare `include()` di file o altri programmi, purche' non ci siano conflitti di nomi nel loro contenuto, e sia definito un solo punto di ingresso `init`.

## Switching between modes (visual nodes / code)
Quando crei un programma, iniziera' con la modalita' Visual Nodes e alcuni nodi IO iniziali come esempio che puoi eliminare.
Il sistema Visual Nodes generera' sempre automaticamente codice in background man mano che fai modifiche.
Puoi "Switch To Code" in qualsiasi momento, tuttavia non sara' modificabile immediatamente.
Per renderlo modificabile, puoi "Convert to Code", che semplicemente commentera' la prima riga #NODES che definisce i nodi, e potrai modificare il codice.
Dopo aver modificato il codice, se vuoi tornare ai nodi, il tuo codice verra' sovrascritto dai nodi che avevi prima di passare inizialmente al codice.
Questo significa che tipicamente, quando si converte in codice, e' permanente, a meno che tu non voglia ripristinarlo com'era.

## Running the code
I computer nel gioco si riavvieranno sempre automaticamente ogni volta che una modifica viene salvata nel file corrente (CTRL+S).
Salvare senza fare modifiche non fara' nulla, ma puoi forzare il riavvio usando CTRL+SHIFT+S, che forzera' anche il salvataggio di TUTTI i file aperti.
Al riavvio dopo aver salvato una modifica, il computer carichera' immediatamente il programma precedente se ce n'era uno in esecuzione, senza passare dal BIOS.
Se si verifica un errore, sia da un errore di sintassi che da un errore a runtime (come una divisione per zero o un'indicizzazione errata), il computer si blocchera' e lo schermo diventera' nero, e l'errore apparira' nella console. A quel punto, dovrai correggere il problema e riavviarlo salvando il file modificato.

## Persistency
I computer nel gioco funzionano tutti lato server, e continueranno a funzionare quando ti disconnetti, se stai giocando su un server dedicato.
I file sono salvati sull'HDD del server in testo semplice, incluso un file temporaneo per le modifiche non salvate, che viene aggiornato ad ogni singola modifica, quindi non perderai il tuo codice.
Anche se non avevi salvato il file, se il gioco crasha, sia che tu stia giocando in locale o in remoto, lo recupererai quando ti riconnetti.
Se preferisci usare un IDE esterno al gioco, come vscode, puoi anche modificare i file direttamente sul server, se lo stai ospitando tu o stai giocando in locale.
Gli HDD virtuali sono memorizzati in `Archean-data/server/worlds/<WORLD_NAME>/ARCHEAN_computer/HDD-*` e contengono i file .xc come li hai creati, oltre alla sotto-directory `storage` che conterra' le variabili di storage nei propri file individuali con i loro valori in testo semplice, separati da newline per gli array.
Quando modifichi un file esternamente, il gioco rilevera' qualsiasi modifica apportata al programma attualmente in esecuzione e riavviera' automaticamente il computer.
Modificare un file di storage tuttavia, non causera' un riavvio, e i valori non saranno usati immediatamente, poiche' sono memorizzati nella cache nella memoria del computer al caricamento.
I file di storage saranno aggiornati immediatamente sull'HDD del server alla modifica del valore.

## Collaboration
L'IDE e' collaborativo, il che significa che piu' giocatori possono almeno visualizzare i contenuti, mentre un singolo giocatore alla volta puo' modificare il codice.
Ogni volta che il giocatore editore fa una modifica, anche se non salvata, gli altri giocatori vedranno la modifica avvenire in tempo reale, sia in modalita' Code che Nodes.
I giocatori non-editore sono in sola lettura, non possono modificare il codice o i nodi, finche' non cliccano su Edit, nel qual caso diventeranno l'editore corrente e l'editore precedente diventera' un visualizzatore in sola lettura.

## Shortcut keys
- `CTRL+S` Salva il file corrente e riavvia il computer
- `CTRL+SHIFT+S` Salva tutti i file e riavvia il computer
- `CTRL+D` Seleziona la prossima occorrenza nel codice, o duplica il/i nodo/i selezionato/i in modalita' Nodes
- `CTRL+C` Copia il codice o i nodi selezionati
- `CTRL+V` Incolla il codice o i nodi
- `CTRL+N` Crea un nuovo File
- `CTRL+SHIFT+N` Crea un nuovo Programma
- `CTRL+Q` Chiudi l'IDE

## VSCode
Abbiamo reso disponibile un'estensione vscode per supportare l'evidenziazione della sintassi XenonCode e alcune funzionalita' di linting, se desideri usarla.

---
