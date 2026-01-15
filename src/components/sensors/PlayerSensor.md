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
The PlayerSensor detects players within a configurable 3D bounding box relative to the sensor's position and orientation. It outputs information about detected players as a key-value text object.

# Usage
Once placed on your build, the PlayerSensor will detect any player entering its detection zone. The detection zone is a 3D box that can be configured via the `V` key menu.

The sensor outputs player information on channel 0 as a key-value text object containing:
- Player ID
- Username
- Distance from the sensor

### V key configuration
- **box_min**: Minimum coordinates of the detection box (X, Y, Z) - Default: -10, -10, -10
- **box_max**: Maximum coordinates of the detection box (X, Y, Z) - Default: +10, +10, +10

The detection box coordinates are relative to the sensor's position and orientation.

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Detected players|key-value text|

### Output format
The output is a key-value text object: `.p<playerID>{.username{<name>}.distance{<meters>}}`
