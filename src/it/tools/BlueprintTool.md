<p align="center">
    <img src="BlueprintTool.png" />
</p>

|Item|`BlueprintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Il Blueprint Tool permette di salvare una copia di una costruzione. I Blueprint vengono salvati nella cartella `(Client Settings)/blueprints` in formato `.json`, uno per Blueprint con il rispettivo nome.

Con questo sistema, puoi trasferire le tue costruzioni in altri mondi o server, condividerle con gli amici o semplicemente duplicare una costruzione.

# Usage

## Scanning a Build
1. **Tasto sinistro** per entrare in modalita' scansione (raggio: 100 metri)
2. Punta la costruzione che vuoi salvare
3. **Tieni premuto il tasto sinistro** per un secondo per scansionare e salvare il Blueprint
4. Inserisci un nome nella finestra di dialogo

### Updating an Existing Blueprint
Per aggiornare un Blueprint esistente, inserisci semplicemente lo stesso identico nome di un Blueprint esistente. Il pulsante **Create** diventera' **Update**, permettendoti di sovrascrivere la versione precedente mantenendo l'ID Steam Workshop se pubblicato.

## Spawning a Blueprint
1. **Tasto destro** per aprire l'interfaccia dei Blueprint
2. Usa la **barra di ricerca** per filtrare i Blueprint per nome
3. Seleziona un Blueprint dalla scheda **Local** o **Steam Workshop**
4. Clicca **Spawn** per entrare in modalita' posizionamento

### Placement Controls

#### Free Placement (new build)
| Azione | Controllo |
|--------|---------|
| Conferma spawn | **Tieni premuto il tasto sinistro** (2 secondi) |
| Ruota | **Rotellina del mouse** |
| Aggancia al suolo e imposta come statico | **Tieni premuto Shift** |
| Annulla | **Tasto destro** |

#### On an Existing Build
Quando punti una costruzione esistente, **premi rapidamente il tasto sinistro** per agganciare il Blueprint e entrare in **modalita' Gizmo**:

| Azione | Controllo |
|--------|---------|
| Trasla / Ruota | **Maniglie Gizmo** (trascina) |
| Alterna visuale mouse | **Tasto destro** |
| Conferma spawn | **Tieni premuto il tasto sinistro** lontano dal gizmo (2 secondi), o pulsante **Spawn** |
| Annulla | **Tasto destro** (quando non in visuale mouse) |

### Spawning in Space
Quando sei nello spazio vicino a una costruzione esistente, puoi fare lo spawn dei Blueprint allo stesso modo della [creazione di una nuova costruzione](ConstructorTool.md#creating-a-build-in-space).

## Steam Workshop
- Clicca **Publish** accanto a un Blueprint locale per caricarlo su Steam Workshop
- Uno strumento di screenshot integrato e' disponibile durante la pubblicazione

# Notes
- In modalita' Adventure, gli oggetti richiesti vengono visualizzati con il loro stato (verde = disponibile, rosso = mancante, arancione = mod non attiva)
- Se e' stato aggiunto un [OwnerPad](../components/miscellaneous/OwnerPad.md), e' necessario avere il permesso "Build" per salvare un Blueprint
