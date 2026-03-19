<p align="center">
  <img src="Crusher.png" />
</p>

|Component|`Crusher`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Item**|Accept Push, Initiate Push|
#
---

# Description
Il Crusher e' un componente che permette la frantumazione rapida delle rocce per ottenere minerali.

Puo' anche essere utilizzato per **riciclare qualsiasi oggetto fabbricabile** nei suoi materiali grezzi. Il processo di riciclaggio restituisce il **100% delle risorse primarie** utilizzate per fabbricare l'oggetto, decomponendo ricorsivamente la ricetta di fabbricazione.

> **Nota:** Le [batterie](../energy/battery/LowVoltageBattery.md) hanno una ricetta di riciclaggio speciale che restituisce solo circa il **50%** del costo di fabbricazione. Questo impedisce di sfruttare il sistema di riciclaggio per ottenere ricariche gratuite frantumando e rifabbricando batterie scariche.

# Usage
Il Crusher richiede alimentazione ad alta tensione e consuma 10 kW.

Per utilizzare il Crusher, basta inviare le rocce da frantumare attraverso la sua porta di ingresso oggetti. Non preleva dal suo ingresso, ma e' in grado di spingere i minerali ottenuti in qualsiasi contenitore che accetta oggetti.

Il Crusher e' in grado di processare 400 kg di rocce al secondo, eguagliando la produzione di 4 [Mining Drill](MiningDrill.md) operanti alla massima potenza.

> Quando la composizione delle rocce contiene una bassa concentrazione di certi minerali, il Crusher accumulera' i minerali a bassa concentrazione fino a quando sara' possibile produrre almeno un'unita' del minerale.
