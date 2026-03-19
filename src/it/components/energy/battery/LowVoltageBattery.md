<p align="center">
  <img src="LowVoltageBattery.png" />
</p>

|Component|`LowVoltageBattery`|
|---|---|
|**Module**|`ARCHEAN_battery`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description
- Tensione: da 44 a 52 volt a seconda dello stato di carica attuale
- Corrente: 1000 ampere per porta
- Capacità totale: 10 kWh
- Porte elettriche: 4
- Porta dati: 1 porta per il monitoraggio dello stato della batteria

> **Riciclaggio:** Quando viene frantumata, questa batteria restituisce circa il **50%** del suo costo di fabbricazione in minerali grezzi.

# Usage
Con la batteria che fornisce 1000 ampere per porta, è possibile ottenere fino a 52 kW su ogni porta per alimentare i componenti.

### List of outputs
|Channel|Function|
|---|---|
|0|Voltage|
|1|Max Capacity (Wh)|
|2|State of charge|
|3|Throughputs (watts)|
