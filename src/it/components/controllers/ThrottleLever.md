<p align="center">
  <img src="ThrottleLever.png" />
</p>

|Component|`ThrottleLever`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
Il Throttle Lever è un tipo di controllo che invia costantemente un valore analogico in base alla posizione della leva. Il valore in uscita è mappato su un intervallo configurabile (predefinito da `-1.0` a `+1.0`).

# Usage
La leva si controlla con il mouse tenendo premuto il tasto `F` e muovendo il `mouse su/giù`.

> - C'è una resistenza al centro della leva per aiutare a trovare la posizione centrale precisa.
> - È possibile configurare i valori **Min** e **Max** della leva, così come la funzione **snap-to-center** dal menu di configurazione accessibile con il tasto `V`.
> - Il Throttle Lever può essere controllato da un altro componente tramite la sua porta dati attivando la modalità "Allow IO Input" nel menu di configurazione.
