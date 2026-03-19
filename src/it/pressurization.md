# Pressurizzazione

La pressurizzazione in Archean ti permette di creare compartimenti sigillati che possono contenere gas a pressioni diverse rispetto all'ambiente circostante. Questo e essenziale per costruire cabine di veicoli spaziali, sottomarini, dirigibili o serbatoi di carburante personalizzati.

## Come funziona

### Il componente Volume

Il componente [Volume](components/fluids/Volume.md) e il nucleo del sistema di pressurizzazione. Quando posizionato all'interno di una struttura e scansionato, utilizza un **algoritmo basato su voxel** per rilevare i confini dello spazio chiuso.

1. **Scansione**: Clicca il pulsante `Scan` sul componente Volume per analizzare lo spazio circostante
2. **Propagazione**: Il sistema si espande in tutte le direzioni (X, Y, Z) fino a incontrare blocchi solidi/ermetici
3. **Stato**:
   - **AIRTIGHT** (verde): Il compartimento e completamente sigillato
   - **LEAK** (rosso): C'e un'apertura verso l'esterno

> Ogni componente Volume rileva solo il compartimento in cui e posizionato. Hai bisogno di componenti Volume separati per ogni compartimento isolato.

### Componenti ermetici

Non tutti i componenti sigillano un volume. Solo i componenti contrassegnati come **ermetici** fungono da pareti per la pressurizzazione. Questi includono:

| Categoria | Componenti ermetici |
|----------|---------------------|
| **Giunti** | Small Hinge, Small Pivot, Linear Track |
| **Bridge** | Data Bridge, Fluid Bridge, Item Bridge, Low/High Voltage Bridge |
| **Giunzioni** | Fluid Junction, Item Junction |
| **Stoccaggio** | Container, Small Container |
| **Aggancio** | Dockable Door |
| **Altro** | Passive Radiator, Aileron, Mini Router... |

I blocchi di costruzione standard (telai, pannelli) sono anch'essi ermetici per impostazione predefinita.

## Giunti e pressurizzazione

I giunti ([Small Hinge](components/joints/SmallHinge.md), [Small Pivot](components/joints/SmallPivot.md), [Linear Track](components/joints/LinearTrack.md)) hanno un comportamento speciale:

- **Quando allineati** (posizione neutra, valore = 0): Il giunto e ermetico e sigilla il volume
- **Quando spostati** (qualsiasi altra posizione): Il giunto rompe il sigillo, causando una perdita

Questo ti permette di creare **porte e portelli funzionali**:

1. Costruisci un telaio per la porta con i blocchi
2. Posiziona uno Small Hinge o Small Pivot
3. Costruisci il pannello della porta sulla parte mobile del giunto
4. Quando il giunto torna alla posizione 0, il compartimento si sigilla

> **Importante**: Quando un giunto si muove, il componente Volume esegue automaticamente una nuova scansione per rilevare se il sigillo e stato rotto.

## Dockable Door

Il [Dockable Door](components/docking/DockableDoor.md) ha una gestione integrata della pressurizzazione:

- **Chiuso**: Funge da sigillo ermetico
- **Aperto**: Permette il trasferimento di gas tra:
  - Il compartimento interno e l'ambiente esterno (se non agganciato)
  - Due compartimenti agganciati (se agganciato con un altro Dockable Door)

Quando due veicoli spaziali si agganciano e aprono i loro Dockable Door, le loro atmosfere si mescolano e la pressione si equalizza.

## Fluid Port - L'interfaccia chiave

Il [Fluid Port](components/fluids/FluidPort.md) e il **componente essenziale** per interagire con i volumi pressurizzati. E l'unico modo per iniettare o estrarre fluidi programmaticamente da un compartimento sigillato.

### Come funziona

Il Fluid Port funge da **ponte** tra il sistema dei fluidi (pompe, serbatoi, tubazioni) e un volume pressurizzato:

- **La posizione conta**: L'ugello del port deve essere **fisicamente all'interno** del volume pressurizzato per interagire con esso
- **Rilevamento automatico**: Rileva automaticamente se si trova all'interno di un volume scansionato o nell'ambiente esterno
- **Bidirezionale**: Puo sia immettere fluidi in un volume che estrarli

### Limitazioni fisiche

Il Fluid Port ha limiti fisici predefiniti:

| Proprieta | Valore |
|----------|-------|
| **Portata massima** | 1,0 m³/s |
| **Calcolo della portata** | Limitato da `min(massa_richiesta / densita, 1,0 m³/s × deltaTime)` |

Questo significa:
- I fluidi densi (liquidi) trasferiscono piu massa al secondo rispetto ai fluidi leggeri (gas)
- Non puoi riempire o svuotare istantaneamente un volume - ci vuole tempo
- Piu Fluid Port possono essere usati in parallelo per aumentare la portata totale

### Scenari d'uso

#### Riempire un serbatoio di carburante personalizzato
1. Costruisci un compartimento sigillato con un componente Volume
2. Posiziona un Fluid Port con il suo ugello **all'interno** del volume
3. Collega il Fluid Port a una Fluid Pump e a una fonte di carburante (serbatoio, elettrolizzatore, ecc.)
4. La pompa spinge il carburante attraverso il Fluid Port nel tuo serbatoio personalizzato

#### Estrarre da un Volume
1. Posiziona un Fluid Port all'interno del volume pressurizzato
2. Collegalo a una pompa configurata per aspirare
3. La composizione del fluido all'interno del volume viene estratta proporzionalmente

#### Supporto vitale della cabina
1. Crea una cabina sigillata con un componente Volume
2. Posiziona un Fluid Port all'interno per iniettare atmosfera respirabile
3. Collega a una fonte di ossigeno e a una pompa
4. Usa un secondo Fluid Port per sfiatare la CO2 o mantenere la pressione

### Rilevamento dell'ambiente

Quando il Fluid Port **non** e all'interno di un volume pressurizzato, interagisce con l'**ambiente esterno**:
- Sulla Terra: Aspira aria atmosferica (miscela N2, O2)
- In acqua: Aspira H2O
- Nello spazio: Nulla da aspirare (vuoto)

Premi `V` su un Fluid Port per vedere:
- Densita attuale dell'ambiente (kg/m³)
- Composizione dell'ambiente (percentuale per volume)

## Fisica dei gas

Il sistema di pressurizzazione simula un comportamento realistico dei gas:

### Proprieta monitorate
- **Pressione** (Pascal/kPa)
- **Temperatura** (Kelvin)
- **Densita** (kg/m³)
- **Composizione** (O2, N2, H2, CH4, H2O, ecc.)
- **Livello del liquido** (per lo stoccaggio di liquidi)

### Trasferimento di gas
- I gas fluiscono dall'alta pressione alla bassa pressione
- La velocita di trasferimento dipende dalla differenza di pressione e dalla dimensione dell'apertura
- La temperatura viene mediata quando i gas si mescolano

### Perdite
Quando un compartimento ha una perdita:
- Il gas fuoriesce verso (o entra dall') ambiente
- Il trasferimento continua fino all'equalizzazione delle pressioni
- Nello spazio (vuoto), tutto il gas finira per fuoriuscire

## Consigli di costruzione

### Creare una cabina sigillata

1. Costruisci uno spazio chiuso con blocchi su tutti i lati
2. Posiziona un componente Volume all'interno
3. Clicca `Scan` - se mostra **AIRTIGHT**, hai finito
4. Se mostra **LEAK**, controlla le fessure nella tua struttura

### Fonti comuni di perdite

- Blocchi mancanti negli angoli o nei bordi
- Giunti che non sono alla posizione 0
- Dockable Door aperti
- Componenti non ermetici posizionati nelle pareti

### Compartimenti multipli

Per costruzioni complesse con piu aree sigillate:
- Posiziona un componente Volume per compartimento
- Ognuno monitorera la propria pressione e composizione
- I volumi collegati (che condividono lo spazio) trasferiranno automaticamente i gas tra di loro

### Usare i Volume come serbatoi di carburante

Il componente Volume puo contenere qualsiasi fluido, non solo aria respirabile:
- Riempi con O2 liquido, H2, CH4 o H2O
- Usa con le [Fluid Pump](components/fluids/fluidPump/FluidPump.md) per estrarre il carburante
- La forma irregolare della tua costruzione diventa la forma del tuo serbatoio
