<p align="center">
  <img src="SmallTurboPump.png" />
</p>

|Component|`SmallTurboPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
La Small Turbo Pump e' un componente utilizzato per trasferire fluidi ad alta densita' fino a 10 kg al secondo.

# Usage
## Power Supply
Per utilizzare la pompa, deve essere alimentata ad alta tensione. Consuma fino a 10 kW alla velocita' massima.

## Data
La porta dati consente di controllare la velocita' della pompa inviando un valore tra `-1` e `1`.
Quando la pompa e' collegata a un computer, e' anche possibile recuperare la portata attuale.

> Inviando un valore negativo, la pompa funzionera' effettivamente in senso inverso.
