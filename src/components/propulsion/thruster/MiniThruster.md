<p align="center">
  <img src="MiniThruster.png" />
</p>

|Component|`MiniThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
The mini thruster generates thrust through the combustion of liquid fuel with liquid oxygen.
It can handle both CH4 (methane) and H2 (hydrogen) as its fuel, but it requires a pre-mixed fuel-oxidizer combination.  
It can produce up to 18 KN of thrust from a flow rate of 1 Kg/s of pre-mixed LOX and H2.
  
# Usage
Connect high flow oxydizer and fuel to the fluid ports, low voltage for ignition, and send 1 in the data port to ignite.

When the fuel is H2, the optimal flow ratio is 8:1 (LOX:H2) and ratio of < 1:1 may result in a flame out (no combustion).
When the fuel is CH4, the optimal flow ratio is 4:1 (LOX:CH4) and ratio of < 1:1 may result in a flame out (no combustion).

The igniter does not need to be kept on once combustion has begun, although it's a good idea to leave it on in case of a flame out.
Ignition consumes 100 watts continuously when on.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|

### List of outputs
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|