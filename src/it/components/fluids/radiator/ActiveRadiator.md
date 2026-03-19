<p align="center">
  <img src="ActiveRadiator.png" />
</p>

|Component|`ActiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|40 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
L'Active Radiator e' un componente progettato per raffreddare i fluidi che lo attraversano. E' dotato di una ventola che migliora notevolmente lo scambio di calore con l'ambiente quando attivata.

# Usage
Il radiatore richiede:
- Un'alimentazione elettrica
- Un ingresso dati per attivare la ventola.

Senza alimentazione, la sua capacita' di raffreddamento e' molto limitata. Quando alimentato e attivato, equalizza lentamente la temperatura tra i fluidi in circolazione e l'ambiente.

Consuma continuamente 100 Watt quando alimentato.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|
