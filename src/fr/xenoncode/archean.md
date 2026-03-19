<!-- toc -->

## Documentation XenonCode pour Archean

Ceci est la documentation étendue relative à l'implémentation spécifique d'Archean de XenonCode.

Pour la syntaxe de base de XenonCode, veuillez vous référer à la [Documentation](documentation.md).
Selon le contexte, certaines fonctionnalités peuvent ne pas être disponibles ou se comporter différemment. Des pages spécifiques pour ces contextes sont disponibles pour plus de détails :
- [Computer](computer.md)
- [Dashboard](dashboard.md)
- [HUD](hud.md)

---

## Fonctionnalités spécifiques à Archean disponibles dans tous les contextes
### Includes
Les includes sont utiles pour partager des fonctionnalités entre programmes, fusionner plusieurs programmes en un seul, ou simplement garder vos programmes propres et organisés.
```xc
include "some_helper_functions.xc"
```

### Déclarations de base
```xc
var $num_value : number
const $speed_of_light = 299792458
```

### Déclarations de stockage
```xc
storage var $memorized_value : number
storage array $memorized_names : text
;Les valeurs de stockage sont conservées entre les redémarrages et les modifications de programme. Elles sont toujours initialisées par défaut à 0 ou vide.
```

### Points d'entrée du programme
```xc
init
; Ce point d'entrée est exécuté une fois lorsque le programme est chargé.
; Un seul point d'entrée 'init' peut être défini dans un programme.

tick
; Ce point d'entrée est exécuté une fois à chaque tick du serveur.
; Un seul point d'entrée 'tick' peut être défini dans un programme.

timer interval 5
; Ce point d'entrée est exécuté toutes les 5 secondes.
; Plusieurs points d'entrée 'timer interval' peuvent être définis dans un seul programme et ils seront tous exécutés quand leur temps sera venu, après le tick.
timer frequency 10
; Ce point d'entrée est exécuté 10 fois par seconde.
; Plusieurs points d'entrée 'timer frequency' peuvent être définis dans un seul programme et ils seront tous exécutés quand leur temps sera venu, après le tick.
```

### Valeurs intégrées
```xc
$num_value = time ; the current time as decimal unix timestamp in seconds with microsecond precision
$num_value = pi ; 3.14159265.....
$num_value = 2pi ; 3.14159265 * 2
```

### Fonctions intégrées
```xc
; Random Generator
$num_value = random(0, 100) ; returns a random integer value between 0 and 100 inclusively
$num_value = random ; returns a random float value between 0.0 and 1.0 (hitting exactly 0.0 or 1.0 is statistically improbable)

; Game Mode
$num_value = game_mode() ; returns the current game mode (0 = Creative, 1 = Adventure)

; Crafting Recipes
var $categories = get_recipes_categories("crafter") ; returns a comma-separated list of recipe categories for the given context
var $recipes = get_recipes("crafter", "CATEGORY") ; returns a comma-separated list of recipe names in the given category (category must be uppercase)
var $recipe = get_recipe("crafter", "recipeName") ; returns a key-value text object with ingredient names and quantities
var $label = get_recipe_label("module.recipeName") ; returns the display label of a recipe (strips the module prefix)
```


### Couleur
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
