# XenonCode IDE
El **XenonCode IDE** es una interfaz que te permite crear/editar scripts y programas para controlar componentes y sistemas. Esta basado en el lenguaje de programacion **XenonCode**, que ha sido escrito especialmente para este juego.

## Features
- **Text Editor**: Un editor de texto con resaltado de sintaxis para escribir scripts/programas.
- **Node Editor**: Un sistema de programacion alternativo basado en nodos visuales para crear scripts de forma visual e intuitiva.
- **Console**: Una consola para mostrar informacion, depuracion y mensajes de error.
- **Toolbar**: Una barra de herramientas para crear/eliminar scripts/programas, reiniciar el sistema y acceder a la documentacion disponible en la pagina de [Archean](archean.md).

---
## Usar el IDE en computers
El boton `CODE` en los computers permite acceder al IDE. Desde ahi, puedes comenzar a escribir scripts y programas para controlar componentes y sistemas.

### IDE Library
El IDE incluye una funcionalidad de Library que te permite guardar y reutilizar localmente archivos XenonCode en diferentes computers. Esto es util para compartir funciones comunes, scripts de utilidad o plantillas entre multiples computers del juego sin tener que copiar y pegar codigo manualmente.

### Informacion adicional especifica de computers
#### [Computer](../components/computers/Computer.md)
El computer tiene una pantalla tactil integrada y un BIOS de UI que muestra informacion del sistema y los programas disponibles en el disco duro al arrancar. Puedes seleccionar un programa para ejecutar apuntando a el y presionando la tecla `F`.

#### [Mini Computer](../components/computers/MiniComputer.md)
El MiniComputer es mas pequeno que el Computer y no tiene pantalla tactil ni BIOS visual. Ejecutara nativamente el primer programa creado en el disco duro.

## Interface
La interfaz del XenonCode IDE funciona de manera muy similar a un IDE normal que usan los programadores, excepto que en lugar de tener una jerarquia de archivos, todos los archivos en el HDD del computer virtual siempre estaran abiertos como pestanas.
Las pestanas se pueden mover y acoplar dentro y fuera del IDE, colocar lado a lado, arriba-abajo, etc.
Puedes tener multiples IDEs (es decir, de multiples computers del juego) abiertos al mismo tiempo, aunque no se pueden acoplar/ajustar entre ellos.

## Crear un BIOS personalizado
Es posible personalizar el BIOS del computer creando un archivo llamado `main.xc`. Este archivo es el primero en ejecutarse cuando un computer arranca. Puedes usarlo para modificar la apariencia del BIOS o para cargar automaticamente un programa o ejecutar directamente cualquier tipo de codigo.

## Programs vs Files
Un Program es un archivo que puede cargarse usando `load_program()`, y su nombre terminara en `*.main.xc` (no tienes que agregar eso en el nombre, solo escribe el prefijo).
Un File es para incluirse dentro de un programa, no puede cargarse como programa independiente, pero puede ser un BIOS personalizado cuando se nombra exactamente `main.xc` sin ningun prefijo.
Los Programs pueden escribirse con el sistema de nodos o codigo puro, mientras que los archivos normales solo pueden escribirse en codigo puro.
Los Programs pueden incluir (`include()`) archivos u otros programas, siempre que no haya conflicto de nombres en sus contenidos, y solo se defina un punto de entrada `init`.

## Cambiar entre modos (nodos visuales / codigo)
Cuando creas un programa, comenzara con el modo de nodos visuales y algunos nodos de IO iniciales como ejemplo que puedes eliminar.
El sistema de nodos visuales siempre generara automaticamente codigo en segundo plano a medida que hagas modificaciones.
Puedes "Switch To Code" en cualquier momento, sin embargo no sera editable de inmediato.
Para hacerlo editable, puedes "Convert to Code", que simplemente comentara la primera linea #NODES que define los nodos, y podras editar el codigo.
Despues de editar en codigo, si deseas volver a nodos, tu codigo sera sobreescrito por los nodos que tenias antes de cambiar inicialmente a codigo.
Esto significa que tipicamente, al convertir a codigo, es permanente, a menos que quieras revertirlo a como estaba.

## Ejecutar el codigo
Los computers del juego siempre se reiniciaran automaticamente cuando se haya guardado un cambio en el archivo actual (CTRL+S).
Guardar sin hacer ningun cambio no hara nada, pero puedes forzar un reinicio usando CTRL+SHIFT+S, que tambien forzara el guardado de TODOS los archivos abiertos.
Al reiniciar despues de guardar un cambio, el computer cargara inmediatamente el programa anterior si habia uno ejecutandose, sin pasar por el BIOS.
Si ocurrio un error, ya sea por un error de sintaxis o un error de ejecucion (como una division por cero o mala indexacion), el computer se congelara y la pantalla se pondra en blanco, y el error aparecera en la consola. En ese punto, necesitaras corregir el problema y reiniciarlo guardando el archivo modificado.

## Persistency
Los computers del juego se ejecutan todos en el lado del servidor, y seguiran funcionando cuando te desconectes, si estas jugando en un servidor dedicado.
Los archivos se guardan en el HDD del servidor en texto plano, incluyendo un archivo temporal para cambios no guardados, que se actualiza con cada cambio individual, por lo que no perderas tu codigo.
Incluso si no habias guardado tu archivo, si tu juego se cierra inesperadamente, ya sea que estes jugando solo o de forma remota, lo recuperaras cuando vuelvas a conectarte.
Si prefieres usar un IDE externo al juego, como vscode, tambien puedes editar los archivos directamente en el servidor, si lo estas alojando tu mismo o jugando en solitario.
Los HDDs virtuales se almacenan en `Archean-data/server/worlds/<WORLD_NAME>/ARCHEAN_computer/HDD-*` y contienen los archivos .xc tal como los has creado, asi como el subdirectorio `storage` que contendra las variables de almacenamiento en sus propios archivos individuales con sus valores en texto plano, separados por saltos de linea para arrays.
Al editar un archivo externamente, el juego detectara cualquier cambio realizado al programa en ejecucion actual y reiniciara automaticamente el computer.
Editar un archivo de almacenamiento, sin embargo, no causara un reinicio, y los valores no se usaran inmediatamente, ya que estan en cache en la memoria del computer al cargarse.
Los archivos de almacenamiento se actualizaran inmediatamente en el HDD del servidor al modificar el valor.

## Collaboration
El IDE es colaborativo, lo que significa que multiples jugadores pueden al menos ver los contenidos, mientras que un solo jugador a la vez puede editar el codigo.
Cuando el jugador editor hace un cambio, incluso si no se ha guardado, otros jugadores veran el cambio ocurrir en tiempo real, ya sea en modo codigo o nodos.
Los jugadores no editores son de solo lectura, no pueden editar el codigo o los nodos, hasta que hagan clic en Edit, en cuyo caso se convertiran en el editor actual y el editor anterior se convertira en un espectador de solo lectura.

## Shortcut keys
- `CTRL+S` Guardar el archivo actual y reiniciar el computer
- `CTRL+SHIFT+S` Guardar todos los archivos y reiniciar el computer
- `CTRL+D` Seleccionar la siguiente ocurrencia en el codigo, o duplicar los nodos seleccionados en modo nodos
- `CTRL+C` Copiar codigo o nodos seleccionados
- `CTRL+V` Pegar codigo o nodos
- `CTRL+N` Crear un nuevo File
- `CTRL+SHIFT+N` Crear un nuevo Program
- `CTRL+Q` Cerrar el IDE

## VSCode
Hemos puesto a disposicion una extension de vscode para soportar el resaltado de sintaxis de XenonCode asi como algo de linting, si deseas usarla.

---
