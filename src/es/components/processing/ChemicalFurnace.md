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
El componente Chemical Furnace calienta fluidos y objetos, generalmente para realizar reacciones químicas.

# Usage
Requiere energía eléctrica para funcionar. Su consumo varía según la temperatura objetivo y el contenido que se está calentando, pudiendo alcanzar hasta **5 MW** en las condiciones más exigentes.

El Chemical Furnace también está equipado con una pantalla táctil que permite:
- Mostrar la temperatura actual
- Establecer una temperatura objetivo manualmente

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Target Temperature (K)|number|
|1|Purge|0 or 1|

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Current Temperature (K)|number|
