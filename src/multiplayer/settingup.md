Archean offers a multiplayer experience, allowing you to open your single-player games to other players or set up a dedicated server.

# Hardware Requirements
To ensure the proper functioning of an Archean server in multiplayer mode, the following minimum configuration is recommended:
- **Processor**: Prioritize high power per core (i7, Ryzen...)
- **Memory**: Minimum of 8 GB of RAM

This setup may change depending on the platform used (Windows, Linux, etc.) and future game updates.

# Network
Regardless of the operating system choice, you must ensure that port `8881` is open for both `UDP` & `TCP`.

# Setting Up a Server
### Docker
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

### Manual Installation
For both Linux and Windows, a standalone executable is available to run an Archean server.

To start the server, simply run the `Archean_server[.exe]` file located in the `Archean-game` folder. The server will launch in console mode and will ask you for a series of information to configure it. This information will no longer be requested once the `server_public_name` value is set in the `server.ini` file.

### Allow Access to Your Single-Player Game
You can allow access to your single-player game if you manually configure the `server.ini` file with the following parameters:
- `server_online = yes`
- `server_public_name = <Any name you want>`
- `accept_remote_connections = yes`

Then, each time you press `Play` in the launcher, a public server will be listed and other players will be able to join you.
> - Don't forget to open your port 8881 (or any other port you have configured in `listen_port`).
> - You do not have to set the `server_online` parameter to `yes` to allow other players to join your game. You can also invite them by giving them your IP address and the port of your server, which they will need to enter manually in the game launcher. You only need to set `accept_remote_connections = yes`.

# Managing Administrators
## Information
An administration panel is accessible in the game with the `F4` key.
It displays the server load and its speed in ticks per second. *(25 ticks/s being the default maximum tick rate guaranteeing optimal performance)*

A checkbox `Admin Privileges` allows, among other things, to spawn blueprints for free when the game mode is set to `Adventure`.

The panel also offers two tabs:
- **Players**: Allows you to see the list of connected players, teleport to them, and/or kick them.
- **Entities**: Allows you to see the list of entities present on the server, delete them, and/or teleport to them.

## Adding/Removing an Administrator
To add an administrator, simply modify the file `/Archean-data/server/admins.txt`.
This file should contain a list of player IDs, one per line.
If the player uses Steam, their Steam64 ID should be used.