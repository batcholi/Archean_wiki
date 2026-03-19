# Fonctionnalités avec XenonCode

## Introduction
L'ajout d'un script XenonCode à un composant est **optionnel**. Si votre composant n'a besoin d'aucun comportement (pas d'écrans, d'animations, de physique ou de ports), vous pouvez ignorer cette étape entièrement.

Pour ajouter du scripting, créez un fichier `main.xc` dans le dossier de votre composant (ex. `mods/MYVENDOR_mymod/components/MyComponent/main.xc`). Ce fichier contient le script XenonCode qui pilote le comportement du composant dans le jeu. Le XenonCode utilisé pour le modding réutilise la syntaxe en jeu tout en exposant des API supplémentaires spécifiques à l'intégration et à l'interaction avec le moteur.

> Consultez [Pour commencer](getting-started.md) pour savoir comment créer un mod et configurer la structure de dossiers.

## Sortie console
Les logs XenonCode, qu'il s'agisse d'erreurs ou de la sortie print(), apparaissent dans la fenêtre d'information (`V` par défaut). Cette fenêtre affiche les 25 dernières lignes de log et efface son contenu à chaque rechargement du script XenonCode. Pour les erreurs de compilation ou d'exécution, une seule ligne est affichée avec le message d'erreur, comme dans l'IDE en jeu.

## Macros
Le modding via XenonCode introduit le concept de macros, qui vous permet de déclarer l'existence de certaines fonctionnalités qui seront utilisées dans le script. Ces macros doivent être placées en haut du fichier avant toute autre instruction et sont préfixées par le caractère `#`.

### Screens
```xc
#SCREEN "screen1" 80 40
; Create an 80x40-pixel screen from the material "screen1".
```

### Nommage des canaux I/O
Lorsque vous utilisez des composants natifs via le système de nœuds, les canaux d'entrée et de sortie sont nommés pour faciliter leur identification. Cette macro vous permet de définir les noms des canaux d'entrée et de sortie.
```xc
#DATAPORT input "data" 0 "Speed (km/h)"
; Defines the name of input channel 0 of the data port "data" as "Speed (km/h)"
#DATAPORT output "data" 3 "Velocity (m/s)"
; Defines the name of output channel 3 of the data port "data" as "Velocity (m/s)"
```
Le nom du port de données est celui défini dans Blender.

### Menu d'information (V)
```xc
#INFO text_info "Text1" "OK" "MyText"
; Add a text info identified by "Text1" with the label "MyText" and default value "OK".
; If the label is omitted, only the value is shown with no colon.

#INFO numeric_info "Num1" 10 "MyNumber"
; Add a numeric info identified by "Num1" with the label "MyNumber" and default value 10.

#INFO text "Text2" "This is the text" "This is the text label"
; Add a text field identified by "Text2" with the label "This is the text label" and value "This is the text".

; --------------------------------------------------------------------------------------------------------------------------

#INFO checkbox "Check1" 0 "MyCheckbox"
; Add a checkbox identified by "Check1" with the label "MyCheckbox" and default value 0 (unchecked).

#INFO slider "Slider1" 20 0 100 "MySlider"
; Add a slider identified by "Slider1" with the label "MySlider" with a default value of 20, a minimum value of 0, and a maximum value of 100.

#INFO drag "Drag1" 0 1 10 0.25 "MyDrag"
; Add a drag field identified by "Drag1" with the label "MyDrag", a default value of 0, a minimum value of 1, a maximum value of 10, and a step value of 0.25.

#INFO button "Button1" "MyButton"
; Add a button identified by "Button1" with the label "MyButton".

; --------------------------------------------------------------------------------------------------------------------------

#INFO colorpicker "Color1" "MyCustomColor"
; Add a color picker identified by "Color1" with the label "MyCustomColor".

```

> **Note :** <font color="orange">Les identifiants comme Text1, Num1, etc. sont convertis en minuscules. Lorsque vous les appelez via une fonction comme get_info(), utilisez toujours des minuscules.</font>

### Fonctions du menu d'information
```xc
get_info($name); Returns the value of a numeric element in the information menu.
get_info_text($name); Returns the value of a text element in the information menu.
set_info($name, $value); Sets the value of an element in the information menu.
```
## Points d'entrée
```xc
#SCREEN screen1 80 40
var $screen = screen("screen1")

; Retrieve the click coordinates of a screen if the screen has been assigned to a variable:
click.$screen($x:number, $y:number)
	print($x, $y) ; Displays the click coordinates

; Retrieve the click coordinates on a screen that isn't necessarily assigned to a variable, or on any material present in the component:
click($x:number, $y:number, $material:text)
	if $material == "screen1"
		print($x, $y) ; Displays the click coordinates
; If the material has been declared as a screen with the #SCREEN macro, the XY coordinates will be in pixels; otherwise, they will be in the range 0.0 to 1.0 according to the UV mapping of the material.

; click_hold works like click but triggers continuously while the button is held:
click_hold.$screen($x:number, $y:number)
click_hold($x:number, $y:number, $material:text)

; scroll entry point for mouse wheel events:
scroll.$screen($scroll:number) ; $scroll is -1 or 1
scroll($scroll:number, $x:number, $y:number, $material:text)
; If the material has been declared as a screen with the #SCREEN macro, the XY coordinates will be in pixels; otherwise, they will be in the range 0.0 to 1.0 according to the UV mapping of the material.
```

### Valeurs intégrées
```xc
$num_value = delta_time ; the time interval between ticks in seconds (equivalent to 1.0 / system_frequency)
```

## Liste des fonctions

#### Screens
```xc
screen($materialName); Returns a screen object based on the material name.
$screen.scroll ; Returns the scroll value (-1, 0, or 1)
;virtualscreen() & screen_copy() are available and behave like they do on a [Computer](../xenoncode/computer.md)/[Dashboard](../xenoncode/dashboard.md).
```

#### Animations
```xc
animate($jointName, $axis, $speed [, $targetValue]); Animates a joint.
get_joint($jointName, $axis); Returns the current value of a joint.
; $axis is an enumeration — use one of the following values directly (no quotes):
; linear_x | linear_y | linear_z | angular_x | angular_y | angular_z
```

Pour plus d'informations sur la création de joints et de targets dans Blender, consultez [Modélisation 3D avec Blender](blender.md).

#### Effets visuels
```xc
set_emissive($renderableName, $materialName, $color, $power); Set the emissiveness of a material.
set_light($target, $radius, $color, $power, $angle); Create a light source.
set_plasma($target, $radius, $depth, $temperature); Define a plasma effect.
toggle_renderable($renderableName, $active); Enable or disable a mesh.
```

#### Effets audio
```xc
play_tone_once($target, $toneMode, $frequency, $amplitude, $duration);
; Generated one-shot tone
play_tone($target, $toneMode, $frequency, $amplitude);
; Generated looping tone

; $toneMode is an enumeration — use one of the following values directly (no quotes)
; sine_wave | square_wave | triangle_wave | sawtooth_wave;


play_sound_once($target, $audioFilePath[, $volume, $pitch, $innerRadius, $outerRadius, $begin, $end]);
; One-shot .wav playback
play_sound($target, $audioFilePath[, $volume, $pitch, $innerRadius, $outerRadius, $begin, $end]);
; Looping .wav playback

; $volume: 0.0 to 1.0 (Default: 0.5)
; $pitch: 0.1 to 4.0 (Default: 1.0)
; $inner/outer radius define the distance attenuation of the sound. (Default: innerRadius=1, outerRadius=25)
; $begin/$end: slice in seconds within the file (Default: begin=0, end=-1 to play to the end)

sound_info($audioFilePath)
; Returns a KV object with information about the audio file:
;   - duration (seconds)
;   - sample_rate (Hertz)
;   - channels (number of channels)
;   - size (bytes)
```
> * Vous pouvez jouer plusieurs entrées audio sur la même cible en même temps, mais seulement si chaque entrée a une clé différente.
>	La clé est construite comme `$target` + `$audioFilePath`.
>	Cela signifie que si vous déclenchez le même fichier audio sur la même cible plusieurs fois avec des paramètres différents, il remplacera toute instance en cours de lecture ayant la même clé.
> * Formats testés et garantis : .**wav**, .**ogg**, .**mp3**
>   *Le moteur audio FMOD peut décoder de nombreux autres types de fichiers, mais ils ne sont pas officiellement testés ni supportés dans Archean*
>
> * Appeler les versions **_once** depuis un tick ou une boucle serrée les redéclenchera à chaque tick (_spoiler : ce n'est probablement pas ce que vous voulez_).

#### Physique
```xc
apply_force($target, $force [, $applyAtCenterOfMass]); Applies a force along the Up axis of the target node.
apply_torque($target, $torque); Applies torque around the Up axis of the target node.
set_mass($mass); Sets the mass of the parent entity.
toggle_collider($colliderName, $active); Enables or disables a collider.
```

#### Informations physiques et environnementales
```xc
get_linear_velocity($target); Returns the linear velocity along the Up axis of the target node.
get_angular_velocity($target); Returns the angular velocity around the Up axis of the target node.
get_speed(); Returns the absolute linear speed of the parent entity.

get_environment($target, $includeTerrain); Returns the environmental properties at the target node.
; List of properties returned in a KV:
;   - Composition of the atmosphere (.molecule{mole fraction}).
;   - Gravity (m/s²).
;   - Temperature (Kelvin).
;   - Pressure (Pascals).
;   - Density (kg/m³).
;   - Viscosity (Pa·s).
;   - Altitude (meters).
;   if $includeTerrain is true, also includes:
;   - Altitude above terrain (meters).
```

## Gestion des ports
### Énergie
```xc
push_power($port, $voltage, $availablePower); Offers power to a port and returns the power consumed.
pull_power($port, $minimumVoltage, $consumedPower); Pulls power from a port. Returns the available power.
```

### Fluides
##### FONCTIONS
```xc
push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
; Pushes a given fluid to the device connected to $port and returns the mass actually accepted. Returns 0 if no connection or if $mass <= 0.

pull_fluid($port:text, $maxMass:number)
; Requests up to $maxMass of fluid from the connected device. Returns a KV object with the pulled composition and temperature. Returns an empty object if nothing is connected.

push_fluid_potential($port:text)
; Queries how much fluid the connected device can currently accept from a push, clamped between 0 and 1. Relies on the device implementing accept_push_fluid/accept_push_fluid_potential; returns 0 if the port cannot handle push entry points.

pull_fluid_potential($port:text)
; Queries how much fluid the connected device can currently provide when pulled, clamped between 0 and 1. Uses accept_pull_fluid/accept_pull_fluid_potential on the other device; returns 0 if the port cannot serve pull entry points.
```

##### POINT D'ENTRÉE
Lorsqu'un autre appareil appelle cette fonction sur ce composant.
```xc
accept_push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
; Called when another device tries to push fluid into this component. Decrease $mass to reflect the unaccepted remainder (the server computes accepted mass as input minus leftover).

accept_pull_fluid($port:text, $maxMass:number, $compositionOut:text, $temperatureOut:number)
; Called when another device wants to pull fluid. Populate $compositionOut with the exported molecules and set $temperatureOut. Respect $maxMass and your own storage limits so the consumer receives only what you can supply.

accept_pull_fluid_potential($port:text, $potentialOut:number)
; Report the ratio of the requested fluid you can provide on this port right now (0–1). Leave $potentialOut at 0 when the port cannot serve pulls or storage is empty.

accept_push_fluid_potential($port:text, $potentialOut:number)
; Report the ratio of incoming fluid you can accept on this port right now (0–1).
```
_Vous pouvez trouver une liste d'exemples de scripts XenonCode pour la gestion des fluides sur la page [Fluid Snippets](fluidSnippets.md)._

### Objets
```xc
push_item($port, $itemName, $itemProperties, $count); Pushes items to a port. Returns the number of items accepted.
pull_item($port, $itemName, $maxCount, $maxMass); Pulls items from a port. Returns a KV of itemName, count, and properties.
```

### Divers
```xc
is_connected($port); Returns 1 if the specified port is connected, 0 otherwise.
```
