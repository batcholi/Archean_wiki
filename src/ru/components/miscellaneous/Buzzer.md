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
Buzzer — компонент, позволяющий воспроизводить звуковые тоны типа `sine`, `square`, `triangle` или `sawtooth` с возможностью управления частотой и амплитудой звука.

# Usage
### Изменение типа тона
Тон можно изменить через интерфейс конфигурации Buzzer, доступный по клавише `V`.


### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|Amplitude|0 to 1|
|1|Frequency (Hz)|0 to 20000 (default: 440Hz)|

> - Для одновременного воспроизведения нескольких частот или тонов необходимо использовать несколько Buzzer.
