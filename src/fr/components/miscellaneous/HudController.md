<p align="center">
  <img src="HudController.png" />
</p>

|Component|`HudController`|
|---|---|
|**Module**|`ARCHEAN_hud`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description

Le HUD Controller est un composant qui permet de creer un HUD et de l'afficher sur l'ecran du joueur lorsqu'il s'y abonne. Par exemple, il permet de creer une ou plusieurs interfaces personnalisees sur les constructions.

# Usage
Lorsque vous placez un HUD Controller sur votre construction, il dispose de deux boutons :
- **Code** :
	- Ouvre l'IDE XenonCode, ou vous pouvez ecrire le code du HUD. Consultez la section [HUD](../../xenoncode/hud.md) pour plus d'informations sur la creation de HUDs.
- **Active** :
	- Permet de s'abonner ou de se desabonner du HUD Controller.

> Lorsque l'IDE est ouvert, vous etes automatiquement abonne au HUD Controller tant que l'IDE reste ouvert.

## Controle via son port de donnees
### Utilisation avec un [Pilot Seat](../controllers/PilotSeat.md)
L'abonnement au HUD Controller peut egalement se faire via son port de donnees en utilisant un [Pilot Seat](../controllers/PilotSeat.md), qui a la capacite unique d'envoyer un identifiant unique (Token) sur son canal 0 (Using). Vous pouvez connecter un [Pilot Seat](../controllers/PilotSeat.md) directement au port de donnees du HUD Controller, vous permettant de vous abonner au HUD Controller lorsque vous etes assis dans le [Pilot Seat](../controllers/PilotSeat.md) et de vous desabonner lorsque vous le quittez.

Vous pouvez egalement utiliser un [Pilot Seat](../controllers/PilotSeat.md) connecte a un [Computer](../computers/Computer.md) pour vous abonner au HUD Controller. Dans ce cas, vous devez utiliser le canal 0 (Using) du [Pilot Seat](../controllers/PilotSeat.md) pour envoyer le Token au port de donnees du HUD Controller.

> - Assurez-vous que le parametre `Emit user token on Channel 0` est active dans la fenetre d'information du [Pilot Seat](../controllers/PilotSeat.md), accessible avec la touche `V`. Cela garantit que le Token de l'utilisateur est transmis sur le canal 0 du [Pilot Seat](../controllers/PilotSeat.md) au lieu d'un `0` ou `1`.
> - Nous recommandons de ne pas recuperer le Token et de coder en dur des choses avec. Le Token est regenere a chaque connexion du joueur au serveur pour des raisons de securite. Si un joueur malveillant obtient le Token d'un autre joueur, il pourrait l'utiliser pour afficher n'importe quoi sur le HUD de ce joueur a son insu.

### HUD Controller pour les administrateurs de serveur
Le HUD Controller peut egalement etre utilise pour creer un HUD visible par tous les joueurs du serveur.
Pour ce faire, un administrateur doit simplement placer un [OwnerPad](OwnerPad.md) sur la construction ou se trouve le HUD Controller.

Ensuite, connectez le HUD Controller a un [Computer](../computers/Computer.md) et envoyez le texte `*` au canal 0 du HUD Controller pour lui indiquer de s'abonner a tous les tokens.

> **Note** : Lorsqu'un administrateur de serveur cree un HUD Controller pour tous les joueurs, il ne peut pas etre desactive. Par consequent, il faut veiller a ne pas creer un HUD Controller qui pourrait etre perturbant pour les joueurs.
