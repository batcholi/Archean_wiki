<p align="center">
    <img src="VehiclePhysicsSensor.png" />
</p>

|Component|`VehiclePhysicsSensor`|
|---|---|
|**Module**|`ARCHEAN_sensor1`|
|**Mass**| 1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#

---

# Description
Il Vehicle Physics Sensor e' un componente che fornisce informazioni sullo stato fisico del veicolo, massa, dimensioni, centro di massa e forza G.

# Usage
Una volta posizionato sulla costruzione, il sensore puo' essere collegato a un computer per recuperare informazioni sulla fisica del veicolo. Ecco le informazioni recuperabili:
- Active Physics: Indica se la fisica e' attiva o meno.
- Mass: La massa del veicolo.
- Size (X,Y,Z): Le dimensioni del volume di delimitazione del veicolo.
- Center of Mass (X,Y,Z): La posizione del centro di massa relativa alla posizione del sensore.
- G-force (X,Y,Z): La forza G relativa all'orientamento del sensore.

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Active Physics|0 or 1|
|1|Mass|kg|
|2|Size X|meters|
|3|Size Y|meters|
|4|Size Z|meters|
|5|Center of Mass X|meters|
|6|Center of Mass Y|meters|
|7|Center of Mass Z|meters|
|8|G-force X|G|
|9|G-force Y|G|
|10|G-force Z|G|
