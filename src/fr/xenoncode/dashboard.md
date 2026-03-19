# Dashboard
## Introduction
Lorsque vous utilisez le Dashboard Tool, divers éléments tels que les écrans et les labels peuvent être utilisés pour afficher des informations, tout comme l'écran d'un [ordinateur AIO](../components/computers/Computer.md). Cependant, en tant qu'écran externe, son fonctionnement peut légèrement différer dans certaines situations.

## Première utilisation d'un écran/label de Dashboard
### Communication avec les éléments du Dashboard
Les Dashboards, contrairement à la plupart des composants disponibles dans le jeu, utilisent un seul port de données pour accéder à tous les éléments disponibles sur le tableau de bord. Chaque élément possède un canal de communication unique et peut être utilisé pour envoyer et recevoir des données. Vous pouvez récupérer le canal en appuyant sur la touche `V` tout en visant l'élément du tableau de bord avec lequel vous souhaitez interagir.

*Note : Les canaux sont assignés de manière incrémentale, ce qui signifie que le premier élément ajouté au tableau de bord aura le canal 0, le second le canal 1, et ainsi de suite. Si vous supprimez un élément, le canal sera réassigné au prochain élément ajouté.*
### Créer et utiliser un écran/label de Dashboard
Lorsque vous utilisez l'écran intégré d'un [ordinateur](../components/computers/Computer.md), vous pouvez simplement effectuer des actions dessus, comme colorer l'écran en rouge ou afficher le texte "Hello World".
```xc
init
    blank(red)
    write(0, 0, white, "Hello World")
```
Dans le contexte d'un dashboard, vous devez d'abord définir l'écran dans une variable pour pouvoir effectuer des actions dessus.
```xc
var $screen = screen(0,3) ;screen(aliasOrIoNumber, channelIndex)

init
    $screen.blank(red)
    $screen.write(0, 0, white, "Hello World")
```

### Liste des fonctions spécifiques aux Dashboards
En supposant que nous avons assigné la variable `$screen` à notre écran de dashboard, voici la liste des fonctions que vous pouvez utiliser pour interagir avec lui.

### Points d'entrée du programme
```xc
click.$screen ($x:number, $y:number)
; Ce point d'entrée est exécuté chaque fois qu'un utilisateur clique sur l'écran, avec des coordonnées xy en pixels.
; Plusieurs points d'entrée 'click' peuvent être définis dans un seul programme et ils seront tous exécutés dans l'ordre de leur définition.
```

### Valeurs intégrées
```xc
$num_value = $screen.char_w ; the width of a character in pixels, taking into consideration the current text size
$num_value = $screen.char_h ; the height of a character in pixels, taking into consideration the current text size

$num_value = $screen.width ; the width of the virtual monitor in pixels
$num_value = $screen.height ; the height of the virtual monitor in pixels

$num_value = $screen.clicked ; whether the mouse button was pressed while aiming at the virtual monitor
$num_value = $screen.click_x ; the x coordinate of the mouse cursor on the virtual monitor when the mouse button was pressed
$num_value = $screen.click_y ; the y coordinate of the mouse cursor on the virtual monitor when the mouse button was pressed
```

### Fonctions de rendu d'écran
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
