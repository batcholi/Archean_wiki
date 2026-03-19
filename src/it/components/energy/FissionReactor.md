<p align="center">
  <img src="FissionReactor.png" />
</p>

|Component|`FissionReactor`|
|---|---|
|**Module**|`ARCHEAN_nuclear`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|300 x 300 x 275 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Il Fission Reactor è un componente che produce calore dalla fissione nucleare di barre di uranio.

---

# Usage

## Funzionamento generale
Il reattore riscalda l'acqua (H₂O) utilizzando l'energia generata dalla fissione nucleare.

L'acqua ha un doppio ruolo:
- Raffreddare il nucleo del reattore.
- Produrre vapore per le turbine.

---

## Risorse necessarie
Il reattore richiede:
- Un'alimentazione continua a bassa tensione di **1000 W**.
- Un approvvigionamento di acqua fredda.
- Barre di uranio posizionate in tutte e 4 le zone interne del reattore.

> È altamente raccomandato avere almeno una barra di uranio per zona.  
> Un reattore con zone vuote funzionerà molto male o non funzionerà affatto.

---

## Inventario e Zone
Il reattore ha **40 slot**, divisi in **4 zone indipendenti**.

Ogni zona influenza la sua potenza locale e la temperatura in base al numero e al tipo di barre di uranio posizionate.

---

## Barre di controllo
Ogni zona ha una *barra di controllo* regolabile:
- 0% estratta (completamente inserita) → Reazione fermata.
- 100% estratta → Reazione massima.

---

## Avvio della reazione
È necessaria un'iniezione manuale di neutroni tramite la porta dati.

Fino a **1000 neutroni** al secondo possono essere inviati durante l'avvio
(fino a **250 neutroni** al secondo per zona).

> - Anche con uranio al 100% U235, un apporto iniziale di neutroni è necessario.
> - Con uranio a basso arricchimento (10% U235), l'avvio potrebbe richiedere alcuni minuti di iniezione continua di neutroni.

---

## Comportamento della reazione a catena

Sebbene ogni zona del reattore abbia le proprie barre di uranio, temperatura e popolazione di neutroni, il reattore è progettato per simulare una reazione a catena realistica attraverso l'intero nucleo.

- Le zone non sono completamente isolate.
- I neutroni prodotti in una zona possono parzialmente diffondersi nelle zone adiacenti.
- Questo comportamento migliora la stabilità della reazione e aiuta le zone più deboli a mantenere la fissione.

> Una zona altamente attiva può supportare una zona meno attiva, ma avere tutte le zone adeguatamente alimentate rimane essenziale per la massima efficienza.

---

## Raffreddamento e produzione di vapore
Quando utilizzato con le [Steam Turbine](SteamTurbine.md), la temperatura ideale dell'acqua in uscita è di **650 K**.

- Sotto → Produzione energetica ridotta.
- Sopra → Perdita di efficienza (nessun guadagno aggiuntivo).

> Un flusso d'acqua eccessivamente alto può raffreddare troppo il reattore e limitare la potenza in uscita.

---

## Stati del reattore

|State|Significato|
|---|---|
|IDLE|Il reattore è spento.|
|STARTING|Avvio in corso (iniezione di neutroni).|
|ACTIVE|Reazione nucleare attiva (i neutroni vengono prodotti).|
|COOLDOWN|Raffreddamento in corso (nessun neutrone prodotto).|
|HOT|Il reattore è caldo, aumentare il flusso di fluido.|
|SCRAM|Arresto di emergenza attivato (barre di controllo bloccate allo 0% di estrazione).|
|CRITICAL|Il nucleo del reattore si sta surriscaldando gravemente, fusione imminente.|
|MELTDOWN|Fusione del nucleo. Reattore inutilizzabile senza reset manuale.|

---

## Sicurezza e fusione del nucleo
- Sopra **1200 K** → Entra nello stato *CRITICAL* - fusione imminente.

In caso di *MELTDOWN*:
- Il flusso di vapore si interrompe - nessuna energia può essere prodotta.
- Il reattore diventa inutilizzabile fino al reset manuale.

### Reset del MELTDOWN
Tramite il pulsante di reset nell'interfaccia del reattore (tasto `V`).

> - In modalità creativa, questo pulsante è sempre disponibile.  
> - In modalità avventura, è disponibile solo quando il reattore è entrato in fusione.

---

# Usura delle barre di uranio

Le barre di uranio si degradano lentamente nel tempo man mano che partecipano alla reazione nucleare.

### Consumo degli isotopi
- **U235** viene gradualmente consumato per sostenere la fissione.
- **U238** può anche trasformarsi parzialmente in plutonio.

### Prodotti di fissione
Durante il funzionamento, le barre accumulano automaticamente prodotti di fissione:
- **Xenon (Xe)**
- **Plutonio (Pu)**

Questi elementi appaiono direttamente nella composizione della barra man mano che invecchia.
> È importante notare che questi prodotti di fissione attualmente non hanno alcun utilizzo nel gioco. Per ottenere plutonio per la fabbricazione dell'RTG, è necessario utilizzare il processo di produzione del plutonio descritto nella pagina RTG [RTG](./RTG.md#how-to-produce-plutonium).

### Barra esaurita
Quando la concentrazione di **U235** di una barra di uranio scende sotto il **4,45%**, diventa *esaurita*.

> Una barra esaurita non può più sostenere una reazione a catena, anche con un apporto esterno di neutroni.

### Fattori di usura
La durata delle barre di uranio dipende interamente da:
- Il loro tasso iniziale di arricchimento in U235.
- La potenza effettiva prodotta dal reattore (quindi il flusso di neutroni).

> → Più basso è l'arricchimento e più alta è l'estrazione di potenza, più velocemente la barra si consumerà.  
> → Al contrario, una barra di uranio altamente arricchita che opera a potenza moderata può durare estremamente a lungo.

### List of inputs

|Channel|Function|Value|
|---|---|---|
|0|Control Rod Zone 1|0.0 to 1.0|
|1|Control Rod Zone 2|0.0 to 1.0|
|2|Control Rod Zone 3|0.0 to 1.0|
|3|Control Rod Zone 4|0.0 to 1.0|
|4|Neutrons Injection|0 to 1000|
|5|SCRAM (Emergency Shutdown)|0 or 1|

---

### List of outputs

|Channel|Function|Value|
|---|---|---|
|0|Zone 1 Temperature (Kelvin)|Number|
|1|Zone 2 Temperature (Kelvin)|Number|
|2|Zone 3 Temperature (Kelvin)|Number|
|3|Zone 4 Temperature (Kelvin)|Number|
|4|Control Rod Position Zone 1|0.0 to 1.0|
|5|Control Rod Position Zone 2|0.0 to 1.0|
|6|Control Rod Position Zone 3|0.0 to 1.0|
|7|Control Rod Position Zone 4|0.0 to 1.0|
|8|Neutron Flux Zone 1|Number|
|9|Neutron Flux Zone 2|Number|
|10|Neutron Flux Zone 3|Number|
|11|Neutron Flux Zone 4|Number|
|12|Input Water Temperature (Kelvin)|Number|
|13|Output Water Temperature (Kelvin)|Number|
|14|Water Flow Rate (kg/s)|Number|
|15|Reactor Status|"IDLE", "STARTING", "ACTIVE", "COOLDOWN", "HOT", "SCRAM", "CRITICAL", "MELTDOWN"|
|16|Lifetime|Estimated remaining time in seconds|

---

# Produzione delle barre di uranio

---

## Low Enriched Uranium (LEU)

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|Crusher (Uranium Powder)|Uranium Ore : 1000 g|Uranium powder (U235 : 10%, U238 : 90%) : 1000 g|-|
|ChemicalFurnace (Yellow Cake (U₃O₈))|Uranium powder : 0.714 g, Oxygen (O₂) : 0.128 g|Yellow Cake (U₃O₈) : 0.842 g|750K - 950K|
|ChemicalFurnace (Uranium Dioxide (UO₂))|Yellow Cake (U₃O₈) : 0.842 g, Hydrogen (H₂) : 0.004 g|Uranium dioxide (UO₂) : 0.810 g, Water (H₂O) : 0.036 g|850K - 1050K|
|Crafter (Uranium Rod LEU (UO₂))|Uranium dioxide (UO₂) : 1000 g|Uranium rod LEU (UO₂, U235 : 10%, U238 : 90%) : 1|-|

---

## Highly Enriched Uranium (HEU)

### Produzione di UF₆ (Gas)

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|Crusher (Fluorite powder (F₂))|Fluorite Ore: 1000 g|Fluorite powder (F₂) : 1000 g|-|
|ChemicalFurnace (Hydrogen Fluoride (HF)) <font color="orange">*</font>|Fluorite powder (F₂) : 0.038 g, Hydrogen (H₂) : 0.002 g|Hydrogen fluoride (HF) : 0.040 g|300K - 400K|
|ChemicalFurnace (Uranium Tetrafluoride (UF₄))|Hydrogen fluoride (HF) : 0.080 g, Uranium dioxide (UO₂) : 0.270 g|Uranium tetrafluoride (UF₄) : 0.314 g, Water (H₂O) : 0.036 g|750K - 950K|
|ChemicalFurnace (Uranium Hexafluoride (UF₆))|Uranium tetrafluoride (UF₄) : 0.314 g, Fluorite powder (F₂) : 0.038 g|Uranium hexafluoride (UF₆) : 0.352 g|550K - 750K|

<font color="orange">*</font> La produzione di Hydrogen Fluoride (HF) innesca una reazione altamente esotermica. In questo caso specifico, la temperatura risultante, anche se il forno chimico mostra valori intorno ai 3000K, non influisce sulla reazione chimica. Tuttavia, nei processi successivi, sarà necessario raffreddare l'HF prima che possa essere utilizzato, tipicamente con un [Active Radiator](../fluids/radiator/ActiveRadiator.md) o un dispositivo di raffreddamento simile.




---

### Utilizzo della centrifuga di arricchimento

|Caratteristica|Valore|
|---|---|
|Consumo energetico|1000 W|
|Flusso in ingresso|0.1 kg/s|
|Capacità interna|10 kg|

Funzionamento:
- La prima centrifuga riceve l'esafluoruro di uranio (UF₆) dall'alto.
- L'uscita pesante (in basso) può essere scartata in quanto conterrà solo U238.
- L'uscita più leggera può essere inviata a un'altra centrifuga per un'ulteriore lavorazione.

> Tipicamente, raggiungere un'alta concentrazione di U235 richiede una catena da 8 a 10 centrifughe.

---

### Ritorno allo stato solido e assemblaggio della barra di uranio HEU

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|ChemicalFurnace (Uranyl Fluoride (UO₂F₂))|Uranium hexafluoride (UF₆) : 0.352 g, Water (H₂O) : 0.036 g|Uranyl fluoride (UO₂F₂) : 0.308 g, Hydrogen fluoride (HF) : 0.080 g|300K - 350K|
|ChemicalFurnace (Uranium Dioxide (UO₂))|Uranyl fluoride (UO₂F₂) : 0.308 g, Hydrogen (H₂) : 0.002 g|Uranium dioxide (UO₂) : 0.270 g, Hydrogen fluoride (HF) : 0.040 g|750K - 850K|
|Crafter (Uranium Rod HEU (UO₂))|Enriched uranium dioxide (UO₂) : 1000 g|Uranium rod HEU (UO₂, U235 content depends on enrichment) : 1|-|
