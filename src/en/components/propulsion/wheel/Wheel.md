<p align="center">
  <img src="Wheel.png" />
</p>

|Component|`Wheel`|
|---|---|
|**Module**|`ARCHEAN_wheel`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 75 x 100 cm|
#
---

# Description
The wheel is a component that allows a build to accelerate forward/backward as well as turn and brake. It includes a configurable suspension and gearbox.

# Usage
It can be configured through its configuration interface accessible via the `V` key.

### Configuration Interface
It provides information about the wheel and allows for configuration.
#### Information
- `Motor Rotation Speed`: Motor rotation speed in rotations per second.
- `Wheel Rotation Speed`: Wheel rotation speed in rotations per second.
- `Power`: Power consumption in watts.
- `Brake`: Wheel braking value.
- `Ground Speed`: Wheel speed relative to the ground in m/s.
- `Gear Ratio`: Wheel speed ratio.

#### Configuration
- `Mudguard`: Show/Hide the mudguard.
- `Reverse`: Reverse the wheel's rotation direction.
- `Grip`: Adjusts the wheel's grip.
- `Suspension`: Adjusts the wheel's suspension.

### Energy
The wheel has a low-voltage energy port and a high-voltage energy port.
### Low-Voltage Energy
In this configuration, the wheel consumes up to 20 kw.
#### High-Voltage Energy
In this configuration, the wheel consumes up to 200 kw.

> - You can reverse the wheel's rotation direction from the configuration menu accessible with the `V` key. This also adjusts the model's orientation, including the tread pattern. This setting does not change the wheel's direction.

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