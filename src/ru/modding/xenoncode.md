# Functionality with XenonCode

## Introduction
Добавление скрипта XenonCode к компоненту **опционально**. Если вашему компоненту не нужно поведение (нет экранов, анимаций, физики или портов), вы можете полностью пропустить этот шаг.

Для добавления скриптинга создайте файл `main.xc` в папке вашего компонента (например, `mods/MYVENDOR_mymod/components/MyComponent/main.xc`). Этот файл содержит скрипт XenonCode, управляющий поведением компонента в игре. XenonCode, используемый для моддинга, переиспользует внутриигровой синтаксис, дополнительно предоставляя API, специфичные для интеграции и взаимодействия с движком.

> См. [Getting Started](getting-started.md) для информации о создании мода и настройке структуры папок.

## Console output
Логи XenonCode, будь то ошибки или вывод print(), отображаются в окне информации (`V` по умолчанию). Это окно показывает последние 25 строк логов и очищает содержимое при каждой перезагрузке скрипта XenonCode. Для ошибок компиляции или выполнения отображается только одна строка с сообщением об ошибке, как и во внутриигровой IDE.

## Macros
Моддинг через XenonCode вводит концепцию макросов, позволяющих объявить существование некоторой функциональности, которая будет использоваться внутри скрипта. Эти макросы должны быть размещены в начале файла перед любой другой инструкцией и имеют префикс `#`.

### Screens
```xc
#SCREEN "screen1" 80 40
; Create an 80x40-pixel screen from the material "screen1".
```

### Naming I/O Channels
При использовании нативных компонентов через систему нод, входные и выходные каналы именуются для облегчения их идентификации. Этот макрос позволяет определить имена входных и выходных каналов.
```xc
#DATAPORT input "data" 0 "Speed (km/h)"
; Defines the name of input channel 0 of the data port "data" as "Speed (km/h)"
#DATAPORT output "data" 3 "Velocity (m/s)"
; Defines the name of output channel 3 of the data port "data" as "Velocity (m/s)"
```
Имя порта данных — это имя, определённое в Blender.

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

> **Note:** <font color="orange">Идентификаторы вроде Text1, Num1 и т.д. конвертируются в нижний регистр. При обращении к ним через функцию вроде get_info() всегда используйте нижний регистр.</font>

### Information Menu functions
```xc
get_info($name); Returns the value of a numeric element in the information menu.
get_info_text($name); Returns the value of a text element in the information menu.
set_info($name, $value); Sets the value of an element in the information menu.
```
## Entry points
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

### Built-in values
```xc
$num_value = delta_time ; the time interval between ticks in seconds (equivalent to 1.0 / system_frequency)
```

## Function list

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

Для дополнительной информации о создании сочленений и целей в Blender см. [3D modeling with Blender](blender.md).

#### Visual effects
```xc
set_emissive($renderableName, $materialName, $color, $power); Set the emissiveness of a material.
set_light($target, $radius, $color, $power, $angle); Create a light source.
set_plasma($target, $radius, $depth, $temperature); Define a plasma effect.
toggle_renderable($renderableName, $active); Enable or disable a mesh.
```

#### Audio effects
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
> * Вы можете воспроизводить несколько аудио-записей на одном target одновременно, но только если каждая запись имеет уникальный ключ.
>	Ключ формируется как `$target` + `$audioFilePath`.
>	Это означает, что если вы запускаете один и тот же аудиофайл на одном target несколько раз с разными параметрами, он заменит текущий воспроизводимый экземпляр с тем же ключом.
> * Протестированные и гарантированные форматы: .**wav**, .**ogg**, .**mp3**
>   *Аудиодвижок FMOD может декодировать многие другие типы файлов, но они не протестированы и не поддерживаются официально в Archean*
>
> * Вызов версий **_once** из tick или тесного цикла будет перезапускать их каждый тик (_спойлер: это, вероятно, не то, что вы хотите_).

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
push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
; Pushes a given fluid to the device connected to $port and returns the mass actually accepted. Returns 0 if no connection or if $mass <= 0.

pull_fluid($port:text, $maxMass:number)
; Requests up to $maxMass of fluid from the connected device. Returns a KV object with the pulled composition and temperature. Returns an empty object if nothing is connected.

push_fluid_potential($port:text)
; Queries how much fluid the connected device can currently accept from a push, clamped between 0 and 1. Relies on the device implementing accept_push_fluid/accept_push_fluid_potential; returns 0 if the port cannot handle push entry points.

pull_fluid_potential($port:text)
; Queries how much fluid the connected device can currently provide when pulled, clamped between 0 and 1. Uses accept_pull_fluid/accept_pull_fluid_potential on the other device; returns 0 if the port cannot serve pull entry points.
```

##### ENTRY POINT
Когда другое устройство вызывает эту функцию на данном компоненте.
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
_Список примеров скриптов XenonCode для управления жидкостями можно найти на странице [Fluid Snippets](fluidSnippets.md)._

### Items
```xc
push_item($port, $itemName, $itemProperties, $count); Pushes items to a port. Returns the number of items accepted.
pull_item($port, $itemName, $maxCount, $maxMass); Pulls items from a port. Returns a KV of itemName, count, and properties.
```

### Miscellaneous
```xc
is_connected($port); Returns 1 if the specified port is connected, 0 otherwise.
```
