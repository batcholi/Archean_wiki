<p align="center">
  <img src="Beacon.png" />
</p>

|Component|`Beacon`|
|---|---|
|**Module**|`ARCHEAN_beacon`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
Le Beacon est un composant qui permet de transmettre et/ou recevoir des donnees vers/depuis d'autres Beacons.

# Usage
Pour fonctionner, un Beacon doit etre alimente en basse tension et consommera 10 watts en fonctionnement.
Il peut etre configure pour transmettre et/ou recevoir des donnees via les ports de donnees ou son interface de configuration accessible via la touche `V`.

Lors du placement d'un Beacon, une fleche apparait sur l'hologramme pour indiquer la direction de localisation du Beacon.

## Interface de configuration
- `Transmit Data` : Permet d'envoyer des donnees de type `nombre/texte`.
- `Transmit Frequency` : Permet de regler la frequence de transmission.
- `Receive Frequency` : Permet de regler la frequence de reception.
#### Informations
- `Last Received Distance` : Affiche la distance en metres du dernier Beacon dont il a recu des donnees.
- `Last Received Direction` : Affiche la direction (x,y,z) du dernier Beacon dont il a recu des donnees.
- `Last Received Data` : Affiche les dernieres donnees recues.
- `Is Receiving` : Indique si le Beacon recoit actuellement des donnees.

## Port de donnees
Le Beacon dispose d'un port de donnees qui permet de l'utiliser depuis un ordinateur ou d'autres composants.

### Liste des sorties
|Channel|Function|Range|
|---|---|---|
|0|Data|number or text|
|1|Distance|number (meters)|
|2|Direction X|-1.0 to +1.0|
|3|Direction Y|-1.0 to +1.0|
|4|Direction Z|-1.0 to +1.0|
|5|Is Receiving|0 or 1|

### Liste des entrees
|Channel|Function|Range|
|---|---|---|
|0|Transmit Data|number or text|
|1|Transmit Frequency|number or text|
|2|Receive Frequency|number or text|

> Informations :
>- Il n'y a pas de limite de distance pour les communications entre Beacons, bien que le plus proche aura la priorite si plusieurs Beacons emettent sur la meme frequence.
>- Le signal d'un Beacon n'est pas affecte par les obstacles.

> Astuces :
>- Le Beacon ne peut transmettre qu'une seule donnee a la fois, soit un nombre soit du texte. Mais vous pouvez utiliser le systeme d'objets [Key-Value](../../xenoncode/documentation.md#key-value-objects) pour transmettre autant de donnees que necessaire.
