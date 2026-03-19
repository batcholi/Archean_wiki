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
Il Buzzer e' un componente che permette di produrre toni sonori di tipo `sine`, `square`, `triangle` o `sawtooth`, consentendo di controllare la frequenza e l'ampiezza del suono.

# Usage
### Changing the tone type
Il tono puo' essere cambiato tramite l'interfaccia di configurazione del Buzzer accessibile con il tasto `V`.


### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|Amplitude|0 to 1|
|1|Frequency (Hz)|0 to 20000 (default: 440Hz)|

> - Per riprodurre piu' frequenze simultaneamente o piu' toni, e' necessario utilizzare piu' Buzzer.
