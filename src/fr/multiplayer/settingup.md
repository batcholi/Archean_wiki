Archean offre une expérience multijoueur, vous permettant d'ouvrir vos parties solo à d'autres joueurs ou de configurer un serveur dédié.

# Configuration matérielle requise
Pour assurer le bon fonctionnement d'un serveur Archean en mode multijoueur, la configuration minimale suivante est recommandée :
- **Processeur** : Privilégiez la puissance par coeur (i7, Ryzen...)
- **Mémoire** : Minimum 8 Go de RAM

Cette configuration peut évoluer selon la plateforme utilisée (Windows, Linux, etc.) et les futures mises à jour du jeu.

# Réseau
Quel que soit le choix du système d'exploitation, vous devez vous assurer que le port `8881` est ouvert pour `UDP` et `TCP`.

> **Note** : En jouant en solo sans `accept_remote_connections = yes`, si le port 8881 est déjà utilisé, le jeu utilisera automatiquement un port disponible aléatoire.

# Mise en place d'un serveur

## SteamCMD (Recommandé)
Archean Server est disponible via SteamCMD. C'est la méthode recommandée pour les serveurs dédiés car elle permet des mises à jour faciles.

```bash
steamcmd +login anonymous +app_update 3557220 +quit
```

Une fois téléchargé, lancez l'exécutable du serveur comme décrit dans **Installation manuelle** ci-dessous.

## Installation manuelle
Pour Linux comme pour Windows, un exécutable autonome est disponible pour faire tourner un serveur Archean.

Pour démarrer le serveur, lancez simplement le fichier `Archean_server[.exe]` situé dans le dossier `Archean-game`. Le serveur se lancera en mode console et vous demandera une série d'informations pour le configurer. Ces informations ne seront plus demandées une fois la valeur `server_public_name` définie dans le fichier `server.ini`.

## Docker
Pour mettre en place un serveur dédié sur un serveur Linux, vous aurez besoin de `curl` ainsi que de `Docker` pour exécuter le script d'installation automatique.

L'installation de Docker peut varier considérablement selon la distribution utilisée. Nous recommandons de consulter le Wiki de votre distribution pour obtenir des conseils sur une installation réussie.

Pour installer le serveur avec le script officiel, voici les étapes à suivre :
```bash
# Télécharger le script d'installation
curl -s -o install_archean_server.sh https://archean.space/assets/user_scripts/run_server_with_docker.sh

# Le rendre exécutable
chmod +x install_archean_server.sh

# Exécuter ce script pour installer ou mettre à jour le serveur
./install_archean_server.sh
```
> Note : Il est possible d'utiliser cette méthode sur Windows en utilisant WSL (Windows Subsystem for Linux), mais certains utilisateurs ont rencontré des problèmes potentiels de performance.

## Autoriser l'accès à votre partie solo
Vous pouvez autoriser l'accès à votre partie solo en configurant manuellement le fichier `server.ini` avec les paramètres suivants :
- `server_online = yes`
- `server_public_name = <Le nom que vous voulez>`
- `accept_remote_connections = yes`

Ensuite, chaque fois que vous appuyez sur `Play` dans le launcher, un serveur public sera listé et d'autres joueurs pourront vous rejoindre.
> - N'oubliez pas d'ouvrir votre port 8881 (ou tout autre port que vous avez configuré dans `listen_port`).
> - Vous n'êtes pas obligé de définir le paramètre `server_online` à `yes` pour permettre à d'autres joueurs de rejoindre votre partie. Vous pouvez aussi les inviter en leur donnant votre adresse IP et le port de votre serveur, qu'ils devront entrer manuellement dans le launcher du jeu. Vous devez uniquement définir `accept_remote_connections = yes`.

# Installation de mods sur un serveur dédié
Sur un serveur dédié, vous devez télécharger manuellement les mods via SteamCMD et configurer le serveur pour les trouver.

## 1. Télécharger les mods avec SteamCMD
Utilisez SteamCMD pour télécharger les mods du Workshop. Vous pouvez installer SteamCMD n'importe où sur votre système.

```bash
# Télécharger un mod par son ID Workshop (remplacez WORKSHOP_ID par l'ID réel)
steamcmd +login anonymous +workshop_download_item 2941660 WORKSHOP_ID +quit
```

où `2941660` est l'AppID Steam d'Archean et `WORKSHOP_ID` est l'ID Workshop du mod (trouvable dans l'URL Workshop du mod).

Par défaut, SteamCMD télécharge le contenu Workshop dans :
- **Linux** : `~/.local/share/Steam/steamapps/workshop/content/2941660/`
- **Windows** : `<chemin_installation_SteamCMD>/steamapps/workshop/content/2941660/`

Vous pouvez également spécifier un répertoire de téléchargement personnalisé avec l'option `+force_install_dir`.

## 2. Configurer external_mods_dir
Dans votre `server.ini`, définissez `external_mods_dir` pour pointer vers le répertoire contenant vos mods téléchargés :

```ini
[server]
external_mods_dir = /chemin/vers/steamcmd/steamapps/workshop/content/2941660/
```

Le serveur scannera ce répertoire à la recherche de dossiers de mods contenant un fichier `repository`.

## 3. Activer les mods pour votre monde
Éditez le fichier `mods.txt` dans le dossier de votre monde :
```
Archean-data/server/worlds/<nom_du_monde>/mods.txt
```

Ajoutez un nom de mod par ligne. Le nom du mod est défini dans le fichier `repository` du mod (pas le nom du dossier).

Exemple de `mods.txt` :
```
MYVENDOR_mymod
OTHERVENDOR_anothermod
```

> - Si un mod listé dans `mods.txt` n'est pas trouvé, le serveur vous demandera de continuer sans ou d'abandonner.
> - Le nom du mod (format VENDOR_modname) est généralement affiché sur la page Steam Workshop du mod.

# Configuration du serveur (server.ini)
Le fichier `server.ini` contient tous les paramètres du serveur. Voici la liste complète des paramètres disponibles :

## Paramètres du serveur
| Paramètre | Par défaut | Description |
|-----------|---------|-------------|
| `server_online` | `no` | Si le serveur est listé publiquement |
| `server_public_name` | *(vide)* | Nom affiché dans la liste des serveurs |
| `accept_remote_connections` | `no` | Autoriser les joueurs à se connecter à distance |
| `max_simultaneous_players` | `16` | Nombre maximum de joueurs simultanés |
| `password` | *(vide)* | Mot de passe pour les serveurs privés (laisser vide pour public) |
| `external_mods_dir` | *(vide)* | Chemin vers le répertoire des mods externes |

## Paramètres de jeu
| Paramètre | Par défaut | Description |
|-----------|---------|-------------|
| `world` | *(vide)* | Nom de la sauvegarde du monde |
| `spawn` | `earth` | Lieu d'apparition (corps céleste) |
| `spawn_x`, `spawn_y`, `spawn_z` | Coordonnées Terre | Coordonnées de la position d'apparition |

## Paramètres réseau
| Paramètre | Par défaut | Description |
|-----------|---------|-------------|
| `listen_port` | `8881` | Port d'écoute |
| `listen_new_connection_timeout_ms` | `500` | Délai d'expiration de connexion en millisecondes |
| `automatic_blacklist` | `no` | Mettre automatiquement en liste noire les connexions problématiques |

## Paramètres de performance
| Paramètre | Par défaut | Description |
|-----------|---------|-------------|
| `updates_per_second` | `25` | Taux de tick du serveur (mises à jour par seconde) |
| `physics_steps_per_update` | `8` | Nombre d'étapes de simulation physique par tick serveur |
| `auto_save_interval_seconds` | `30` | Intervalle de sauvegarde automatique en secondes |
| `screens_compression_level` | `2` | Niveau de compression des écrans (0-9). Plus bas = CPU plus rapide mais plus de bande passante. Plus haut = CPU plus lent mais moins de bande passante |
| `server_loop_thread_cpu_affinity` | `-1` | Affinité de coeur CPU pour le thread de boucle serveur (-1 = automatique) |

> **Astuce** : Si votre serveur a une charge CPU élevée due aux écrans/dashboards, essayez de baisser `screens_compression_level` à 0 ou 1 pour de meilleures performances au prix d'une bande passante réseau plus importante.

# Gestion des administrateurs
## Panneau d'administration (F4)
Un panneau d'administration est accessible en jeu avec la touche `F4`.
Il affiche la charge du serveur et sa vitesse en ticks par seconde. *(25 ticks/s étant le taux de tick maximum par défaut garantissant des performances optimales)*

Une case à cocher `Admin Privileges` permet, entre autres, de faire apparaître des Blueprint gratuitement lorsque le mode de jeu est réglé sur `Adventure`.

Le panneau offre deux onglets :
- **Players** : Permet de voir la liste des joueurs connectés, de se téléporter vers eux et/ou de les expulser.
- **Entities** : Permet de voir la liste des entités présentes sur le serveur (avec propriétaire et alias), de les supprimer et/ou de se téléporter vers elles. Affiche également le nombre total d'entités.

## Ajouter/Supprimer un administrateur
Pour ajouter un administrateur, modifiez simplement le fichier `/Archean-data/server/admins.txt`.
Ce fichier doit contenir une liste d'identifiants de joueurs, un par ligne.
Si le joueur utilise Steam, son identifiant Steam64 doit être utilisé.

## Commandes administrateur
Les administrateurs ont accès à des commandes de chat spéciales. Consultez [Chat & Commandes](../misc/chat.md) pour la liste complète, y compris la commande `/ban`.
