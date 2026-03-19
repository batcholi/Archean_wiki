<p align="center">
  <img src="BigWheel.png" />
</p>

|Component|`BigWheel`|
|---|---|
|**Module**|`ARCHEAN_wheel`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 100 x 100 cm|
#
---

# Description
Das Big Wheel ist eine Komponente, die es einem Build ermöglicht, vorwärts/rückwärts zu beschleunigen sowie zu lenken und zu bremsen. Es enthält eine konfigurierbare Federung und ein Getriebe.

# Usage
Es kann über sein Konfigurationsinterface konfiguriert werden, das über die `V`-Taste zugänglich ist.

### Configuration Interface
Es bietet Informationen über das Rad und ermöglicht die Konfiguration.
#### Information
- `Motor Rotation Speed`: Motordrehzahl in Umdrehungen pro Sekunde.
- `Wheel Rotation Speed`: Raddrehzahl in Umdrehungen pro Sekunde.
- `Power`: Stromverbrauch in Watt.
- `Brake`: Bremsenwert des Rades.
- `Ground Speed`: Radgeschwindigkeit relativ zum Boden in m/s.
- `Gear Ratio`: Übersetzungsverhältnis des Rades.

#### Configuration
- `Reverse`: Drehrichtung des Rades umkehren.
- `Grip`: Griffigkeit des Rades anpassen.
- `Suspension`: Federung des Rades anpassen.

### Energy
Das Big Wheel kann im Gegensatz zum [Wheel](Wheel.md) nur mit Hochspannung betrieben werden.
Es verbraucht bis zu 400 kW bei voller Leistung.

> - Sie können die Drehrichtung des Rades über das Konfigurationsmenü umkehren, das mit der `V`-Taste zugänglich ist. Dies passt auch die Ausrichtung des Modells an, einschließlich des Reifenprofils. Diese Einstellung ändert nicht die Fahrtrichtung des Rades.

### List of inputs
|Channel|Function|Value|
|---|---|---|
|0|Accelerate|-1.0 to +1.0|
|1|Steer|-1.0 to +1.0|
|2|Regen|0 or 1|
|3|Brake|0.0 to 1.0|
|4|Gearbox|-1.0 to +1.0|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Wheel Rotation Speed|rot/s|
|1|Ground Friction|0 to 1|
