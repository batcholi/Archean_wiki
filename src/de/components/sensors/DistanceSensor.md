<p align="center">
  <img src="DistanceSensor.png" />
</p>

|Component|`DistanceSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Der Distance Sensor ist ein Laser-Entfernungsmesser, der den Abstand zur nächsten Oberfläche (Terrain oder Build) misst. Er kann sowohl Terrain als auch Collider anderer Builds innerhalb einer konfigurierbaren Reichweite erkennen.

# Usage
Sobald er auf Ihrem Build platziert ist, benötigt er eine Niederspannungs-Stromversorgung und eine Datenverbindung zum Betrieb. Der Sensor schießt einen Strahl entlang seiner Vorderseite. Wenn der Eingang "Show Laser" aktiviert ist, wird ein sichtbarer roter Laserstrahl bis zur erkannten Oberfläche angezeigt.

### Range & Multi-tick Scanning
Die Standardreichweite beträgt 1000m (einzelner Tick, sofortiges Ergebnis). Die Reichweite kann über den Eingangskanal "Max Range" auf bis zu 25.000m erweitert werden. Wenn die Reichweite 1000m überschreitet, wird der Terrain-Scan über mehrere Server-Ticks aufgeteilt (128 Terrain-Schritte pro Tick):

|Range|Ticks|Delay|
|---|---|---|
|1,000 m|1|instant|
|5,000 m|5|~200 ms|
|10,000 m|10|~400 ms|
|25,000 m|25|~1 s|

> Die Erkennung von Entities (Builds) erfolgt immer sofort, unabhängig von der Reichweite. Nur das Terrain-Tracing wird über Ticks aufgeteilt.

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|On/Off|number (≠ 0 = on)|
|1|Show Laser|number (≠ 0 = on)|
|2|Max Range|number (meters, 1000-25000, default 1000)|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Distance|number (meters, -1 if out of range)|

>- Wenn inaktiv oder außerhalb der Reichweite, ist der Ausgabewert -1.
>- Der Sensor erkennt nicht seinen eigenen Build.
>- Der Sensor kann Avatare erkennen.
