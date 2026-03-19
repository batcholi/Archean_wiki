<p align="center">
  <img src="GeothermalExchanger.png" />
</p>

|Component|GeothermalExchanger|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Le Geothermal Exchanger est un composant concu pour exploiter la chaleur naturelle des profondeurs souterraines afin de rechauffer un fluide.

# Usage
Le Geothermal Exchanger est destine a etre utilise exclusivement sur des constructions stationnaires. Une fois place sur une construction et alimente en basse tension (consommant 1000 watts en continu), il s'ancrera automatiquement au sol et empechera completement la structure de bouger.

> #### Attention :
> - Le Geothermal Exchanger verrouille la construction en place. Pour restaurer la mobilite, il doit d'abord etre detruit.
> - Si la structure reste statique apres la destruction du Geothermal Exchanger, placez simplement un [Ground Anchor](../miscellaneous/GroundAnchor.md) temporairement pour rafraichir son etat et lui permettre de redevenir active.

Le Geothermal Exchanger doit etre place tres pres du sol. Si sa base est a plus de 0,5 metre au-dessus du sol, il restera inactif.

Une fois operationnel :
- Il fore lentement jusqu'a une profondeur maximale de 1000 metres.
- Plus il descend, plus le fluide en circulation devient chaud (jusqu'a un maximum de 650K).
- Il commence a pomper le fluide une fois qu'il atteint 373K.

Il est principalement utilise pour produire de l'energie en faisant circuler le fluide a travers une Steam Turbine.

### Informations supplementaires
- Le Geothermal Exchanger fonctionne exclusivement avec de l'eau (H₂O).
- Debit maximum : 0,1 kg/s.

> Une Small Steam Turbine peut generalement etre alimentee efficacement par jusqu'a 10 Geothermal Exchangers, permettant une puissance de sortie theorique maximale d'environ 270 kW.

### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Depth|metres|
|1|Temperature|Kelvin|