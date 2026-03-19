# Visual Nodes Editor
El editor de nodos del XenonCode IDE ofrece una amplia gama de nodos para ayudarte a crear scripts y programas.

Es lo suficientemente completo para manejar tareas complejas y tambien es mas facil de comprender para principiantes. Para posibilidades aun mas avanzadas, tambien puedes usar [XenonCode](documentation.md) en modo texto (codigo).

---
## Code generation

El sistema de nodos visuales siempre generara automaticamente codigo en segundo plano a medida que hagas modificaciones.
El codigo se genera cada vez que se agrega un nodo de punto final `output`, `print` o `execute`, y se retropropagara a traves de las dependencias de entrada.
Esto significa que agregar un nodo de entrada no generara ningun codigo, pero agregar un nodo de salida generara el codigo para ambos nodos cuando los conectes juntos.

---
## Lista de nodos

Aqui hay una lista de los diferentes tipos de nodos disponibles en el editor, junto con sus descripciones si es necesario:

`Constant Number` Define un valor numerico constante.

`Constant Text` Define un valor textual constante.

`Variable Number` Define un valor numerico variable que puede ser definido y reiniciado por otro nodo.

`Variable Text` Define un valor textual variable que puede ser definido y reiniciado por otro nodo.

`Comment` Te permite mostrar un bloque de comentarios en tu script.

---
### Input
`By Alias` Usa un nodo de salida de un componente usando su alias al comunicarse a traves de un Router.

`0,1,2,3...` Usa un nodo de salida de un componente que esta actualmente conectado a un puerto del computer. Cuando conectas un componente a un puerto, es automaticamente detectado por el computer.

---
### Output
`Print (Console log)` Muestra un numero/texto en la consola del computer.

`By Alias` Usa un nodo de entrada de un componente usando su alias al comunicarse a traves de un Router.

`0,1,2,3...` Usa un nodo de entrada de un componente que esta actualmente conectado a un puerto del computer. Cuando conectas un componente a un puerto, es automaticamente detectado por el computer.

---
### Math
Los nodos matematicos pueden tener mas de dos entradas, permitiendote encadenar multiples valores en una sola operacion.

`Add` Devuelve la suma de dos o mas valores.

`Subtract` Devuelve la resta de dos o mas valores.

`Multiply` Devuelve el producto de dos o mas valores.

`Divide` Devuelve la division de dos o mas valores.

`Absolute` Devuelve el valor absoluto de un numero.

`Negative` Devuelve el valor negativo de un numero.

`Modulo` Devuelve el resto de la division de dos numeros.

`Floor` Devuelve el valor redondeado hacia abajo al entero mas cercano.

`Ceil` Devuelve el valor redondeado hacia arriba al entero mas cercano.

`Round` Devuelve el valor redondeado al entero mas cercano.

`Fract` Devuelve la parte decimal de un numero.

`Sign` Devuelve el signo de un numero.

`Pow` Devuelve la potencia de dos numeros.

`Log` Devuelve el logaritmo de un numero.

`Sqrt` Devuelve la raiz cuadrada de un numero.

`Clamp` Devuelve el valor de un numero restringido entre un minimo y un maximo.

`Step` Devuelve 0 si el valor es menor que un umbral y 1 si es mayor.

`Smoothstep` Devuelve una interpolacion suave restringida entre dos valores basada en una proporcion.

`Lerp` Devuelve una interpolacion lineal entre dos valores basada en una proporcion.

`Sin` Devuelve el seno de un angulo (dado en radianes).

`Cos` Devuelve el coseno de un angulo (dado en radianes).

`Tan` Devuelve la tangente de un angulo (dado en radianes).

`Asin` Devuelve el angulo arcoseno en radianes de un numero.

`Acos` Devuelve el angulo arcocoseno en radianes de un numero.

`Atan` Devuelve el angulo arcotangente en radianes de un numero.

---
### Boolean
Los valores booleanos se representan como valores numericos. 0 significa Falso, cualquier otro valor significa Verdadero.
Los nodos booleanos pueden tener mas de dos entradas, permitiendote encadenar multiples condiciones en una sola operacion.

`And` Devuelve 1 si todos los valores se evaluan como Verdadero.

`Or` Devuelve 1 si alguno de los valores se evalua como Verdadero.

`Xor` Devuelve 1 si un numero impar de valores se evaluan como Verdadero.

`Not` Devuelve lo opuesto de un valor booleano dado.

---
### Compare
`Equal` Compara si dos valores son iguales y devuelve un booleano (0 o 1).

`Greater` Compara si un valor es mayor que otro y devuelve un booleano (0 o 1).

`Lesser` Compara si un valor es menor que otro y devuelve un booleano (0 o 1).

---
### Functions
`Expression` Te permite escribir una expresion matematica mas avanzada usando funciones de XenonCode y/o algebra.

`Switch` Devuelve diferentes valores dependiendo del valor de entrada.

`Counter` Devuelve un contador que se incrementa con cada llamada. El valor inicial, minimo y maximo pueden definirse.

`Pulse` Devuelve 1 cuando su valor de entrada ha cambiado.

`PulseToggle` Devuelve un booleano que alterna entre Verdadero/Falso cada vez que su valor de entrada ha cambiado.

`Text` Te permite escribir una expresion textual mas avanzada.

`PID Controller` Devuelve un valor de control PID basado en el error, la integral del error y la derivada del error.

`Unit Converter` Convierte un valor entre unidades fisicas comunes de la misma categoria. Categorias soportadas: Angle (Radians, Degrees), Rotation (RPS, RPM), Speed (m/s, km/h, mph, ft/s, knots), Temperature (Kelvin, Celsius, Fahrenheit), Pressure (Pascal, bar, psi, atm), Force (Newton, lbf, kgf).

---
### Execution
`Statement` Te permite escribir una sentencia pura de XenonCode como una llamada a funcion. Debe conectarse a un nodo Conditional o Execute.

`Conditional` Considera la sentencia dada solo si la condicion dada se evalua como Verdadero. Puede encadenarse con otros condicionales.

`Execute` Ejecuta las sentencias conectadas en orden de arriba a abajo.

`Include` Incluye otro script de XenonCode en el script actual. Asegurate de que tus nodos de variables y constantes tengan nombres unicos.

---
### Timing

`Time` Devuelve el timestamp Unix actual en unidades de segundos, con decimales con precision de microsegundos.

`Delay` Devuelve un booleano 1 despues de un retraso dado en segundos despues de que la entrada Set haya recibido un cambio de 1 a 0.

`Blinker` Devuelve un booleano alternante entre 0 y 1 que cambia en cada intervalo de tiempo definido en segundos.

`Smooth` Devuelve un valor que interpola desde el objetivo anterior (o 0) hasta el valor objetivo actual con una duracion dada en segundos despues de que la entrada Start haya recibido un cambio de 1 a 0.
