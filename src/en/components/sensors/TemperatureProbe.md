<p align="center">
  <img src="TemperatureProbe.png" />
</p>

|Component|`TemperatureProbe`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|250 g|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|10 x 10 x 1 cm|
#
---

# Description
The Temperature Probe is a component that measures the temperature of the block or panel it is attached to.

# Usage
Once attached to your build, it can be connected to a Computer to retrieve the temperature of the material at the contact point of its tip. The temperature is provided in Kelvin, refreshed every 0.2 s. It reads 0 when it is not touching any block or panel.

Above 1350 K, the probe gets damaged. A fully damaged probe reads 0 and can be repaired.

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Temperature|Kelvin|
