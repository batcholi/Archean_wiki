<p align="center">
  <img src="DensitySensor.png" />
</p>

|Component|`DensitySensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Il Density Sensor e' un componente che misura la densita' e la composizione dell'ambiente in cui e' posizionato.

# Usage
Una volta posizionato sulla costruzione, puo' essere collegato a un computer, ad esempio, per recuperare la densita' e la composizione dell'ambiente. La composizione e' fornita come stringa key-value.

### List of outputs
|Channel|Function|value|
|---|---|---|
|0|Density (kg/m³)|number|
|1|Composition|text|
