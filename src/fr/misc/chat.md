# Chat & Commandes

## Système de chat
Le chat permet aux joueurs de communiquer entre eux. Pour discuter avec d'autres joueurs, appuyez sur `Entrée` pour ouvrir le chat, puis tapez votre message et appuyez de nouveau sur `Entrée` pour l'envoyer.
> - Vous avez la possibilité de copier un message en cliquant simplement dessus avec le `bouton gauche de la souris`. Les messages multilignes sont entièrement supportés.
> - La longueur maximale d'un message est limitée à 800 caractères.
> - Les conversations du chat sont enregistrées dans le fichier de log du serveur.

### Historique des commandes
Lorsque le chat est ouvert, utilisez les **touches fléchées Haut/Bas** pour parcourir les commandes précédemment saisies. Un popup visuel apparaît au-dessus de la zone de saisie affichant jusqu'à 20 entrées récentes. Vous pouvez également cliquer sur n'importe quelle entrée pour la sélectionner.

> **Note :** Si des suggestions de commandes sont visibles (auto-complétion), les touches fléchées naviguent dans les suggestions à la place. La navigation dans l'historique reprend lorsqu'aucune suggestion n'est affichée.

## Commandes
Les commandes vous permettent d'effectuer des actions spécifiques en les tapant dans le chat, précédées d'un `/`. Plusieurs commandes sont disponibles, dont certaines sont réservées aux administrateurs.

#### Liste des commandes disponibles pour tous les joueurs :
- `/clear` - Efface les messages affichés dans le chat.
- `/help` - Affiche la liste des commandes disponibles et leurs effets.
- `/list` - Affiche la liste des joueurs connectés.
- `/info` - Affiche des informations sur le serveur. *(Nom du serveur, charge CPU, ticks par seconde (25 ticks/s étant la valeur idéale pour un serveur stable))*

#### Liste des commandes disponibles pour les administrateurs :
- `/save` - Sauvegarde l'état actuel du jeu.
- `/setspawn <nom_utilisateur>` - Définit le point d'apparition pour un utilisateur spécifique.
- `/give [<stack>] [<moduleName>.]<itemType> [<inventoryAlias|nom_utilisateur>]` - Donne des objets à un joueur. Si aucun nom d'utilisateur n'est spécifié, les objets vous sont donnés.
- `/kick <nom_utilisateur|id>` - Expulse un joueur du serveur.
- `/ban <nom_utilisateur|id>` - Bannit un joueur du serveur.
- `/timeadd [-]<heures>` - Ajoute ou soustrait du temps dans le jeu.
