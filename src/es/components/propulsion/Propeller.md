<p align="center">
  <img src="Propeller.png" />
</p>

|Component|`Propeller`|
|---|---|
|**Module**|`ARCHEAN_propeller`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description
El Propeller es un componente que genera empuje usando palas giratorias. Se utiliza para propulsar vehículos en el aire o en el agua.

# Usage

Puede configurarse a través de su interfaz de configuración accesible mediante la tecla `V`.

### Interfaz de configuración
Proporciona información sobre la hélice y permite su configuración.
#### Información
- `Input Voltage`: Voltaje de entrada en voltios.
- `Power`: Consumo de energía en vatios.
- `Thrust`: Empuje generado en Newtons.
- `Rotation Speed`: Velocidad de rotación en rotaciones por segundo.
- `Pitch`: Ángulo de paso normalizado.

#### Configuración
- `Radius`: Radio de la hélice en metros.
- `Twist`: Ángulo de torsión de la hélice (normalizado).
- `Blades`: Número de palas.

### Energía
El Propeller tiene un puerto de energía de bajo voltaje y un puerto de energía de alto voltaje, que permiten mayor o menor control sobre la potencia suministrada.
### Bajo voltaje
En esta configuración, el Propeller consume hasta 50 kw.
#### Alto voltaje
En esta configuración, el Propeller consume hasta 500 kw.


### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Speed|-1.0 to +1.0|
|1|Pitch|-1.0 to +1.0|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Rotation Speed|rot/s|
|1|Thrust|Newtons|
