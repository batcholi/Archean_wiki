<p align="center">
  <img src="RTG.png" />
</p>

|Component|`RTG`|
|---|---|
|**Module**|`ARCHEAN_rtg`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 100 cm|
#
---

# Description
Il generatore termoelettrico a radioisotopi (RTG) genera energia a bassa tensione. Può fornire una potenza continua che dipende dalla capacità di raffreddamento dell'ambiente.

# Usage
Collegare l'RTG al componente che richiede energia a bassa tensione per funzionare.

L'RTG ha due porte elettriche, il che consente di collegare due componenti contemporaneamente o collegare più RTG in catena per aumentare la potenza totale in uscita.

### List of outputs
|Channel|Function|
|---|---|
|0|Generated Power (Watts)|
|1|Output Power (Watts)|

> - L'RTG può generare fino a **12 kW** di potenza. La sua uscita effettiva dipende dalla capacità di raffreddamento dell'ambiente (ridotta a ~6 kW nel vuoto dello spazio). Non ha effetti dannosi sul giocatore o sull'ambiente.
>
> - Se si utilizza l'RTG per alimentare due componenti, la potenza totale distribuita sulle due porte non può superare la potenza in uscita disponibile dell'RTG.
>
> - Se uno dei due componenti vuole consumare l'intera potenza disponibile dall'RTG, potrebbe impedire all'altro componente di utilizzare qualsiasi potenza. In questo caso è meglio utilizzare delle junction di potenza per assicurarsi che tutti i componenti ricevano alimentazione in modo equo.


# How to produce Plutonium

## Processo di produzione del plutonio

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|Crusher|Uranium Ore: 1000 g|Uranium Powder (U) : 1000 g (U235 : 10%, U238 : 90%)|-|
|ChemicalFurnace (Yellow Cake - U₃O₈)|Uranium Powder (U) : 0.714 g, O₂ : 0.128 g|Yellow Cake (U₃O₈) : 0.842 g|750K - 950K|
|ChemicalFurnace (Uranium Dioxide - UO₂)|Yellow Cake (U₃O₈) : 0.842 g, H₂ : 0.004 g|Uranium Dioxide (UO₂) : 0.810 g, H₂O : 0.036 g|850K - 1050K|
|Crafter|Uranium Dioxide (UO₂) : 1000 g|Uranium Rod (U235 : 10%, U238 : 90%) : 1|-|
|Crusher|Uranium Rod|Plutonium Dioxide (PuO₂) : 1 g (Pu : 100%)|-|
|Crafter|Plutonium Dioxide (PuO₂) : 5000 g|Plutonium Pellet : 1|-|

> Si raccomanda di utilizzare uranio a basso arricchimento (LEU) per la produzione di plutonio. Il livello di arricchimento non influisce sulla quantità di plutonio ottenuta.

---

# Additional Information
<font color="orange">
In realtà, il trattamento del plutonio dal combustibile nucleare esaurito è un'operazione industriale estremamente complessa e impegnativa, che richiede infrastrutture avanzate e strutture specializzate. Per questo motivo, il recupero e il ritrattamento del plutonio non sono attualmente supportati in Archean.  

Invece, gli RTG utilizzano una forma semplificata di plutonio prodotta specificamente per la generazione di energia. Sebbene questa alternativa rimanga più facile da gestire rispetto al plutonio reale, la sua produzione è intenzionalmente più impegnativa rispetto alle versioni precedenti del gioco, rendendo gli RTG meno banali da ottenere pur rimanendo accessibili ai giocatori avanzati.
</font>
