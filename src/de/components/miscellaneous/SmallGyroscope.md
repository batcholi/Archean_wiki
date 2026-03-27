<p align="center">
  <img src="SmallGyroscope.png" />
</p>

|Component|`SmallGyroscope`|
|---|---|
|**Module**|`ARCHEAN_gyroscope`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description
Das Gyroscope ist eine Komponente, die bei Stromversorgung und Aktivierung ihre Winkelgeschwindigkeit dämpft. Es wird hauptsächlich zur Stabilisierung eines Fahrzeugs oder zum Stoppen des Drehimpulses in der Schwerelosigkeit verwendet.

# Power Supply
Das SmallGyroscope wird über **Niederspannung** betrieben. Es verbraucht beim Start mehr Strom und reduziert dann allmählich seinen Verbrauch, wenn es die über den Datenport angeforderte Drehgeschwindigkeit erreicht.

# Usage
Um das Gyroscope zu starten, muss es einen Wert zwischen `0.0` und `1.0` über seinen Datenport empfangen, um seine Drehgeschwindigkeit zu verringern/erhöhen und damit seinen stabilisierenden Effekt zu verstärken.

Das Gyroscope ermöglicht die manuelle Ausrichtung eines Fahrzeugs über seinen Datenport, indem es das induzierte Drehmoment der Schwungräder in seinem Inneren nutzt. Es wirkt basierend auf seiner Ausrichtung und Drehgeschwindigkeit.

### List of inputs
|Channel|Function|range|
|---|---|---|
|0|Speed| 0.0 to 1.0|
|1|Control| -1.0 to +1.0|

>Ein Gyroscope hat einen begrenzten Effekt relativ zum Gewicht des Builds. Sie können die Anzahl der Gyroscopes erhöhen, um den stabilisierenden Effekt zu verstärken.
