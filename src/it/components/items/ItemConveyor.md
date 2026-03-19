<p align="center">
  <img src="ItemConveyor.png" />
</p>

|Component|`ItemConveyor`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 100 cm|
|**Push/Pull Item**|Initiate Push/Pull|
#
---

# Description
L'Item Conveyor e' un componente che permette di spostare oggetti da un punto all'altro. Funziona prelevando oggetti dall'ingresso e spingendoli all'uscita. Puo' essere utilizzato, ad esempio, per trasportare oggetti da un contenitore all'altro.

# Usage
L'Item Conveyor richiede alimentazione a bassa tensione, con un consumo energetico direttamente proporzionale alla portata degli oggetti spostati.

Puo' essere configurato tramite la sua finestra informativa (accessibile con il tasto `V`) o tramite la sua porta dati.
Le opzioni di configurazione disponibili sono:

|Option|Value|Description|
|---|---|---|
|**Pull n items/sec**|1 to 1000|Numero massimo di oggetti da spostare al secondo|
|**Pull x kg/sec**|0 to 1000 kg|Massa massima di oggetti da spostare al secondo|
|**Filter**|text|Permette di filtrare un tipo specifico di oggetto. Ad esempio, se si specifica "Wire", solo i cavi saranno autorizzati a passare|

> - L'Item Conveyor puo' filtrare solo un tipo di oggetto alla volta. Se e' necessario spostare piu' tipi di oggetti, bisognera' utilizzare piu' conveyor.
> - Il filtro e' sensibile alle maiuscole/minuscole.

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|ON|0 or 1|
|1|Pull n items/second|1 to 1000|
|2|Filter|text|
|3|Pull x kg/second|0 to 1000|
