<p align="center">
  <img src="GeothermalExchanger.png" />
</p>

|Component|GeothermalExchanger|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Il Geothermal Exchanger e' un componente progettato per sfruttare il calore naturale del sottosuolo profondo per riscaldare un fluido.

# Usage
Il Geothermal Exchanger e' destinato all'uso esclusivamente su costruzioni stazionarie. Una volta posizionato su una costruzione e alimentato con bassa tensione (consumando 1000 watt continuamente), si ancorera' automaticamente al suolo e impedira' completamente qualsiasi movimento della struttura.

> #### Attenzione:
> - Il Geothermal Exchanger blocca la costruzione. Per ripristinare la mobilita', deve prima essere distrutto.
> - Se la struttura rimane statica dopo aver distrutto il Geothermal Exchanger, basta posizionare temporaneamente un [Ground Anchor](../miscellaneous/GroundAnchor.md) per aggiornarne lo stato e permetterle di tornare attiva.

Il Geothermal Exchanger deve essere posizionato molto vicino al suolo. Se la sua base si trova a piu' di 0,5 metri dal suolo, restera' inattivo.

Una volta operativo:
- Perfora lentamente fino a una profondita' massima di 1000 metri.
- Piu' scende in profondita', piu' il fluido in circolazione diventa caldo (fino a un massimo di 650K).
- Inizia a pompare il fluido quando raggiunge 373K.

Viene utilizzato principalmente per produrre energia facendo circolare il fluido attraverso una Steam Turbine.

### Additional Information
- Il Geothermal Exchanger funziona esclusivamente con acqua (H₂O).
- Portata massima: 0,1 kg/s.

> Una Small Steam Turbine puo' generalmente essere alimentata efficacemente da un massimo di 10 Geothermal Exchanger, consentendo una potenza teorica massima di circa 270 kW.

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Depth|meters|
|1|Temperature|Kelvin|
