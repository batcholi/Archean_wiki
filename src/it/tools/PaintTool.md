<p align="center">
    <img src="PaintTool.png" />
</p>

|Item|`PaintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Il Paint Tool permette di dipingere blocchi, cavi, etichette e componenti con colori personalizzati e finiture superficiali.

# Usage

## Controls
| Azione | Controllo |
|--------|---------|
| Dipingi faccia | **Tasto sinistro** |
| Dipingi blocco intero (tutte le facce) | **Shift** + **Tasto sinistro** |
| Preleva colore dal blocco | **Tasto destro** |
| Sostituisci colore in tutta la costruzione | **X** + **Tasto sinistro** |

## Color Palettes
Il Paint Tool utilizza un sistema di palette per salvare e organizzare i colori.

### Palette Management
- **Create**: Crea una nuova palette vuota
- **Copy**: Duplica la palette corrente con un nuovo nome
- **Delete**: Rimuovi la palette corrente

### Adding Colors
Clicca il pulsante **+** nella palette per aggiungere un nuovo slot colore.

## Color Picker
La sezione inferiore dell'interfaccia contiene:

1. **RGB Color Picker**: Seleziona qualsiasi colore usando la barra della tonalita' e il quadrato saturazione/valore
2. **Gamma Preview**: Mostra come apparira' il colore nel gioco con le tue impostazioni gamma

## Surface Materials
Ogni colore puo' avere una finitura superficiale diversa:

| Materiale | Aspetto |
|----------|------------|
| **Matte** | Superficie ruvida, non riflettente |
| **Glossy** | Superficie liscia e lucida |
| **Metal** | Superficie metallica ruvida |
| **Chrome** | Superficie metallica a specchio |
| **Transparent** | Trasparente (per effetti vetro) |

## Replace Color
Tieni premuto **X** e premi il **tasto sinistro** su qualsiasi superficie dipinta per sostituire quel colore in tutta la costruzione. Funziona su:
- **Blocchi**: Sostituisce tutti i blocchi che condividono lo stesso indice di colore
- **Tubi/Cavi**: Sostituisce tutti i tubi con lo stesso colore
- **Componenti**: Sostituisce tutti i componenti dello stesso tipo e materiale

## Symmetry Painting
Quando la costruzione ha la [modalita' simmetria](ConstructorTool.md) abilitata, il Paint Tool dipinge automaticamente anche il blocco specchiato. Questo si applica a:
- Pittura singola faccia
- Pittura blocco intero (**Shift**)

Se il blocco si trova sul piano di simmetria, viene dipinta la faccia specchiata sullo stesso blocco.

> **Nota**: La sostituzione del colore (**X**) influisce sempre sull'intera costruzione indipendentemente dalla simmetria, quindi la simmetria non viene applicata in quella modalita'.

# Notes
- Dipingere un blocco applica il colore **per faccia** (usa Shift per tutte le facce)
- I cavi hanno opzioni di personalizzazione aggiuntive, vedi [Spool](../consumables/Spool.md#painting-cables)
