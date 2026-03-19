<p align="center">
  <img src="Wheel.png" />
</p>

|Component|`Wheel`|
|---|---|
|**Module**|`ARCHEAN_wheel`|
|**Mass**|100 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 75 x 100 cm|
#
---

# Description
La Wheel est un composant qui permet a une construction d'accelerer vers l'avant/l'arriere ainsi que de tourner et freiner. Elle inclut une suspension et une boite de vitesses configurables.

# Usage
Elle peut etre configuree via son interface de configuration accessible via la touche `V`.

### Interface de configuration
Elle fournit des informations sur la roue et permet la configuration.
#### Informations
- `Motor Rotation Speed` : Vitesse de rotation du moteur en rotations par seconde.
- `Wheel Rotation Speed` : Vitesse de rotation de la roue en rotations par seconde.
- `Power` : Consommation d'energie en watts.
- `Brake` : Valeur de freinage de la roue.
- `Ground Speed` : Vitesse de la roue par rapport au sol en m/s.
- `Gear Ratio` : Rapport de vitesse de la roue.

#### Configuration
- `Mudguard` : Afficher/Masquer le garde-boue.
- `Reverse` : Inverser le sens de rotation de la roue.
- `Grip` : Ajuste l'adherence de la roue.
- `Suspension` : Ajuste la suspension de la roue.

### Energie
La roue dispose d'un port d'energie basse tension et d'un port d'energie haute tension.
### Energie basse tension
Dans cette configuration, la roue consomme jusqu'a 20 kW.
#### Energie haute tension
Dans cette configuration, la roue consomme jusqu'a 200 kW.

> - Vous pouvez inverser le sens de rotation de la roue depuis le menu de configuration accessible avec la touche `V`. Cela ajuste egalement l'orientation du modele, y compris le motif de la bande de roulement. Ce reglage ne change pas la direction de la roue.

### Liste des entrees
|Channel|Function|Value|
|---|---|---|
|0|Accelerate|-1.0 to +1.0|
|1|Steer|-1.0 to +1.0|
|2|Regen|0 or 1|
|3|Brake|0.0 to 1.0|
|4|Gearbox|-1.0 to +1.0|

### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Wheel Rotation Speed|rot/s|
|1|Ground Friction|0 to 1|
