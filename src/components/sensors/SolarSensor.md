<p align="center">
    <img src="SolarSenor.png" />
</p>

|Component|`SolarSenor`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**| 1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#

---

# Description
The solar sensor is a component that measures the angle of incidence of the sun and the potential solar power.

# Usage*
Once placed on your build, the sensor can be connected to a computer to retrieve a normalized value of the angle of incidence, typically indicating the position of the sun relative to the sensor's position. The sensor also allows retrieving the potential value of received solar power in watts/m².

> - It is possible to make a solar panel track the sun without using a computer by connecting these sensors directly to hinges.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Normalized Angle|-1.0 to +1.0|
|1|Solar Power|W/m²|