# Add functionality with XenonCode

> <font color="red" size="5">The content of this page is currently available only in the **Experimental** version of Archean.</font>

## Introduction
Creating a component involves several steps. First, create a new folder in `Archean/Archean-game/modules/ARCHEAN_mod/components/MyComponentName/`, where `MyComponentName` is the name of your component. This folder must contain the component's 3D object exported from Blender with the Archean plugin, as well as a `main.xc` file that will host the XenonCode script, even if the script itself remains optional.

Refer to the [3D modeling with Blender](blender.md) page for guidance on creating and exporting a new 3D object.

Once the 3D object is created and exported, create a `main.xc` file in your new component folder. This file contains the XenonCode script that drives the component's behavior in the game. The XenonCode used for modding reuses the in-game syntax while exposing additional APIs specific to integrating with and interacting with the engine.

## Console output
XenonCode logs, whether errors or print() output, appear in the information window (`V` by default). This window displays the last 25 log lines and clears its contents each time the XenonCode script reloads. For compilation or runtime errors, only a single line is shown with the error message, just like the in-game IDE.

## Macros
Modding through XenonCode introduces the concept of macros, which lets you declare the existence of some functionality that will be used inside the script. These macros must be placed at the top of the file before any other instruction and are prefixed with the `#` character.

### Screens
```xc
#SCREEN "screen1" 80 40
; Create an 80x40-pixel screen from the material "screen1".
```

### Naming I/O Channels
When using native components via the node system, input and output channels are named to facilitate their identification. This macro allows you to define the names of the input and output channels.
```xc
#DATAPORT "data" input.0 "Speed (km/h)"
; Defines the name of input channel 0 of the data port "data" as "Speed (km/h)"
#DATAPORT "data" output.3 "Velocity (m/s)"
; Defines the name of output channel 3 of the data port "data" as "Velocity (m/s)"
```
The data port name is the one defined in Blender.

### Information Menu (V)
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

> **Note:** <font color="orange">Identifiers like Text1, Num1, etc.. are converted to lowercase. When calling them through a function like get_info(), always use lowercase.</font>

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

#### Screens
```xc
screen($materialName); Returns a screen object based on the material name.
;virtualscreen() & screen_copy() are available and behave like they do on a Computer/Dashboard.
```

#### Animations
```xc
animate($jointName, $axis, $speed [, $targetValue]); Animates a joint.
; $axis is an enumeration — use one of the following values directly (no quotes):
; linear_x | linear_y | linear_z | angular_x | angular_y | angular_z
```

#### Visual effects
```xc
set_emissive($renderableName, $materialName, $color, $power); Set the emissiveness of a material.
set_light($target, $radius, $color, $power, $angle); Create a light source.
set_plasma($target, $radius, $depth, $temperature); Define a plasma effect.
toggle_renderable($renderableName, $active); Enable or disable a mesh.
```

#### Audio effects
```xc
play_tone($target, $toneMode, $frequency, $amplitude);
; $toneMode is an enumeration — use one of the following values directly (no quotes):
; sine_wave | square_wave | triangle_wave | sawtooth_wave
; To play several sounds simultaneously, create multiple $target values and call play_tone() for each one.
```

#### Physics
```xc
apply_force($target, $force [, $applyAtCenterOfMass]); Applies a force along the Up axis of the target node.
apply_torque($target, $torque); Applies torque around the Up axis of the target node.
set_mass($mass); Sets the mass of the parent entity.
toggle_collider($colliderName, $active); Enables or disables a collider.
```

#### Physical and environmental informations
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

## Port management
### Energy
```xc
push_power($port, $voltage, $availablePower); Offers power to a port and returns the power consumed.
pull_power($port, $minimumVoltage, $consumedPower); Pulls power from a port. Returns the available power.
```

### Fluids
##### FUNCTIONS
```xc
push_fluid($port:text, $molecule:text, $mass:number, $temperature:number) ; Returns how much mas has been accepted
pull_fluid($port:text, $maxMass:number) ; Returns KV with composition and temperature
push_fluid_potential($port:text) ; Returns a value between 0 and 1 (how much fluid flow can the connected device accept with a push)
pull_fluid_potential($port:text) ; Returns a value between 0 and 1 (how much fluid flow can the connected device accept with a pull)
```

##### ENTRY POINT
When another device calls that function on this component.
```xc
accept_push_fluid($port:text, $molecule:text, $mass:number, $temperature:number) ; Must modify $mass to subtract how much mass has been accepted
accept_pull_fluid($port:text, $maxMass:number, $compositionOut:text, $temperatureOut:number) ; Must write molecules to $compositionOut and set $temperatureOut
accept_pull_fluid_potential($port:text, $potentialOut:number) ; Must set $potentialOut to the flow of fluid another device can pull from this component (value between 0 and 1)
accept_push_fluid_potential($port:text, $potentialOut:number) ; Must set $potentialOut to the flow of fluid another device can push to this component (value between 0 and 1)
```

_You can find a list of XenonCode script examples for fluid management on the [Fluid Snippets](fluidSnippets.md) page._


----------------------------------
### Items
```xc
push_item($port, $itemName, $itemProperties, $count); Pushes items to a port. Returns the number of items accepted.
pull_item($port, $itemName, $maxCount, $maxMass); Pulls items from a port. Returns a KV of itemName, count, and properties.
```

### Miscellaneous
```xc
is_connected($port); Returns 1 if the specified port is connected, 0 otherwise.
```