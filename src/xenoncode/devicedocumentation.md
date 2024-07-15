# Component Specific Documentation
## Virtual Monitors aka Screens
Here is an example of displaying information to a screen on a dashboard. The diagram is a layman's visual representation how the devices are communicating with each other. Then of course the code to communicate to said screen. (Note: To view the metadata of a component, look at it and press `V`, this is how to view channel, port and is one way to view/change the alias of a component)
```
Screen (Channel 0) --> Dashboard (Device Alias: db-1) --> Router --> Computer
```

```xc
; Declare global variables
var $db1_display = screen("db-1", 0)

; Initialize the program
init
	; Clear the display with black background
	$db1_display.blank(black)
	; Write an initial message in green
	$db1_display.write(0, 0, green, "Dashboard initialized")

; Update the display at every server tick
tick
	; Optional: Any dynamic updates or sensor readings can be displayed here
	var $time = time ; Get the current time
	var $formattedTime = text("Current Time: {}", $time)
	
	; Clear the display for new updates
	$db1_display.blank(black)
	
	; Write the current time to the display
	$db1_display.write(0, 0, green, $formattedTime)
```
This script will initialize the virtual monitor, get the time, format the time, clear the virtual monitor and then draw the formatted time at coordinates 0,0 with a text color of green.
### Useful Things For Virtual Monitors
```xc
$num_value  = char_w ; the width of a character in pixels, taking into consideration the current text size  
$num_value  = char_h ; the height of a character in pixels, taking into consideration the current text size  

$num_value  = screen_w ; the width of the virtual monitor in pixels  
$num_value  = screen_h ; the height of the virtual monitor in pixels  

$num_value  = clicked ; whether the mouse button was pressed while aiming at the virtual monitor  
$num_value  = click_x ; the x coordinate of the mouse cursor on the virtual monitor when the mouse button was pressed  
$num_value  = click_y ; the y coordinate of the mouse cursor on the virtual monitor when the mouse button was pressed

var  $blue  = color(0,  0,  255) ; returns an RGB color given three values between 0 and 255. This will always assume full opacity (as if 255 is passed in the a component).  
var  $translucentRed  = color(255,  0,  0,  128) ; returns an RGBA color given four values between 0 and 255. A value of 128 in the a component will effectively be 50% opacity. 0 would mean transparent.  
var  $redComponent  = color_r($translucentRed) ; is effectively the reverse of the previous function to get back the 255 value. Same can be done with color_g, color_b and color_a.  

; Built-in colors  
var  $black  = black 
var  $white  = white 
var  $red  = red 
var  $green  = green 
var  $blue  = blue 
var  $yellow  = yellow 
var  $pink  = pink 
var  $orange  = orange 
var  $cyan  = cyan 
var  $gray  = gray 
var  $purple  = purple 
var  $brown  = brown

blank($black) ; clears the screen with a given color 
write(0,  0, green,  "Hello") ; write a green Hello message in the top left corner of the screen 
write(0, char_h, blue,  "Hey") ; write a blue Hey message just under the first message  
; Note that char_w and char_h return the size of one character in pixels + 1 additional pixel, to serve as a multiplier to jump lines or to count the width of a text. 

text_size(2) ; sets text size to two times native, only valid for following writes in the current cycle until the next call to text_size()  

; Draw functions take positions X and Y where 0,0 = top-left, in pixels.  
; draw_point(x, y, color) 
draw_point(screen_w/2, screen_h/2, white) ; draw a single white pixel in the middle of the screen  
; draw_line(x1, y1, x2, y2, color) 
draw_line(0,  0, screen_w, screen_h, yellow) ; draw a yellow line going from top left to bottom right of the screen  
; draw_rect(x1, y1, x2, y2, color [, fillcolor]) 
draw_rect(50,  50,  60,  60, red) ; draw a red square starting at coordinates 50,50 inclusive through 60,60 exclusive, it will effectively have a size of 10x10.  
; draw_triangle(x1, y1, x2, y2, x3, y3, color [, fillcolor]) 
draw_triangle(screen_w/2,  0,  0, screen_h, screen_w, screen_h, blue) ; draw a blue triangle from the top middle to the bottom corners of the screen  
; draw_circle(x, y, radius, color [, fillcolor]) 
draw_circle(screen_w/2, screen_h/2,  50, green) ; draw a green circle with a radius of 50 pixels in the middle of the screen  

; Draw functions may also be turned into Buttons. Works with rect, triangle and circle.  
if button_rect(0,  0,  40,  10, gray) ; draw a gray rectangle button in the top left corner of the screen. Evaluates to true if clicked.  
	if user == owner 
			print("The owner of this computer clicked the button") 
	else 
			print("The button was clicked by "  & user) ; prints a message to the console (when the button was clicked, in this case)  
; Here we also happen to use the built-ins 'user' and 'owner' which are player usernames  

var  $somePixelColor  = pixel(10,  10) ; get the current color of the pixel at coordinates 10,10  

; For rendering to external screens, you may define a screen object and call any of the above Screen Rendering functions.  
; The screen() constructor takes in two arguments 0 or two arguments. If no arguments are provided, it will refer to the computer's screen, if available.  
; The arguments are ioNumber and channelIndex.  
var  $dash  = screen(0,1) ; declare a screen plugged into port 0 using the channel 1  
$dash.draw_circle($dash.width/2,  $dash.height/2,  50, green) ; draw a green circle with a radius of 50 pixels in the middle of the external screen  
; Note that screen_w and screen_h are now width and height respectively. Everything else is the same.
```