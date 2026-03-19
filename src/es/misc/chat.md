# Chat & Commands

## Sistema de chat
El chat permite a los jugadores comunicarse entre si. Para chatear con otros jugadores, presiona `Enter` para abrir el chat, luego escribe tu mensaje y presiona `Enter` de nuevo para enviarlo.
> - Tienes la opcion de copiar un mensaje simplemente haciendo clic en el con el `boton izquierdo del raton`. Los mensajes multilinea son totalmente compatibles.
> - La longitud maxima de un mensaje esta limitada a 800 caracteres.
> - Las conversaciones del chat se registran en el archivo de registro del servidor.

### Historial de comandos
Cuando el chat esta abierto, usa las **teclas de flecha Arriba/Abajo** para navegar por los comandos introducidos anteriormente. Aparece una ventana emergente visual encima del cuadro de entrada mostrando hasta 20 entradas recientes. Tambien puedes hacer clic en cualquier entrada para seleccionarla.

> **Nota:** Si las sugerencias de comandos son visibles (autocompletado), las teclas de flecha navegan por las sugerencias en su lugar. La navegacion del historial se reanuda cuando no se muestran sugerencias.

## Comandos
Los comandos te permiten realizar acciones especificas escribiendolos en el chat, precedidos por un `/`. Hay varios comandos disponibles, algunos de los cuales estan reservados para administradores.

#### Lista de comandos disponibles para todos los jugadores:
- `/clear` - Limpia los mensajes mostrados en el chat.
- `/help` - Muestra la lista de comandos disponibles y sus efectos.
- `/list` - Muestra la lista de jugadores conectados.
- `/info` - Muestra informacion sobre el servidor. *(Nombre del servidor, carga de CPU, ticks por segundo (25 ticks/s siendo el valor ideal para un servidor estable))*

#### Lista de comandos disponibles para administradores:
- `/save` - Guarda el estado actual del juego.
- `/setspawn <username>` - Establece el punto de reaparicion para un usuario especifico.
- `/give [<stack>] [<moduleName>.]<itemType> [<inventoryAlias|username>]` - Da objetos a un jugador. Si no se especifica un nombre de usuario, los objetos se dan a ti mismo.
- `/kick <username|id>` - Expulsa a un jugador del servidor.
- `/ban <username|id>` - Banea a un jugador del servidor.
- `/timeadd [-]<hours>` - Anade o resta tiempo en el juego.
