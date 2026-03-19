<p align="center">
    <img src="SolarSensor.png" />
</p>

|Component|`SolarSensor`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**| 1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#

---

# Description
Il Solar Sensor e' un componente che misura l'angolo di incidenza del sole e la potenza solare potenziale.

# Usage
Una volta posizionato sulla costruzione, il sensore puo' essere collegato a un computer per recuperare un valore normalizzato dell'angolo di incidenza, che indica tipicamente la posizione del sole rispetto alla posizione del sensore. Il sensore permette anche di recuperare il valore potenziale della potenza solare ricevuta in watt/m².

> - E' possibile far seguire il sole a un pannello solare senza utilizzare un computer collegando questi sensori direttamente alle cerniere.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Normalized Angle|-1.0 to +1.0|
|1|Solar Power|W/m²|
