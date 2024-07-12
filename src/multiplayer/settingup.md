Archean offers a multiplayer experience, allowing you to open your single-player games to other players or set up a dedicated server.

# Hardware Requirements
To ensure the proper functioning of an Archean server in multiplayer mode, the following minimum configuration is recommended:
- **Processor**: Prioritize high power per core (i7, Ryzen...)
- **Memory**: Minimum of 8 GB of RAM

This setup may change depending on the platform used (Windows, Linux, etc.) and future game updates.

# Network
Regardless of the operating system choice, you must ensure that port `8881` is open for both `UDP` & `TCP`.

# Operating System
## Linux
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

## Windows
Standalone windows servers are not supported yet, but coming soon.  

However, you can host a game while playing it if you configure `server.ini` with the following:  
- `server_online = yes`
- `server_public_name = <Any name you want>`
- `accept_remote_connections = yes`  

Then, whenever you hit `Play` in the launcher, a public server will be listed and others can join.  
Again, don't forget to open your port 8881 (or anything have set in `listen_port`).

> When you configure your game (locally) to be publicly accessible, if you have changed the default port (8881) in the `server.ini` file, you will also need to change the port in the `client.ini` file so that you can connect to your own local server.

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