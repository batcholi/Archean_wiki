<p align="center">
  <img src="Turbojet.png" />
</p>

|Composant|`Turbojet`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Masse**|1000 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|400 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Le Turbojet est un turboréacteur qui génère de la poussée par la combustion de carburant liquide avec l'air ambiant.
Il peut produire jusqu'à **60 kN** de poussée au niveau de la mer, à partir d'un débit de 1,4 kg/s de dodécane (C12H26).

# Usage

## Mise en place
Le réacteur nécessite :
- Une pompe qui pousse le carburant dans son port de fluide (il ne tire pas lui-même dans un réservoir).
- Une alimentation haute tension capable de fournir **125 kW** pendant le démarrage.
- Trois canaux de données : le démarreur, les allumeurs et la vanne de carburant.

Il n'a pas de régulation interne : la vanne de carburant est directement la commande de poussée.

## Démarrage
1. Démarreur à 1 : l'arbre monte jusqu'à environ 24 % de N1. Le démarreur consomme 125 kW tant qu'il tourne.
2. Allumeurs à 1 (400 watts) et vanne ouverte modérément : la combustion démarre dès que le carburant arrive dans la chambre.
3. Une fois le réacteur en marche, le démarreur et les allumeurs peuvent être coupés : la flamme entretient seule la rotation.

Le carburant injecté sans étincelle s'accumule dans la chambre et s'enflamme d'un coup à la première étincelle.

> Le panneau d'inspection affiche l'état des trois commandes et la raison pour laquelle le réacteur ne tourne pas (démarreur sans alimentation, vanne fermée, pas de carburant, pas d'étincelle, pas d'oxygène).

## Pilotage
La poussée nominale s'obtient vers 77 % de la vanne ; grande ouverte, elle laisse passer 30 % de plus que le débit nominal et la température des gaz dépasse la limite des aubes.

La flamme ne tient que dans une plage de richesse :
- Une ouverture brutale de la vanne rend le mélange trop riche : le compresseur pompe (`Surge`) pendant une seconde et le réacteur subit des dégâts.
- Une fermeture presque complète au-dessus de 45 % de N1 rend le mélange trop pauvre : la flamme s'éteint.

Après une extinction, les allumeurs ne rallument la flamme qu'une fois l'arbre redescendu sous 55 % de N1. Une chambre encore chaude (plus de 750 K) rallume le carburant d'elle-même, sans allumeurs.

Vanne à 0, la flamme s'éteint et l'arbre met environ deux minutes à s'arrêter.

La poussée diminue avec l'altitude. En vol, la vitesse comprime l'air à l'entrée mais réduit la poussée à puissance égale.

## Limites
- Température des gaz (EGT) au-dessus de **1250 K** : usure rapide des aubes.
- N1 au-dessus de **105 %** : destruction rapide du rotor.
- Ingestion d'eau au-dessus de 30 % de N1 : les aubes cassent.
- Carburant contaminé (eau, hydrocarbures lourds) au-delà de 5 % : usure. Le pétrole brut use le réacteur.

## États
|État|Signification|
|---|---|
|Off|Réacteur arrêté.|
|Cranking|Le démarreur entraîne l'arbre.|
|Running|Combustion en cours.|
|Surge|Pompage du compresseur, mélange trop riche.|
|Destroyed|Réacteur détruit.|

### Liste des entrées
|Canal|Fonction|Plage|
|---|---|---|
|0|Starter|0 ou 1|
|1|Igniters|0 ou 1|
|2|Throttle|0.0 à 1.0|

### Liste des sorties
|Canal|Fonction|Valeur|
|---|---|---|
|0|N1|%|
|1|Thrust|Newtons|
|2|EGT|Kelvin|
|3|Running|0 ou 1|
|4|Burned fuel flow|kg/s|
|5|Unburned fuel flow|kg/s|
|6|State|"Off", "Cranking", "Running", "Surge", "Destroyed"|
