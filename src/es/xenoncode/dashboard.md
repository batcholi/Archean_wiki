# Dashboard
## Introduction
Al usar el Dashboard Tool, se pueden utilizar varios elementos como pantallas y etiquetas para mostrar informacion, al igual que la pantalla de un [ordenador AIO](../components/computers/Computer.md). Sin embargo, como pantalla externa, su funcionamiento puede diferir ligeramente en ciertas situaciones.

## Primer uso de una pantalla/etiqueta de Dashboard
### Comunicacion con elementos del Dashboard
Los Dashboards, a diferencia de la mayoria de componentes disponibles en el juego, usan un unico puerto de datos para acceder a todos los elementos disponibles en el dashboard. Cada elemento tiene un canal de comunicacion unico y puede usarse para enviar y recibir datos. Puedes obtener el canal presionando la tecla `V` mientras apuntas al elemento del dashboard con el que deseas interactuar.

*Nota: Los canales se asignan incrementalmente, lo que significa que el primer elemento agregado a un dashboard tendra el canal 0, el segundo tendra el canal 1, y asi sucesivamente. Si eliminas un elemento, el canal se reasignara al siguiente elemento agregado.*
### Crear y usar una pantalla/etiqueta de Dashboard
Al usar la pantalla integrada de un [computer](../components/computers/Computer.md), puedes simplemente realizar acciones en ella, como colorear la pantalla de rojo o mostrar el texto "Hello World".
```xc
init
    blank(red)
    write(0, 0, white, "Hello World")
```
En el contexto de un dashboard, primero debes definir la pantalla en una variable para poder realizar acciones en ella.
```xc
var $screen = screen(0,3) ;screen(aliasOrIoNumber, channelIndex)

init
    $screen.blank(red)
    $screen.write(0, 0, white, "Hello World")
```

### Lista de funciones especificas para Dashboards
Asumiendo que hemos asignado la variable `$screen` a nuestra pantalla de dashboard, aqui esta la lista de funciones que puedes usar para interactuar con ella.

### Program Entry Points
```xc
click.$screen ($x:number, $y:number)
; This entry point is executed whenever a user clicks on the screen, given an xy coordinate in pixels.
; Multiple 'click' entry points may be defined in a single program and they will all be executed in the order they are defined.
```

### Built-in values
```xc
$num_value = $screen.char_w ; the width of a character in pixels, taking into consideration the current text size
$num_value = $screen.char_h ; the height of a character in pixels, taking into consideration the current text size

$num_value = $screen.width ; the width of the virtual monitor in pixels
$num_value = $screen.height ; the height of the virtual monitor in pixels

$num_value = $screen.clicked ; whether the mouse button was pressed while aiming at the virtual monitor
$num_value = $screen.click_x ; the x coordinate of the mouse cursor on the virtual monitor when the mouse button was pressed
$num_value = $screen.click_y ; the y coordinate of the mouse cursor on the virtual monitor when the mouse button was pressed
```

### Screen Rendering functions
```xc
$screen.blank($black) ; clears the screen with a given color

$screen.write(0, 0, green, "Hello") ; write a green Hello message in the top left corner of the screen
$screen.write(0, $screen.char_h, blue, "Hey") ; write a blue Hey message just under the first message
; Note that char_w and char_h return the size of one character in pixels + 1 additional pixel, to serve as a multiplier to jump lines or to count the width of a text.

$screen.text_size(2) ; sets text size to two times native, only valid for following writes in the current cycle until the next call to text_size()
$screen.text_align(top_left) ; sets text alignment to top_left, only valid for following writes in the current cycle until the next call to text_align()
;(top_left, top, top_right, left, center, right, bottom_left, bottom, bottom_right)
$screen.newline_spacing(3) ; sets the spacing between lines when using "\n" to make new line in write(), only valid for following writes in the current cycle until the next call to newline_spacing()


; Draw functions take positions X and Y where 0,0 = top-left, in pixels.
; draw_point(x, y, color)
$screen.draw_point($screen.width/2, $screen.height/2, white) ; draw a single white pixel in the middle of the screen
; draw_line(x1, y1, x2, y2, color)
$screen.draw_line(0, 0, $screen.width, $screen.height, yellow) ; draw a yellow line going from top left to bottom right of the screen
; draw_rect(x1, y1, x2, y2, color [, fillcolor])
$screen.draw_rect(50, 50, 60, 60, red) ; draw a red square starting at coordinates 50,50 inclusive through 60,60 exclusive, it will effectively have a size of 10x10.
; draw_triangle(x1, y1, x2, y2, x3, y3, color [, fillcolor])
$screen.draw_triangle($screen.width/2, 0, 0, $screen.height, $screen.width, $screen.height, blue) ; draw a blue triangle from the top middle to the bottom corners of the screen
; draw_circle(x, y, radius, color [, fillcolor])
$screen.draw_circle($screen.width/2, $screen.height/2, 50, green) ; draw a green circle with a radius of 50 pixels in the middle of the screen
; draw_poly(color, x1, y1, x2, y2, x3, y3, x4, y4)
$screen.draw_poly(yellow, 0, 0, 50, 50, 100, 0) ; draw a yellow polygon with 3 points. There is no limit to the number of points, allowing for the creation of complex shapes.

; Draw functions may also be turned into Buttons. Works with rect, triangle and circle.
if $screen.button_rect(0, 0, 40, 10, gray) ; draw a gray rectangle button in the top left corner of the screen. Evaluates to true if clicked.
    if user == owner
        print("The owner of this computer clicked the button")
    else
        print("The button was clicked by " & user) ; prints a message to the console (when the button was clicked, in this case)
; Here we also happen to use the built-ins 'user' and 'owner' which are player usernames

; Legacy draw|button function with width/height parameters (still supported)
; draw(x, y, color, width, height)
$screen.draw(0, 0, red, 50, 70) ; draw a red rectangle at coordinates 0,0 with a width of 50 and a height of 70
if $screen.button(10, 10, red, 30, 30) ; draw a red button at coordinates 10,10 with a width of 30 and a height of 30. Evaluates to true if clicked.
    print("The button was clicked")


var $somePixelColor = $screen.pixel(10, 10) ; get the current color of the pixel at coordinates 10,10
```
