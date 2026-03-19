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
Il Propeller e' un componente che genera spinta utilizzando pale rotanti. E' utilizzato per propellere veicoli nell'aria o nell'acqua.

# Usage

Puo' essere configurato tramite la sua interfaccia di configurazione accessibile con il tasto `V`.

### Configuration Interface
Fornisce informazioni sull'elica e ne consente la configurazione.
#### Information
- `Input Voltage`: Tensione di ingresso in volt.
- `Power`: Consumo energetico in Watt.
- `Thrust`: Spinta generata in Newton.
- `Rotation Speed`: Velocita' di rotazione in rotazioni al secondo.
- `Pitch`: Angolo di passo normalizzato.

#### Configuration
- `Radius`: Raggio dell'elica in metri.
- `Twist`: Angolo di torsione dell'elica (normalizzato).
- `Blades`: Numero di pale.

### Energy
Il Propeller ha una porta di energia a bassa tensione e una porta di energia ad alta tensione, che consentono un controllo piu' o meno preciso della potenza fornita.
### Low-Voltage Energy
In questa configurazione, il Propeller consuma fino a 50 kW.
#### High-Voltage Energy
In questa configurazione, il Propeller consuma fino a 500 kW.


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
