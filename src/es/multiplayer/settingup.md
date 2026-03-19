Archean ofrece una experiencia multijugador, permitiendote abrir tus partidas de un solo jugador a otros jugadores o configurar un servidor dedicado.

# Requisitos de hardware
Para asegurar el correcto funcionamiento de un servidor Archean en modo multijugador, se recomienda la siguiente configuracion minima:
- **Procesador**: Priorizar alta potencia por nucleo (i7, Ryzen...)
- **Memoria**: Minimo de 8 GB de RAM

Esta configuracion puede cambiar dependiendo de la plataforma utilizada (Windows, Linux, etc.) y futuras actualizaciones del juego.

# Red
Independientemente del sistema operativo elegido, debes asegurarte de que el puerto `8881` este abierto tanto para `UDP` como para `TCP`.

> **Nota**: Al jugar en solitario sin `accept_remote_connections = yes`, si el puerto 8881 ya esta en uso, el juego usara automaticamente un puerto disponible aleatorio.

# Setting Up a Server

## SteamCMD (Recomendado)
Archean Server esta disponible a traves de SteamCMD. Este es el metodo recomendado para servidores dedicados ya que permite actualizaciones faciles.

```bash
steamcmd +login anonymous +app_update 3557220 +quit
```

Una vez descargado, ejecuta el ejecutable del servidor como se describe en **Instalacion manual** a continuacion.

## Instalacion manual
Tanto para Linux como para Windows, hay un ejecutable independiente disponible para ejecutar un servidor Archean.

Para iniciar el servidor, simplemente ejecuta el archivo `Archean_server[.exe]` ubicado en la carpeta `Archean-game`. El servidor se iniciara en modo consola y te pedira una serie de informacion para configurarlo. Esta informacion ya no se solicitara una vez que el valor `server_public_name` este establecido en el archivo `server.ini`.

## Docker
Para configurar un servidor dedicado en un servidor Linux, necesitaras `curl` asi como `Docker` para ejecutar el script de instalacion automatica.

La instalacion de Docker puede variar significativamente dependiendo de la distribucion utilizada. Recomendamos consultar la Wiki de tu distribucion para obtener orientacion sobre una instalacion exitosa.

Para instalar el servidor con el script oficial, estos son los pasos a seguir:
```bash
# Descargar el script de instalacion
curl -s -o install_archean_server.sh https://archean.space/assets/user_scripts/run_server_with_docker.sh

# Hacerlo ejecutable
chmod +x install_archean_server.sh

# Ejecutar este script para instalar o actualizar el servidor
./install_archean_server.sh
```
> Nota: Es posible usar este metodo en Windows usando WSL (Windows Subsystem for Linux), pero algunos usuarios han encontrado posibles problemas de rendimiento.

## Permitir acceso a tu partida de un solo jugador
Puedes permitir el acceso a tu partida de un solo jugador si configuras manualmente el archivo `server.ini` con los siguientes parametros:
- `server_online = yes`
- `server_public_name = <Cualquier nombre que desees>`
- `accept_remote_connections = yes`

Luego, cada vez que presiones `Play` en el lanzador, un servidor publico aparecera en la lista y otros jugadores podran unirse a ti.
> - No olvides abrir tu puerto 8881 (o cualquier otro puerto que hayas configurado en `listen_port`).
> - No es necesario establecer el parametro `server_online` a `yes` para permitir que otros jugadores se unan a tu juego. Tambien puedes invitarlos dandoles tu direccion IP y el puerto de tu servidor, que tendran que introducir manualmente en el lanzador del juego. Solo necesitas establecer `accept_remote_connections = yes`.

# Instalar mods en un servidor dedicado
En un servidor dedicado, necesitas descargar los mods manualmente usando SteamCMD y configurar el servidor para encontrarlos.

## 1. Descargar mods con SteamCMD
Usa SteamCMD para descargar mods del Workshop. Puedes instalar SteamCMD en cualquier lugar de tu sistema.

```bash
# Descargar un mod por su ID del Workshop (reemplaza WORKSHOP_ID con el ID real)
steamcmd +login anonymous +workshop_download_item 2941660 WORKSHOP_ID +quit
```

donde `2941660` es el AppID de Steam de Archean y `WORKSHOP_ID` es el ID del Workshop del mod (se encuentra en la URL del Workshop del mod).

Por defecto, SteamCMD descarga el contenido del Workshop en:
- **Linux**: `~/.local/share/Steam/steamapps/workshop/content/2941660/`
- **Windows**: `<ruta_de_instalacion_SteamCMD>/steamapps/workshop/content/2941660/`

Tambien puedes especificar un directorio de descarga personalizado con la opcion `+force_install_dir`.

## 2. Configurar external_mods_dir
En tu `server.ini`, establece `external_mods_dir` para que apunte al directorio que contiene tus mods descargados:

```ini
[server]
external_mods_dir = /ruta/a/steamcmd/steamapps/workshop/content/2941660/
```

El servidor escaneara este directorio en busca de carpetas de mods que contengan un archivo `repository`.

## 3. Habilitar mods para tu mundo
Edita el archivo `mods.txt` en la carpeta de tu mundo:
```
Archean-data/server/worlds/<nombre_del_mundo>/mods.txt
```

Anade un nombre de mod por linea. El nombre del mod esta definido en el archivo `repository` del mod (no en el nombre de la carpeta).

Ejemplo de `mods.txt`:
```
MYVENDOR_mymod
OTHERVENDOR_anothermod
```

> - Si un mod listado en `mods.txt` no se encuentra, el servidor te pedira que continues sin el o abortes.
> - El nombre del mod (formato VENDOR_modname) generalmente se muestra en la pagina del Workshop de Steam del mod.

# Configuracion del servidor (server.ini)
El archivo `server.ini` contiene todas las configuraciones del servidor. Aqui hay una lista completa de los parametros disponibles:

## Configuracion del servidor
| Parametro | Por defecto | Descripcion |
|-----------|-------------|-------------|
| `server_online` | `no` | Si el servidor aparece en la lista publica |
| `server_public_name` | *(vacio)* | Nombre mostrado en la lista de servidores |
| `accept_remote_connections` | `no` | Permitir que los jugadores se conecten remotamente |
| `max_simultaneous_players` | `16` | Numero maximo de jugadores simultaneos |
| `password` | *(vacio)* | Contrasena para servidores privados (dejar vacio para publico) |
| `external_mods_dir` | *(vacio)* | Ruta al directorio de mods externos |

## Configuracion del juego
| Parametro | Por defecto | Descripcion |
|-----------|-------------|-------------|
| `world` | *(vacio)* | Nombre del mundo guardado |
| `spawn` | `earth` | Ubicacion de reaparicion (cuerpo celeste) |
| `spawn_x`, `spawn_y`, `spawn_z` | Coordenadas de la Tierra | Coordenadas de la posicion de reaparicion |

## Configuracion de red
| Parametro | Por defecto | Descripcion |
|-----------|-------------|-------------|
| `listen_port` | `8881` | Puerto de escucha |
| `listen_new_connection_timeout_ms` | `500` | Tiempo de espera de conexion en milisegundos |
| `automatic_blacklist` | `no` | Poner automaticamente en lista negra las conexiones problematicas |

## Configuracion de rendimiento
| Parametro | Por defecto | Descripcion |
|-----------|-------------|-------------|
| `updates_per_second` | `25` | Tasa de ticks del servidor (actualizaciones por segundo) |
| `physics_steps_per_update` | `8` | Numero de pasos de simulacion fisica por tick del servidor |
| `auto_save_interval_seconds` | `30` | Intervalo de guardado automatico en segundos |
| `screens_compression_level` | `2` | Nivel de compresion de pantallas (0-9). Menor = CPU mas rapido pero mas ancho de banda. Mayor = CPU mas lento pero menos ancho de banda |
| `server_loop_thread_cpu_affinity` | `-1` | Afinidad de nucleo de CPU para el hilo del bucle del servidor (-1 = automatico) |

> **Consejo**: Si tu servidor tiene alta carga de CPU por pantallas/dashboards, intenta reducir `screens_compression_level` a 0 o 1 para mejor rendimiento a costa de mas ancho de banda de red.

# Gestion de administradores
## Panel de administracion (F4)
Un panel de administracion es accesible en el juego con la tecla `F4`.
Muestra la carga del servidor y su velocidad en ticks por segundo. *(25 ticks/s siendo la tasa maxima de ticks por defecto que garantiza un rendimiento optimo)*

Una casilla de verificacion `Admin Privileges` permite, entre otras cosas, generar Blueprint de forma gratuita cuando el modo de juego esta configurado en `Adventure`.

El panel ofrece dos pestanas:
- **Players**: Permite ver la lista de jugadores conectados, teletransportarse a ellos y/o expulsarlos.
- **Entities**: Permite ver la lista de entidades presentes en el servidor (con propietario y alias), eliminarlas y/o teletransportarse a ellas. Tambien muestra el conteo total de entidades.

## Anadir/Eliminar un administrador
Para anadir un administrador, simplemente modifica el archivo `/Archean-data/server/admins.txt`.
Este archivo debe contener una lista de IDs de jugadores, uno por linea.
Si el jugador usa Steam, se debe usar su Steam64 ID.

## Comandos de administrador
Los administradores tienen acceso a comandos de chat especiales. Consulta [Chat & Commands](../misc/chat.md) para la lista completa, incluyendo el comando `/ban`.
