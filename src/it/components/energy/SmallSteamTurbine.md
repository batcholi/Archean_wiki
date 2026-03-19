<p align="center">
  <img src="SmallSteamTurbine.png" />
</p>

|Component|`SmallSteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|75 x 75 x 150 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Il componente Small Steam Turbine è una versione compatta della [Steam Turbine](SteamTurbine.md), progettata per convertire l'energia termica del vapore caldo in energia elettrica.

# Usage
Funziona iniettando vapore d'acqua caldo nel suo ingresso fluidi. Più il vapore è caldo e maggiore è la portata, più energia può produrre.

A piena capacità, può erogare fino a circa **270 kilowatt**.

Come per qualsiasi turbina a vapore, è necessario un collegamento di uscita fluidi per evacuare il vapore. Senza di esso, la turbina non produrrà alcuna energia.

- Temperatura minima di funzionamento: 373 K  
- Temperatura massima effettiva: 650 K (funzionamento ottimale)  
- Portata massima: 1 kg/s  

L'energia generata viene erogata direttamente su un'uscita elettrica ad alta tensione.  

Quando la potenza non è completamente consumata, il bypass della turbina viene attivato automaticamente per mantenerla alla velocità di rotazione massima.
Questo effetto farà sì che il fluido in uscita non si raffreddi altrettanto.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Potential Energy output (watts)|number|
