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
The distance sensor is a laser rangefinder that measures the distance to the nearest surface (terrain or build). It can detect both terrain and other builds' colliders within a configurable range.

# Usage
Once placed on your build, it requires a low voltage power connection and a data connection to operate. The sensor fires a ray along its front face. When the "Show Laser" input is enabled, a visible red laser beam is displayed up to the detected surface.

### Range & Multi-tick Scanning
The default range is 1000m (single tick, instant result). The range can be extended up to 25,000m via the "Max Range" input channel. When the range exceeds 1000m, the terrain scan is split across multiple server ticks (128 terrain steps per tick):

|Range|Ticks|Delay|
|---|---|---|
|1,000 m|1|instant|
|5,000 m|5|~200 ms|
|10,000 m|10|~400 ms|
|25,000 m|25|~1 s|

> Entity detection (builds) is always instant regardless of range. Only terrain tracing is split across ticks.

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

>- When inactive or out of range, the output is -1.
>- The sensor does not detect its own build.
>- The sensor can detect avatars.
