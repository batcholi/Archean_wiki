<p align="center">
  <img src="AltitudeSensor.png" />
</p>

|Component|`AltitudeSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
L'Altitude Sensor invia l'altitudine tra la posizione del sensore e il suolo o il centro del corpo celeste attraverso la sua porta dati.

# Usage
Una volta posizionato sulla costruzione, puo' essere collegato a un computer, ad esempio, per recuperare l'altitudine in metri. L'orientamento dell'Altitude Sensor non ha alcun impatto sul suo funzionamento.

### List of outputs
|Channel|Function|
|---|---|
|0|Absolute Altitude|
|1|Above Terrain|

>- In modalita' "Above Terrain", l'acqua non e' considerata come terreno.
>- L'Altitude Sensor funziona solo nell'ambiente di un corpo celeste.
