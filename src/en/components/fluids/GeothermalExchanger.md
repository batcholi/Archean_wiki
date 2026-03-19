<p align="center">
  <img src="GeothermalExchanger.png" />
</p>

|Component|GeothermalExchanger|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
The Geothermal Exchanger is a component designed to harness the natural heat of deep underground to warm up a fluid.

# Usage
The Geothermal Exchanger is intended to be used exclusively on stationary builds. Once placed on a build and powered with low voltage (consuming 1000 watts continuously), it will automatically anchor itself to the ground and completely prevent the structure from moving.

> #### Warning:
> - The Geothermal Exchanger locks the build in place. To restore mobility, it must first be destroyed.
> - If the structure remains static after destroying the Geothermal Exchanger, simply place a [Ground Anchor](../miscellaneous/GroundAnchor.md) temporarily to refresh its state and allow it to become active again.

The Geothermal Exchanger must be placed very close to the ground. If its base is more than 0.5 meter above the ground, it will remain inactive.

Once operational:
- It slowly drills down to a maximum depth of 1000 meters.
- The deeper it goes, the hotter the circulating fluid becomes (up to a maximum of 650K).
- It starts pumping the fluid once it reaches 373K.

It is primarily used to produce energy by circulating the fluid through a Steam Turbine.

### Additional Information
- The Geothermal Exchanger works exclusively with water (H₂O).
- Maximum flow rate: 0.1 kg/s.

> A Small Steam Turbine can generally be supplied effectively by up to 10 Geothermal Exchangers, allowing for a theoretical maximum output power of about 270 kW.

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Depth|meters|
|1|Temperature|Kelvin|