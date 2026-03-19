# Estrazione mineraria

L'estrazione mineraria in Archean e il processo di localizzazione, raccolta e lavorazione delle risorse minerali presenti nel terreno dei corpi celesti. E la base del sistema di fabbricazione — senza minerali, non puoi costruire nulla.

Il ciclo completo di estrazione e: **Scansione → Raccolta → Frantumazione → Fabbricazione**.

## Localizzare i minerali

Prima di raccogliere le rocce, dovresti identificare dove sono concentrati i minerali di valore.

L'[Ore Scanner Tool](tools/OreScannerTool.md) e un dispositivo portatile che mostra un grafico in tempo reale della densita dei minerali nella direzione in cui stai guardando. Equipaggialo e guardati intorno — e il modo piu rapido per esplorare una zona.

Per la scansione automatizzata, il componente [Ore Scanner](components/mining/OreScanner.md) puo essere controllato tramite [XenonCode](xenoncode/documentation.md) e restituisce i dati di composizione come [oggetti testo chiave-valore](xenoncode/documentation.md#key-value-objects).

---

## Raccogliere le rocce

Le rocce sono piccoli oggetti sparsi sulla superficie dei corpi celesti. Variano in dimensione, e **una roccia piu grande fornisce piu materiale** quando viene raccolta.

### A mano
Senza nessuno strumento equipaggiato, premi `LMB` per raccogliere una roccia. Devi cliccare di nuovo per ogni roccia.

### Rock Rake Tool
Il [Rock Rake](tools/RockRakeTool.md) e il modo consigliato per raccogliere le rocce manualmente:

- **Tieni premuto `LMB`**: Raccoglie continuamente le rocce mentre le guardi
- **`RMB`**: Ispeziona una roccia prima di raccoglierla — mostra la sua composizione e il rendimento

---

## Estrazione automatizzata — Mining Drill

Il [Mining Drill](components/mining/MiningDrill.md) estrae rocce dal terreno automaticamente. Deve essere installato su una struttura ancorata usando un [Ground Anchor](components/miscellaneous/GroundAnchor.md).

L'efficienza del trapano diminuisce con la profondita — dovresti **riposizionarlo** periodicamente quando la produzione cala. Consulta la pagina del [Mining Drill](components/mining/MiningDrill.md) per le specifiche dettagliate.

---

## Composizione delle rocce

Ogni roccia ha una **composizione** — un insieme di elementi con le rispettive densita, determinato dalla sua posizione sul terreno. La composizione e rappresentata come [oggetti testo chiave-valore](xenoncode/documentation.md#key-value-objects):

`.Al{0.1500}.Fe{0.2000}.Si{0.6500}` — significa 15% Alluminio, 20% Ferro, 65% Silicio.

Le rocce con **composizione identica** si impilano nel tuo inventario. Composizioni diverse occupano slot separati.

### Elementi

|Simbolo|Elemento|Simbolo|Elemento|
|---|---|---|---|
|Al|Alluminio|Ni|Nichel|
|C|Carbonio|Si|Silicio|
|Cr|Cromo|Ag|Argento|
|Cu|Rame|Sn|Stagno|
|Au|Oro|Ti|Titanio|
|F|Fluorite|W|Tungsteno|
|Fe|Ferro|U|Uranio|
|Pb|Piombo|Ch|???|

---

## Lavorazione delle rocce

Per trasformare le rocce in minerali utilizzabili, devi frantumarle. Ci sono due modi per farlo:

### Lavorazione dall'avatar (inizio gioco)
Il tuo zaino ha un'**Area di lavorazione oggetti** integrata (1 slot) accessibile dall'[interfaccia di fabbricazione](interfaces.md#area-di-lavorazione-oggetti). Posiziona le rocce in questo slot e clicca **Crush** per convertirle direttamente in minerali dal tuo inventario. E lento ma non richiede infrastrutture — e il modo per ottenere i tuoi primi minerali in modalita Adventure.

### Componente Crusher (automatizzato)
Il [Crusher](components/mining/Crusher.md) e un componente posizionabile per la lavorazione su larga scala. Converte le rocce in minerali proporzionalmente alla loro composizione. Per esempio, frantumare 10 Kg di roccia con il 20% di Ferro produce 2000 g di minerale di Ferro.

Quando le concentrazioni sono molto basse, il Crusher accumula quantita frazionarie attraverso piu rocce fino a poter produrre almeno 1 unita — nulla viene perso.

> Il Crusher **non preleva** dal suo input — le rocce devono essere [inviate](pushpull.md) ad esso. Consulta la pagina [Push & Pull](pushpull.md) per maggiori dettagli.

---

## Distribuzione delle risorse

La distribuzione dei minerali varia in base al corpo celeste, all'altitudine e alla vicinanza a formazioni vulcaniche. Consulta [Earth](celestialbodies/earth.md) e [Moon](celestialbodies/moon.md) per i dettagli.

|Rarita|Elementi|Dove cercare|
|---|---|---|
|Comune|Si, Fe, C, Cu, Sn|Ovunque / sopra il livello del mare|
|Non comune|Al, Ag|Alta quota (montagne)|
|Raro|Ni, Cr, Ti, W|Alta quota / altissima quota|
|Molto raro|Au, Pb, U, F|Fondali marini / vicino ai vulcani|

- I **vulcani** aumentano il Ferro, il Piombo, e sono l'**unica fonte di Fluorite**

---

## Consigli pratici

- **Esplora prima**: Usa l'Ore Scanner Tool per trovare un punto ricco dei minerali di cui hai bisogno prima di posizionare le infrastrutture
- **Configurazioni tipiche**: Mining Drill → Crusher → Container, oppure Mining Drill → Container → [Conveyor](components/items/ItemConveyor.md) → Crusher
- **Dimensionamento**: 1 Crusher gestisce fino a 4 Mining Drill ad alta tensione
- **Riposiziona i trapani** quando l'efficienza cala significativamente
- **Rock Rake per l'inizio gioco**: Usalo per raccogliere il tuo primo Ferro e fabbricare fino a ottenere un Mining Drill
- **Controlla la composizione**: Clic destro sulle rocce con il Rock Rake per controllare cosa contengono prima di raccoglierle
