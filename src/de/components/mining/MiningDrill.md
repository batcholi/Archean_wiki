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
Der Mining Drill ist eine Komponente, die das Bohren des Terrains ermöglicht, um Gestein zu fördern, das zerkleinert werden kann, um Erze zu gewinnen.

# Usage
Damit er funktioniert, muss er auf einem Build installiert sein, der mit einem [Ground Anchor](../miscellaneous/GroundAnchor.md) am Boden verankert ist.
Sie müssen ihn mit einem [Container](../storage/Container.md) oder einer anderen Komponente verbinden, die Items aufnimmt, um das geförderte Gestein zu sammeln.

Je nach Energieart kann er Gestein mit unterschiedlichen Geschwindigkeiten fördern.

|Energy|Power required|Speed|Depth|
|---|---|---|---|
|Low Voltage|10 kw|Up to 10 rocks per second|0.01 meter per second|
|High Voltage|100kw|Up to 100 rocks per second|0.1 meter per second|

## Data retrieval
Der Mining Drill ermöglicht jederzeit das Abrufen von Informationen über die Zusammensetzung an seiner Position.
Der zurückgegebene Wert ist ein [Key-Value objects](../../xenoncode/documentation.md#key-value-objects), das im folgenden Format dargestellt wird, zum Beispiel: `.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}`.
Das bedeutet, dass die Position 12% Kohlenstoff, 5% Eisen, 3% Silizium und 80% Kupfer enthält.


## Efficiency & depletion
Das Abbaugebiet ist nicht unbegrenzt, es erschöpft sich allmählich mit zunehmender Tiefe und die Effizienz nimmt entsprechend ab.  
Sie müssen ihn von Zeit zu Zeit umsetzen.


### List of outputs
|Channel|Function|
|---|---|
|0|Composition|
|1|Depth|
|2|Efficiency|
|3|MiningRate|
|4|DrillingRate|
