<p align="center">
  <img src="LinearTrack.png" />
</p>

|Component|`LinearTrack`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
The Linear Track is a component that includes a buildable moving block. It is designed to allow linear translation of objects on a build. It can only Translate along a track automatically created on the movement axis of the block.

> <font color="green"> *This component is related to the pressurization of builds, please refer to the [Pressurization](../../pressurization.md) page for more information.*</font>

# Usage
The Linear Track can operate in two modes: Servo (default) and Velocity. To switch between modes, press the V key to open the component's information interface.

In this interface, there are two additional configurations possible:
- `Max Speed` which determines the maximum speed in meters per second.
- `Acceleration` which determines the rate at which the linear track will accelerate to reach its Max Speed.

## Tracks
The tracks for the Linear Track component are automatically created and updated aloong its axis. They are created on top of normal blocks of any type. To end the track the line has to be broken. For exanple with another block on top or by leaving a whole along the track.

## Servo Mode
In servo mode, the device rotates to a precise position determined by the data received through its data port. It accepts all values and will react accordingly in the range between min and max. So if a number greater or smaller is recived it will move into the according min/max position.

## Velocity Mode
In velocity mode, the device operates continuously in the direction indicated by the data from its port, accepting values between `-1.0` to `+1.0` to determine it's speed and moving direction. `1.0` means Max Speed.

> - Builds installed on a moving part cannot collide with a parent or sibling build. They can only collide with the terrain or other separate builds.
> - To destroy the Linear Track, you must absolutely remove all the child blocks/components it contains.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Position|m|
|1|Speed|m/s|
|2|Minimum Position|m|
|3|Maximum Position|m|
|4|Travel (Total Distance)|m|

![LinearTrackDemo](track.gif)
