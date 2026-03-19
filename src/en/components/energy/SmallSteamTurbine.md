<p align="center">
  <img src="SmallSteamTurbine.png" />
</p>

|Component|`SmallSteamTurbine`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|75 x 75 x 150 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
The Small Steam Turbine component is a compact version of the [Steam Turbine](SteamTurbine.md), designed to convert the thermal energy of hot steam into electrical energy.

# Usage
It operates by injecting hot water steam into its fluid input. The hotter the steam and the higher the flow rate, the more energy it can produce.

At full capacity, it can deliver up to approximately **270 kilowatts**.

As with any steam turbine, a fluid output connection is required to evacuate the steam. Without it, the turbine will not produce any energy.

- Minimum operating temperature: 373 K  
- Maximum effective temperature: 650 K (optimal operation)  
- Maximum flow rate: 1 kg/s  

The generated energy is directly delivered to a high-voltage electrical output.  

When the power is not fully consumed, it will automatically bypass the turbine to keep it at a maximum rotation rate.
This effect will cause the output fluid to not cool down as much.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Potential Energy output (watts)|number|
