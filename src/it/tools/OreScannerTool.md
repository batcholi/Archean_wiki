<p align="center">
  <img src="OreScannerTool.png" />
</p>

|Item|`OreScannerTool`|
|---|---|
|**Module**|`ARCHEAN_celestial`|

# Description
L'Ore Scanner Tool e' un dispositivo portatile che mostra la composizione minerale nella direzione in cui stai guardando. Visualizza un grafico in tempo reale della densita' del minerale rispetto alla distanza, permettendoti di localizzare i giacimenti minerari prima dell'estrazione.

Questo strumento e' diverso dal [componente OreScanner](../components/mining/OreScanner.md) - mentre il componente e' progettato per essere montato sui veicoli e controllato tramite XenonCode, l'Ore Scanner Tool fornisce un'interfaccia visiva immediata per il giocatore.

# Usage

## Basic Operation
1. Equipaggia l'Ore Scanner Tool dal tuo inventario
2. Punta nella direzione in cui vuoi scansionare
3. Lo strumento visualizza un grafico che mostra le concentrazioni di minerale lungo quella direzione

## Interface
La finestra dello scanner mostra:
- **Distance selector**: Scegli il raggio di scansione (100m, 250m, 500m o 1000m)
- **Ore checkboxes**: Seleziona quali minerali visualizzare sul grafico
- **Graph**: Mostra la densita' del minerale (asse Y) rispetto alla distanza (asse X)

## Ore Types
Lo scanner puo' rilevare i seguenti minerali:

|Simbolo|Elemento|Colore|
|---|---|---|
|Al|Alluminio|Argento/Grigio chiaro|
|C|Carbonio|Nero|
|Cr|Cromo|Grigio metallico|
|Cu|Rame|Arancione|
|Au|Oro|Giallo oro|
|F|Fluorite|Viola|
|Fe|Ferro|Marrone ruggine|
|Pb|Piombo|Grigio scuro|
|Ni|Nichel|Grigio verdastro|
|Si|Silicio|Blu scuro|
|Ag|Argento|Argento brillante|
|Sn|Stagno|Grigiastro|
|Ti|Titanio|Bluastro|
|W|Tungsteno|Grigio scuro|
|U|Uranio|Verde|

## Scanning Tips
- La direzione di scansione si basa sulla componente orizzontale della tua direzione di visuale
- Il grafico si aggiorna automaticamente mentre ti muovi o cambi direzione
- Seleziona piu' minerali per confrontare le loro posizioni
- Il Ferro (Fe) e' selezionato per default essendo la risorsa piu' comune

---

> **Nota:** L'Ore Scanner Tool richiede di trovarsi su un corpo celeste con dati del terreno. Non funziona nello spazio o in ambienti senza dati di composizione del terreno.
