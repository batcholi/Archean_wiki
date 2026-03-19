# Gestion du HUD dans Archean
## Introduction
Le système HUD (Heads-Up Display) permet aux joueurs de créer leurs propres interfaces graphiques pour afficher des informations à l'écran telles que des textes, des boutons, des dessins... en utilisant XenonCode.

Les HUDs sont entièrement gérés par le client, ce qui signifie que chaque joueur a ses propres HUDs et les autres joueurs ne peuvent pas les voir. Cependant, ils peuvent communiquer avec un [Beacon](../components/navigation/Beacon.md) ou d'autres joueurs grâce à un système intégré qui permet d'envoyer et de recevoir des données sur des fréquences.

Il est important de noter que puisque les HUDs sont entièrement côté client, ils seront disponibles sur tous les serveurs/mondes auxquels vous vous connectez. Vous ne pouvez pas les configurer pour un serveur/monde spécifique sauf manuellement comme indiqué dans la section suivante.

> Informations supplémentaires :
> - Lorsque vous utilisez un bouton ou toute autre interaction sur un HUD, le `clic droit` est préféré pour éviter de capturer le regard souris.

## Créer un HUD
Puisque les HUDs sont une fonctionnalité entièrement côté client, ils n'ont pas d'objets directement associés dans le jeu. Pour créer un HUD, vous devez passer par le menu des paramètres du jeu `F1` et aller dans l'onglet `HUD`.

![HUD Menu](hud-img/hudMenu.png)

Depuis ce menu, vous pouvez créer autant de HUDs que vous le souhaitez et les activer/désactiver à votre convenance en utilisant la case à cocher. Il est important de savoir que chaque HUD est une instance unique et ne communique pas nativement avec les autres HUDs, bien que la communication soit possible grâce à une fonctionnalité qui sera expliquée plus loin sur cette page.

Une fois votre HUD créé, vous pouvez ouvrir son IDE pour coder vos fonctionnalités.

## Créer votre première interface graphique
Les HUDs utilisent des panneaux pour afficher du contenu à l'écran. Un panneau peut contenir des éléments graphiques tels que des textes, des boutons, des dessins...

Vous pouvez créer autant de panneaux que vous le souhaitez et les positionner à l'écran comme bon vous semble.
Pour créer un panneau, la syntaxe est similaire à ce que vous pourriez trouver sur un écran de [dashboard](dashboard.md).

```xc
var $panel = panel(center, sizeX, sizeY)
```

Exemple de HUD affichant "Hello World" au centre de l'écran dans une boîte grise de 100x50 pixels

```xc
var $panel = panel(center, 100, 50)

init
    $panel.blank(gray)
    $panel.write(1, 1, cyan, "Hello World")
```

![Hello World](hud-img/hudExample.png)

# Liste des fonctions spécifiques aux HUDs

### Fonctions liées à la fenêtre de jeu
```xc
screen_w ; returns the width of the game window
screen_h ; returns the height of the game window
screen_ratio ; returns the aspect ratio of the screen (width/height)
fov ; returns the player's camera field of view (radians)
aim_distance ; returns the distance of whatever the player is aiming at in meters

mouse_x ; returns the x position of the mouse on the game window
mouse_y ; returns the y position of the mouse on the game window

set_resolution_scale($scale)
; Sets the internal resolution of the HUD, from 1 (full resolution) to 8 (lower resolution).
; Default is 2. The HUD is rendered at screen resolution divided by $scale.
; Final display size is affected by ($scale * ui_scaling).
```
> Il est important de rappeler que le UI Scaling configuré dans les paramètres du jeu influence les valeurs retournées par ces fonctions.

### Fonctions liées aux panneaux
```xc
var $myPanel = panel(center, $width, $height) ; creates a panel centered on the screen of size width, height
; 'Center' can be replaced by 'Top', 'top_left', 'top_right', 'bottom', 'bottom_left'...

$myPanel.set_position($x, $y) ; moves the panel to position x, y
$myPanel.set_size($width, $height) ; resizes the panel to size width, height

$myPanel.width ; returns the width of the panel
$myPanel.height ; returns the height of the panel
$myPanel.x ; returns the x position of the panel
$myPanel.y ; returns the y position of the panel
$myPanel.scroll ; returns the mouse scroll value (-1, 0, or 1)

; ENTRY POINT
click.$myPanel ($x:number, $y:number) ; returns the click position within the panel
```
Note : La manière de dessiner sur le panneau est similaire à celle de l'[écran de dashboard](../xenoncode/dashboard.md#screen-rendering-functions)

### Fonctions liées à l'ordinateur intégré
```xc
set_cps(25) ; sets the number of HUD cycles per second
tick ; returns the current tick index
language ; returns the player's current language code (e.g., "en", "fr")
mouse_look() ; returns 1 if mouse look is active, 0 otherwise
```

### Fonctions liées à la communication
```xc
var $beacon = beacon($transmitFreq, $receiveFreq) ; Allows sending/receiving data

var $data = $beacon.data ; returns the data received by the beacon
var $distance = $beacon.distance ; returns the distance between the player and the remote beacon
var $dir_x = $beacon.direction_x ; returns the x direction between the player and the remote beacon
var $dir_y = $beacon.direction_y ; returns the y direction between the player and the remote beacon
var $dir_z = $beacon.direction_z ; returns the z direction between the player and the remote beacon
var $is_recv = $beacon.is_receiving ; whether this beacon is receiving data on the receiving frequency

$beacon.transmit($data) ; sends data on the transmission frequency
```

# Valeurs partagées
Les valeurs partagées sont une fonctionnalité qui permet de récupérer et de définir des informations dans le client du joueur.

Une liste de valeurs partagées est nativement disponible pour vous permettre de récupérer des informations sur l'environnement du joueur.

```xc
var $comp = get("avatar_sensor_environment_composition") ; returns the composition of the player's environment
var $density = get("avatar_sensor_density") ; returns the density of the player's environment
var $temp = get("avatar_sensor_temperature") ; returns the temperature of the player's environment in Kelvin
var $gravity = get("avatar_sensor_gravity") ; returns the gravity of the player's environment
var $speed = get("avatar_sensor_speed") ; returns the player's speed in m/s
var $alt = get("avatar_sensor_altitude") ; returns the player's altitude in meters
var $alt = get("avatar_sensor_altitude_absolute") ; returns the player's absolute altitude in meters
var $view = get("avatar_is_3rd_person") ; returns whether the player is in third person view

var $inv = get("avatar_inventory") ; returns the player's inventory as a string of key values
var $belt = get("avatar_belt") ; returns the content of the belt as a string of key values
var $mass = get("avatar_mass") ; returns the mass of the avatar including inventory in kg (Avatar base mass is 100kg)
var $water = get("avatar_water_level") ; returns the player's water level
var $o2 = get("avatar_oxygen_level") ; returns the player's oxygen level
var $h2 = get("avatar_hydrogen_level") ; returns the player's hydrogen level
```

## Créer vos propres valeurs partagées
Il est possible de créer vos propres valeurs partagées pour transmettre/recevoir, par exemple, des informations entre HUDs.
```xc
set("mySharedValue", "Hello World") ; sets a shared value identified by "mySharedValue" with the value "Hello World"
get("mySharedValue") ; returns the value of the shared value "mySharedValue"
```

# Écran virtuel et screen_copy
Ces fonctions sont disponibles dans les HUDs et fonctionnent de la même manière que sur les ordinateurs.
Référez-vous à la documentation pour le [virtualscreen](../xenoncode/computer.md#virtual-screen-function) et le [screen_copy](../xenoncode/computer.md#screen-rendering-functions-draw-on-a-virtual-screen).

# Exemples
### HUD qui affiche la vitesse du joueur
```xc
var $panel = panel(top,100,12)

tick
	$panel.blank()
	$panel.text_align(top)
	$panel.write(1,1,cyan,text("Speed: {0} km/h", get("avatar_sensor_speed")*3.6))
```
<video controls width="600">
    <source src="hud-img/speedDemo.mp4" type="video/mp4">
</video>

### HUD qui cible un beacon et affiche la distance
```xc
var $panel = panel(center, 50,50)
var $beacon = beacon("", "target")

function @target_beacon($b:beacon, $p:panel, $width:number, $height:number, $color:number)
    if $b.direction_z > 0
        var $f = screen_w / (2 * tan(fov / 2))
        var $rz = $b.direction_z * (screen_w / screen_h)
        var $x_proj = ($b.direction_x * $f) / $rz
        var $y_proj = ($b.direction_y * $f) / $rz
        var $x = screen_w / 2 + $x_proj - $width / 2
        var $y = screen_h / 2 - $y_proj - $height / 2
        $p.set_position($x, $y)
        $p.set_size($width, $height)
        $p.blank()
        $p.draw_rect(0, 0, $width, $height, $color)
        $p.text_align(center)
        $p.write(text("{0.0} m", $b.distance))

tick
    @target_beacon($beacon, $panel, 50, 50, green)
```
<video controls width="600">
    <source src="hud-img/targetDemo.mp4" type="video/mp4">
</video>
