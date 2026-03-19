<p align="center">
  <img src="ChemicalFurnace.png" />
</p>

|Component|`ChemicalFurnace`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|150 x 200 x 200 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
|**Push/Pull Item**|Accept Push / Initiate Push|
#
---

# Description
The Chemical Furnace component heats up fluids and items, usually to perform chemical reactions.

# Usage
It requires electrical power to operate. Its power consumption varies depending on the target temperature and the content being heated, and can reach up to **5 MW** in the most demanding conditions.

The Chemical Furnace is also equipped with a touchscreen allowing:
- To display the current temperature
- To set a target temperature manually

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Target Temperature (K)|number|
|1|Purge|0 or 1|

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Current Temperature (K)|number|
