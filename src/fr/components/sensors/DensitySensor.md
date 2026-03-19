<p align="center">
  <img src="DensitySensor.png" />
</p>

|Component|`DensitySensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Le capteur de densite est un composant qui mesure la densite et la composition de l'environnement dans lequel il est place.

# Usage
Une fois place sur votre construction, il peut etre connecte a un ordinateur, par exemple, pour recuperer la densite et la composition de l'environnement. La composition est donnee sous forme de chaine key-value.

### Liste des sorties
|Channel|Function|value|
|---|---|---|
|0|Density (kg/m³)|number|
|1|Composition|text|
