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
Le Buzzer est un composant qui permet de produire des tonalites sonores de type `sine`, `square`, `triangle` ou `sawtooth` tout en permettant de controler la frequence et l'amplitude du son.

# Usage
### Changer le type de tonalite
La tonalite peut etre changee via l'interface de configuration du Buzzer accessible avec la touche `V`.


### Liste des entrees
|Channel|Function|Value|
|---|---|---|
|0|Amplitude|0 to 1|
|1|Frequency (Hz)|0 to 20000 (default: 440Hz)|

> - Pour jouer plusieurs frequences simultanement ou plusieurs tonalites, vous devez utiliser plusieurs Buzzers.
