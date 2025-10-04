# Add functionality with XenonCode

> <font color="red" size="5">The content of this page is currently available only in the **Experimental** version of Archean.</font>

## Introduction
Creating a component involves several steps. First, create a new folder in `Archean/Archean-game/modules/ARCHEAN_mod/components/MyComponentName/`, where `MyComponentName` is the name of your component. This folder must contain the component's 3D object exported from Blender with the Archean plugin, as well as a `main.xc` file that will host the XenonCode script, even if the script itself remains optional.

Refer to the [3D modeling with Blender](blender.md) page for guidance on creating and exporting a new 3D object.

Once the 3D object is created and exported, create a `main.xc` file in your new component folder. This file contains the XenonCode script that drives the component's behavior in the game. The XenonCode used for modding reuses the in-game syntax while exposing additional APIs specific to integrating with and interacting with the engine.

## Macros
Modding through XenonCode introduces the concept of macros, which lets you declare the existence of some functionality that will be used inside the script. These macros must be placed at the top of the file before any other instruction and are prefixed with the `#` character.

### Screens
```xc
#SCREEN screen1 80 40
; Create an 80x40-pixel screen from the material "screen1".
```

### Information Menu (V)
```xc
#INFO text_info Texte1 OK MyText
; Add a line of text identified by "Texte1" with the label "MyText" and default value "OK".

#INFO numeric_info Num1 10 MyNumber
; Add a numeric field identified by "Num1" with the label "MyNumber" and default value 10.

#INFO text Texte2 "This is the text" This is the text label
; Add a text field identified by "Texte2" with the label "This is the text label" and value "This is the text".

; --------------------------------------------------------------------------------------------------------------------------

#INFO checkbox Check1 0 MyCheckbox
; Add a checkbox identified by "Check1" with the label "MyCheckbox" and default value 0 (unchecked).

#INFO slider Slider1 20 0 100 MySlider
; Add a slider identified by "Slider1" with the label "MySlider" with a default value of 20, a minimum value of 0, and a maximum value of 100.

#INFO button Button1 MyButton
; Add a button identified by "Button1" with the label "MyButton".
```

> **Note:** <font color="orange">Note: Identifiers like Texte1, Num1, etc.. are converted to lowercase. When calling them through a function like get_info(), always use lowercase.</font>

### Information Menu functions
```xc
get_info($name); Returns the value of a numeric element in the information menu.
get_info_text($name); Returns the value of a text element in the information menu.
set_info($name, $value); Sets the value of an element in the information menu.
```
## Entry point
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
```

## Function list

```xc
; Screens
screen($materialName); Returns a screen object based on the material name.
;virtualscreen() & screen_copy() are available and behave like they do on a Computer/Dashboard.
```
#### Port management
```xc
; Electricity
push_power($port, $voltage, $availablePower); Offers power to a port and returns the power consumed.
pull_power($port, $minimumVoltage, $consumedPower); Pulls power from a port. Returns the available power.

; Fluids
push_fluid($port, $molecule, $mass, $temperature); Pushes fluid to a port. Returns the mass accepted.
pull_fluid($port, $maxMass); Pulls fluid from a port. Returns a KV of molecule, mass, and temperature.

; Items
push_item($port, $itemName, $itemProperties, $count); Pushes items to a port. Returns the number of items accepted.
pull_item($port, $itemName, $maxCount, $maxMass); Pulls items from a port. Returns a KV of itemName, count, and properties.
```

#### Animation
```xc
animate($jointName, $axis, $speed [, $targetValue]); Animates a joint.
; $axis is an enumeration — use one of the following values directly (no quotes):
; linear_x | linear_y | linear_z | angular_x | angular_y | angular_z

```

#### Visual effects
```xc
set_emissive($renderableName, $materialName, $color, $power); Set the emissiveness of a material.
set_light($target, $color, $power, $angle); Create a light source.
set_plasma($target, $radius, $depth, $temperature); Define a plasma effect.
toggle_renderable($renderableName, $active); Enable or disable a mesh.
```

<!-- #### Audio effects
```xc
play_tone($target, $toneMode, $frequency, $amplitude);
; $toneMode is an enumeration — use one of the following values directly (no quotes):
; sine_wave | square_wave | triangle_wave | sawtooth_wave
; To play several sounds simultaneously, create multiple $target values and call play_tone() for each one.
``` -->

#### Physics
```xc
apply_force($target, $force [, $applyAtCenterOfMass]); Applies a force along the Up axis of the target node.
apply_torque($target, $torque); Applies torque around the Up axis of the target node.
set_mass($mass); Sets the mass of the parent entity.
toggle_collider($colliderName, $active); Enables or disables a collider.
```

#### Physical and environmental information
```xc
get_linear_velocity($target); Returns the linear velocity along the Up axis of the target node.
get_angular_velocity($target); Returns the angular velocity around the Up axis of the target node.
get_speed(); Returns the absolute linear speed of the parent entity.
get_environment($target, $includeTerrain); Returns the environmental properties at the target node.
; $includeTerrain is a boolean that, when true, includes terrain information in the returned KV.
```


