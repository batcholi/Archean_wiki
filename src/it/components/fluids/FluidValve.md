<p align="center">
  <img src="FluidValve.png" />
</p>

|Component|`FluidValve`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|accept Push/Pull -> forwards action to other side|
#
---

# Description
La Fluid Valve e' un componente che permette di controllare il flusso del fluido che la attraversa.

# Usage
Per impostazione predefinita, la valvola e' chiusa e blocca il passaggio del fluido. Per controllare il flusso del fluido, inviare un segnale dati tra `0 (Chiusa)` e `1 (Aperta)`.

La valvola trasmette la temperatura del fluido che la attraversa sul canale 0.
