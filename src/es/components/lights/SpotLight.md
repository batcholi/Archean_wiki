<p align="center">
  <img src="SpotLight.png" />
</p>

|Component|`SpotLight`|
|---|---|
|**Module**|`ARCHEAN_light`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
El SpotLight es un componente que permite iluminar una zona amplia con un ángulo máximo de 120°. Es especialmente adecuado para colocar en vehículos como faro.

# Usage
El SpotLight debe estar alimentado con bajo voltaje y consume hasta 1000 W dependiendo de la potencia configurada en su menú de información accesible mediante la tecla `V`.

Los colores del SpotLight pueden cambiarse a través de su menú de información o mediante su puerto de datos.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|
