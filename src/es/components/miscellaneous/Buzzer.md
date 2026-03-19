<p align="center">
  <img src="Buzzer.png" />
</p>

|Component|`Buzzer`|
|---|---|
|**Module**|`ARCHEAN_beep`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
El Buzzer es un componente que permite producir tonos de sonido de tipo `sine`, `square`, `triangle` o `sawtooth` mientras permite controlar la frecuencia y amplitud del sonido.

# Usage
### Cambiar el tipo de tono
El tono puede cambiarse a través de la interfaz de configuración del Buzzer accesible con la tecla `V`.


### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|Amplitude|0 to 1|
|1|Frequency (Hz)|0 to 20000 (default: 440Hz)|

> - Para reproducir múltiples frecuencias simultáneamente o múltiples tonos, debes usar múltiples Buzzers.
