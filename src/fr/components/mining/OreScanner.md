<p align="center">
  <img src="OreScanner.png" />
</p>

|Component|`OreScanner`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 25 x 25 cm|
#
---

# Description
L'Ore Scanner est un composant qui permet de recuperer la composition du terrain a une ou plusieurs positions (par distance) dans la direction de son capteur. Il ne fonctionne que sur les planetes et les lunes et est principalement utilise pour trouver des minerais pour le systeme de fabrication.

# Usage
D'un point de vue technique, le scanner est tres simple. Vous lui envoyez un nombre dans le canal 0 qui correspond a la distance en metres a laquelle vous souhaitez scanner le terrain horizontalement, et le scanner retournera un objet texte correspondant a la composition a cette distance dans la direction du capteur.

Sa force reside dans la capacite a lui envoyer plusieurs distances dans differents canaux pour scanner plusieurs points simultanement a chaque tick du serveur (25 fois par seconde par defaut).

> Ne le pointez jamais vers le bas/haut, il fonctionne mieux en scannant horizontalement.

## Exemple
Pour scanner le terrain a une distance de 10m, vous devez envoyer la valeur 10 dans le canal d'entree 0. Le scanner retournera un objet texte correspondant a la composition a 10m de distance dans le canal de sortie correspondant.

Pour scanner le terrain a des distances de 10m et 20m, vous devez envoyer la valeur 10 dans le canal d'entree 0 et la valeur 20 dans le canal d'entree 1, par exemple. Le scanner retournera alors un objet texte correspondant a la composition a 10m dans le canal de sortie 0 et un autre objet texte pour 20m dans le canal de sortie 1.

Avec ces possibilites, vous pouvez, par exemple, utiliser une boucle XenonCode pour scanner toutes les compositions dans un rayon de 100m avec un pas de 10m et les afficher dans la console.

```xc
	repeat 10 ($i)
		output_number($scanner_io, $i, $i*10)
		print(input_text($scanner_io, $i))
```

Gardez a l'esprit qu'il y aura un delai de 1 tick entre l'envoi vers la sortie et la recuperation depuis l'entree.
En gros, le Scanner vous donnera les resultats bases sur les valeurs que vous lui avez envoyees au tick precedent, donc ne melangez pas vos valeurs de distance entre les canaux et n'utilisez pas de valeurs aleatoires, essayez de les garder coherentes sur plusieurs ticks.

## Recuperation des donnees
Lorsque vous avez effectue un scan, vous pouvez recuperer les informations de composition, qui seront sous forme d'objet texte key-value.
Par exemple, si vous avez scanne le terrain a une distance de 10m, vous pouvez recuperer un objet texte de la forme `.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}`, ce qui signifie que le terrain a une distance de 10m contient 12% de carbone, 5% de fer, 3% de silicium et 80% de cuivre.

Vous pouvez facilement parser cela pour recuperer les donnees qui vous interessent en utilisant le systeme key-value implemente dans [XenonCode](../../xenoncode/documentation.md).

## Aller plus loin
L'Ore Scanner scanne le terrain dans la direction de son capteur. Vous pouvez l'installer sur un Small Pivot pour, par exemple, le faire tourner et creer une carte de composition autour de sa position en utilisant un programme XenonCode et les ecrans du jeu.

## Energie
L'Ore Scanner consomme de l'energie basse tension pour fonctionner. Sa consommation est directement proportionnelle au nombre de canaux que vous utilisez. Plus vous scannez de positions en un seul tick, plus vous consommez d'energie, soit 100 watts par canal par tick.
