<p align="center">
  <img src="PilotSeat.png" />
</p>

|Composant|`PilotSeat`|
|---|---|
|**Module**|`ARCHEAN_avatar`|
|**Masse**|50 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|75 x 75 x 175 cm|
#
---

# Description
Le Pilot Seat permet à un joueur de contrôler (envoyer des valeurs sur différents canaux) un composant en utilisant les commandes véhicule assignées depuis un clavier, une manette ou un joystick.

# Usage
Appuyez sur `R` pour vous asseoir dans le siège.
Appuyez sur `R` pour quitter le siège.

> Vous pouvez activer **Maintenir la touche pour quitter le siège** dans les paramètres du jeu si vous préférez l'ancien comportement de maintien de R pendant une seconde.

> Lorsque vous êtes assis, vous pouvez passer à un autre siège proche sans avoir besoin de quitter le siège actuel en utilisant la touche `R`.
> Lorsque vous quittez un siège, il se souvient de votre position relative à la construction au moment où vous vous êtes assis, et c'est là que vous serez lorsque vous le quitterez.

## Configuration
Dans la fenêtre d'information du Pilot Seat accessible avec la touche `V` :

| Option | Description |
|--------|-------------|
| **Smooth Controls** | Lisse les entrées clavier pour les joueurs sans joystick |
| **Emit user token on Channel 0** | Envoie le jeton de l'utilisateur sur le canal 0 au lieu de `1` (activé par défaut) |

Le jeton utilisateur peut être utilisé avec un [HUD Controller](../miscellaneous/HudController.md) pour identifier quel utilisateur est assis.

### Liste des sorties
|Canal|Fonction|Plage|
|---|---|---|
|0|Utilisation|1 ou le jeton de l'utilisateur assis dans le Pilot Seat, sinon 0|
|1|Arrière/Avant|-1.0 à +1.0|
|2|Gauche/Droite|-1.0 à +1.0|
|3|Bas/Haut|-1.0 à +1.0|
|4|Tangage|-1.0 à +1.0|
|5|Roulis|-1.0 à +1.0|
|6|Lacet|-1.0 à +1.0|
|7|Poussée principale|0.0 à 1.0|
|8|Aux 1|0 ou 1|
|9|Aux 2|0 ou 1|
|10|Aux 3|0 ou 1|
|11|Aux 4|0 ou 1|
|12|Aux 5|0 ou 1|
|13|Aux 6|0 ou 1|
|14|Aux 7|0 ou 1|
|15|Aux 8|0 ou 1|
|16|Aux 9|0 ou 1|
|17|Aux 0|0 ou 1|

> Si un [OwnerPad](../miscellaneous/OwnerPad.md) est présent, vous devez avoir la permission "`Sit`" pour vous asseoir dans le siège et `Interact` pour utiliser les commandes.
