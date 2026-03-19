<p align="center">
  <img src="Propeller.png" />
</p>

|Component|`Propeller`|
|---|---|
|**Module**|`ARCHEAN_propeller`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description
Der Propeller ist eine Komponente, die Schub durch rotierende Blätter erzeugt. Er wird verwendet, um Fahrzeuge in der Luft oder im Wasser anzutreiben.

# Usage

Er kann über sein Konfigurationsinterface konfiguriert werden, das über die `V`-Taste zugänglich ist.

### Configuration Interface
Es bietet Informationen über den Propeller und ermöglicht die Konfiguration.
#### Information
- `Input Voltage`: Eingangsspannung in Volt.
- `Power`: Stromverbrauch in Watt.
- `Thrust`: Erzeugter Schub in Newton.
- `Rotation Speed`: Drehgeschwindigkeit in Umdrehungen pro Sekunde.
- `Pitch`: Normalisierter Anstellwinkel.

#### Configuration
- `Radius`: Propellerradius in Metern.
- `Twist`: Verwindungswinkel des Propellers (normalisiert).
- `Blades`: Anzahl der Blätter.

### Energy
Der Propeller hat einen Niederspannungs-Energieport und einen Hochspannungs-Energieport, die mehr oder weniger Kontrolle über die zugeführte Leistung ermöglichen.
### Low-Voltage Energy
In dieser Konfiguration verbraucht der Propeller bis zu 50 kW.
#### High-Voltage Energy
In dieser Konfiguration verbraucht der Propeller bis zu 500 kW.


### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Speed|-1.0 to +1.0|
|1|Pitch|-1.0 to +1.0|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Rotation Speed|rot/s|
|1|Thrust|Newtons|
