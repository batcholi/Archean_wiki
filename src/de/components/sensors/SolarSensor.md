<p align="center">
    <img src="SolarSensor.png" />
</p>

|Component|`SolarSensor`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**| 1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#

---

# Description
Der Solar Sensor ist eine Komponente, die den Einfallswinkel der Sonne und die potenzielle Solarleistung misst.

# Usage
Sobald er auf Ihrem Build platziert ist, kann der Sensor mit einem Computer verbunden werden, um einen normalisierten Wert des Einfallswinkels abzurufen, der typischerweise die Position der Sonne relativ zur Sensorposition angibt. Der Sensor ermöglicht auch das Abrufen des potenziellen Wertes der empfangenen Solarleistung in Watt/m².

> - Es ist möglich, ein Solarpanel ohne Verwendung eines Computers der Sonne nachführen zu lassen, indem man diese Sensoren direkt mit Hinges verbindet.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Normalized Angle|-1.0 to +1.0|
|1|Solar Power|W/m²|
