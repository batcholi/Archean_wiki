<p align="center">
  <img src="PlayerSensor.png" />
</p>

|Component|`PlayerSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
El PlayerSensor detecta jugadores dentro de un cuadro delimitador 3D configurable relativo a la posición y orientación del sensor. Emite información sobre los jugadores detectados como un objeto de texto key-value.

# Usage
Una vez colocado en tu construcción, el PlayerSensor detectará a cualquier jugador que entre en su zona de detección. La zona de detección es un cuadro 3D que puede configurarse mediante el menú de la tecla `V`.

El sensor emite información del jugador en el canal 0 como un objeto de texto key-value que contiene:
- ID del jugador
- Nombre de usuario
- Distancia desde el sensor

### Configuración con tecla V
- **box_min**: Coordenadas mínimas del cuadro de detección (X, Y, Z) - Por defecto: -10, -10, -10
- **box_max**: Coordenadas máximas del cuadro de detección (X, Y, Z) - Por defecto: +10, +10, +10

Las coordenadas del cuadro de detección son relativas a la posición y orientación del sensor.

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Detected players|key-value text|

### Formato de salida
La salida es un objeto de texto key-value: `.p<playerID>{.username{<name>}.distance{<meters>}}`
