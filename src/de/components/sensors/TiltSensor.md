<p align="center">
  <img src="TiltSensor.png" />
</p>

|Component|`TiltSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Der Tilt Sensor ermöglicht es, die aktuelle Neigung basierend auf dem Horizont über seinen Datenport zu senden.

# Usage
Sobald er auf Ihrem Build platziert ist, kann er zum Beispiel mit einem Computer verbunden werden, um Ihre Neigung zwischen `-1.0` und `+1.0` abzurufen.  
Seine Längsachse ist wie eine Wasserwaage zu verwenden.  
`-1.0` oder `+1.0` bedeutet eine Neigung von 90 Grad, wobei ein Ende perfekt nach unten und das andere perfekt nach oben zeigt, während `0.0` eine waagerechte Ausrichtung zum Horizont bedeutet.

> Funktioniert nicht im Weltraum
