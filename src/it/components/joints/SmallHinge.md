<p align="center">
  <img src="SmallHinge.png" />
</p>

|Component|`SmallHinge`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
La Small Hinge e' un componente che include un blocco costruibile su una cerniera.

> <font color="green"> *Questo componente e' legato alla pressurizzazione delle costruzioni. Per maggiori informazioni, consultare la pagina [Pressurization](../../pressurization.md).*</font>

# Usage
La Small Hinge funziona esclusivamente in modalita' servo.

Premendo V per aprire l'interfaccia informativa, sono possibili due configurazioni:
- `Max Rotation Speed` che determina la velocita' massima di rotazione in rotazioni al secondo.
- `Acceleration` che determina il tasso (in rotazioni al secondo al secondo) a cui la cerniera accelerera' per raggiungere la sua Max Rotation Speed prima di rallentare per raggiungere la posizione target.

Il dispositivo ruota a una posizione precisa determinata dai dati ricevuti tramite la sua porta dati. Accetta valori normalizzati tra `-1.0` e `+1.0`, che corrispondono a rotazioni di `-90°` e `+90°` rispettivamente.

> - Le costruzioni installate su una parte mobile non possono collidere con una costruzione genitore o sorella. Possono collidere solo con il terreno o altre costruzioni separate.
> - Per distruggere la Small Hinge, e' assolutamente necessario rimuovere tutti i blocchi/componenti figli che contiene.
### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s|

![SmallPivotDemo](hinge.gif)
