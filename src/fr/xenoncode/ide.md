# XenonCode IDE
Le **XenonCode IDE** est une interface qui vous permet de créer/modifier des scripts et des programmes pour contrôler des composants et des systèmes. Il est basé sur le langage de programmation **XenonCode**, qui a été écrit spécialement pour ce jeu.

## Fonctionnalités
- **Éditeur de texte** : Un éditeur de texte avec coloration syntaxique pour écrire des scripts/programmes.
- **Éditeur de noeuds** : Un système de programmation alternatif basé sur des noeuds visuels pour créer des scripts de manière visuelle et intuitive.
- **Console** : Une console pour afficher des informations, des messages de débogage et d'erreur.
- **Barre d'outils** : Une barre d'outils pour créer/supprimer des scripts/programmes, redémarrer le système, et accéder à la documentation disponible sur la page [Archean](archean.md).

---
## Utiliser l'IDE sur les ordinateurs
Le bouton `CODE` sur les ordinateurs permet d'accéder à l'IDE. De là, vous pouvez commencer à écrire des scripts et des programmes pour contrôler des composants et des systèmes.

### Bibliothèque de l'IDE
L'IDE inclut une fonctionnalité de bibliothèque qui vous permet de sauvegarder localement et de réutiliser des fichiers XenonCode à travers différents ordinateurs. C'est utile pour partager des fonctions communes, des scripts utilitaires ou des modèles entre plusieurs ordinateurs en jeu sans avoir à copier-coller du code manuellement.

### Informations supplémentaires spécifiques aux ordinateurs
#### [Computer](../components/computers/Computer.md)
L'ordinateur possède un écran tactile intégré et un BIOS avec interface utilisateur qui affiche les informations système et les programmes disponibles sur le disque dur au démarrage. Vous pouvez sélectionner un programme à exécuter en le visant et en appuyant sur la touche `F`.

#### [Mini Computer](../components/computers/MiniComputer.md)
Le MiniComputer est plus petit que le Computer et ne possède pas d'écran tactile ni de BIOS visuel. Il exécutera nativement le premier programme créé sur le disque dur.

## Interface
L'interface du XenonCode IDE fonctionne beaucoup comme un IDE normal que les programmeurs utilisent, sauf qu'au lieu d'avoir une hiérarchie de fichiers, tous les fichiers du disque dur de l'ordinateur virtuel sont toujours ouverts sous forme d'onglets.
Les onglets peuvent être déplacés et détachés/rattachés de l'IDE, mis côte à côte, de haut en bas, etc.
Vous pouvez avoir plusieurs IDEs (c'est-à-dire de plusieurs ordinateurs en jeu) ouverts en même temps dans le jeu, bien qu'ils ne puissent pas être attachés/accrochés ensemble.

## Créer un BIOS personnalisé
Il est possible de personnaliser le BIOS de l'ordinateur en créant un fichier nommé `main.xc`. Ce fichier est le premier à être exécuté lorsqu'un ordinateur démarre. Vous pouvez l'utiliser pour modifier l'apparence du BIOS ou pour charger automatiquement un programme ou exécuter directement n'importe quel type de code.

## Programmes vs Fichiers
Un Programme est un fichier qui peut être chargé en utilisant `load_program()`, et son nom se terminera par `*.main.xc` (vous n'avez pas à ajouter cela dans le nom, écrivez juste le préfixe).
Un Fichier est destiné à être inclus dans un programme, ne peut pas être chargé comme programme autonome, mais peut être un BIOS personnalisé lorsqu'il est nommé exactement `main.xc` sans aucun préfixe.
Les programmes peuvent être écrits avec le système de noeuds ou en code pur, tandis que les fichiers normaux ne peuvent être écrits qu'en code pur.
Les programmes peuvent `include()` des fichiers ou d'autres programmes, tant qu'il n'y a pas de conflit de noms dans leur contenu, et qu'un seul point d'entrée `init` est défini.

## Basculer entre les modes (noeuds visuels / code)
Lorsque vous créez un programme, il commencera avec le mode noeuds visuels et quelques noeuds IO initiaux comme exemple que vous pouvez supprimer.
Le système de noeuds visuels générera toujours automatiquement du code en arrière-plan au fur et à mesure que vous faites des modifications.
Vous pouvez "Switch To Code" à tout moment, cependant il ne sera pas modifiable tout de suite.
Pour le rendre modifiable, vous pouvez "Convert to Code", ce qui commentera simplement la première ligne #NODES qui définit les noeuds, et vous pourrez modifier le code.
Après avoir modifié en code, si vous voulez revenir aux noeuds, votre code sera écrasé par les noeuds que vous aviez avant de passer initialement au code.
Cela signifie que typiquement, lors de la conversion en code, c'est permanent, à moins que vous ne vouliez revenir à ce qu'il y avait avant.

## Exécuter le code
Les ordinateurs en jeu redémarreront toujours automatiquement chaque fois qu'une modification a été sauvegardée dans le fichier courant (CTRL+S).
Sauvegarder sans faire de modification ne fera rien, mais vous pouvez forcer le redémarrage avec CTRL+SHIFT+S, qui forcera aussi la sauvegarde de TOUS les fichiers ouverts.
Lors du redémarrage après la sauvegarde d'une modification, l'ordinateur chargera immédiatement le programme précédent s'il y en avait un en cours d'exécution, sans passer par le BIOS.
Si une erreur survient, que ce soit une erreur de syntaxe ou une erreur d'exécution (comme une division par zéro ou un mauvais indexage), l'ordinateur se figera et l'écran deviendra vide, et l'erreur apparaîtra dans la console. À ce stade, vous devrez corriger le problème et le redémarrer en sauvegardant le fichier modifié.

## Persistance
Les ordinateurs en jeu fonctionnent tous côté serveur, et ils continueront de fonctionner lorsque vous vous déconnectez, si vous jouez sur un serveur dédié.
Les fichiers sont sauvegardés sur le disque dur du serveur en texte brut, y compris un fichier temporaire pour les modifications non sauvegardées, qui est mis à jour à chaque modification, donc vous ne perdrez pas votre code.
Même si vous n'aviez pas sauvegardé votre fichier, si votre jeu plante, que vous jouiez en solo ou à distance, vous le récupérerez lorsque vous vous reconnecterez.
Si vous préférez utiliser un IDE externe au jeu, comme vscode, vous pouvez aussi modifier les fichiers directement sur le serveur, si vous l'hébergez vous-même ou jouez en solo.
Les disques durs virtuels sont stockés dans `Archean-data/server/worlds/<WORLD_NAME>/ARCHEAN_computer/HDD-*` et ils contiennent les fichiers .xc tels que vous les avez créés, ainsi que le sous-répertoire `storage` qui contiendra les variables de stockage dans leurs propres fichiers individuels avec leurs valeurs en texte brut, séparées par des sauts de ligne pour les tableaux.
Lors de la modification d'un fichier en externe, le jeu détectera tout changement apporté au programme en cours d'exécution et redémarrera automatiquement l'ordinateur.
Cependant, la modification d'un fichier de stockage ne causera pas de redémarrage, et les valeurs ne seront pas utilisées immédiatement, car elles sont mises en cache dans la mémoire de l'ordinateur au chargement.
Les fichiers de stockage seront néanmoins mis à jour immédiatement sur le disque dur du serveur lors de la modification de la valeur.

## Collaboration
L'IDE est collaboratif, ce qui signifie que plusieurs joueurs peuvent au moins voir le contenu, tandis qu'un seul joueur à la fois peut modifier le code.
Chaque fois que le joueur éditeur fait un changement, même non sauvegardé, les autres joueurs verront le changement se produire en temps réel, que ce soit en mode Code ou Noeuds.
Les joueurs non-éditeurs sont en lecture seule, ils ne peuvent pas modifier le code ou les noeuds, jusqu'à ce qu'ils cliquent sur Edit, auquel cas ils deviendront l'éditeur courant et l'éditeur précédent deviendra un lecteur en lecture seule.

## Raccourcis clavier
- `CTRL+S` Sauvegarder le fichier courant et redémarrer l'ordinateur
- `CTRL+SHIFT+S` Sauvegarder tous les fichiers et redémarrer l'ordinateur
- `CTRL+D` Sélectionner l'occurrence suivante dans le code, ou dupliquer le(s) noeud(s) sélectionné(s) en mode Noeuds
- `CTRL+C` Copier le code ou les noeuds sélectionnés
- `CTRL+V` Coller le code ou les noeuds
- `CTRL+N` Créer un nouveau fichier
- `CTRL+SHIFT+N` Créer un nouveau programme
- `CTRL+Q` Fermer l'IDE

## VSCode
Nous avons mis à disposition une extension vscode pour supporter la coloration syntaxique XenonCode ainsi que du linting, si vous souhaitez l'utiliser.

---
