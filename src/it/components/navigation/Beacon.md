<p align="center">
  <img src="Beacon.png" />
</p>

|Component|`Beacon`|
|---|---|
|**Module**|`ARCHEAN_beacon`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Il Beacon e' un componente che permette di trasmettere e/o ricevere dati da/verso altri Beacon.

# Usage
Per funzionare, un Beacon deve essere alimentato da energia a bassa tensione e consumera' 10 watt durante il funzionamento.
Puo' essere configurato per trasmettere e/o ricevere dati utilizzando le porte dati o la sua interfaccia di configurazione accessibile tramite il tasto `V`.

Quando si posiziona un Beacon, appare una freccia sull'ologramma per indicare la direzione di localizzazione del Beacon.

## Configuration Interface
- `Transmit Data`: Permette di inviare un dato `number/text`.
- `Transmit Frequency`: Permette di regolare la frequenza di trasmissione.
- `Receive Frequency`: Permette di regolare la frequenza di ricezione.
#### Informations
- `Last Received Distance`: Mostra la distanza in metri dall'ultimo Beacon da cui ha ricevuto dati.
- `Last Received Direction`: Mostra la direzione (x,y,z) dall'ultimo Beacon da cui ha ricevuto dati.
- `Last Received Data`: Mostra gli ultimi dati ricevuti.
- `Is Receiving`: Mostra se il Beacon sta attualmente ricevendo dati.

## Data Port
Il Beacon ha una porta dati che ne consente l'utilizzo da un computer o da altri componenti.

### List of outputs
|Channel|Function|Range|
|---|---|---|
|0|Data|number or text|
|1|Distance|number (meters)|
|2|Direction X|-1.0 to +1.0|
|3|Direction Y|-1.0 to +1.0|
|4|Direction Z|-1.0 to +1.0|
|5|Is Receiving|0 or 1|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Transmit Data|number or text|
|1|Transmit Frequency|number or text|
|2|Receive Frequency|number or text|

> Informazioni:
>- Non c'e' limite di distanza per le comunicazioni tra Beacon, anche se il piu' vicino avra' la precedenza se piu' Beacon trasmettono sulla stessa frequenza.
>- Il segnale di un Beacon non e' influenzato dagli ostacoli.

> Suggerimenti:
>- Il Beacon puo' trasmettere un solo dato alla volta, sia un numero che un testo. Ma e' possibile utilizzare il sistema [Key-Value objects](../../xenoncode/documentation.md#key-value-objects) per trasmettere tutti i dati necessari.
