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
Le Propeller est un composant qui genere de la poussee a l'aide de pales rotatives. Il est utilise pour propulser des vehicules dans l'air ou dans l'eau.

# Usage

Il peut etre configure via son interface de configuration accessible via la touche `V`.

### Interface de configuration
Elle fournit des informations sur l'helice et permet la configuration.
#### Informations
- `Input Voltage` : Tension d'entree en volts.
- `Power` : Consommation d'energie en Watts.
- `Thrust` : Poussee generee en Newtons.
- `Rotation Speed` : Vitesse de rotation en rotations par seconde.
- `Pitch` : Angle de pas normalise.

#### Configuration
- `Radius` : Rayon de l'helice en metres.
- `Twist` : Angle de torsion de l'helice (normalise).
- `Blades` : Nombre de pales.

### Energie
Le Propeller dispose d'un port d'energie basse tension et d'un port d'energie haute tension, qui permettent un controle plus ou moins precis de la puissance fournie.
### Energie basse tension
Dans cette configuration, le Propeller consomme jusqu'a 50 kW.
#### Energie haute tension
Dans cette configuration, le Propeller consomme jusqu'a 500 kW.


### Liste des entrees
|Channel|Function|Range|
|---|---|---|
|0|Speed|-1.0 to +1.0|
|1|Pitch|-1.0 to +1.0|

### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Rotation Speed|rot/s|
|1|Thrust|Newtons|
