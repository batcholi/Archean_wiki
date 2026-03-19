<p align="center">
  <img src="MiningDrill.png" />
</p>

|Component|`MiningDrill`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 100 cm|
|**Push/Pull Item**|Initiate Push|
#
---

# Description
Il Mining Drill e' un componente che permette di perforare il terreno per estrarre rocce che possono essere frantumate per ottenere minerali.

# Usage
Per funzionare, deve essere installato su una costruzione che deve essere ancorata al suolo utilizzando un [Ground Anchor](../miscellaneous/GroundAnchor.md).
E' necessario collegarlo a un [Container](../storage/Container.md) o qualsiasi altro componente che accetta oggetti, per raccogliere le rocce estratte.

A seconda del tipo di energia, puo' estrarre rocce a velocita' diverse.

|Energy|Power required|Speed|Depth|
|---|---|---|---|
|Low Voltage|10 kw|Fino a 10 rocce al secondo|0,01 metri al secondo|
|High Voltage|100kw|Fino a 100 rocce al secondo|0,1 metri al secondo|

## Data retrieval
Il Mining Drill permette di recuperare informazioni sulla composizione nella sua posizione in qualsiasi momento.
Il valore restituito e' un oggetto [Key-Value](../../xenoncode/documentation.md#key-value-objects) presentato nel seguente formato, ad esempio: `.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}`.
Questo significa che la posizione contiene il 12% di carbonio, il 5% di ferro, il 3% di silicio e l'80% di rame.


## Efficiency & depletion
L'area estratta non e' illimitata, si esaurisce gradualmente man mano che scende in profondita' e l'efficienza diminuisce di conseguenza.
Sara' necessario riposizionarlo di tanto in tanto.


### List of outputs
|Channel|Function|
|---|---|
|0|Composition|
|1|Depth|
|2|Efficiency|
|3|MiningRate|
|4|DrillingRate|

