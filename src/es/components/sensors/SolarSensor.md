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
El sensor solar es un componente que mide el ángulo de incidencia del sol y la potencia solar potencial.

# Usage
Una vez colocado en tu construcción, el sensor puede conectarse a un ordenador para obtener un valor normalizado del ángulo de incidencia, que típicamente indica la posición del sol respecto a la posición del sensor. El sensor también permite obtener el valor potencial de la potencia solar recibida en vatios/m².

> - Es posible hacer que un panel solar siga al sol sin usar un ordenador conectando estos sensores directamente a bisagras.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Normalized Angle|-1.0 to +1.0|
|1|Solar Power|W/m²|
