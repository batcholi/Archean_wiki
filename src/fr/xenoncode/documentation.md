# XenonCode - Documentation

**XenonCode** est un langage de programmation léger conçu comme un langage de script de haut niveau dans les jeux pour des dispositifs informatiques virtuels (c'est-à-dire : un ordinateur programmable dans un jeu).

# Capabilities

- Variables typées
- Constantes
- Tableaux dynamiques
- Vecteurs et Matrices (jusqu'à 4x4) avec swizzling
- Opérations arithmétiques standard sur les valeurs numériques
- Concaténation et formatage de texte simplifiés
- Fonctions définies par l'utilisateur
- Fonctions et objets définis par le dispositif
- Fonctions trailing/membres
- Fonctions mathématiques standard intégrées
- Opérations d'entrée/sortie intégrées entre dispositifs virtuels
- Objets clé-valeur intégrés
- Fonctions à intervalle synchronisé (timers)
- Conditionnels `if`/`elseif`/`else`
- Boucles `while`
- Boucles `foreach` pour les tableaux
- Boucles `repeat n`
- Boucles `for` avec premier et dernier index

# Sample code

```xc
include "my_functions.xc"

; Declare global storage
storage var $myStorageVar : number
storage array $myStorageArray : number

; Declare global variables
var $myVar = 0
var $myVar2 = "Hello World"
var $myVar3 : number
var $myVar4 : text
array $myArray : number
array $myArray2 : text

; Declare a user-defined function that changes the values of $myVar and $myVar2
function @myFunction($arg1 : number, $arg2 : text)
	$myVar = $arg1
	$myVar2 = $arg2

; Declare a user-defined function that returns a value
function @myFunction2($arg1 : number, $arg2 : text) : number
	return $arg1 + size($arg2)

init
	; Call a user-defined function
	@myFunction(1, "Hello")

	; Call a trailing function
	$myVar.@myFunction2("Hey")

	; Add values to an array
	$myArray.append(1)
	$myArray.append(5)
	$myArray.append(0)

	; Sort an array
	$myArray.sort()

	; Iterate over an array
	foreach $myArray ($index, $item)
		$myVar4 &= $index:text & ": " & $item:text & ", "

	; Output to a virtual device (ie: a console at input port 0)
	output.0 ($myVar4)
	output.0 (text("Sum of values in the array: {}", $myArray.sum))
	output.1 ($myArray.0:text)
	output.1 ($myArray.1:text)
	var $index = 2
	output.1 ($myArray.$index:text)

	; Repeat a statement three times
	repeat 3 ($i)
		output.1 ($i)

	; for loops
	for 3,8 ($i)
		; value of $i will go from 3 to 8 inclusively

```

## Types de développeurs

1. `User` : La personne qui utilise ce langage pour écrire un script, typiquement un joueur dans un jeu.
2. `Device` : L'implémentation définissant les capacités et les fonctions disponibles, typiquement un type spécifique de dispositif virtuel programmable dans un jeu spécifique.

# Syntax

XenonCode est conçu avec une syntaxe très simple et une structure très précise.

- Chaque instruction doit être courte et facile à lire
- Très peu de caractères spéciaux nécessaires
- Moins cryptique que la plupart des autres langages
- Les indentations définissent la portée (tabulations UNIQUEMENT, pas d'ambiguïté)
- Une seule instruction par ligne
- L'indexation des tableaux, comme la plupart des langages de programmation, commence à 0 mais utilise la notation point `arr.0` au lieu de la notation crochet typique `arr[0]`
- 100% insensible à la casse
- Une implémentation peut définir des fonctions, objets et points d'entrée "Device" personnalisés

### Types

XenonCode est un langage typé, mais ne comprend que deux types génériques, ainsi que des tableaux de chacun, et des objets définis par l'implémentation.

Types de données génériques que l'utilisateur peut déclarer :
- `number`
- `text`
- `vecN` (vecteur numérique de taille fixe, ex. `vec3`)
- `matNxM` (matrice numérique de taille fixe, ex. `mat4x4`)

Une variable `number` est toujours un nombre à virgule flottante 64 bits en interne, mais peut aussi servir de booléen lorsque sa valeur est 1 ou 0 (vrai ou faux), bien que toute valeur différente de zéro soit évaluée comme vraie.

Les variables `text` contiennent du texte Unicode brut, bien que leur taille maximale dépende de l'implémentation.
Un littéral texte est défini entre guillemets doubles `" "`.
Pour utiliser des guillemets doubles dans le texte, vous pouvez les doubler.
Il n'y a pas d'autre mécanisme de séquence d'échappement. Un antislash `\` fait simplement partie de la chaîne, et l'implémentation peut décider de l'utiliser pour des séquences d'échappement.
```xc
var $myText = "Say ""Hello"" to this text"
```

Les types objets sont destinés à l'implémentation et sont opaques pour l'utilisateur, ce qui signifie que leur structure n'est pas nécessairement définie, cependant l'implémentation peut rendre disponibles certaines fonctions membres pour ces objets à l'utilisateur.

Bien que ce soit un langage typé, spécifier le type n'est pas nécessaire lorsqu'il peut être automatiquement déduit par le compilateur lors de l'initialisation. Le type ne doit être spécifié que lorsqu'il n'y a pas d'initialisation.

Tous les mots définis par l'utilisateur doivent commencer par un caractère préfixe :
- `$` pour les variables
- `@` pour les fonctions

### Comments

Les commentaires sont des lignes qui commencent par `;`
Une instruction de code peut aussi se terminer par un commentaire trailing
NOTE : `//` est déprécié et ne devrait PAS être utilisé.

# Limitations
Ce langage est conçu pour être potentiellement exécuté côté serveur dans le contexte d'un jeu multijoueur, donc pour des raisons de sécurité et de performance, il y a des limites à ce que les utilisateurs peuvent faire.

- Pas de types pointeur ni de référence (sauf pour les objets définis par l'implémentation, qui doivent être assainis par l'implémentation à l'exécution)
- Le nombre d'instructions par cycle peut être limité, un dépassement peut causer un crash virtuel pour l'utilisateur
- Les tableaux peuvent être limités en taille à l'exécution, un dépassement peut déclencher un crash virtuel pour l'utilisateur
- La pile récursive (appeler une fonction récursivement) est autorisée avec une syntaxe spécifique et est limitée à 16 récursions
- Les fonctions DOIVENT être entièrement définies AVANT leur utilisation, donc l'ordre de définition compte (c'est ce qui impose le point précédent)

### Limitations par ordinateur virtuel
Celles-ci sont définies par implémentation et peuvent inclure plusieurs variantes ou être personnalisables par l'utilisateur

- ROM (taille maximale du programme compilé en nombre de mots 32 bits)
- RAM (nombre maximum de variables locales, globales et temporaires plus tous les tableaux locaux et globaux multipliés par leur taille)
- STORAGE (nombre maximum de variables de stockage plus tous les tableaux de stockage multipliés par leur taille)
- Frequency (fréquence maximale pour les fonctions timer et la lecture d'entrée)
- Ports (nombre maximum d'entrées/sorties)
- IPC (maximum d'instructions par cycle, une ligne de code peut compter comme plusieurs instructions)

### Opérations sur les données
- Toutes les fonctions, y compris les timers, sont exécutées de manière atomique, empêchant toute condition de course
- Les arguments de fonction sont toujours passés par copie, une fonction NE PEUT PAS modifier les variables placées dans sa liste d'arguments
- Les fonctions trailing MODIFIENT la valeur de la variable précédente
- Les affectations de variables copient toujours la valeur pour les types génériques
- Les objets définis par l'implémentation sont toujours passés par référence
- Les objets définis par l'implémentation ne peuvent pas être copiés sauf si l'implémentation fournit cette fonctionnalité via une fonction device
- Les divisions par zéro résultent en une erreur d'exécution. Il est de la responsabilité de l'utilisateur de s'assurer d'en tenir compte.

### Règles de base
- Les variables peuvent être déclarées avec `var` et optionnellement recevoir une valeur initiale, sinon la valeur par défaut générique est utilisée (0 pour number et "" pour text)
- Les variables objet doivent être assignées lors de la déclaration en utilisant un constructeur ou une fonction device qui retourne un objet de ce type
- Commencer une instruction avec un nom de variable (commençant par `$`) signifie que nous modifions sa valeur
- Si le mot suivant après une affectation de variable est `=`, alors le résultat de l'expression suivante sera assigné comme sa valeur
- Si le mot suivant après une affectation de variable est un point et une fonction, cet appel de fonction est considéré comme une fonction trailing
- Appeler une fonction trailing MODIFIE la valeur de la variable précédente qui est aussi utilisée comme premier argument de la fonction, lequel doit être omis de la liste d'arguments lors de l'appel
- Commencer une instruction avec un nom de fonction (commençant par `@` pour les fonctions définies par l'utilisateur) signifie que nous appelons cette fonction et ignorons sa valeur de retour
- Appeler une fonction ne MODIFIERA JAMAIS la valeur de ses arguments de type générique passés entre parenthèses, les types génériques sont toujours passés par copie
- Tout ce qui est entre parenthèses et non précédé d'un nom de fonction est considéré comme une expression séparée, les expressions internes les plus à gauche sont calculées en premier
- Les règles habituelles s'appliquent pour la priorité mathématique des opérateurs

# Valid usage

XenonCode est conçu pour être compilé en byteCode qui est très rapide à analyser par le jeu hôte à l'exécution.

## Chaque ligne doit commencer par l'un des premiers mots suivants (avec exemples) :

### Global scope
- `include` Importe le contenu d'un autre fichier
- `const` déclare une constante globale
- `var` déclare une variable globale
- `array` déclare un tableau global
- `storage` déclare une variable ou un tableau de stockage, qui sera persistant entre les cycles d'alimentation
- `init` Définit le corps de la fonction init, qui s'exécutera une fois lorsque le dispositif est allumé
- `tick` déclare le corps de la fonction tick qui s'exécutera à chaque cycle d'horloge
- `function` déclare une fonction définie par l'utilisateur
- `recursive function` déclare une fonction définie par l'utilisateur qui peut s'appeler elle-même récursivement
- `timer` Définit le corps d'une fonction qui s'exécutera de manière répétée à une fréquence spécifique en Hz
- `input` Définit une fonction d'entrée
- `;` Commentaires
- un point d'entrée défini par l'implémentation
- une ou plusieurs tabulations, signifiant que nous sommes dans le corps d'une fonction, alors les règles suivantes s'appliquent :

### Function body / Entry point
- `var` Déclare une nouvelle variable dans cette portée locale (non accessible depuis l'extérieur de cette fonction)
- `array` Déclare un nouveau tableau dans cette portée locale (non accessible depuis l'extérieur de cette fonction)
- `$` Pour assigner une nouvelle valeur à une variable existante
- `@` Pour appeler une fonction définie par l'utilisateur
- `output` Fonction intégrée pour envoyer des données à un autre dispositif via un port spécifique
- `foreach` parcourt tous les éléments d'un tableau
- `repeat` répète un bloc de code n fois
- `while` boucle tant qu'une condition est évaluée comme vraie
- `for` boucle un bloc de code, étant donné un premier et un dernier index
- `break` arrête une boucle comme si elle avait terminé toutes ses itérations
- `continue` arrête cette itération d'une boucle ici et exécute l'itération suivante immédiatement
- `if` exécute un bloc de code si une condition est évaluée comme vraie
- `elseif` après un if, lorsque la condition initiale est évaluée comme fausse et qu'une nouvelle condition est évaluée comme vraie
- `else` après un if, lorsque toutes les conditions ont été évaluées comme fausses
- `return` arrête l'exécution de cette fonction ici et retourne une valeur à l'appelant

## Reserved keywords
Puisque tous les mots définis par l'utilisateur doivent commencer par `$` ou `@`, il n'y a pas besoin de mots réservés.
L'implémentation/dispositif doit veiller à ne définir que des noms de fonctions et des types d'objets qui n'entrent pas en conflit avec les mots-clés intégrés pour la version de XenonCode qu'ils utilisent.

## Déclarer une constante
Les constantes sont des valeurs nommées qui ne devraient jamais changer pendant l'exécution d'un programme. Ce sont des valeurs fixes définies à la compilation.
Leurs valeurs assignées doivent être explicitement données et doivent être des expressions dont le résultat peut être déterminé à la compilation.

`const $stuff = 5` déclare une constante nommée $stuff avec le nombre 5 comme valeur
`const $stuff = "hello"` déclare une constante nommée $stuff avec le texte "hello" comme valeur

## Déclarer une variable
Les variables sont des valeurs nommées qui peuvent changer pendant l'exécution d'un programme.
On peut ou non leur assigner une valeur initiale.
Si on n'assigne pas de valeur initiale, la valeur par défaut générique est utilisée, et on doit fournir un type.
Une variable n'est accessible que dans la portée dans laquelle elle a été déclarée. Par exemple, si on déclare une variable au début d'une fonction, elle est disponible dans toute la fonction. Si on déclare une variable dans un bloc if, elle n'est disponible que dans ce bloc, jusqu'au `else`, `elseif` correspondant ou jusqu'au retour à la portée parente.
Une variable déclarée dans la portée globale est accessible de partout.
Pour les variables déclarées dans la portée globale, lorsqu'on leur assigne une valeur initiale, l'expression donnée doit être déterminée à la compilation.
Les noms de variables doivent commencer par une lettre ou un underscore (`a`-`z` ou `_`) puis ne doivent contenir que des caractères alphanumériques et des underscores.

`var $stuff = 5` déclare une variable numérique avec une valeur initiale de 5 au démarrage du programme
`var $stuff = "hello"` déclare une variable texte avec une valeur initiale "hello" au démarrage du programme
`var $stuff:number` déclare une variable numérique avec une valeur initiale de 0 au démarrage du programme
`var $stuff:text` déclare une variable texte avec une valeur initiale "" au démarrage du programme
`var $stuff = position()` déclare une instance d'un objet défini par l'implémentation de type `position` (c'est un exemple)

Les objets définis par l'implémentation ne peuvent pas être déclarés sans initialisation, car ils n'ont pas de valeur par défaut.

## Assigner une nouvelle valeur à une variable
Pour assigner une nouvelle valeur à une variable, on peut simplement commencer une instruction avec le nom de la variable suivi de `=` et d'une expression dont le résultat sera la nouvelle valeur.
On peut aussi utiliser une fonction trailing qui modifiera intrinsèquement la valeur de cette variable.

`$stuff = 5` assigne la valeur 5 à la variable nommée $stuff
`$stuff = $other + 5` assigne le résultat de l'expression ($other + 5) à la variable nommée $stuff
`$stuff.round()` appelle une fonction trailing qui arrondit la valeur de la variable

## Déclarer un tableau
Un tableau est une liste dynamique de valeurs d'un certain type. On peut ajouter ou supprimer des valeurs, accéder à une valeur spécifique de la liste, ou parcourir toutes ses valeurs.
Lors de la déclaration d'un tableau, on ne peut pas spécifier de valeur initiale, et on doit fournir un type.
Les tableaux sont initialisés avec une taille de zéro au démarrage du programme, les valeurs peuvent être ajoutées/supprimées/modifiées pendant l'exécution du programme

`array $stuff:number` déclare un tableau de nombres
`array $stuff:text` déclare un tableau de textes

Les tableaux ne peuvent pas contenir d'objets définis par l'implémentation, seulement des types génériques.

## Vecteurs et Matrices

Les vecteurs et matrices sont des conteneurs de taille fixe de nombres à virgule flottante 64 bits, utiles pour les positions, les transformations et l'algèbre linéaire. Tous les éléments sont initialisés à zéro.

### Déclaration

Utilisez `vecN` pour les vecteurs (1D) et `matNxM` pour les matrices 2D, avec des dimensions jusqu'à 4.

```xc
var $position : vec3       ; vecteur à 3 éléments (vec2, vec3, vec4 disponibles)
var $transform : mat4x4    ; matrice 4x4
var $rotation : mat3       ; raccourci pour mat3x3
```

| Type | Raccourci | Description |
|------|-----------|-------------|
| `vec2`, `vec3`, `vec4` | -- | Vecteurs avec 2, 3 ou 4 éléments |
| `matNxM` | -- | Matrice 2D avec N lignes et M colonnes (ex. `mat3x4`) |
| `matN` | `matNxN` | Raccourci pour matrice carrée (ex. `mat3` = `mat3x3`) |

### Accès aux composantes

Accédez aux éléments avec `.x`, `.y`, `.z`, `.w` ou de manière équivalente `.0`, `.1`, `.2`, `.3`.

**Vecteurs** -- chaque accesseur fait référence à un seul élément :
```xc
var $v : vec3
$v.x = 1       ; élément 0
$v.y = 2       ; élément 1
$v.z = 3       ; élément 2
$v.0 = 1       ; identique à .x
```

**Matrices 2D** -- le premier accesseur sélectionne une ligne, le second sélectionne une colonne dans cette ligne :
```xc
var $m : mat4x4
$m.0.x = 1     ; ligne 0, colonne 0
$m.1.y = 1     ; ligne 1, colonne 1
$m.w.w = 1     ; ligne 3, colonne 3 (identique à $m.3.3)
```

### Swizzling

Combinez 2 à 4 noms de composantes parmi `xyzw` pour extraire plusieurs éléments à la fois dans un nouveau vecteur :
```xc
var $v : vec3
$v.x = 10
$v.y = 20
$v.z = 30
var $a : vec2
$a = $v.xy         ; vec2 contenant (10, 20)
var $b : vec2
$b = $v.zx         ; vec2 contenant (30, 10)
```
Le swizzling produit toujours une **copie** -- modifier le résultat n'affecte pas l'original.

### Arithmétique

Opérations **élément par élément** entre vecteurs/matrices de même taille :
```xc
var $a : vec3
var $b : vec3
var $c : vec3
$c = $a + $b       ; addition élément par élément
$c = $a - $b       ; soustraction élément par élément
```

La multiplication et la division **scalaire** mettent à l'échelle chaque élément :
```xc
$c = $a * 2        ; multiplie tous les éléments par 2
$c = $a / 2        ; divise tous les éléments par 2
```

**Multiplication matricielle** avec `*` lorsque les dimensions sont compatibles :
```xc
var $m : mat3x3
var $v : vec3
var $result : vec3
$result = $m * $v  ; matrice 3x3 fois vecteur 3x1 = vecteur 3x1
```

Les opérateurs d'**affectation composée** fonctionnent aussi : `+=`, `-=`, `*=`, `/=`

### Fonctions trailing (sur place)

Ces fonctions modifient directement le vecteur ou la matrice et ne retournent pas de valeur.

| Fonction | S'applique à | Description |
|----------|--------------|-------------|
| `.normalize()` | vecteurs | Normalise à une longueur unitaire |
| `.cross($other)` | vec3 | Stocke le produit vectoriel de soi et `$other` dans soi |
| `.transpose()` | matrices carrées | Transpose sur place |
| `.inverse()` | matrices carrées | Inverse sur place |
| `.identity()` | matrices carrées | Définit comme matrice identité |
| `.lerp($other, $t)` | vecteurs / matrices | Interpole vers `$other` d'un facteur `$t` |

```xc
var $dir : vec3
$dir.x = 3
$dir.y = 4
$dir.normalize()   ; $dir est maintenant un vecteur unitaire
```

### Fonctions standard (retournent une nouvelle valeur)

Ces fonctions ne modifient pas leurs arguments. Les fonctions retournant un seul nombre sont marquées *scalaire*.

| Fonction | Retourne | Description |
|----------|----------|-------------|
| `length($v)` | scalaire | Magnitude d'un vecteur |
| `distance($a, $b)` | scalaire | Distance euclidienne entre deux vecteurs |
| `dot($a, $b)` | scalaire | Produit scalaire de deux vecteurs |
| `angle($a, $b)` | scalaire | Angle entre deux vecteurs en radians |
| `cross($a, $b)` | vec3 | Produit vectoriel de deux vecteurs vec3 |
| `determinant($m)` | scalaire | Déterminant d'une matrice carrée |
| `normalize($v)` | même type | Copie normalisée d'un vecteur |
| `transpose($m)` | même type | Copie transposée d'une matrice carrée |
| `inverse($m)` | même type | Copie inversée d'une matrice carrée |
| `lerp($a, $b, $t)` | même type | Copie interpolée entre `$a` et `$b` d'un facteur `$t` |

### Passage aux fonctions

Les vecteurs et matrices peuvent être utilisés comme types d'arguments et de retour de fonctions :
```xc
function @scale($v : vec3, $factor : number) : vec3
	return $v * $factor

var $result : vec3
$result = @scale($myVec, 2.5)
```

## Déclarer du stockage
Le stockage est utilisé pour garder certaines données persistantes entre les cycles d'alimentation et même à travers une recompilation.
On peut déclarer des variables de stockage et des tableaux de type number ou text.
Le stockage ne devrait être déclaré QUE dans la portée globale.
```xc
storage var $stuff:number
storage var $stuff:text
storage array $stuff:number
storage array $stuff:text
```

## Accéder/Assigner le n-ième élément d'un tableau
Pour accéder ou modifier la valeur d'un élément spécifique dans un tableau, on doit utiliser l'opérateur trail `.` suivi de l'index basé sur 0 de l'élément ou d'une variable contenant cet index
`$stuff.0 = 5` Assigne la valeur 5 au premier élément du tableau
`$stuff.$index = 5` Assigne la valeur 5 à l'élément avec un index défini par la valeur de $index
`$value = $stuff.1` Assigne la valeur du deuxième élément du tableau à la variable $value

## Accéder/Assigner le n-ième caractère d'une variable texte
Les variables texte fonctionnent de manière très similaire aux tableaux. On peut utiliser l'opérateur trail `.` pour accéder ou modifier la valeur de caractères spécifiques dans un texte.
`$myText.0 = "a"` Définit "a" comme premier caractère de $myText

### Objets clé-valeur

XenonCode supporte son propre type clé-valeur qui est toujours stocké comme texte.
Déclarez simplement une variable texte et assignez/lisez ses membres en utilisant sa clé comme membre trailing
```xc
var $myObject = ".a{5}.b{8}" ; you can use the serialization format like so, but you don't have to, you may simply start with an empty text and assign the members one by one
print($myObject.a) ; will print 5
$myObject.b += 2 ; adds 2 to b which was 8 and will now be 10
```

## La fonction Init
Le corps de la fonction Init sera exécuté en premier chaque fois que l'ordinateur virtuel est allumé.
La fonction init ne peut pas être appelée par l'utilisateur. Elle ne peut être que définie, et le dispositif l'appellera automatiquement au démarrage virtuel.
```xc
init
    $stuff = 5
    @func1()
    ;...
```

## Fonction Tick
La fonction tick est exécutée au début de chaque cycle d'horloge de cet ordinateur virtuel.
La fonction tick ne peut pas être appelée par l'utilisateur. Elle ne peut être que définie, et le dispositif l'appellera automatiquement à chaque cycle.
```xc
tick
    ; This body is executed once per clock cycle at the virtual computer's frequency
```

## Fonctions Timer
Les fonctions timer sont exécutées à un intervalle ou une fréquence spécifiés, mais au plus une fois par cycle d'horloge.
On peut soit spécifier un `interval` comme toutes les N secondes, soit une `frequency` comme N fois par seconde.
Les fonctions timer ne peuvent pas être appelées par l'utilisateur. Elles ne peuvent être que définies, et le dispositif les appellera automatiquement au moment approprié.
```xc
timer frequency 4
    ; stuff here runs 4 times per second
timer interval 2
    ; stuff here runs once every 2 seconds
```
Note : Si la vitesse d'horloge de l'ordinateur virtuel est plus lente que l'intervalle ou la fréquence donnée, cette fonction timer ne s'exécutera pas correctement à l'intervalle ou la fréquence spécifiée, et pourra être exécutée à chaque cycle d'horloge à la place.

## Input
Les points d'entrée input sont un moyen d'accéder aux informations que nous avons reçues d'un autre dispositif.
Ils peuvent être exécutés n'importe quel nombre de fois par cycle d'horloge, selon la quantité de données reçues depuis le cycle précédent. L'implémentation peut décider de ne l'exécuter qu'une fois par cycle en utilisant uniquement les dernières données reçues.
Les dispositifs peuvent avoir une limite supérieure dans le tampon de réception qui définit le nombre maximum de fois que la fonction input peut être appelée par cycle d'horloge.
Si cette limite a été atteinte, seules les N dernières valeurs seront conservées dans le tampon.
Les points d'entrée input sont comme des fonctions définies par l'utilisateur, contenant des arguments, mais sans valeur de retour, et on doit aussi spécifier un index de port.
L'index de port doit être spécifié après le mot-clé input et un opérateur trail `.`
L'index de port peut aussi être spécifié via une constante (doit être connu à la compilation).
Les arguments de fonction doivent être entourés de parenthèses et leurs types doivent être spécifiés.
Les points d'entrée ne peuvent pas être appelés directement par l'utilisateur. Ils ne peuvent être que définis, puis le dispositif les appellera automatiquement si des données ont été reçues, à la fin d'un cycle d'horloge.
```xc
input.0 ($arg1:number, $arg2:text)
    $stuff = $arg1
input.$myPortIndex ($arg1:number, $arg2:text)
    $stuff = $arg1
```

## Output
La fonction output est la manière dont on envoie des données à un autre dispositif. Cette fonction est destinée à être appelée comme une instruction, et ne peut pas être utilisée dans la portée globale comme les fonctions input.
On doit aussi passer l'index de port comme on le fait avec la fonction input, et il peut aussi être spécifié via une constante connue à la compilation.
On doit passer une liste d'arguments entourés de parenthèses (ou un ensemble vide de parenthèses).
`output.0 ($stuff, $moreStuff)`

## If Elseif Else
Comme la plupart des langages de programmation, on peut utiliser des conditionnels.
```xc
if $stuff == 5
    ; then run this
elseif $stuff == 6
    ; then run that instead
else
    ; all previous conditions evaluate to false, then run this instead
```

## Boucles Foreach
Cela parcourt tous les éléments d'un tableau.
Le bloc de code sous cette instruction de boucle sera exécuté pour chaque élément du tableau, un par un.
```xc
foreach $stuff ($index, $item)
    ; we loop through the array $stuff, and we define $index which contains the 0-based index of this item and $item for the current item's value
    ; note that $item is a copy of its value, so modifying the value of $item will not affect the original array $stuff
    ; if we want to persist the modified $item value into the original array, we can use $index to index the element from the array like so:
    $stuff.$index = $item
    ; CAUTION: $index is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
Vous pouvez aussi utiliser la boucle foreach avec des objets clé-valeur
```xc
foreach $obj ($key, $value)
    print($key)
    print($value)
```

## Boucles Repeat
Cette boucle répétera l'exécution du bloc suivant un nombre donné de fois.
```xc
repeat 5 ($i)
    ; this block will be repeated 5 times, and $i is the 0-based index of this iteration (first time will be 0, last will be 4)
    ; CAUTION: $i is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
Le nombre de fois (ci-dessus spécifié comme 5) peut aussi être spécifié via une variable ou une constante, mais pas une expression

## Boucles For
Cette boucle est similaire à repeat mais prend un premier et un dernier index au lieu d'un nombre de répétitions
```xc
for 3,8 ($i)
	; $i will start at 3, and end with 8, inclusively, for a total of 6
```

## Boucles While
Cette boucle exécutera le bloc suivant tant que la condition donnée est évaluée comme vraie.
```xc
while $stuff < 5
    $stuff++
```

## Break
Ce mot-clé est utilisé pour arrêter une boucle comme si elle avait terminé toutes ses itérations.
```xc
while $stuff < 5
    $stuff++
    if $stuff == 3
        break
```

## Continue
Ce mot-clé est utilisé pour arrêter cette itération d'une boucle ici et exécuter l'itération suivante immédiatement.
```xc
while $stuff < 5
    $stuff++
    if $stuff == 2
        continue
```

## Math Operators
- `+` addition
- `-` soustraction
- `*` multiplication
- `/` division
- `%` modulo
- `^` puissance

## Trailing Operators
- `++` incrémente la valeur de la variable
- `--` décrémente la valeur de la variable
- `!!` inverse la valeur de la variable (si sa valeur est `0`, la met à `1`, sinon à `0`)

## Assignment operators
- `=` assigne simplement la valeur suivante directement

Les opérateurs suivants calculeront l'opération mathématique appropriée entre la variable précédente et l'expression suivante, puis assigneront le résultat à la variable précédente.
- `+=` addition
- `-=` soustraction
- `*=` multiplication
- `/=` division
- `%=` modulo
- `^=` puissance
- `&=` concaténation de texte

## Conditional Operators
- `==` égal à
- `<>` ou `!=` différent de
- `>` supérieur à
- `<` inférieur à
- `<=` inférieur ou égal à
- `>=` supérieur ou égal à
- `&&` ou `and` ET conditionnel
- `||` ou `or` OU conditionnel
- `xor` est aussi disponible, équivalent à (!!a != !!b)

## Other operators
- `.` (opérateur trail) fait référence à un sous-élément d'un tableau ou texte ou appelle une fonction trailing sur la variable précédente, ou un membre d'un objet
- `:` (opérateur de conversion de type) convertit en un autre type
- `&` (opérateur de concaténation) concatène des textes
- `!` (opérateur not) inverse une valeur ou expression booléenne (les nombres non-zéro deviennent 0, et 0 devient 1)

## Conversion de type (analyser les variables comme un autre type)

Pour analyser une variable existante comme un autre type, ajoutez simplement deux-points et le type, comme ceci :
```xc
$someTextValue = $someNumberValue:text
```
Cela ne fonctionne qu'avec les types génériques `number` et `text`, pas les tableaux ou les objets.

## Concaténation de texte

Pour concaténer des textes, séparez simplement toutes les valeurs/variables texte avec l'opérateur de concaténation `&` dans la même affectation (n'oubliez pas de convertir en texte si nécessaire).
```xc
$someTextVar = "Hello, " & $someName & "!, My age is " & $age:text & " and I have all my teeth"
```

## Include
Vous pouvez vouloir diviser votre projet en plusieurs fichiers source.
Pour ce faire, vous pouvez mettre du code dans un autre fichier `.xc` et utiliser le mot-clé `include` dans le fichier parent.
```xc
include "test.xc"
```
C'est effectivement la même chose que prendre toutes les lignes de `test.xc` et les insérer dans le fichier courant à l'endroit du `include`.
Cela peut être fait sur plusieurs niveaux, assurez-vous simplement qu'un fichier ne s'inclut pas lui-même, directement ou indirectement, auquel cas les définitions qu'il contient entreront en conflit et résulteront en une erreur de compilation.

# Fonctions définies par l'utilisateur

Les fonctions définissent un groupe d'opérations que nous pouvons appeler une ou plusieurs fois pendant l'exécution du programme.

Les opérations à exécuter dans une fonction apparaissent dans son corps.

Les fonctions peuvent avoir des arguments qui peuvent être utilisés dans le corps pour que les opérations puissent varier selon la valeur de certaines variables.

Les arguments de fonction sont définis après le nom de la fonction, entre parenthèses et ils peuvent être de type `number`, `text`, ou objet défini par l'implémentation.

Les noms de fonctions ont les mêmes règles que les noms de variables.

NOTE : Les fonctions DOIVENT être entièrement définies avant leur utilisation. Cela signifie que l'ordre de déclaration des fonctions compte et on ne peut appeler qu'une fonction qui a été déclarée AU-DESSUS de l'appelant et une fonction NE PEUT PAS s'appeler elle-même. Cela impose la règle de "pas de récursion par pile".

### Declaration

Voici quelques exemples de déclaration de fonctions

Cette fonction prend un seul argument numérique :
```xc
function @func0 ($var1:number)
```

Cette fonction prend deux arguments numériques :
```xc
function @func1 ($var1:number, $var2:number)
```

Cette fonction prend un argument numérique et un argument texte :
```xc
function @func2 ($var1:number, $var2:text)
```

Cette fonction prend un argument de type objet `position` défini par l'implémentation :
```xc
function @func3 ($var1:position)
```

Cette fonction prend un argument numérique et un argument texte et retourne une valeur numérique :
```xc
function @func2 ($var1:number, $var2:text) : number
```

### Body
Le corps d'une fonction (les opérations à exécuter lors de son appel) doit être sur les lignes suivant la déclaration, indenté d'une tabulation.
Les lignes vides dans un corps sont autorisées et ignorées par le compilateur.
Les corps de fonctions peuvent avoir une instruction `return` optionnellement suivie d'une expression qui serait utilisée pour assigner une variable précédente dans l'instruction appelante.
Lors du retour d'une valeur, le type de retour doit être fourni à la fin des arguments, après la parenthèse fermante et un deux-points.

```xc
function @func1 ($var1:number, $var2:number) : number
    return $var1 + $var2
```

### Call

Appeler une fonction exécutera les opérations dans son corps.
Pour appeler une fonction, écrivez simplement le nom de la fonction (commençant par `@` pour les fonctions définies par l'utilisateur), puis ses arguments entre parenthèses séparés par des virgules, comme ceci :
```xc
@func1(4, 6)
```
Ici nous avons passé deux arguments numériques, donc cet appel exécute le corps de la déclaration ci-dessus.
Il est bien sûr aussi possible d'utiliser des variables ou même des expressions complexes au lieu de simples nombres littéraux comme arguments de fonction.

#### NOTE :
Les arguments omis sont légaux.
Leur valeur prend initialement la valeur par défaut vide ("" ou 0) puis persiste avec ce qui est passé ou assigné pour les appels suivants à cette fonction.
Changer la valeur d'un argument dans cette fonction sera aussi persistant pour le prochain appel à cette fonction, si cet argument est omis.
Ainsi, si un concept de valeur d'argument par défaut est nécessaire, ils peuvent être assignés à l'argument dans le corps de cette fonction après leur utilisation.
Ce concept d'argument omis peut aussi être vu comme un concept similaire aux variables locales statiques en C++.

### Valeur de retour

Les fonctions peuvent retourner une valeur en utilisant le mot-clé `return`.
Cette valeur retournée peut être assignée à une variable comme ceci :
```xc
$value = @func1(4, 6)
```

# Fonctions récursives
Une fonction récursive est une fonction qui s'appelle elle-même.
Pour définir une fonction récursive, utilisez `recursive function` et `recurse` pour appeler la fonction elle-même.
```xc
recursive function @recursiveFunc($myVar:number)
    if $myVar < 15
        recurse($myVar++)
```
Cet exemple de fonction récursive s'appellera elle-même tant que la valeur de $myVar est inférieure à 15.
Les fonctions récursives sont limitées à 16 appels récursifs.

Note : Le mot-clé `recurse` n'est disponible que dans les fonctions récursives et est utilisé pour appeler la fonction elle-même. La liste d'arguments doit être la même que la définition de la fonction.

# Fonctions trailing
N'importe quelle fonction peut être appelée comme fonction trailing, même les fonctions définies par l'utilisateur.
La façon dont elles fonctionnent est qu'en interne, la variable précédente est passée comme premier argument à cette fonction, puis la valeur de retour lui est assignée.
Lors de l'appel d'une fonction trailing, on doit omettre le premier argument car il envoie automatiquement la variable précédente comme premier argument en interne.
Si la définition de la fonction n'a pas d'arguments, c'est toujours valide, bien qu'on ne se soucie simplement pas de la valeur actuelle de la variable précédente, mais on lui assignera une nouvelle valeur.
La définition de la fonction DOIT avoir un type de retour qui correspond à celui de la variable précédente, si c'est un type générique.
Une fonction trailing peut être appelée sur des objets définis par l'implémentation, auquel cas le premier argument doit être de ce type d'objet, il n'y a pas de type de retour dans la fonction et elle ne doit PAS retourner de valeur.
Puisqu'on ne peut pas passer de tableaux comme arguments de fonction, les tableaux ne peuvent prendre que leurs propres fonctions trailing spécifiquement définies.
```xc
$myVariable.round()
```
```xc
$myVariable.@func1(6)
```
```xc
$myArray.clear()
```

# Fonctions intégrées

### Math
Ces fonctions sont définies dans le langage de base et prennent un ou plusieurs arguments.
Les fonctions mathématiques trailing utiliseront la variable précédente comme premier argument et modifieront cette variable en lui assignant la valeur de retour.
- `floor`(number)
- `ceil`(number)
- `round`(number)
- `sin`(number) en radians
- `cos`(number) en radians
- `tan`(number) en radians
- `asin`(number) en radians
- `acos`(number) en radians
- `atan`(number) ou (number, number) en radians
- `abs`(number)
- `fract`(number)
- `log`(number, base)
- `sqrt`(number)
- `sign`(number [, default])
- `pow`(number, exponent)
- `clamp`(number, minimum, maximum)
- `step`(edge1, edge2, number) ou (edge, number)
- `smoothstep`(edge1, edge2, number)
- `lerp`(a, b, number)
- `mod`(number, divisor) l'opérateur modulo
- `min`(number, number)
- `max`(number, number)
- `avg`(number, number)
- `add`(number, number)
- `sub`(number, number)
- `mul`(number, number)
- `div`(number, number)

### Fonctions texte
- `text`(inputTextWithFormatting, vars ...) Voir la section ci-dessous pour plus de détails
- `substring`($myText, start, length) retourne une nouvelle chaîne
- `replace`($myText, searchText, replaceText [, count]) retourne une nouvelle chaîne avec toutes les occurrences de `searchText` remplacées par `replaceText`, ou jusqu'à `count` occurrences si spécifié
- `size`($myText) retourne le nombre de caractères dans $myText
- `last`($myText) retourne le dernier caractère dans $myText
- `lower`($myText) retourne la version en minuscules de $myText
- `upper`($myText) retourne la version en majuscules de $myText

#### Formatage
La fonction `text` prend un format comme premier argument.
Le format est essentiellement un texte qui peut contenir des accolades qui seront remplacées par la valeur de certaines variables ou expressions.
Exemple :
```xc
$formattedText = text("My name is {} and I am {} years old.", $name, $age)
```
Les accolades vides ci-dessus seront remplacées par les variables correspondantes dans les arguments suivants dans le même ordre.
Il est aussi possible de formater les variables numériques d'une manière spécifique en fournissant des pseudo-valeurs dans les accolades comme ceci :
- `{}` affiche automatiquement seulement les chiffres nécessaires selon la valeur (ex : `3` ou `123.456`)
- `{0}` arrondit à la valeur entière la plus proche (ex : `3` ou `123`)
- `{00}` arrondit à la valeur entière la plus proche mais affiche au moins deux chiffres (ex : `03` ou `123`)
- `{0e}` affiche la valeur entière arrondie en notation scientifique (ex : `3e+00` ou `1e+02`)
- `{0e.00}` affiche la valeur en notation scientifique avec deux chiffres après la virgule (ex : `3.00e+00` ou `1.23e+02`)
- `{0.0}` arrondit à un chiffre après la virgule (ex : `3.0` ou `123.5`)
- `{0000.00}` affiche au moins 4 chiffres entiers et arrondit à deux chiffres après la virgule (ex : `0003.00` ou `0123.46`)

### Fonctions trailing pour les tableaux
Ces fonctions DOIVENT être appelées comme fonctions trailing, et elles ne retournent rien, à la place elles modifient le tableau
- $myArray.`clear`() Vide un tableau
- $myArray.`sort`() Trie un tableau par ordre croissant
- $myArray.`sortd`() Trie un tableau par ordre décroissant
- $myArray.`append`(value1, value2, ...) Ajoute une ou plusieurs valeurs à la fin d'un tableau.
- $myArray.`pop`() Supprime la dernière valeur d'un tableau, réduisant sa taille de un
- $myArray.`insert`(index, value) Insère une nouvelle valeur dans un tableau à une position spécifique, repoussant toutes les valeurs suivantes de un
- $myArray.`erase`(index) Supprime un élément d'un tableau à un index spécifique, ramenant toutes les valeurs suivantes de un
- $myArray.`fill`(qty, value) Redimensionne et remplit un tableau avec une taille donnée et la valeur spécifiée pour tous les éléments (cela efface toutes les valeurs précédemment présentes dans le tableau)
- $myArray.`from`(other [, separator]) Définit le contenu du tableau à partir d'un autre tableau ou texte. Le séparateur sert à diviser avec une chaîne spécifique (valide uniquement quand other est un texte). Cette fonction fonctionne aussi en sens inverse lorsqu'elle est exécutée sur un texte avec un tableau et un séparateur.

### Membres trailing pour les tableaux
En utilisant l'opérateur trail `.`, on peut aussi retourner une information spécifique sur certains types de variables.
- $myArray.`size` retourne le nombre d'éléments dans $myArray
- $myArray.`min` retourne la valeur minimale dans un tableau de nombres
- $myArray.`max` retourne la valeur maximale dans un tableau de nombres
- $myArray.`avg` retourne la valeur moyenne dans un tableau de nombres
- $myArray.`med` retourne la valeur médiane dans un tableau de nombres
- $myArray.`sum` retourne la somme de toutes les valeurs dans un tableau de nombres
- $myArray.`last` retourne la valeur du dernier élément dans un tableau, cela permet aussi de modifier cette valeur en assignant une expression

### Autres fonctions utiles
- `contains`($myText, "str") retourne 1 si $myText contient "str", sinon 0
- `find`($myText, "str") retourne l'index du premier caractère de la première occurrence de "str" dans $myText, sinon -1 si non trouvé
Ces fonctions marchent aussi sur les tableaux.
- `isnumeric`($myText) retourne 1 si $myText est un nombre, sinon 0

### Opérateur ternaire
L'opérateur ternaire est une expression conditionnelle raccourcie qui retourne une valeur selon l'évaluation d'une condition.
```xc
$myVar = if($cond, $valTrue, $valFalse)
```

### Fonctions device
Une implémentation devrait définir des fonctions device spécifiques à l'application.
Voici des exemples de fonctions device de base qui PEUVENT ou PEUVENT NE PAS être définies :
- `delta`() retourne la différence de temps en secondes depuis la dernière exécution de cette fonction `delta`
Les fonctions device qui ne nécessitent aucun argument peuvent être utilisées sans parenthèses lorsqu'elles sont appelées depuis une expression.

# Spécifications du compilateur
Cette section est destinée aux développeurs de jeux qui souhaitent utiliser ceci dans leur jeu.

XenonCode est livré avec sa propre bibliothèque parser/compilateur/interpréteur, et un outil CLI très simple.

## Éditeur
Il est encouragé que l'éditeur de code exécute l'analyse suivante sur la ligne courante à chaque frappe :
- Remplacer les séquences d'espaces en début de ligne par exactement une tabulation de plus que la ligne non-vide précédente, si elle commence plus loin
- Auto-compléter les mots en appuyant sur la barre d'espace si ce mot n'est pas un symbole existant
    - Écrire les caractères restants minimum (dénominateur commun) des symboles qui commencent par les caractères écrits
        - Si c'est le premier mot : Auto-compléter uniquement avec les mots d'instruction de portée globale
        - Si précédé de tabulations : Auto-compléter uniquement avec les mots d'instruction de corps de fonction
        - Quand le premier caractère du mot courant est `$`, auto-compléter avec une variable utilisateur
        - Quand le premier caractère du mot courant est `@`, auto-compléter avec une fonction utilisateur
        - Sinon, auto-compléter avec l'un de :
            - Arguments de la fonction/foreach/repeat courante
            - Fonctions intégrées
            - Opérateurs

## Runtime

Au démarrage de l'ordinateur virtuel :
- Exécuter le corps de la fonction init()

Un cycle d'horloge, exécuté 'frequency' fois par seconde :
- Exécuter toutes les fonctions input qui ont reçu des données depuis le dernier cycle (une fois chacune par cycle)
- Exécuter les événements personnalisés / points d'entrée
- Exécuter la fonction tick
- Exécuter toutes les fonctions timer séquentiellement si leur temps est arrivé
- Dormir pendant Écoulé-1/Fréquence Secondes

# Tester XenonCode
Vous pouvez vouloir tester XenonCode ou pratiquer vos compétences de programmation.
Il existe un outil fiddle en ligne sur <a href="https://xenoncode.com/">XenonCode.com</a>

Sinon, vous pouvez essayer de l'exécuter directement sur votre ordinateur.
Pour cela, XenonCode a un CLI avec une commande `-run` pour tester des scripts dans la console.
Ce dépôt contient l'outil CLI, situé dans `build/xenoncode`
Voici comment vous pouvez télécharger et exécuter XenonCode :
```shell
# Clone this github repository
git clone https://github.com/batcholi/XenonCode.git
cd XenonCode
# Compile & Run the XC program located in test/
build/xenoncode -compile test -run test
```
Vous pouvez modifier les fichiers source .xc dans `test/` puis essayer d'exécuter la dernière ligne à nouveau pour compiler et exécuter.
Le répertoire `test/storage/` sera créé, il contiendra les données de stockage (variables préfixées avec le mot-clé `storage`).
Notez que cette commande `-run` est destinée à tester rapidement le langage et n'exécutera que la fonction `init`.
Aussi, assurez-vous que votre éditeur est configuré pour utiliser des tabulations et non des espaces, pour un bon parsing de l'indentation.

Si vous voulez intégrer XenonCode dans votre projet C++, vous pouvez inclure `XenonCode.hpp`.
Une documentation supplémentaire viendra bientôt pour cela, en attendant vous pouvez utiliser `main.cpp` comme exemple mais son utilisation est encore susceptible de changer.
