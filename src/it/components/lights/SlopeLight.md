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
La SlopeLight e' un componente di illuminazione compatto progettato per adattarsi alle superfici inclinate. Emette luce con un angolo di apertura predefinito di 120°.

# Usage
La SlopeLight deve essere alimentata a bassa tensione e consuma fino a 1000 W a seconda della potenza impostata nel suo menu informativo accessibile tramite il tasto `V`.

Il colore e l'angolo della luce possono essere configurati tramite il menu informativo (tasto `V`) o tramite la sua porta dati.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Off/On|0 or 1|
|1|Red|0 to 255|
|2|Green|0 to 255|
|3|Blue|0 to 255|

### V key configuration
- **Max Power**: Regolabile da 0 a 1000 W (predefinito: 200 W)
- **Angle**: Regolabile da 20° a 120°
- **RGB**: Selettore di colore per la luce
