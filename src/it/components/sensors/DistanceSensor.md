<p align="center">
  <img src="DistanceSensor.png" />
</p>

|Component|`DistanceSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Il Distance Sensor e' un telemetro laser che misura la distanza dalla superficie piu' vicina (terreno o costruzione). Puo' rilevare sia il terreno che i collider di altre costruzioni entro un raggio configurabile.

# Usage
Una volta posizionato sulla costruzione, richiede un collegamento di alimentazione a bassa tensione e un collegamento dati per funzionare. Il sensore emette un raggio lungo la sua faccia frontale. Quando l'ingresso "Show Laser" e' abilitato, viene visualizzato un raggio laser rosso visibile fino alla superficie rilevata.

### Range & Multi-tick Scanning
Il raggio predefinito e' di 1000m (singolo tick, risultato istantaneo). Il raggio puo' essere esteso fino a 25.000m tramite il canale di ingresso "Max Range". Quando il raggio supera i 1000m, la scansione del terreno viene suddivisa su piu' tick del server (128 passi di terreno per tick):

|Range|Ticks|Delay|
|---|---|---|
|1.000 m|1|istantaneo|
|5.000 m|5|~200 ms|
|10.000 m|10|~400 ms|
|25.000 m|25|~1 s|

> Il rilevamento delle entita' (costruzioni) e' sempre istantaneo indipendentemente dal raggio. Solo il tracciamento del terreno viene suddiviso su piu' tick.

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|On/Off|number (≠ 0 = on)|
|1|Show Laser|number (≠ 0 = on)|
|2|Max Range|number (meters, 1000-25000, default 1000)|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Distance|number (meters, -1 if out of range)|

>- Quando inattivo o fuori portata, l'uscita e' -1.
>- Il sensore non rileva la propria costruzione.
>- Il sensore puo' rilevare gli avatar.
