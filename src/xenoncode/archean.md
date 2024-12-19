<!-- toc -->

## Archean XenonCode Documentation

This is the extended documentation related to the Archean specific implementation of XenonCode.

For the basic syntax of XenonCode, please refer to [Documentation](documentation.md).
According to the context, some features may not be available or may behave differently. Specific pages for these contexts are available for more details:
- [Computer](computer.md)
- [Dashboard](dashboard.md)
- [HUD](hud.md)

---

## Archean Specific Features Available in All Contexts
### Includes
Includes are useful to either share functionality between programs, merge multiple programs into one, or just to keep your programs clean and organized.
```xc
include "some_helper_functions.xc"
```

### Basic Declarations
```xc
var $num_value : number
const $speed_of_light = 299792458
```

### Storage Declarations
```xc
storage var $memorized_value : number
storage array $memorized_names : text
;Storage values are retained between reboots and program modifications. They are always default-initialized to 0 or empty.
```

### Program Entry Points
```xc
init
; This entry point is executed once when the program is loaded.
; Only one 'init' entry point may be defined in a program.

tick
; This entry point is executed once every server tick.
; Only one 'tick' entry point may be defined in a program.

timer interval 5
; This entry point is executed every 5 seconds.
; Multiple 'timer interval' entry points may be defined in a single program and they will all be executed as their time has come, after the tick.
timer frequency 10
; This entry point is executed 10 times per second.
; Multiple 'timer frequency' entry points may be defined in a single program and they will all be executed as their time has come, after the tick.
```

### Built-in values
```xc
$num_value = time ; the current time as decimal unix timestamp in seconds with microsecond precision
$num_value = pi ; 3.14159265.....
$num_value = 2pi ; 3.14159265 * 2
```
	
### Built-in functions
```xc
; Random Generator
$num_value = random(0, 100) ; returns a random integer value between 0 and 100 inclusively
$num_value = random ; returns a random float value between 0.0 and 1.0 (hitting exactly 0.0 or 1.0 is statistically improbable)
```


### Color
```xc
var $blue = color(0, 0, 255) ; returns an RGB color given three values between 0 and 255. This will always assume full opacity (as if 255 is passed in the a component).
var $translucentRed = color(255, 0, 0, 128) ; returns an RGBA color given four values between 0 and 255. A value of 128 in the a component will effectively be 50% opacity. 0 would mean transparent.
var $redComponent = color_r($translucentRed) ; is effectively the reverse of the previous function to get back the 255 value. Same can be done with color_g, color_b and color_a.

; Built-in colors
var $black = black
var $white = white
var $red = red
var $green = green
var $blue = blue
var $yellow = yellow
var $pink = pink
var $orange = orange
var $cyan = cyan
var $gray = gray
var $purple = purple
var $brown = brown
```
