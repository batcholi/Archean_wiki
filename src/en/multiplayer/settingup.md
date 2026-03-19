Archean offers a multiplayer experience, allowing you to open your single-player games to other players or set up a dedicated server.

# Hardware Requirements
To ensure the proper functioning of an Archean server in multiplayer mode, the following minimum configuration is recommended:
- **Processor**: Prioritize high power per core (i7, Ryzen...)
- **Memory**: Minimum of 8 GB of RAM

This setup may change depending on the platform used (Windows, Linux, etc.) and future game updates.

# Network
Regardless of the operating system choice, you must ensure that port `8881` is open for both `UDP` & `TCP`.

> **Note**: When playing solo without `accept_remote_connections = yes`, if port 8881 is already in use, the game will automatically use a random available port.

# Setting Up a Server

## SteamCMD (Recommended)
Archean Server is available via SteamCMD. This is the recommended method for dedicated servers as it allows easy updates.

```bash
steamcmd +login anonymous +app_update 3557220 +quit
```

Once downloaded, run the server executable as described in **Manual Installation** below.

## Manual Installation
For both Linux and Windows, a standalone executable is available to run an Archean server.

To start the server, simply run the `Archean_server[.exe]` file located in the `Archean-game` folder. The server will launch in console mode and will ask you for a series of information to configure it. This information will no longer be requested once the `server_public_name` value is set in the `server.ini` file.

## Docker
To set up a dedicated server on a Linux server, you will need `curl` as well as `Docker` in order to execute the automatic installation script.

Installing Docker can significantly vary depending on the distribution used. We recommend consulting the Wiki of your distribution for guidance on successful installation.

To install the server with the official script, here are the steps to follow:
```bash
# Download the install script
curl -s -o install_archean_server.sh https://archean.space/assets/user_scripts/run_server_with_docker.sh

# Make it executable
chmod +x install_archean_server.sh

# Run this script to Install or Update the server
./install_archean_server.sh
```
> Note: It is possible to use this method on Windows using WSL (Windows Subsystem for Linux), but some users have encountered potential performance issues.

## Allow Access to Your Single-Player Game
You can allow access to your single-player game if you manually configure the `server.ini` file with the following parameters:
- `server_online = yes`
- `server_public_name = <Any name you want>`
- `accept_remote_connections = yes`

Then, each time you press `Play` in the launcher, a public server will be listed and other players will be able to join you.
> - Don't forget to open your port 8881 (or any other port you have configured in `listen_port`).
> - You do not have to set the `server_online` parameter to `yes` to allow other players to join your game. You can also invite them by giving them your IP address and the port of your server, which they will need to enter manually in the game launcher. You only need to set `accept_remote_connections = yes`.

# Installing Mods on a Dedicated Server
On a dedicated server, you need to manually download mods using SteamCMD and configure the server to find them.

## 1. Download mods with SteamCMD
Use SteamCMD to download Workshop mods. You can install SteamCMD anywhere on your system.

```bash
# Download a mod by its Workshop ID (replace WORKSHOP_ID with the actual ID)
steamcmd +login anonymous +workshop_download_item 2941660 WORKSHOP_ID +quit
```

where `2941660` is Archean's Steam AppID and `WORKSHOP_ID` is the mod's Workshop ID (found in the mod's Workshop URL).

By default, SteamCMD downloads Workshop content to:
- **Linux**: `~/.local/share/Steam/steamapps/workshop/content/2941660/`
- **Windows**: `<SteamCMD_install_path>/steamapps/workshop/content/2941660/`

You can also specify a custom download directory with the `+force_install_dir` option.

## 2. Configure external_mods_dir
In your `server.ini`, set `external_mods_dir` to point to the directory containing your downloaded mods:

```ini
[server]
external_mods_dir = /path/to/steamcmd/steamapps/workshop/content/2941660/
```

The server will scan this directory for mod folders containing a `repository` file.

## 3. Enable mods for your world
Edit the `mods.txt` file in your world folder:
```
Archean-data/server/worlds/<world_name>/mods.txt
```

Add one mod name per line. The mod name is defined in the mod's `repository` file (not the folder name).

Example `mods.txt`:
```
MYVENDOR_mymod
OTHERVENDOR_anothermod
```

> - If a mod listed in `mods.txt` is not found, the server will prompt you to continue without it or abort. 
> - The mod name (VENDOR_modname format) is usually displayed on the mod's Steam Workshop page.

# Server Configuration (server.ini)
The `server.ini` file contains all server settings. Here is a complete list of available parameters:

## Server Settings
| Parameter | Default | Description |
|-----------|---------|-------------|
| `server_online` | `no` | Whether the server is listed publicly |
| `server_public_name` | *(empty)* | Name displayed in the server list |
| `accept_remote_connections` | `no` | Allow players to connect remotely |
| `max_simultaneous_players` | `16` | Maximum number of concurrent players |
| `password` | *(empty)* | Password for private servers (leave empty for public) |
| `external_mods_dir` | *(empty)* | Path to external mods directory |

## Game Settings
| Parameter | Default | Description |
|-----------|---------|-------------|
| `world` | *(empty)* | World save name |
| `spawn` | `earth` | Spawn location (celestial body) |
| `spawn_x`, `spawn_y`, `spawn_z` | Earth coordinates | Spawn position coordinates |

## Networking Settings
| Parameter | Default | Description |
|-----------|---------|-------------|
| `listen_port` | `8881` | Port to listen on |
| `listen_new_connection_timeout_ms` | `500` | Connection timeout in milliseconds |
| `automatic_blacklist` | `no` | Automatically blacklist problematic connections |

## Performance Settings
| Parameter | Default | Description |
|-----------|---------|-------------|
| `updates_per_second` | `25` | Server tick rate (updates per second) |
| `physics_steps_per_update` | `8` | Number of physics simulation steps per server tick |
| `auto_save_interval_seconds` | `30` | Auto-save interval in seconds |
| `screens_compression_level` | `2` | Screen compression level (0-9). Lower = faster CPU but more bandwidth. Higher = slower CPU but less bandwidth |
| `server_loop_thread_cpu_affinity` | `-1` | CPU core affinity for the server loop thread (-1 = automatic) |

> **Tip**: If your server has high CPU load from screens/dashboards, try lowering `screens_compression_level` to 0 or 1 for better performance at the cost of more network bandwidth.

# Managing Administrators
## Administration Panel (F4)
An administration panel is accessible in the game with the `F4` key.
It displays the server load and its speed in ticks per second. *(25 ticks/s being the default maximum tick rate guaranteeing optimal performance)*

A checkbox `Admin Privileges` allows, among other things, to spawn blueprints for free when the game mode is set to `Adventure`.

The panel offers two tabs:
- **Players**: Allows you to see the list of connected players, teleport to them, and/or kick them.
- **Entities**: Allows you to see the list of entities present on the server (with owner and alias), delete them, and/or teleport to them. Also shows the total entity count.

## Adding/Removing an Administrator
To add an administrator, simply modify the file `/Archean-data/server/admins.txt`.
This file should contain a list of player IDs, one per line.
If the player uses Steam, their Steam64 ID should be used.

## Admin Commands
Administrators have access to special chat commands. See [Chat & Commands](../misc/chat.md) for the full list, including the `/ban` command.