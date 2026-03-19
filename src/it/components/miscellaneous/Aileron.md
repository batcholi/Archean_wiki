<p align="center">
  <img src="Aileron.png" />
</p>

|Component|`Aileron`|
|---|---|
|**Module**|`ARCHEAN_aileron`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
#
---

# Description
L'Aileron e' un dispositivo che influenza l'aerodinamica di una costruzione.

La sua efficacia e' strettamente legata alla densita' del mezzo in cui opera, sia che si trovi nell'atmosfera (aereo...) o nell'acqua (barca...).

# Usage
L'Aileron non richiede alcuna energia per funzionare, solo un valore tra `-1.0` e `+1.0` attraverso la sua porta dati.

>- Gli Aileron non calcolano le occlusioni come fanno i blocchi. Questo consente di ottimizzare l'efficienza di volo di un veicolo nascondendoli in superfici piu' grandi, come all'interno delle ali.
