<p align="center">
  <img src="Computer.png" />
</p>

|Composant|`Computer`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Masse**|10 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|100 x 100 x 50 cm|
#
---
> Pour apprendre à utiliser l'interface de programmation de l'ordinateur, consultez la page XenonCode IDE.

# Description

Le Computer est un composant conçu pour exécuter des programmes XenonCode afin de contrôler d'autres composants ou d'afficher diverses informations sur son écran.

Il possède des caractéristiques qui déterminent sa puissance, son stockage et sa mémoire.
Ces informations sont visibles sur le BIOS comme illustré dans l'image ci-dessous.

![Bios](bios.png)

### Informations du BIOS :
- **Processor Type** : Le processeur XPU64-AIO fait référence à ce type de composant ordinateur tout-en-un.
- **Frequency** : La fréquence est la vitesse à laquelle l'ordinateur exécute le code du programme en cours et correspond au paramètre `updates_per_second` du serveur (25 ticks par seconde par défaut).
- **Max IPC** : Ce paramètre est déterminé par un fichier de configuration et représente le nombre maximum d'instructions par cycle avant un "crash" virtuel.
- **System RAM** : Dans les programmes XenonCode, vous pouvez stocker des valeurs dans des variables volatiles qui se réinitialisent au redémarrage de l'ordinateur ou au rechargement d'un programme. Ce paramètre représente le nombre maximum de valeurs pour toutes les variables du programme en cours d'exécution.
- **Storage Capacity** : De manière similaire à la RAM système, il existe un type de variable de stockage qui enregistre les données sur le disque dur de façon permanente jusqu'à modification. Dans ce cas, la limite est de 256 valeurs maximum.
- **I/O Ports** : Ce paramètre est déterminé par les composants et indique simplement le nombre de ports de données sur l'ordinateur.

> Le BIOS est un programme qui s'exécute par défaut sur chaque ordinateur au démarrage.
>
> Dans ce cas, son rôle est d'indiquer les caractéristiques de l'ordinateur ainsi que la liste des programmes disponibles sur le disque dur afin que vous puissiez en sélectionner un à exécuter.
>
> Il est possible de personnaliser le BIOS en créant un nouveau fichier nommé "main.xc" pour modifier son apparence ou charger automatiquement un programme. Veuillez consulter la documentation du XenonCode IDE pour plus d'informations.

# Usage
### Programme :
Lorsqu'un programme est créé et sauvegardé, il apparaît dans la liste des programmes sur le BIOS. Vous pouvez sélectionner le programme à exécuter avec la touche `F`.
### Boutons :
Le Computer possède deux boutons physiques : le bouton "Code" qui ouvre le XenonCode IDE pour développer vos programmes, et un bouton "Reboot" qui redémarre l'ordinateur et ré-exécute le programme main.xc (BIOS).
### Alimentation :
Pour fonctionner, le Computer nécessite une alimentation basse tension. Il consomme 30 watts au repos et sa consommation peut monter jusqu'à 500 watts selon le ratio entre le nombre d'instructions exécutées par le programme en cours et le MAX IPC configuré sur le serveur.
### HDD :
Le Computer dispose d'une baie pour disque dur. Vous pouvez avoir plusieurs HDD dans la baie (un seul actif à la fois), échanger des HDD avec d'autres ordinateurs ou les ranger dans votre inventaire. Cela est utile lorsque vous souhaitez déplacer votre ordinateur sans perdre votre code.

---
>- La résolution de l'écran intégré est de 200x160 pixels.
>- *Le contenu des HDD (votre code) n'est pas perdu si vous détruisez un composant Computer par erreur. Il existera toujours dans les fichiers du serveur (ou de votre propre ordinateur si vous jouez en solo). Vous pouvez le trouver dans (Server Settings)/worlds/(World Name)/ARCHEAN_computer/HDD-... Vous pouvez même modifier le code depuis cet emplacement et cela redémarrera votre ordinateur en direct dans le jeu, si vous préférez utiliser un éditeur externe (VSCode dispose d'ailleurs d'une extension XenonCode)*
