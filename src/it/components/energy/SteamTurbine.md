<p align="center">
  <img src="SteamTurbine.png" />
</p>

|Component|`SteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|150 x 200 x 200 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Il componente Steam Turbine converte l'energia termica del vapore caldo in energia elettrica.

# Usage
Funziona iniettando vapore d'acqua caldo nel suo ingresso fluidi. Più il vapore è caldo e maggiore è la portata, più energia può produrre.

A piena capacità, può erogare fino a circa **27 megawatt**.

È necessario un collegamento di uscita fluidi. Senza di esso, la turbina non sarà in grado di espellere il vapore e non produrrà alcuna energia.

- Temperatura minima di funzionamento: 373 K  
- Temperatura massima effettiva: 650 K (funzionamento ottimale)  
- Portata massima: 100 kg/s  

L'energia generata viene erogata direttamente su un'uscita elettrica ad alta tensione.  

Quando la potenza non è completamente consumata, il bypass della turbina viene attivato automaticamente per mantenerla alla velocità di rotazione massima.
Questo effetto farà sì che il fluido in uscita non si raffreddi altrettanto.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Potential Energy output (watts)|number|
