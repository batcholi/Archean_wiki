<p align="center">
  <img src="Beacon.png" />
</p>

|Component|`Beacon`|
|---|---|
|**Module**|`ARCHEAN_beacon`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Der Beacon ist eine Komponente, die das Senden und/oder Empfangen von Daten zu/von anderen Beacons ermöglicht.

# Usage
Zum Betrieb muss ein Beacon mit Niederspannungsenergie versorgt werden und verbraucht 10 Watt während des Betriebs.
Er kann über die Datenports oder sein Konfigurationsinterface, das über die `V`-Taste zugänglich ist, zum Senden und/oder Empfangen von Daten konfiguriert werden.

Beim Platzieren eines Beacons erscheint ein Pfeil auf dem Hologramm, der die Lokalisierungsrichtung des Beacons anzeigt.

## Configuration Interface
- `Transmit Data`: Ermöglicht das Senden von `number/text`-Daten.
- `Transmit Frequency`: Ermöglicht die Anpassung der Sendefrequenz.
- `Receive Frequency`: Ermöglicht die Anpassung der Empfangsfrequenz.
#### Informations
- `Last Received Distance`: Zeigt die Entfernung in Metern zum letzten Beacon an, von dem Daten empfangen wurden.
- `Last Received Direction`: Zeigt die Richtung (x,y,z) zum letzten Beacon an, von dem Daten empfangen wurden.
- `Last Received Data`: Zeigt die zuletzt empfangenen Daten an.
- `Is Receiving`: Zeigt an, ob der Beacon gerade Daten empfängt.

## Data Port
Der Beacon hat einen Datenport, der die Verwendung von einem Computer oder anderen Komponenten ermöglicht.

### List of outputs
|Channel|Function|Range|
|---|---|---|
|0|Data|number or text|
|1|Distance|number (meters)|
|2|Direction X|-1.0 to +1.0|
|3|Direction Y|-1.0 to +1.0|
|4|Direction Z|-1.0 to +1.0|
|5|Is Receiving|0 or 1|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Transmit Data|number or text|
|1|Transmit Frequency|number or text|
|2|Receive Frequency|number or text|

> Informationen:
>- Es gibt keine Entfernungsbegrenzung für die Kommunikation zwischen Beacons, obwohl der nächstgelegene Vorrang hat, wenn mehrere Beacons auf derselben Frequenz senden.
>- Das Signal eines Beacons wird nicht durch Hindernisse beeinflusst.

> Hinweise:
>- Der Beacon kann jeweils nur einen einzelnen Datenwert senden, entweder eine Zahl oder einen Text. Sie können jedoch das [Key-Value objects](../../xenoncode/documentation.md#key-value-objects)-System verwenden, um beliebig viele Daten zu übertragen.
