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
El sensor de densidad es un componente que mide la densidad y composición del entorno en el que está colocado.

# Usage
Una vez colocado en tu construcción, puede conectarse a un ordenador, por ejemplo, para obtener la densidad y composición del entorno. La composición se proporciona como una cadena key-value.

### List of outputs
|Channel|Function|value|
|---|---|---|
|0|Density (kg/m³)|number|
|1|Composition|text|
