<p align="center">
  <img src="SmallPivot.png" />
</p>

|Component|`SmallPivot`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Il Small Pivot e' un componente che include un blocco rotante costruibile. E' progettato per permettere la rotazione di oggetti su una costruzione.

> <font color="green"> *Questo componente e' legato alla pressurizzazione delle costruzioni. Per maggiori informazioni, consultare la pagina [Pressurization](../../pressurization.md).*</font>

# Usage
Il Small Pivot puo' funzionare in due modalita': Servo (predefinita) e Velocity. Per passare da una modalita' all'altra, premere il tasto V per aprire l'interfaccia informativa del componente.

In questa interfaccia, sono possibili due configurazioni aggiuntive:
- `Max Rotation Speed` che determina la velocita' massima di rotazione in rotazioni al secondo.
- `Acceleration` che determina il tasso (in rotazioni al secondo al secondo) a cui il pivot accelerera' per raggiungere la sua Max Rotation Speed.

## Servo Mode
In modalita' servo, il dispositivo ruota a una posizione precisa determinata dai dati ricevuti tramite la sua porta dati. Accetta valori normalizzati tra `-1.0` e `+1.0`, che corrispondono a rotazioni di `-360°` e `+360°`. Cio' significa effettivamente che i valori `0.0`, `-1.0` e `+1.0` risulteranno nella stessa posizione servo.

## Velocity Mode
In modalita' velocity, il dispositivo opera continuamente nella direzione indicata dai dati della sua porta, accettando valori tra `-1.0` e `+1.0` per determinare la velocita' e la direzione di rotazione. `1.0` significa Max Rotation Speed.

> - Le costruzioni installate su una parte mobile non possono collidere con una costruzione genitore o sorella. Possono collidere solo con il terreno o altre costruzioni separate.
> - Per distruggere il Small Pivot, e' assolutamente necessario rimuovere tutti i blocchi/componenti figli che contiene.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s| 

![SmallPivotDemo](pivot.gif)
