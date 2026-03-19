<p align="center">
  <img src="Volume.png" />
</p>

|Component|`Volume`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
The Volume component, when added to a build, automatically calculates and defines the volume it occupies. This feature can be used to:
- Design custom-shaped fuel tanks.  
- Ensure cabin pressurization for specific environments (e.g., submarines, rockets).  
- Create airships...
- ...  

> <font color="green"><strong> This component is related to the pressurization of builds, please refer to the [Pressurization](../../pressurization.md) page for more information.</strong></font>

# Usage
The Volume component is easy to use and requires no special configuration. Simply add it to a build and click the `Scan` button to automatically detect the volume of the sealed compartment where it is placed. Note that it calculates only the volume it is located in, not the entire build. You will need to add a separate Volume component for each compartment you want to pressurize.

This component can display two states:
- `Airtight`: The state turns green if the compartment is completely sealed.
- `Leak`: The state turns red if the compartment is not airtight.

The Volume screen only displays the volume of the sealed compartment in cubic meters (m³). For more detailed information, you can access its information window by pressing the `V` key. The available data includes:
- `Volume capacity (m³)`: The total capacity of the sealed volume.
- `Contents Mass (kg)`: The total mass of the contents present in the volume.
- `Pressure (kPa)`: The pressure inside the sealed compartment.
- `Liquid Level (%)`: The percentage of liquid fill.
- `Composition`: The distribution of different fluids as normalized percentages.

In Creative mode, additional buttons appear to allow filling or emptying the volume.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Level|0 to 1|
|1|Volume (m³)|number|
|2|State|text|

