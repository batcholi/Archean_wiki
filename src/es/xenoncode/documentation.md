# XenonCode - Documentation

**XenonCode** es un lenguaje de programacion ligero disenado como scripting de alto nivel dentro de juegos para dispositivos de computacion virtuales (es decir: un ordenador programable dentro de un juego).

# Capabilities

- Variables tipadas
- Constantes
- Arrays dinamicos
- Vectores y Matrices (hasta 4x4) con swizzling
- Operaciones aritmeticas estandar sobre valores numericos
- Concatenacion y formateo de cadenas de texto sencillo
- Funciones definidas por el usuario
- Funciones y objetos definidos por el dispositivo
- Funciones trailing/miembro
- Funciones matematicas estandar integradas
- Operaciones de IO integradas entre dispositivos virtuales
- Objetos clave-valor integrados
- Funciones de intervalo sincronizadas (timers)
- Condicionales `if`/`elseif`/`else`
- Bucles `while`
- Bucles `foreach` para arrays
- Bucles `repeat n`
- Bucles `for` con indice inicial y final

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

## Tipos de desarrollador

1. `User`: La persona que usa este lenguaje para escribir un script, tipicamente un jugador en un juego.
2. `Device`: La implementacion que define las capacidades y funciones disponibles, tipicamente un tipo especifico de dispositivo virtual programable en un juego especifico.

# Syntax

XenonCode esta disenado con una sintaxis muy basica y una estructura muy precisa.

- Cada sentencia debe ser corta y facil de leer
- Muy pocos caracteres especiales necesarios
- Menos criptico que la mayoria de otros lenguajes
- Las indentaciones definen el alcance (SOLO tabulaciones, sin ambiguedad)
- Una sola instruccion por linea
- La indexacion de arrays, como en la mayoria de lenguajes de programacion, es base-0 pero usa la notacion de punto `arr.0` en lugar de la notacion tipica de subindice `arr[0]`
- 100% insensible a mayusculas y minusculas
- Una implementacion puede definir funciones, objetos y puntos de entrada personalizados del "Device"

### Types

XenonCode es un lenguaje tipado, pero solo incluye dos tipos genericos, asi como arrays de cualquiera de ellos, y objetos definidos por la implementacion.

Tipos de datos genericos que el usuario puede declarar:
- `number`
- `text`
- `vecN` (vector numérico de tamaño fijo, ej. `vec3`)
- `matNxM` (matriz numérica de tamaño fijo, ej. `mat4x4`)

Una variable `number` siempre es internamente un punto flotante de 64 bits, pero tambien puede actuar como booleano cuando su valor es 1 o 0 (verdadero o falso), aunque cualquier valor diferente de cero se evalua como verdadero.

Las variables `text` contienen texto unicode simple, aunque su tamano maximo depende de la implementacion.
Un literal de texto se define entre comillas dobles `" "`.
Para usar caracteres de comillas dobles dentro del texto, puedes duplicarlos.
No hay otro mecanismo de secuencia de escape. Una barra invertida `\` es simplemente parte de la cadena, y la implementacion puede decidir usarla para secuencias de escape.
```xc
var $myText = "Say ""Hello"" to this text"
```

Los tipos de objetos son para uso de la implementacion y son opacos para el usuario, lo que significa que su estructura no esta necesariamente definida, sin embargo la implementacion puede hacer disponibles algunas funciones miembro para esos objetos al usuario.

Aunque este es un lenguaje tipado, especificar el tipo no es necesario cuando puede ser deducido automaticamente por el compilador durante la inicializacion. El tipo solo debe especificarse cuando no hay inicializacion.

Todas las palabras definidas por el usuario deben comenzar con un caracter de prefijo:
- `$` para variables
- `@` para funciones

### Comments

Los comentarios son lineas que comienzan con `;`
Una sentencia de codigo tambien puede terminar con un comentario al final.
NOTA: `//` esta obsoleto y NO debe usarse.

# Limitations
Este lenguaje esta disenado para ejecutarse potencialmente del lado del servidor en el contexto de un juego multijugador, por lo tanto, por razones de seguridad y rendimiento hay limites a lo que los usuarios pueden hacer.

- Sin tipos de puntero ni referencia (excepto para objetos definidos por la implementacion, que deben ser saneados por la implementacion en tiempo de ejecucion)
- El numero de instrucciones por ciclo puede estar limitado, y un desbordamiento puede causar un crash virtual para el usuario
- Los arrays pueden estar limitados en tamano en tiempo de ejecucion, y un desbordamiento puede provocar un crash virtual para el usuario
- La pila recursiva (llamar a una funcion recursivamente) esta permitida con una sintaxis especifica y esta limitada a 16 recursiones
- Las funciones DEBEN estar completamente definidas ANTES de su uso, por lo que el orden de definicion importa (esto es lo que impone el punto anterior)

### Per-Virtual-Computer limitations
Estas se definen por implementacion y pueden incluir multiples variantes o ser personalizables por el usuario

- ROM (tamano maximo del programa compilado como numero de palabras de 32 bits)
- RAM (numero maximo de variables locales, globales y temporales mas todos los arrays locales y globales multiplicados por su tamano)
- STORAGE (numero maximo de variables de almacenamiento mas todos los arrays de almacenamiento multiplicados por su tamano)
- Frequency (frecuencia maxima para funciones timer y lectura de entrada)
- Ports (numero maximo de entradas/salidas)
- IPC (maximo de instrucciones por ciclo, una linea de codigo puede contar como multiples instrucciones)

### Operation on data
- Todas las funciones, incluyendo timers, se ejecutan atomicamente, previniendo cualquier data-race
- Los argumentos de funciones siempre se pasan por copia, una funcion NO PUEDE modificar las variables colocadas en su lista de argumentos
- Las funciones trailing SI modifican el valor de la variable principal
- Las asignaciones de variables siempre copian el valor para tipos genericos
- Los objetos definidos por la implementacion siempre se pasan por referencia
- Los objetos definidos por la implementacion no pueden copiarse a menos que la implementacion proporcione esa funcionalidad a traves de una funcion del dispositivo
- Las divisiones por cero resultan en un error de ejecucion. Es responsabilidad del usuario asegurarse de tenerlo en cuenta.

### Basic rules
- Las variables pueden declararse usando `var` y opcionalmente asignarse un valor inicial, de lo contrario se usa el valor generico por defecto (0 para number y "" para text)
- Las variables de objeto deben asignarse al declararse usando un constructor o una funcion del dispositivo que devuelva un objeto de ese tipo
- Comenzar una sentencia con un nombre de variable (que empiece con `$`) significa que estamos modificando su valor
- Si la siguiente palabra despues de una asignacion de variable es `=`, entonces el resultado de la siguiente expresion se asignara como su valor
- Si la siguiente palabra despues de una asignacion de variable es un punto y una funcion, esta llamada a funcion se considera una funcion trailing
- Llamar a una funcion trailing SI modifica el valor de la variable principal que tambien se usa como primer argumento de la funcion, el cual debe omitirse de la lista de argumentos al llamarla
- Comenzar una sentencia con un nombre de funcion (que empiece con `@` para funciones definidas por el usuario) significa que estamos llamando a esta funcion y descartando su valor de retorno
- Llamar a una funcion NUNCA modificara el valor de ninguno de sus argumentos de tipo generico pasados entre parentesis, los tipos genericos siempre se pasan por copia
- Cualquier cosa entre parentesis que no este precedida por un nombre de funcion se considera una expresion separada, las expresiones internas mas a la izquierda se calculan primero
- Se aplican las reglas tipicas de precedencia matematica de operadores

# Valid usage

XenonCode esta disenado para compilarse como byteCode que es muy rapido de analizar por el juego anfitrion en tiempo de ejecucion.

## Cada linea debe comenzar con una de las siguientes primeras palabras (con ejemplos):

### Global scope
- `include` Importa el contenido de otro archivo
- `const` declara una constante global
- `var` declara una variable global
- `array` declara un array global
- `storage` declara una variable o array de almacenamiento, que sera persistente entre ciclos de encendido
- `init` Define el cuerpo de la funcion init, que se ejecutara una vez cuando el dispositivo se encienda
- `tick` declara el cuerpo de la funcion tick que se ejecutara en cada ciclo de reloj
- `function` declara una funcion definida por el usuario
- `recursive function` declara una funcion definida por el usuario que puede llamarse a si misma recursivamente
- `timer` Define el cuerpo de una funcion que se ejecutara repetidamente a una frecuencia especifica en Hz
- `input` Define una funcion de entrada
- `;` Comentarios
- un punto de entrada definido por la implementacion
- una o mas tabulaciones, lo que significa que estamos dentro del cuerpo de una funcion, entonces se aplican las siguientes reglas:

### Function body / Entry point
- `var` Declara una nueva variable en este ambito local (no accesible desde fuera de esta funcion)
- `array` Declara un nuevo array en este ambito local (no accesible desde fuera de esta funcion)
- `$` Para asignar un nuevo valor a una variable existente
- `@` Para llamar a una funcion definida por el usuario
- `output` Funcion integrada para enviar datos a otro dispositivo a traves de un puerto especifico
- `foreach` recorre todos los elementos de un array
- `repeat` repite un bloque de codigo n veces
- `while` repite mientras una condicion se evalue como verdadera
- `for` repite un bloque de codigo, dado un indice inicial y final
- `break` detiene un bucle como si hubiera completado todas sus iteraciones
- `continue` detiene esta iteracion de un bucle y ejecuta la siguiente iteracion inmediatamente
- `if` ejecuta un bloque de codigo si una condicion se evalua como verdadera
- `elseif` despues de un if, cuando la condicion inicial hasta ahora se evalua como falsa y una nueva condicion se evalua como verdadera
- `else` despues de un if, cuando todas las condiciones se evaluaron como falsas
- `return` detiene la ejecucion de esta funcion aqui y devuelve un valor al llamador

## Reserved keywords
Como todas las palabras definidas por el usuario deben comenzar con `$` o `@`, no hay necesidad de palabras reservadas.
La implementacion/dispositivo debe encargarse de definir solo nombres de funciones y tipos de objetos que no entren en conflicto con las palabras clave integradas para la version de XenonCode que estan usando.

## Declaring a constant
Las constantes son valores con nombre que nunca deben cambiar durante la ejecucion de un programa. Son valores fijos definidos en tiempo de compilacion.
Sus valores asignados deben darse explicitamente y deben ser expresiones cuyo resultado pueda determinarse en tiempo de compilacion.

`const $stuff = 5` declara una constante llamada $stuff con el numero 5 como valor
`const $stuff = "hello"` declara una constante llamada $stuff con el texto "hello" como valor

## Declaring a variable
Las variables son valores con nombre que pueden cambiar durante la ejecucion de un programa.
Podemos o no asignarles un valor inicial.
Si no asignamos un valor inicial, se usa el valor generico por defecto, y debemos proporcionar un tipo.
Una variable solo es accesible dentro del ambito en el que fue declarada. Por ejemplo, si declaramos una variable al principio de una funcion, esta disponible en toda la funcion. Si declaramos una variable dentro de un bloque if, solo esta disponible dentro de ese bloque, hasta el correspondiente `else`, `elseif` o hasta volver al ambito padre.
Una variable declarada en el ambito global es accesible desde todas partes.
Para variables declaradas en el ambito global, cuando le asignamos un valor inicial, la expresion dada debe poder determinarse en tiempo de compilacion.
Los nombres de variables deben comenzar con una letra o guion bajo (`a`-`z` o `_`) y luego deben contener solo caracteres alfanumericos y guiones bajos.

`var $stuff = 5` declara una variable numerica con un valor inicial de 5 cuando el programa arranca
`var $stuff = "hello"` declara una variable de texto con un valor inicial de "hello" cuando el programa arranca
`var $stuff:number` declara una variable numerica con un valor inicial de 0 cuando el programa arranca
`var $stuff:text` declara una variable de texto con un valor inicial de "" cuando el programa arranca
`var $stuff = position()` declara una instancia de un objeto de tipo `position` definido por la implementacion (esto es un ejemplo)

Los objetos definidos por la implementacion no pueden declararse sin inicializacion, ya que no tienen un valor por defecto.

## Assigning a new value to a variable
Para asignar un nuevo valor a una variable, podemos simplemente comenzar una sentencia con el nombre de la variable seguido de un `=` y una expresion cuyo resultado sera el nuevo valor.
Tambien podemos usar una funcion trailing que inherentemente modificara el valor de dicha variable.

`$stuff = 5` asigna el valor 5 a la variable llamada $stuff
`$stuff = $other + 5` asigna el resultado de la expresion ($other + 5) a la variable llamada $stuff
`$stuff.round()` llama a una funcion trailing que redondea el valor de la variable

## Declaring an array
Un array es una lista dinamica de valores de cierto tipo. Podemos agregar o eliminar valores, acceder a un valor especifico de la lista, o recorrer todos sus valores.
Al declarar un array, no podemos especificar un valor inicial, y debemos proporcionar un tipo.
Los arrays se inicializan con tamano cero cuando el programa arranca, los valores pueden agregarse/eliminarse/modificarse durante la ejecucion del programa.

`array $stuff:number` declara un array de numeros
`array $stuff:text` declara un array de textos

Los arrays no pueden contener objetos definidos por la implementacion, solo tipos genericos.

## Vectores y Matrices

Los vectores y matrices son contenedores de tamaño fijo de números de punto flotante de 64 bits, útiles para posiciones, transformaciones y álgebra lineal. Todos los elementos se inicializan a cero.

### Declaración

Use `vecN` para vectores (1D) y `matNxM` para matrices 2D, con dimensiones hasta 4.

```xc
var $position : vec3       ; vector de 3 elementos (vec2, vec3, vec4 disponibles)
var $transform : mat4x4    ; matriz 4x4
var $rotation : mat3       ; abreviatura de mat3x3
```

| Tipo | Abreviatura | Descripción |
|------|-------------|-------------|
| `vec2`, `vec3`, `vec4` | -- | Vectores con 2, 3 o 4 elementos |
| `matNxM` | -- | Matriz 2D con N filas y M columnas (ej. `mat3x4`) |
| `matN` | `matNxN` | Abreviatura de matriz cuadrada (ej. `mat3` = `mat3x3`) |

### Acceso a componentes

Acceda a los elementos usando `.x`, `.y`, `.z`, `.w` o equivalentemente `.0`, `.1`, `.2`, `.3`.

**Vectores** -- cada accesor se refiere a un solo elemento:
```xc
var $v : vec3
$v.x = 1       ; elemento 0
$v.y = 2       ; elemento 1
$v.z = 3       ; elemento 2
$v.0 = 1       ; igual que .x
```

**Matrices 2D** -- el primer accesor selecciona una fila, el segundo selecciona una columna dentro de esa fila:
```xc
var $m : mat4x4
$m.0.x = 1     ; fila 0, columna 0
$m.1.y = 1     ; fila 1, columna 1
$m.w.w = 1     ; fila 3, columna 3 (igual que $m.3.3)
```

### Swizzling

Combine 2-4 nombres de componentes de `xyzw` para extraer múltiples elementos a la vez en un nuevo vector:
```xc
var $v : vec3
$v.x = 10
$v.y = 20
$v.z = 30
var $a : vec2
$a = $v.xy         ; vec2 conteniendo (10, 20)
var $b : vec2
$b = $v.zx         ; vec2 conteniendo (30, 10)
```
El swizzling siempre produce una **copia** -- modificar el resultado no afecta al original.

### Aritmética

Operaciones **elemento a elemento** entre vectores/matrices del mismo tamaño:
```xc
var $a : vec3
var $b : vec3
var $c : vec3
$c = $a + $b       ; suma elemento a elemento
$c = $a - $b       ; resta elemento a elemento
```

La multiplicación y división **escalar** escalan cada elemento:
```xc
$c = $a * 2        ; multiplica todos los elementos por 2
$c = $a / 2        ; divide todos los elementos por 2
```

**Multiplicación de matrices** con `*` cuando las dimensiones son compatibles:
```xc
var $m : mat3x3
var $v : vec3
var $result : vec3
$result = $m * $v  ; matriz 3x3 por vector 3x1 = vector 3x1
```

Los operadores de **asignación compuesta** también funcionan: `+=`, `-=`, `*=`, `/=`

### Funciones trailing (en el lugar)

Estas modifican el vector o la matriz directamente y no devuelven un valor.

| Función | Se aplica a | Descripción |
|---------|-------------|-------------|
| `.normalize()` | vectores | Escalar a longitud unitaria |
| `.cross($other)` | vec3 | Almacenar el producto cruz de sí mismo y `$other` en sí mismo |
| `.transpose()` | matrices cuadradas | Transponer en el lugar |
| `.inverse()` | matrices cuadradas | Invertir en el lugar |
| `.identity()` | matrices cuadradas | Establecer como matriz identidad |
| `.lerp($other, $t)` | vectores / matrices | Interpolar hacia `$other` por factor `$t` |

```xc
var $dir : vec3
$dir.x = 3
$dir.y = 4
$dir.normalize()   ; $dir es ahora un vector unitario
```

### Funciones estándar (devuelven un nuevo valor)

Estas no modifican sus argumentos. Las funciones que devuelven un solo número están marcadas como *escalar*.

| Función | Devuelve | Descripción |
|---------|----------|-------------|
| `length($v)` | escalar | Magnitud de un vector |
| `distance($a, $b)` | escalar | Distancia euclidiana entre dos vectores |
| `dot($a, $b)` | escalar | Producto punto de dos vectores |
| `angle($a, $b)` | escalar | Ángulo entre dos vectores en radianes |
| `cross($a, $b)` | vec3 | Producto cruz de dos vectores vec3 |
| `determinant($m)` | escalar | Determinante de una matriz cuadrada |
| `normalize($v)` | mismo tipo | Copia normalizada de un vector |
| `transpose($m)` | mismo tipo | Copia transpuesta de una matriz cuadrada |
| `inverse($m)` | mismo tipo | Copia invertida de una matriz cuadrada |
| `lerp($a, $b, $t)` | mismo tipo | Copia interpolada entre `$a` y `$b` por factor `$t` |

### Paso a funciones

Los vectores y matrices pueden usarse como tipos de argumento y de retorno de funciones:
```xc
function @scale($v : vec3, $factor : number) : vec3
	return $v * $factor

var $result : vec3
$result = @scale($myVec, 2.5)
```

## Declaring storage
El almacenamiento se usa para mantener algunos datos persistentes entre ciclos de encendido e incluso a traves de una recompilacion.
Podemos declarar variables y arrays de almacenamiento de tipo number o text.
El almacenamiento SOLO debe declararse en el ambito global.
```xc
storage var $stuff:number
storage var $stuff:text
storage array $stuff:number
storage array $stuff:text
```

## Accessing/Assigning the nth item within an array
Para acceder o modificar el valor de un elemento especifico en un array, debemos usar el operador trail `.` seguido del indice base-0 del elemento o una variable que contenga ese indice.
`$stuff.0 = 5` Asigna el valor 5 al primer elemento del array
`$stuff.$index = 5` Asigna el valor 5 al elemento con un indice definido por el valor de $index
`$value = $stuff.1` Asigna el valor del segundo elemento del array a la variable $value

## Accessing/Assigning the nth character within a text variable
Las variables de texto funcionan de manera muy similar a los arrays. Podemos usar el operador trail `.` para acceder o modificar el valor de caracteres especificos dentro de un texto.
`$myText.0 = "a"` Establece "a" como el primer caracter de $myText

### Key-Value objects

XenonCode soporta su propio tipo clave-valor que siempre se almacena como texto.
Simplemente declara una variable de texto y asigna/lee sus miembros usando su clave como miembro trailing.
```xc
var $myObject = ".a{5}.b{8}" ; you can use the serialization format like so, but you don't have to, you may simply start with an empty text and assign the members one by one
print($myObject.a) ; will print 5
$myObject.b += 2 ; adds 2 to b which was 8 and will now be 10
```

## The Init function
El cuerpo de la funcion Init se ejecutara primero cada vez que el ordenador virtual se encienda.
La funcion init no puede ser llamada por el usuario. Solo puede ser definida, y el dispositivo la llamara automaticamente al arrancar virtualmente.
```xc
init
    $stuff = 5
    @func1()
    ;...
```

## Tick function
La funcion tick se ejecuta al principio de cada ciclo de reloj de este ordenador virtual.
La funcion tick no puede ser llamada por el usuario. Solo puede ser definida, y el dispositivo la llamara automaticamente para cada ciclo.
```xc
tick
    ; This body is executed once per clock cycle at the virtual computer's frequency
```

## Timer functions
Las funciones timer se ejecutan a un intervalo o frecuencia especificados, pero como maximo una vez por ciclo de reloj.
Podemos especificar un `interval` como cada N segundos o una `frequency` como N veces por segundo.
Las funciones timer no pueden ser llamadas por el usuario. Solo pueden ser definidas, y el dispositivo las llamara automaticamente en su momento apropiado.
```xc
timer frequency 4
    ; stuff here runs 4 times per second
timer interval 2
    ; stuff here runs once every 2 seconds
```
Nota: Si la velocidad de reloj del ordenador virtual es mas lenta que el intervalo o frecuencia dados, esa funcion timer no se ejecutara correctamente al intervalo o frecuencia especificados, y puede ejecutarse en cada ciclo de reloj en su lugar.

## Input
Los puntos de entrada de input son una forma de acceder a la informacion que hemos recibido de otro dispositivo.
Pueden ejecutarse cualquier numero de veces por ciclo de reloj, dependiendo de cuantos datos se hayan recibido desde el ciclo de reloj anterior. La implementacion puede decidir ejecutarlo solo una vez por ciclo usando solo los ultimos datos recibidos.
Los dispositivos pueden tener un limite superior en el buffer de recepcion que define el numero maximo de veces que la funcion de entrada puede ser llamada por ciclo de reloj.
Si ese limite se ha alcanzado, solo se mantendran los ultimos N valores en el buffer.
Los puntos de entrada de input son como funciones definidas por el usuario, contienen argumentos, pero sin valor de retorno, y tambien debemos especificar un indice de puerto.
El indice de puerto debe especificarse despues de la palabra clave input y un operador trail `.`
El indice de puerto puede especificarse tambien a traves de una constante (debe ser conocido en tiempo de compilacion).
Los argumentos de funcion deben estar rodeados por parentesis y sus tipos deben especificarse.
Los puntos de entrada no pueden ser llamados directamente por el usuario. Solo pueden ser definidos, luego el dispositivo los llamara automaticamente si se han recibido datos, al final de un ciclo de reloj.
```xc
input.0 ($arg1:number, $arg2:text)
    $stuff = $arg1
input.$myPortIndex ($arg1:number, $arg2:text)
    $stuff = $arg1
```

## Output
La funcion output es como enviamos datos a otro dispositivo. Esta funcion esta disenada para ser llamada como sentencia, y no puede usarse en el ambito global como las funciones de input.
Tambien debemos pasar el indice de puerto como lo hacemos con la funcion de input, y tambien puede especificarse a traves de una constante que sea conocida en tiempo de compilacion.
Debemos pasar una lista de argumentos rodeados por parentesis (o un conjunto vacio de parentesis).
`output.0 ($stuff, $moreStuff)`

## If Elseif Else
Como la mayoria de lenguajes de programacion, podemos usar condicionales.
```xc
if $stuff == 5
    ; then run this
elseif $stuff == 6
    ; then run that instead
else
    ; all previous conditions evaluate to false, then run this instead
```

## Foreach loops
Esto recorre todos los elementos de un array.
El bloque de codigo bajo esa sentencia de bucle se ejecutara para cada elemento en el array, uno por uno.
```xc
foreach $stuff ($index, $item)
    ; we loop through the array $stuff, and we define $index which contains the 0-based index of this item and $item for the current item's value
    ; note that $item is a copy of its value, so modifying the value of $item will not affect the original array $stuff
    ; if we want to persist the modified $item value into the original array, we can use $index to index the element from the array like so:
    $stuff.$index = $item
    ; CAUTION: $index is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
Tambien puedes usar el bucle foreach con objetos clave-valor.
```xc
foreach $obj ($key, $value)
    print($key)
    print($value)
```

## Repeat loops
Este bucle repetira la ejecucion del siguiente bloque un numero dado de veces.
```xc
repeat 5 ($i)
    ; this block will be repeated 5 times, and $i is the 0-based index of this iteration (first time will be 0, last will be 4)
    ; CAUTION: $i is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
El numero de veces (arriba especificado como 5) tambien puede especificarse a traves de una variable o constante, pero no una expresion.

## For loops
Este bucle es similar a repeat pero toma un indice inicial y final en lugar de un numero de repeticiones.
```xc
for 3,8 ($i)
	; $i will start at 3, and end with 8, inclusively, for a total of 6
```

## While loops
Este bucle ejecutara el siguiente bloque mientras la condicion dada se evalue como verdadera.
```xc
while $stuff < 5
    $stuff++
```

## Break
Esta palabra clave se usa para detener un bucle como si hubiera completado todas sus iteraciones.
```xc
while $stuff < 5
    $stuff++
    if $stuff == 3
        break
```

## Continue
Esta palabra clave se usa para detener esta iteracion de un bucle aqui y ejecutar la siguiente iteracion inmediatamente.
```xc
while $stuff < 5
    $stuff++
    if $stuff == 2
        continue
```

## Math Operators
- `+` suma
- `-` resta
- `*` multiplicacion
- `/` division
- `%` modulo
- `^` potencia

## Trailing Operators
- `++` incrementa el valor de la variable
- `--` decrementa el valor de la variable
- `!!` invierte el valor de la variable (si su valor es `0`, lo establece a `1`, de lo contrario a `0`)

## Assignment operators
- `=` simplemente asigna el siguiente valor directamente

Los siguientes operadores calcularan la operacion matematica apropiada entre la variable principal y la siguiente expresion, luego asignaran el resultado de vuelta a la variable principal.
- `+=` suma
- `-=` resta
- `*=` multiplicacion
- `/=` division
- `%=` modulo
- `^=` a la potencia
- `&=` concatenar texto

## Conditional Operators
- `==` igual a
- `<>` o `!=` diferente de
- `>` mayor que
- `<` menor que
- `<=` menor o igual que
- `>=` mayor o igual que
- `&&` o `and` AND condicional
- `||` o `or` OR condicional
- `xor` tambien esta disponible, equivalente a (!!a != !!b)

## Other operators
- `.` (operador trail) refiere a un sub-elemento de un array o texto o llama a una funcion trailing sobre la variable principal, o un miembro de un objeto
- `:` (operador typecast) convierte a otro tipo
- `&` (operador concat) concatena textos
- `!` (operador not) invierte un valor o expresion booleana (los numeros distintos de cero se convierten en 0, y 0 se convierte en 1)

## Casting (analizar variables como otro tipo)

Para analizar una variable existente como otro tipo, simplemente agrega dos puntos y el tipo, asi:
```xc
$someTextValue = $someNumberValue:text
```
Esto solo funciona con tipos genericos `number` y `text`, no arrays u objetos.

## String concatenation

Para concatenar textos, simplemente separa todos los valores/variables de texto con el operador concat `&` en la misma asignacion (no olvides convertir a texto si es necesario).
```xc
$someTextVar = "Hello, " & $someName & "!, My age is " & $age:text & " and I have all my teeth"
```

## Include
Es posible que desees dividir tu proyecto en multiples archivos fuente.
Para hacer esto, puedes poner algo de codigo en otro archivo `.xc` y usar la palabra clave `include` en el archivo padre.
```xc
include "test.xc"
```
Esto es efectivamente lo mismo que tomar todas las lineas de `test.xc` e insertarlas en el archivo actual donde esta el `include`.
Esto puede hacerse en multiples niveles, solo asegurate de que un archivo no se incluya a si mismo, directa o indirectamente, en cuyo caso las definiciones dentro de el entraran en conflicto y resultaran en un error de compilacion.

# User-Defined Functions

Las funciones definen un grupo de operaciones que podemos llamar una o mas veces durante la ejecucion del programa.

Las operaciones a ejecutar en una funcion aparecen dentro de su cuerpo.

Las funciones pueden tener argumentos que pueden usarse dentro del cuerpo para que las operaciones puedan tener una variacion dependiendo del valor de algunas variables.

Los argumentos de funcion se definen despues del nombre de la funcion, entre parentesis y pueden ser de tipo `number`, `text`, u objeto definido por la implementacion.

Los nombres de funciones tienen las mismas reglas que los nombres de variables.

NOTA: Las funciones DEBEN estar completamente definidas antes de su uso. Esto significa que el orden de declaracion de funciones importa y solo podemos llamar a una funcion que ha sido declarada ARRIBA del llamador y una funcion NO PUEDE llamarse a si misma. Esto impone la regla de "no-recursion-de-pila".

### Declaration

Aqui hay algunos ejemplos de declaracion de funciones.

Esta funcion toma un unico argumento numerico:
```xc
function @func0 ($var1:number)
```

Esta funcion toma dos argumentos numericos:
```xc
function @func1 ($var1:number, $var2:number)
```

Esta funcion toma un argumento numerico y un argumento de texto:
```xc
function @func2 ($var1:number, $var2:text)
```

Esta funcion toma un argumento de objeto de tipo `position` definido por la implementacion:
```xc
function @func3 ($var1:position)
```

Esta funcion toma un argumento numerico y un argumento de texto y devuelve un valor numerico:
```xc
function @func2 ($var1:number, $var2:text) : number
```

### Body
El cuerpo de una funcion (las operaciones a ejecutar al llamarla) debe estar en las lineas siguientes despues de la declaracion, indentado con una tabulacion.
Las lineas vacias dentro de un cuerpo estan permitidas e ignoradas por el compilador.
Los cuerpos de funciones pueden tener una sentencia `return` seguida opcionalmente de una expresion que se usaria para asignar una variable principal en la sentencia del llamador.
Al devolver un valor, el tipo de retorno debe proporcionarse al final de los argumentos, despues del parentesis de cierre y dos puntos.

```xc
function @func1 ($var1:number, $var2:number) : number
    return $var1 + $var2
```

### Call

Llamar a una funcion ejecutara las operaciones en su cuerpo.
Para llamar a una funcion, simplemente escribe el nombre de la funcion (comenzando con `@` para funciones definidas por el usuario), luego sus argumentos entre parentesis separados por comas, asi:
```xc
@func1(4, 6)
```
Aqui hemos pasado dos argumentos numericos, por lo tanto esta llamada ejecuta el cuerpo de la declaracion anterior.
Por supuesto, tambien es posible usar variables o incluso expresiones complejas en lugar de solo numeros literales como argumentos de funcion.

#### NOTE:
Los argumentos omitidos son legales.
Su valor inicialmente toma el valor vacio por defecto ("" o 0) luego persiste con lo que se pasa o se les asigna en las siguientes llamadas a esa funcion.
Cambiar el valor de un argumento dentro de esa funcion tambien sera persistente para la siguiente llamada a esa funcion, si ese argumento es omitido.
Por lo tanto, si se necesita un concepto de valor por defecto de argumento, pueden asignarse al argumento en el cuerpo de esa funcion despues de su uso.
Este concepto de argumento omitido tambien puede pensarse como un concepto similar a las variables locales estaticas en C++.

### Return value

Las funciones pueden devolver un valor usando la palabra clave `return`.
Este valor devuelto puede asignarse a una variable asi:
```xc
$value = @func1(4, 6)
```

# Recursive functions
Una funcion recursiva es una funcion que se llama a si misma.
Para definir una funcion recursiva, usa `recursive function` y `recurse` para llamar a la funcion misma.
```xc
recursive function @recursiveFunc($myVar:number)
    if $myVar < 15
        recurse($myVar++)
```
Este ejemplo de funcion recursiva se llamara a si misma mientras el valor de $myVar sea menor que 15.
Las funciones recursivas estan limitadas a 16 llamadas recursivas.

Nota: La palabra clave `recurse` solo esta disponible dentro de funciones recursivas y se usa para llamar a la funcion misma. La lista de argumentos debe ser la misma que la definicion de la funcion.

# Trailing functions
Cualquier funcion puede ser llamada como funcion trailing, incluso funciones definidas por el usuario.
La forma en que funcionan es que internamente la variable principal se pasa como primer argumento a esa funcion, y luego se le asigna el valor de retorno.
Al llamar a una funcion trailing, debemos omitir el primer argumento ya que automaticamente envia la variable principal como su primer argumento internamente.
Si la definicion de la funcion no tiene argumentos, esto sigue siendo valido, aunque simplemente no nos importa el valor actual de la variable principal, pero le asignaremos un nuevo valor.
La definicion de la funcion DEBE tener un tipo de retorno que coincida con el de la variable principal, si es un tipo generico.
Una funcion trailing puede ser llamada sobre objetos definidos por la implementacion, en cuyo caso el primer argumento debe ser de ese tipo de objeto, no hay tipo de retorno en la funcion y NO debe devolver ningun valor.
Como no podemos pasar Arrays como argumentos de funcion, los arrays solo pueden tomar sus propias funciones trailing especificamente definidas.
```xc
$myVariable.round()
```
```xc
$myVariable.@func1(6)
```
```xc
$myArray.clear()
```

# Built-in functions

### Math
Estas funciones estan definidas en el lenguaje base y toman uno o mas argumentos.
Las funciones matematicas trailing usaran la variable principal como su primer argumento y modificaran esa variable asignandole el valor de retorno.
- `floor`(number)
- `ceil`(number)
- `round`(number)
- `sin`(number) en radianes
- `cos`(number) en radianes
- `tan`(number) en radianes
- `asin`(number) en radianes
- `acos`(number) en radianes
- `atan`(number) o (number, number) en radianes
- `abs`(number)
- `fract`(number)
- `log`(number, base)
- `sqrt`(number)
- `sign`(number [, default])
- `pow`(number, exponent)
- `clamp`(number, minimum, maximum)
- `step`(edge1, edge2, number) o (edge, number)
- `smoothstep`(edge1, edge2, number)
- `lerp`(a, b, number)
- `mod`(number, divisor) el operador modulo
- `min`(number, number)
- `max`(number, number)
- `avg`(number, number)
- `add`(number, number)
- `sub`(number, number)
- `mul`(number, number)
- `div`(number, number)

### Text functions
- `text`(inputTextWithFormatting, vars ...) Ver la seccion a continuacion para mas detalles
- `substring`($myText, start, length) devuelve una nueva cadena
- `replace`($myText, searchText, replaceText [, count]) devuelve una nueva cadena con todas las ocurrencias de `searchText` reemplazadas por `replaceText`, o hasta `count` ocurrencias si se especifica
- `size`($myText) devuelve el numero de caracteres en $myText
- `last`($myText) devuelve el ultimo caracter en $myText
- `lower`($myText) devuelve la version en minusculas de $myText
- `upper`($myText) devuelve la version en mayusculas de $myText

#### Formatting
La funcion `text` toma un formato como primer argumento.
El formato es basicamente un texto que puede contener llaves que seran reemplazadas por el valor de algunas variables o expresiones.
Ejemplo:
```xc
$formattedText = text("My name is {} and I am {} years old.", $name, $age)
```
Las llaves vacias arriba seran reemplazadas por las variables correspondientes en los siguientes argumentos en el mismo orden.
Tambien es posible formatear variables numericas de una manera especifica proporcionando algunos pseudo-valores dentro de las llaves asi:
- `{}` muestra automaticamente solo los digitos necesarios basados en el valor (ej: `3` o `123.456`)
- `{0}` redondea al valor entero mas cercano (ej: `3` o `123`)
- `{00}` redondea al valor entero mas cercano pero tambien muestra al menos dos digitos (ej: `03` o `123`)
- `{0e}` muestra el valor integral redondeado como notacion cientifica (ej: `3e+00` o `1e+02`)
- `{0e.00}` muestra el valor como notacion cientifica con dos digitos despues del decimal (ej: `3.00e+00` o `1.23e+02`)
- `{0.0}` redondea a un digito despues del decimal (ej: `3.0` o `123.5`)
- `{0000.00}` muestra al menos 4 digitos integrales y redondea a dos digitos despues del decimal (ej: `0003.00` o `0123.46`)

### Trailing functions for Arrays
Estas funciones DEBEN ser llamadas como funciones trailing, y no devuelven nada, en su lugar modifican el array.
- $myArray.`clear`() Vacia un array
- $myArray.`sort`() Ordena un array en orden ascendente
- $myArray.`sortd`() Ordena un array en orden descendente
- $myArray.`append`(value1, value2, ...) Agrega uno o mas valores al final de un array
- $myArray.`pop`() Elimina el ultimo valor en un array, reduciendo su tamano en uno
- $myArray.`insert`(index, value) Inserta un nuevo valor en un array en una posicion especifica, desplazando todos los valores siguientes una posicion
- $myArray.`erase`(index) Elimina un elemento de un array en un indice especifico, trayendo todos los valores siguientes una posicion
- $myArray.`fill`(qty, value) Redimensiona y llena un array con un tamano dado y el valor especificado para todos los elementos (esto borra cualquier valor previamente presente en el array)
- $myArray.`from`(other [, separator]) Establece el contenido del array a otro array o texto. El separador es para dividir con una cadena especifica (solo valido cuando other es un texto). Esta funcion tambien funciona a la inversa cuando se ejecuta sobre un texto dado un array y un separador.

### Trailing members for Arrays
Usando el operador trail `.`, tambien podemos devolver informacion especifica sobre ciertos tipos de variables.
- $myArray.`size` devuelve el numero de elementos en $myArray
- $myArray.`min` devuelve el valor minimo dentro de un array numerico
- $myArray.`max` devuelve el valor maximo dentro de un array numerico
- $myArray.`avg` devuelve el valor promedio dentro de un array numerico
- $myArray.`med` devuelve el valor mediano dentro de un array numerico
- $myArray.`sum` devuelve la suma de todos los valores dentro de un array numerico
- $myArray.`last` devuelve el valor del ultimo elemento dentro de un array, esto tambien permite modificar ese valor asignando una expresion

### Other useful helpers
- `contains`($myText, "str") devuelve 1 si $myText contiene "str", de lo contrario 0
- `find`($myText, "str") devuelve el indice del primer caracter de la primera ocurrencia de "str" en $myText, de lo contrario -1 si no se encuentra
Estos tambien funcionan con arrays.
- `isnumeric`($myText) devuelve 1 si $myText es un numero, de lo contrario 0

### Ternary operator
El operador ternario es una expresion condicional abreviada que devuelve un valor dependiendo de la evaluacion de una condicion.
```xc
$myVar = if($cond, $valTrue, $valFalse)
```

### Device functions
Una implementacion deberia definir funciones especificas de la aplicacion para el dispositivo.
Aqui hay ejemplos de funciones basicas del dispositivo que PUEDEN o NO estar definidas:
- `delta`() devuelve la diferencia de tiempo en segundos desde la ultima ejecucion de esta funcion `delta`
Las funciones del dispositivo que no requieren argumentos pueden usarse sin parentesis cuando se llaman desde dentro de una expresion.

# Compiler Specifications
Esta seccion esta destinada a desarrolladores de juegos que quieran usar esto en su juego.

XenonCode viene con su propia biblioteca de parser/compilador/interprete, y una herramienta cli muy simple.

## Editor
Se recomienda que el editor de codigo ejecute el siguiente analisis en la linea actual en cada pulsacion de tecla:
- Reemplazar secuencias iniciales de espacios con exactamente una tabulacion mas que la linea no vacia anterior, si comienza mas adelante
- Autocompletar palabras al presionar la barra espaciadora si esa palabra no es un simbolo existente
    - Escribir los caracteres restantes minimos (denominador comun) de los simbolos que comienzan con los caracteres escritos
        - Si es la palabra inicial: Solo autocompletar con palabras de sentencia de ambito global
        - Si esta precedida por tabulaciones: Solo autocompletar con palabras de sentencia de cuerpo de funcion
        - Cuando el primer caracter de la palabra actual es un `$`, autocompletar con una variable de usuario
        - Cuando el primer caracter de la palabra actual es un `@`, autocompletar con una funcion de usuario
        - De lo contrario, autocompletar con uno de:
            - Argumentos actuales de funcion/foreach/repeat
            - Funciones integradas
            - Operadores

## Runtime

Al encender el ordenador virtual:
- Ejecutar el cuerpo de la funcion init()

Un ciclo de reloj, ejecutado 'frequency' veces por segundo:
- Ejecutar todas las funciones de entrada que hayan recibido datos desde el ultimo ciclo (una vez cada una por ciclo)
- Ejecutar eventos personalizados / puntos de entrada
- Ejecutar la funcion tick
- Ejecutar todas las funciones timer secuencialmente si su tiempo ha llegado
- Dormir durante Elapsed-1/Frequency segundos

# Testing XenonCode
Es posible que desees probar XenonCode o practicar tus habilidades de programacion.
Hay una herramienta de prueba en linea en <a href="https://xenoncode.com/">XenonCode.com</a>

De lo contrario, puedes intentar ejecutarlo directamente en tu ordenador.
Para esto, XenonCode tiene un cli con un comando `-run` para probar algunos scripts en la consola.
Este repositorio viene con la herramienta cli, ubicada en `build/xenoncode`
Asi es como puedes descargar y ejecutar XenonCode:
```shell
# Clone this github repository
git clone https://github.com/batcholi/XenonCode.git
cd XenonCode
# Compile & Run the XC program located in test/
build/xenoncode -compile test -run test
```
Puedes editar los archivos fuente .xc en `test/` y luego intentar ejecutar la ultima linea de nuevo para compilar y ejecutar.
El directorio `test/storage/` se creara, contendra los datos de almacenamiento (variables prefijadas con la palabra clave `storage`).
Ten en cuenta que este comando `-run` esta disenado para probar rapidamente el lenguaje y solo ejecutara la funcion `init`.
Ademas, asegurate de que tu editor este configurado para usar tabulaciones y no espacios, para el correcto analisis de la indentacion.

Si deseas integrar XenonCode en tu proyecto C++, puedes incluir `XenonCode.hpp`.
Se proporcionara documentacion adicional para esto pronto, mientras tanto puedes usar `main.cpp` como ejemplo pero su uso aun esta sujeto a cambios.
