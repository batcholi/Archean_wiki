# Interfacce e gestione dell'inventario

Questa pagina tratta tutti i sistemi di interfaccia utente in Archean, inclusa la gestione dell'inventario, le scorciatoie e la manipolazione delle finestre.

---

## Inventari dell'avatar

Il giocatore ha accesso a due inventari personali:

### Cintura

La **cintura** e la barra di accesso rapido nella parte inferiore dello schermo.

- Contiene **9 slot** per strumenti e oggetti
- Seleziona gli oggetti usando i tasti da **1** a **9**
- Le rocce raccolte vanno prima nella cintura, poi traboccano nello zaino
- L'oggetto attivo mostra un contorno verde

### Zaino

Lo **zaino** e il tuo spazio di stoccaggio principale dell'inventario.

- Apri/chiudi con **Tab**
- In modalita Adventure: **48 slot**
- In modalita Creative: slot illimitati con oggetti pre-inseriti
- Ha una **barra di ricerca** per filtrare gli oggetti per nome
- La massa degli oggetti influisce sulla velocita di movimento in modalita Adventure

---

## Sistema della mano

La **Mano** e l'oggetto attualmente selezionato/attivo.

| Azione | Descrizione |
|--------|-------------|
| **Tasti numerici (1-9)** | Seleziona lo slot della cintura come attivo |
| **Doppio clic** su qualsiasi oggetto | Lo seleziona come attivo (funziona da qualsiasi inventario aperto) |

Quando hai uno strumento in mano, puoi usarlo con:
- **Clic sinistro** (funzione principale)
- **Clic destro** (funzione secondaria)
- **Tieni premuto C** per configurare lo strumento
- **Tieni premuto X** per la modalita speciale

---

## Interazione con i componenti

Premi **F** per interagire con il componente o lo schermo che stai puntando (aprire inventari, premere pulsanti, attivare interruttori, regolare leve, cliccare sugli schermi...).

Inoltre, puoi fare **clic sinistro** direttamente sui componenti:

| Condizione | Comportamento |
|-----------|----------|
| **Mouse libero** (nessun controllo della visuale) | Clicca su qualsiasi componente visibile per interagire |
| **Controllo visuale senza oggetto attivo** | Clicca per interagire con il componente nel tuo mirino |
| **Controllo visuale con oggetto attivo** | Il clic sinistro e usato dallo strumento — l'interazione con i componenti e disabilitata |

> **Nota:** L'interazione tramite clic sinistro ti permette di premere pulsanti o attivare interruttori senza dover riporre lo strumento — basta liberare il mouse o svuotare la mano.

---

## Manipolazione degli oggetti

### Trascina e rilascia

| Azione | Descrizione |
|--------|-------------|
| **Trascina oggetto** | Sposta l'oggetto tra slot o inventari |
| **Rilascia fuori dall'inventario** | Lascia cadere l'oggetto a terra (crea una scatola) |

### Impilamento e divisione

Mentre trascini una pila di oggetti:

| Azione | Descrizione |
|--------|-------------|
| **Clic destro** | Rilascia **1** oggetto dalla pila |
| **Shift + Clic destro** | Rilascia **meta** della pila |
| **Rilascia sullo stesso tipo di oggetto** | Impila gli oggetti insieme (se c'e spazio) |

### Trasferimento rapido

| Azione | Descrizione |
|--------|-------------|
| **Shift + Clic sinistro** | Sposta rapidamente l'oggetto in un altro inventario aperto |

Funziona tra il tuo zaino e qualsiasi contenitore aperto. Gli oggetti tenteranno prima di impilarsi con oggetti esistenti dello stesso tipo.

---

## Fabbricazione

Apri lo zaino (**Tab**) per accedere all'interfaccia di fabbricazione sul lato sinistro.

### Azioni di fabbricazione

| Modalita | Pulsanti disponibili |
|------|-------------------|
| **Predefinita** | **+1** e **+10** |
| **Tieni premuto Shift** | **+50** e **+max** (in base alle risorse disponibili) |

Clicca su un ingrediente per espandere e vedere le sotto-ricette (fabbricazione ricorsiva).

### Requisiti di fabbricazione

- Gli ingredienti solidi devono essere nel tuo zaino (o in qualsiasi inventario aperto)
- I fluidi (H₂O, H₂, O₂) devono essere forniti tramite **bombole** negli slot dedicati ai fluidi nella parte inferiore della finestra di fabbricazione
- Puoi fabbricare usando risorse da qualsiasi inventario aperto - gli ingredienti vengono automaticamente spostati nel tuo zaino

### Area di lavorazione oggetti

L'Area di lavorazione oggetti (1 slot) e usata per **lavorare oggetti**, non per la fabbricazione. Per esempio:
- Frantumare rocce in minerali (inizio gioco in modalita Adventure)

### Slot per fluidi

Nella parte inferiore della finestra di fabbricazione, puoi vedere i tuoi livelli di fluidi: **Acqua**, **Idrogeno** e **Ossigeno**.

- Il tuo avatar ha un **serbatoio d'acqua integrato** che si riempie automaticamente quando i tuoi piedi toccano l'acqua (oceano, lago)
- Il toggle **Elettrolisi** converte l'acqua in idrogeno e ossigeno per le ricette di fabbricazione che li richiedono

---

## Inventari esterni (Contenitori)

Interagisci con un [Container](components/storage/Container.md) usando **F** per aprire il suo inventario.

### Usare strumenti dai contenitori

Alcuni strumenti possono operare direttamente dall'interno di un contenitore:

1. Posiziona lo strumento nel contenitore
2. **Doppio clic** sullo strumento per attivarlo
3. Lo strumento usera le risorse dal contenitore invece che dal tuo zaino

> **Suggerimento:** Se hai un oggetto da un contenitore selezionato in mano, premere **Tab** aprira automaticamente sia il tuo zaino che il contenitore di origine.

Questo e particolarmente utile quando le risorse sono troppo pesanti da trasportare sul tuo avatar:
- **Constructor Tool** - costruisci usando componenti stoccati nel contenitore
- **Destructor Tool** - i componenti distrutti vanno nel contenitore
- **Spool Tool** - usa le bobine di cavo dal contenitore
- **Blueprint Tool** - genera veicoli in modalita Adventure con tutti i componenti necessari nel contenitore
- **Rock Rake Tool** - le rocce raccolte vanno nel contenitore

### Limiti di distanza

Gli inventari aperti hanno una distanza massima di interazione:
- **Contenitori**: 100 metri
- **Scatole lasciate cadere**: 10 metri

Quando ti allontani oltre il limite, gli oggetti diventano **grigi** e non possono essere manipolati. La finestra dell'inventario si chiudera automaticamente se ti allontani troppo.

### Fabbricazione da inventari aperti

Quando un contenitore e aperto, il sistema di fabbricazione dell'avatar puo prelevare automaticamente gli ingredienti da esso. Questo ti permette di fabbricare oggetti usando risorse stoccate nei contenitori senza doverle trasferire manualmente nel tuo zaino.

---

## Posizionamento di componenti al suolo

Alcuni componenti possono essere posizionati direttamente sul terreno senza bisogno di una struttura esistente.

1. Seleziona il componente nella tua mano
2. Punta il terreno (entro **10 metri**)
3. **Clic sinistro** per posizionarlo

| Azione | Descrizione |
|--------|-------------|
| **Clic sinistro** | Posiziona il componente |
| **Tieni premuto Shift + Rotella del mouse** | Ruota il componente |

Il componente si allineera automaticamente alla direzione della gravita locale. Una nuova struttura viene creata per contenere il componente.

---

## Gestione delle finestre

### Fissare le finestre dell'inventario

Molte finestre di stoccaggio possono essere **fissate** per mantenerle aperte:
- Contenitori
- Computer (alloggiamento HDD, IDE)
- Slot del combustibile del Fission Reactor
- Cestini
- Scatole di oggetti lasciati cadere

| Azione | Descrizione |
|--------|-------------|
| **Clicca icona puntina** | Fissa la finestra |
| **Clicca X** | Chiudi e sblocca la finestra |
| **ESC** | Nascondi tutte le finestre fissate |
| **Tab** | Riporta le finestre fissate nascoste |

### Finestre GetInfo

Premi **V** puntando un componente per aprire la sua finestra informativa. Questo sistema funziona separatamente dal fissaggio dell'inventario:

| Azione | Descrizione |
|--------|-------------|
| **Clicca icona puntina** | Mantieni la finestra aperta |
| **Clicca X** | Chiudi e sblocca la finestra |

- Piu finestre GetInfo possono essere fissate contemporaneamente
- Le finestre fissate mostrano **valori aggiornati in tempo reale**
- **ESC non influisce** sulle finestre GetInfo

Questo e utile per monitorare piu componenti contemporaneamente (es. livelli delle batterie, pressioni dei serbatoi, letture dei sensori).
