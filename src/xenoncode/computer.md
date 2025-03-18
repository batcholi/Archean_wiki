# Computer

## Specific Functions for Computers

### Program Entry Points
```xc
input.0 ($value0:number, $value1:number, $value2:text)
; This entry point is executed whenever a value is received from the input with the specified IO index.
; The arguments are the values received for each channel. Any number of arguments can be provided, with their appropriate types.
; There can only be one 'input' entry point defined per IO index per program.

update
; This entry point is executed on each server tick at the end of each cycle, after the timers.
; Multiple 'update' entry points may be defined in a single program and they will all be executed in the order they are defined.

click ($x:number, $y:number)
; This entry point is executed whenever a user clicks on the screen, given an xy coordinate in pixels.
; Multiple 'click' entry points may be defined in a single program and they will all be executed in the order they are defined.

shutdown
; This entry point is executed once when the computer is powered off or before it is rebooted (but NOT when it crashes).
; Multiple 'shutdown' entry points may be defined in a single program and they will all be executed in the order they are defined.
```

### Built-in values
```xc
$num_value = delta_time ; the time interval between ticks in seconds (equivalent to 1.0 / system_frequency)
$num_value = tick ; the index of the current tick since the computer has started

$num_value = char_w ; the width of a character in pixels, taking into consideration the current text size
$num_value = char_h ; the height of a character in pixels, taking into consideration the current text size

$num_value = screen_w ; the width of the virtual monitor in pixels
$num_value = screen_h ; the height of the virtual monitor in pixels

$num_value = clicked ; whether the mouse button was pressed while aiming at the virtual monitor
$num_value = click_x ; the x coordinate of the mouse cursor on the virtual monitor when the mouse button was pressed
$num_value = click_y ; the y coordinate of the mouse cursor on the virtual monitor when the mouse button was pressed

$num_value = system_frequency ; the frequency of the system clock in hertz (ticks per second)
$num_value = programs_count ; the number of programs currently on the virtual HDD
$num_value = system_ipc ; the maximum number of instructions per cycle (IPC) of the virtual CPU
$num_value = ipc ; the number of instructions per cycle (IPC) of the virtual CPU
```
	
### Built-in functions
```xc
var $programName = program_name(0) ; returns a program name, given an index between 0 and programs_count-1
load_program($programName) ; loads a program and call its init function (it first unloads the currently running program, calling shutdown on it)
reboot() ; reboots the computer (calls the shutdown entry point and loads the bios or main program)

$text_value = device_type(aliasOrIoNumber) ; returns the type of the device with the given IO index
```

### IO
```xc
; input_[number|text](aliasOrIoNumber, channelIndex) ; returns the value of the input with the given alias and index
var $someNumber = input_number("", 0)
var $someText = input_text("", 0)

; output_[number|text](aliasOrIoNumber, channelIndex, value) ; sends the given value to the output with the given alias and index
output_number(0, 0, $num_value) ; send a number to output with alias computer
output_number("computer", 0, $num_value) ; send a number to output with alias computer
output_text("computer", 0, "hello") ; send text hello to output with alias computer
```
	
	
### Screen Rendering functions (draw on a virtual screen)
```xc
blank($black) ; clears the screen with a given color

write(0, 0, green, "Hello") ; write a green Hello message in the top left corner of the screen
write(0, char_h, blue, "Hey") ; write a blue Hey message just under the first message
; Note that char_w and char_h return the size of one character in pixels + 1 additional pixel, to serve as a multiplier to jump lines or to count the width of a text.

text_size(2) ; sets text size to two times native, only valid for following writes in the current cycle until the next call to text_size()
text_align(top_left) ; sets text alignment to top_left, only valid for following writes in the current cycle until the next call to text_align()
;(top_left, top, top_right, left, center, right, bottom_left, bottom, bottom_right)
newline_spacing(3) ; sets the spacing between lines when using "\n" to make new line in write(), only valid for following writes in the current cycle until the next call to newline_spacing()

; Draw functions take positions X and Y where 0,0 = top-left, in pixels.
; draw_point(x, y, color)
draw_point(screen_w/2, screen_h/2, white) ; draw a single white pixel in the middle of the screen
; draw_line(x1, y1, x2, y2, color)
draw_line(0, 0, screen_w, screen_h, yellow) ; draw a yellow line going from top left to bottom right of the screen
; draw_rect(x1, y1, x2, y2, color [, fillcolor])
draw_rect(50, 50, 60, 60, red) ; draw a red square starting at coordinates 50,50 inclusive through 60,60 exclusive, it will effectively have a size of 10x10.
; draw_triangle(x1, y1, x2, y2, x3, y3, color [, fillcolor])
draw_triangle(screen_w/2, 0, 0, screen_h, screen_w, screen_h, blue) ; draw a blue triangle from the top middle to the bottom corners of the screen
; draw_circle(x, y, radius, color [, fillcolor])
draw_circle(screen_w/2, screen_h/2, 50, green) ; draw a green circle with a radius of 50 pixels in the middle of the screen
; draw_poly(color, x1, y1, x2, y2, x3, y3, x4, y4)
draw_poly(yellow, 0, 0, 50, 50, 100, 0) ; draw a yellow polygon with 3 points. There is no limit to the number of points, allowing for the creation of complex shapes.

; Draw functions may also be turned into Buttons. Works with rect, triangle and circle.
if button_rect(0, 0, 40, 10, gray) ; draw a gray rectangle button in the top left corner of the screen. Evaluates to true if clicked.
	if user == owner
		print("The owner of this computer clicked the button")
	else
		print("The button was clicked by " & user) ; prints a message to the console (when the button was clicked, in this case)
; Here we also happen to use the built-ins 'user' and 'owner' which are player usernames

var $somePixelColor = pixel(10, 10) ; get the current color of the pixel at coordinates 10,10

; Copy a zone from one screen to another screen
screen_copy($sprites, $dash, $src_x, $src_y, $dst_x, $dst_y, $width, $height, $color) ; here $color is an optional argument to apply additional tint (multiply)
```

### Virtual Screen Function
Allows the creation of a virtual screen with XenonCode. This screen, defined by code, is not physical and mainly serves to store visual data. You can then copy this data to a physical screen using the `screen_copy()` function, which is faster than redrawing.

Typical use: store sprites in a virtual screen to copy them all at once to a physical screen. For example, create a complex background and copy it in one go rather than redrawing it each time.

Avoid drawing on the virtual screen in a loop, as this would be as slow as drawing directly on a physical screen. Even though this can be useful in some use cases, we recommend using it in a static manner.


```xc
var $vScreen = virtualscreen(100, 200) ;virtualscreen(width, height)
;The maximum size of a virtual screen is 800x800 pixels.

init
    $vScreen.blank(black); clear the virtual screen with black
    $vScreen.write(0, 0, white, "Hello World") ; write a white "Hello World" message in the top left corner of the virtual screen
```