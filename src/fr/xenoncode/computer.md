# Computer

## Fonctions spécifiques aux ordinateurs

### Points d'entrée du programme
```xc
input.0 ($value0:number, $value1:number, $value2:text)
; Ce point d'entrée est exécuté chaque fois qu'une valeur est reçue depuis l'entrée avec l'index IO spécifié.
; Les arguments sont les valeurs reçues pour chaque canal. N'importe quel nombre d'arguments peut être fourni, avec leurs types appropriés.
; Il ne peut y avoir qu'un seul point d'entrée 'input' défini par index IO par programme.

update
; Ce point d'entrée est exécuté à chaque tick du serveur à la fin de chaque cycle, après les timers.
; Plusieurs points d'entrée 'update' peuvent être définis dans un seul programme et ils seront tous exécutés dans l'ordre de leur définition.

click ($x:number, $y:number)
; Ce point d'entrée est exécuté chaque fois qu'un utilisateur clique sur l'écran, avec des coordonnées xy en pixels.
; Plusieurs points d'entrée 'click' peuvent être définis dans un seul programme et ils seront tous exécutés dans l'ordre de leur définition.

click_hold ($x:number, $y:number)
; Ce point d'entrée est exécuté continuellement tant qu'un utilisateur maintient le clic sur l'écran, avec des coordonnées xy en pixels.
; Utile pour les interactions de glissement ou la détection d'entrée continue.
; Plusieurs points d'entrée 'click_hold' peuvent être définis dans un seul programme et ils seront tous exécutés dans l'ordre de leur définition.

scroll ($delta:number)
; Ce point d'entrée est exécuté chaque fois qu'un utilisateur fait défiler la molette de la souris en visant l'écran.
; Le paramètre $delta indique la direction et la quantité du défilement (positif pour défiler vers le haut, négatif pour défiler vers le bas).
; Plusieurs points d'entrée 'scroll' peuvent être définis dans un seul programme et ils seront tous exécutés dans l'ordre de leur définition.

shutdown
; Ce point d'entrée est exécuté une fois lorsque l'ordinateur est éteint ou avant son redémarrage (mais PAS lorsqu'il plante).
; Plusieurs points d'entrée 'shutdown' peuvent être définis dans un seul programme et ils seront tous exécutés dans l'ordre de leur définition.
```

### Valeurs intégrées
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
$num_value = scroll ; the scroll wheel delta value (positive for scroll up, negative for scroll down)

$num_value = system_frequency ; the frequency of the system clock in hertz (ticks per second)
$num_value = programs_count ; the number of programs currently on the virtual HDD
$num_value = system_ipc ; the maximum number of instructions per cycle (IPC) of the virtual CPU
$num_value = system_ram ; the maximum number of variables in RAM
$num_value = ipc ; the number of instructions per cycle (IPC) of the virtual CPU
```

### Fonctions intégrées
```xc
var $programName = program_name(0) ; returns a program name, given an index between 0 and programs_count-1
load_program($programName) ; loads a program and call its init function (it first unloads the currently running program, calling shutdown on it)
reboot() ; reboots the computer (calls the shutdown entry point and loads the bios or main program)

$text_value = device_type(aliasOrIoNumber) ; returns the type of the device with the given IO index
```

### Screen Override
Un ordinateur peut remplacer l'écran de n'importe quel composant qui lui est connecté. Cela vous permet de remplacer l'affichage par défaut d'un composant par des graphiques personnalisés rendus par votre programme XenonCode.

Pour activer le remplacement d'écran :
1. Ouvrez le menu GetInfo du composant avec `V`
2. Cochez l'option **Override Screen**
3. Référencez l'écran dans votre code en utilisant `screen(ioIndex, channel)` et dessinez dessus comme n'importe quel autre écran

### IO
Les ordinateurs peuvent résoudre les alias de composants directement sans avoir besoin d'un Router. Utilisez simplement le nom de l'alias comme premier paramètre dans les fonctions IO.

```xc
; input_[number|text](aliasOrIoNumber, channelIndex) ; returns the value of the input with the given alias and index
var $someNumber = input_number("", 0)
var $someText = input_text("", 0)

; output_[number|text](aliasOrIoNumber, channelIndex, value) ; sends the given value to the output with the given alias and index
output_number(0, 0, $num_value) ; send a number to output with alias computer
output_number("computer", 0, $num_value) ; send a number to output with alias computer
output_text("computer", 0, "hello") ; send text hello to output with alias computer
```


### Fonctions de rendu d'écran (dessiner sur un écran virtuel)
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
; Here we also happen to use the built-ins 'user', 'username' and 'owner'
; 'user' returns the user token (text) of the player who clicked
; 'username' returns the username (text) of the player who clicked
; 'owner' returns the user token (text) of the computer's owner

; Legacy draw|button function with width/height parameters (still supported)
; draw(x, y, color, width, height)
draw(0, 0, red, 50, 70) ; draw a red rectangle at coordinates 0,0 with a width of 50 and a height of 70
if button(10, 10, red, 30, 30) ; draw a red button at coordinates 10,10 with a width of 30 and a height of 30. Evaluates to true if clicked.
    print("The button was clicked")


var $somePixelColor = pixel(10, 10) ; get the current color of the pixel at coordinates 10,10

; Copy a zone from one screen to another screen
screen_copy($sprites, $dash, $src_x, $src_y, $dst_x, $dst_y, $width, $height, $color, $rotation, $bilinear)
; The arguments $color, $rotation, and $bilinear are optional.
; $color    : Applies a tint to the copied area. Use -1 to apply no tint.
; $rotation : Rotates the copied area (in degrees, clockwise).
; $bilinear : Enables bilinear interpolation. Set to 1 to enable
```

### Fonction écran virtuel
Permet la création d'un écran virtuel avec XenonCode. Cet écran, défini par le code, n'est pas physique et sert principalement à stocker des données visuelles. Vous pouvez ensuite copier ces données vers un écran physique en utilisant la fonction `screen_copy()`, ce qui est plus rapide que de redessiner.

Utilisation typique : stocker des sprites dans un écran virtuel pour les copier tous en une fois vers un écran physique. Par exemple, créer un arrière-plan complexe et le copier d'un coup plutôt que de le redessiner à chaque fois.

Évitez de dessiner sur l'écran virtuel dans une boucle, car cela serait aussi lent que de dessiner directement sur un écran physique. Bien que cela puisse être utile dans certains cas, nous recommandons de l'utiliser de manière statique.


```xc
var $vScreen = virtualscreen(100, 200) ;virtualscreen(width, height)
;The maximum size of a virtual screen is 10000x10000 pixels.

init
    $vScreen.blank(black); clear the virtual screen with black
    $vScreen.write(0, 0, white, "Hello World") ; write a white "Hello World" message in the top left corner of the virtual screen
```
