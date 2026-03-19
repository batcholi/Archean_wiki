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
Chemical Furnace — компонент, нагревающий жидкости и предметы, как правило, для проведения химических реакций.

# Usage
Для работы требуется электропитание. Потребляемая мощность зависит от целевой температуры и нагреваемого содержимого и может достигать **5 МВт** в наиболее требовательных условиях.

Chemical Furnace также оснащён сенсорным экраном, позволяющим:
- Отображать текущую температуру
- Вручную задавать целевую температуру

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Target Temperature (K)|number|
|1|Purge|0 or 1|

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Current Temperature (K)|number|
