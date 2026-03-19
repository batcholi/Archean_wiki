<p align="center">
  <img src="FluidPump.png" />
</p>

|Component|`FluidPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
La Fluid Pump e' un componente utilizzato per trasferire fluido fino a 1 kg al secondo. A differenza delle turbo pump, funziona con alimentazione a bassa tensione e reagisce istantaneamente ai comandi di controllo, consentendo una gestione dei fluidi altamente reattiva.

# Usage
## Power Supply
Per utilizzare la pompa, deve essere alimentata a bassa tensione. Consuma fino a 1 kW alla velocita' massima.

## Data
La porta dati consente di controllare la velocita' della pompa inviando un valore tra `-1` e `1`.
Quando la pompa e' collegata a un computer, e' anche possibile recuperare la portata attuale.

> Inviando un valore negativo, la pompa funzionera' effettivamente in senso inverso.
