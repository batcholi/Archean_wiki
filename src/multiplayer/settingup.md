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
