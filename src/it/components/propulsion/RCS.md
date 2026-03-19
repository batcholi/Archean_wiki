<p align="center">
  <img src="RCS.png" />
</p>

|Component|`RCS`|
|---|---|
|**Module**|`ARCHEAN_rcs`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Il sistema di controllo di reazione (RCS) e' composto da propulsori a gas freddo utilizzati principalmente per controllare l'orientamento e la posizione di un veicolo spaziale. Viene anche utilizzato per regolazioni precise durante l'aggancio di veicoli spaziali. L'RCS e' composto da diversi piccoli propulsori che possono essere attivati/disattivati individualmente e rapidamente per fornire un controllo preciso.

# Usage
L'RCS puo' essere alimentato da vari fluidi, che ne influenzeranno le prestazioni in base alla loro densita' e pressione. Puo' essere controllato da un computer o da un altro dispositivo per regolare la spinta e la direzione.

Non effettua alcun tipo di combustione.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Nozzle 0 (Center)|0.0 to 1.0|
|1|Nozzle 1|0.0 to 1.0|
|2|Nozzle 2|0.0 to 1.0|
|3|Nozzle 3|0.0 to 1.0|
|4|Nozzle 4|0.0 to 1.0|
