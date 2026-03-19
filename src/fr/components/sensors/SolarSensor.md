<p align="center">
    <img src="SolarSensor.png" />
</p>

|Component|`SolarSensor`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**| 1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#

---

# Description
Le capteur solaire est un composant qui mesure l'angle d'incidence du soleil et la puissance solaire potentielle.

# Usage
Une fois place sur votre construction, le capteur peut etre connecte a un ordinateur pour recuperer une valeur normalisee de l'angle d'incidence, indiquant generalement la position du soleil par rapport a la position du capteur. Le capteur permet egalement de recuperer la valeur potentielle de la puissance solaire recue en watts/m².

> - Il est possible de faire suivre le soleil par un panneau solaire sans utiliser d'ordinateur en connectant ces capteurs directement a des hinges.


### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Normalized Angle|-1.0 to +1.0|
|1|Solar Power|W/m²|
