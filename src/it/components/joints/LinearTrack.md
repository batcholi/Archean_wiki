<p align="center">
  <img src="LinearTrack.png" />
</p>

|Component|`LinearTrack`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
La Linear Track e' un componente che include un blocco mobile costruibile. E' progettata per consentire la traslazione lineare di oggetti su una costruzione. Puo' traslare solo lungo un binario creato automaticamente sull'asse di movimento del blocco.

> <font color="green"> *Questo componente e' legato alla pressurizzazione delle costruzioni. Per maggiori informazioni, consultare la pagina [Pressurization](../../pressurization.md).*</font>

# Usage
La Linear Track puo' funzionare in due modalita': Servo (predefinita) e Velocity. Per passare da una modalita' all'altra, premere il tasto V per aprire l'interfaccia informativa del componente.

In questa interfaccia, sono possibili configurazioni aggiuntive:
- `Max Speed` che determina la velocita' massima in metri al secondo.
- `Acceleration` che determina il tasso a cui la Linear Track accelerera' per raggiungere la sua Max Speed.
- `Override limits` quando abilitato, permette di impostare manualmente i limiti di posizione minima e massima invece di utilizzare i valori calcolati automaticamente in base allo spazio disponibile sul binario.

## Tracks
I binari per il componente Linear Track vengono creati e aggiornati automaticamente lungo il suo asse. Vengono creati sopra blocchi normali di qualsiasi tipo. Per terminare il binario, la linea deve essere interrotta. Ad esempio con un altro blocco sopra o lasciando un buco lungo il binario.

## Servo Mode
In modalita' servo, il dispositivo si sposta a una posizione precisa determinata dai dati ricevuti tramite la sua porta dati. Accetta tutti i valori e reagira' di conseguenza nell'intervallo tra min e max. Quindi, se viene ricevuto un numero maggiore o minore, si spostera' nella posizione min/max corrispondente.

## Velocity Mode
In modalita' velocity, il dispositivo opera continuamente nella direzione indicata dai dati della sua porta, accettando valori tra `-1.0` e `+1.0` per determinare la velocita' e la direzione di movimento. `1.0` significa Max Speed.

> - Le costruzioni installate su una parte mobile non possono collidere con una costruzione genitore o sorella. Possono collidere solo con il terreno o altre costruzioni separate.
> - Per distruggere la Linear Track, e' assolutamente necessario rimuovere tutti i blocchi/componenti figli che contiene.
> - La Linear Track ha un intervallo di spostamento massimo da -250m a +250m (500m totali).


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Position|meters|
|1|Speed|m/s|
|2|Minimum Position|meters|
|3|Maximum Position|meters|

![LinearTrackDemo](lineartrack.gif)
