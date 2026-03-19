# HUD Management in Archean
## Introduction
Система HUD (Heads-Up Display) позволяет игрокам создавать собственные графические интерфейсы для отображения информации на экране: тексты, кнопки, рисунки... с помощью XenonCode.

HUD полностью управляются на стороне клиента, что означает, что у каждого игрока свои HUD, и другие игроки не могут их видеть. Однако они могут взаимодействовать с [Beacon](../components/navigation/Beacon.md) или другими игроками через интегрированную систему, позволяющую отправлять и получать данные на частотах.

Важно отметить, что поскольку HUD полностью клиентские, они будут доступны на всех серверах/мирах, к которым вы подключаетесь. Вы не можете настроить их для конкретного сервера/мира, кроме как вручную, как указано в следующем разделе.

> Дополнительная информация:
> - При использовании кнопки или любого другого взаимодействия на HUD, `правая кнопка мыши` предпочтительна, чтобы не захватывать обзор мышью.

## Creating a HUD
Поскольку HUD — это полностью клиентская функция, у них нет предметов, непосредственно связанных с ними в игре. Чтобы создать HUD, вам нужно зайти в меню настроек игры `F1` и перейти на вкладку `HUD`.

![HUD Menu](hud-img/hudMenu.png)

Из этого меню вы можете создать сколько угодно HUD и активировать/деактивировать их по своему усмотрению с помощью флажка. Важно знать, что каждый HUD — это уникальный экземпляр и не взаимодействует нативно с другими HUD, хотя взаимодействие возможно через функцию, которая будет описана далее на этой странице.

После создания HUD вы можете открыть его IDE для написания кода ваших функций.

## Creating your first graphical interface
HUD используют панели для отображения содержимого на экране. Панель может содержать графические элементы: тексты, кнопки, рисунки...

Вы можете создать сколько угодно панелей и расположить их на экране по своему усмотрению.
Для создания панели синтаксис аналогичен тому, что вы можете найти на экране [dashboard](dashboard.md).
    
```xc
var $panel = panel(center, sizeX, sizeY)
```

Пример HUD, отображающего "Hello World" в центре экрана в серой рамке размером 100x50 пикселей

```xc
var $panel = panel(center, 100, 50)

init
    $panel.blank(gray)
    $panel.write(1, 1, cyan, "Hello World")
```

![Hello World](hud-img/hudExample.png)

# List of functions specific to HUDs

### Functions related to the game window
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
> Важно помнить, что масштабирование интерфейса, настроенное в настройках игры, влияет на значения, возвращаемые этими функциями.

### Functions related to panels
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
Примечание: Способ рисования на панели аналогичен [экрану dashboard](../xenoncode/dashboard.md#screen-rendering-functions)

### Functions related to the integrated computer
```xc
set_cps(25) ; sets the number of HUD cycles per second
tick ; returns the current tick index
language ; returns the player's current language code (e.g., "en", "fr")
mouse_look() ; returns 1 if mouse look is active, 0 otherwise
```

### Functions related to communication
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

# Shared Values
Shared Values — это функция, позволяющая получать и устанавливать информацию в клиенте игрока.

Список Shared Values доступен нативно, чтобы позволить вам получать информацию об окружении игрока.

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

## Creating your own shared values
Можно создавать собственные Shared Values для передачи/получения, например, информации между HUD.
```xc
set("mySharedValue", "Hello World") ; sets a shared value identified by "mySharedValue" with the value "Hello World"
get("mySharedValue") ; returns the value of the shared value "mySharedValue"
```

# Virtual screen and screencopy
Эти функции доступны в HUD и работают так же, как на компьютерах.
Обратитесь к документации по [virtualscreen](../xenoncode/computer.md#virtual-screen-function) и [screen_copy](../xenoncode/computer.md#screen-rendering-functions-draw-on-a-virtual-screen).

# Examples
### HUD that displays the player's speed
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

### HUD that targets a beacon and displays the distance
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
