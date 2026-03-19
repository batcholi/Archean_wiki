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
Der PlayerSensor erkennt Spieler innerhalb einer konfigurierbaren 3D-Begrenzungsbox relativ zur Position und Ausrichtung des Sensors. Er gibt Informationen über erkannte Spieler als Key-Value-Textobjekt aus.

# Usage
Sobald er auf Ihrem Build platziert ist, erkennt der PlayerSensor jeden Spieler, der seine Erkennungszone betritt. Die Erkennungszone ist eine 3D-Box, die über das `V`-Tastenmenü konfiguriert werden kann.

Der Sensor gibt Spielerinformationen auf Kanal 0 als Key-Value-Textobjekt aus, das Folgendes enthält:
- Spieler-ID
- Benutzername
- Entfernung zum Sensor

### V key configuration
- **box_min**: Minimale Koordinaten der Erkennungsbox (X, Y, Z) - Standard: -10, -10, -10
- **box_max**: Maximale Koordinaten der Erkennungsbox (X, Y, Z) - Standard: +10, +10, +10

Die Koordinaten der Erkennungsbox sind relativ zur Position und Ausrichtung des Sensors.

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Detected players|key-value text|

### Output format
Die Ausgabe ist ein Key-Value-Textobjekt: `.p<playerID>{.username{<name>}.distance{<meters>}}`
