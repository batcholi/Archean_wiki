<p align="center">
  <img src="SlopeLight.png" />
</p>

|Component|`SlopeLight`|
|---|---|
|**Module**|`ARCHEAN_light`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---
# Description
El SlopeLight es un componente de iluminación compacto diseñado para encajar en pendientes. Emite luz con un ángulo de haz predeterminado de 120°.

# Usage
El SlopeLight debe estar alimentado con bajo voltaje y consume hasta 1000 W dependiendo de la potencia configurada en su menú de información accesible mediante la tecla `V`.

El color y el ángulo de la luz pueden configurarse a través del menú de información (tecla `V`) o mediante su puerto de datos.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|

### Configuración con tecla V
- **Max Power**: Ajustable de 0 a 1000 W (por defecto: 200 W)
- **Angle**: Ajustable de 20° a 120°
- **RGB**: Selector de color para el color de la luz
