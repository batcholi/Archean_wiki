<p align="center">
  <img src="DashboardTool.png" />
</p>

|Item|`DashboardTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Il Dashboard Tool viene utilizzato per progettare dashboard con componenti piu' piccoli in modo piu' flessibile. Permette di posizionare schermi, pulsanti, LED, etichette e altri elementi su superfici per creare pannelli di controllo e display personalizzati.

# Usage
Premi `C` per aprire il menu radiale e selezionare l'elemento da posizionare.

Premi `V` per aprire il menu GetInfo di un elemento e accedere a opzioni aggiuntive.

## Available Elements

### Screens

| Tipo | Risoluzione | Dimensione massima |
|------|------------|----------|
| Standard Screen | 2 pixel/cm (200 px/m) | 4 m |
| HD Screen | 6 pixel/cm (600 px/m) | 50 cm |

Gli HD Screen offrono una densita' di pixel 3 volte superiore per display piu' dettagliati, ma sono limitati a 50 cm.

Gli schermi si aggiornano ogni 20 ms.

**Opzioni GetInfo (`V`):**
- **Matte**: Alterna tra superficie lucida e opaca

### Labels
Le Label funzionano come gli schermi ma con una risoluzione di 5 pixel/cm (500 px/m) e una dimensione massima di 1 m.

Le Label si aggiornano ogni 500 ms, rendendole piu' adatte per testi statici o che cambiano lentamente.

**Opzioni GetInfo (`V`):**
- **Text**: Inserisci il testo da visualizzare (multilinea supportato)
- **Text Align**: Center, Left, Right, Top, Bottom, Top Left, Bottom Left, Top Right, Bottom Right
- **Text Size**: da 1 a 8
- **Color picker**: Imposta il colore del testo

### Buttons

#### [PushButton](../components/controllers/PushButton.md)
Invia un segnale quando viene premuto.

**Opzioni GetInfo (`V`):**
- **Single Pulse**: Quando abilitato, invia un solo impulso per pressione invece di un segnale continuo finche' tenuto premuto

#### [ToggleButton](../components/controllers/ToggleButton.md)
Alterna tra gli stati on/off quando cliccato.

**Opzioni GetInfo (`V`):**
- **Allow IO input**: Accetta segnali di input per controllare lo stato
- **Horizontal**: Alterna l'orientamento orizzontale

#### ArrowButton
Pulsante direzionale con opzioni di rotazione.

**Opzioni GetInfo (`V`):**
- **Rotation**: 0-3 (incrementi di 90°)
- **Single Pulse**: Come il PushButton

### LED
I LED possono essere cliccati come i push button e possono visualizzare colori personalizzati.

**Opzioni GetInfo (`V`):**
- **Single Pulse (press)**: Invia un solo impulso per clic
- **Color From Input**: Riceve il valore del colore dal canale dati invece di usare il colore configurato
- **Color picker**: Imposta il colore del LED

### Trim
Il Trim e' un elemento decorativo che puo' essere posizionato con una precisione di 1 cm e ridimensionato con incrementi di 1 cm fino a 4 m. Utile per aggiungere separazioni visive o bordi al layout della dashboard.

## Adding Components to Dashboards
Qualsiasi componente puo' essere posizionato su una dashboard in posizioni e orientamenti arbitrari. Questo permette di incorporare strumenti, sensori o altri componenti direttamente nel design della dashboard.

## Programming
Per informazioni sulla programmazione degli schermi delle dashboard con XenonCode, consulta la [documentazione XenonCode per Dashboard](../xenoncode/dashboard.md).
