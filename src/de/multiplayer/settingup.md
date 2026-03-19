Archean bietet ein Mehrspieler-Erlebnis, das es dir ermöglicht, deine Einzelspieler-Spiele für andere Spieler zu öffnen oder einen dedizierten Server einzurichten.

# Hardwareanforderungen
Um den ordnungsgemäßen Betrieb eines Archean-Servers im Mehrspielermodus zu gewährleisten, wird folgende Mindestkonfiguration empfohlen:
- **Prozessor**: Hohe Leistung pro Kern priorisieren (i7, Ryzen...)
- **Arbeitsspeicher**: Mindestens 8 GB RAM

Dieses Setup kann sich je nach verwendeter Plattform (Windows, Linux usw.) und zukünftigen Spiel-Updates ändern.

# Netzwerk
Unabhängig von der Wahl des Betriebssystems musst du sicherstellen, dass Port `8881` sowohl für `UDP` als auch `TCP` geöffnet ist.

> **Hinweis**: Beim Solo-Spielen ohne `accept_remote_connections = yes` wird das Spiel automatisch einen zufällig verfügbaren Port verwenden, wenn Port 8881 bereits belegt ist.

# Server einrichten

## SteamCMD (Empfohlen)
Archean Server ist über SteamCMD verfügbar. Dies ist die empfohlene Methode für dedizierte Server, da sie einfache Updates ermöglicht.

```bash
steamcmd +login anonymous +app_update 3557220 +quit
```

Nach dem Download führe die Server-Programmdatei wie unter **Manuelle Installation** beschrieben aus.

## Manuelle Installation
Sowohl für Linux als auch für Windows ist eine eigenständige Programmdatei verfügbar, um einen Archean-Server zu betreiben.

Um den Server zu starten, führe einfach die Datei `Archean_server[.exe]` im Ordner `Archean-game` aus. Der Server startet im Konsolenmodus und fragt dich nach einer Reihe von Informationen zur Konfiguration. Diese Informationen werden nicht mehr abgefragt, sobald der Wert `server_public_name` in der Datei `server.ini` gesetzt ist.

## Docker
Um einen dedizierten Server auf einem Linux-Server einzurichten, benötigst du `curl` sowie `Docker`, um das automatische Installationsskript auszuführen.

Die Installation von Docker kann je nach verwendeter Distribution erheblich variieren. Wir empfehlen, das Wiki deiner Distribution zu konsultieren, um eine erfolgreiche Installation zu gewährleisten.

Um den Server mit dem offiziellen Skript zu installieren, folge diesen Schritten:
```bash
# Installationsskript herunterladen
curl -s -o install_archean_server.sh https://archean.space/assets/user_scripts/run_server_with_docker.sh

# Ausführbar machen
chmod +x install_archean_server.sh

# Dieses Skript ausführen, um den Server zu installieren oder zu aktualisieren
./install_archean_server.sh
```
> Hinweis: Es ist möglich, diese Methode unter Windows mit WSL (Windows Subsystem for Linux) zu verwenden, aber einige Benutzer haben potenzielle Leistungsprobleme festgestellt.

## Zugang zu deinem Einzelspieler-Spiel erlauben
Du kannst den Zugang zu deinem Einzelspieler-Spiel erlauben, indem du die Datei `server.ini` manuell mit folgenden Parametern konfigurierst:
- `server_online = yes`
- `server_public_name = <Ein beliebiger Name>`
- `accept_remote_connections = yes`

Dann wird jedes Mal, wenn du im Launcher auf `Play` drückst, ein öffentlicher Server gelistet und andere Spieler können dir beitreten.
> - Vergiss nicht, deinen Port 8881 (oder einen anderen Port, den du in `listen_port` konfiguriert hast) zu öffnen.
> - Du musst den Parameter `server_online` nicht auf `yes` setzen, um anderen Spielern den Beitritt zu ermöglichen. Du kannst sie auch einladen, indem du ihnen deine IP-Adresse und den Port deines Servers gibst, die sie manuell im Spiel-Launcher eingeben müssen. Du musst nur `accept_remote_connections = yes` setzen.

# Mods auf einem dedizierten Server installieren
Auf einem dedizierten Server musst du Mods manuell über SteamCMD herunterladen und den Server so konfigurieren, dass er sie findet.

## 1. Mods mit SteamCMD herunterladen
Verwende SteamCMD, um Workshop-Mods herunterzuladen. Du kannst SteamCMD an beliebiger Stelle auf deinem System installieren.

```bash
# Mod über ihre Workshop-ID herunterladen (WORKSHOP_ID durch die tatsächliche ID ersetzen)
steamcmd +login anonymous +workshop_download_item 2941660 WORKSHOP_ID +quit
```

wobei `2941660` Archeans Steam AppID ist und `WORKSHOP_ID` die Workshop-ID der Mod ist (zu finden in der Workshop-URL der Mod).

Standardmäßig lädt SteamCMD Workshop-Inhalte herunter nach:
- **Linux**: `~/.local/share/Steam/steamapps/workshop/content/2941660/`
- **Windows**: `<SteamCMD_Installationspfad>/steamapps/workshop/content/2941660/`

Du kannst auch ein benutzerdefiniertes Download-Verzeichnis mit der Option `+force_install_dir` angeben.

## 2. external_mods_dir konfigurieren
Setze in deiner `server.ini` den Wert `external_mods_dir` auf das Verzeichnis, das deine heruntergeladenen Mods enthält:

```ini
[server]
external_mods_dir = /pfad/zu/steamcmd/steamapps/workshop/content/2941660/
```

Der Server durchsucht dieses Verzeichnis nach Mod-Ordnern, die eine `repository`-Datei enthalten.

## 3. Mods für deine Welt aktivieren
Bearbeite die Datei `mods.txt` in deinem Weltordner:
```
Archean-data/server/worlds/<Weltname>/mods.txt
```

Füge einen Mod-Namen pro Zeile hinzu. Der Mod-Name ist in der `repository`-Datei der Mod definiert (nicht der Ordnername).

Beispiel `mods.txt`:
```
MYVENDOR_mymod
OTHERVENDOR_anothermod
```

> - Wenn eine in `mods.txt` aufgeführte Mod nicht gefunden wird, fragt der Server, ob du ohne sie fortfahren oder abbrechen möchtest.
> - Der Mod-Name (VENDOR_modname-Format) wird normalerweise auf der Steam Workshop-Seite der Mod angezeigt.

# Serverkonfiguration (server.ini)
Die Datei `server.ini` enthält alle Servereinstellungen. Hier ist eine vollständige Liste der verfügbaren Parameter:

## Servereinstellungen
| Parameter | Standard | Beschreibung |
|-----------|---------|-------------|
| `server_online` | `no` | Ob der Server öffentlich gelistet wird |
| `server_public_name` | *(leer)* | Name, der in der Serverliste angezeigt wird |
| `accept_remote_connections` | `no` | Fernverbindungen von Spielern erlauben |
| `max_simultaneous_players` | `16` | Maximale Anzahl gleichzeitiger Spieler |
| `password` | *(leer)* | Passwort für private Server (leer lassen für öffentlich) |
| `external_mods_dir` | *(leer)* | Pfad zum externen Mods-Verzeichnis |

## Spieleinstellungen
| Parameter | Standard | Beschreibung |
|-----------|---------|-------------|
| `world` | *(leer)* | Name des Weltspeicherstands |
| `spawn` | `earth` | Spawn-Ort (Himmelskörper) |
| `spawn_x`, `spawn_y`, `spawn_z` | Erdkoordinaten | Spawn-Positionskoordinaten |

## Netzwerkeinstellungen
| Parameter | Standard | Beschreibung |
|-----------|---------|-------------|
| `listen_port` | `8881` | Port zum Abhören |
| `listen_new_connection_timeout_ms` | `500` | Verbindungs-Timeout in Millisekunden |
| `automatic_blacklist` | `no` | Problematische Verbindungen automatisch auf die Blacklist setzen |

## Leistungseinstellungen
| Parameter | Standard | Beschreibung |
|-----------|---------|-------------|
| `updates_per_second` | `25` | Server-Tickrate (Updates pro Sekunde) |
| `physics_steps_per_update` | `8` | Anzahl der Physiksimulationsschritte pro Server-Tick |
| `auto_save_interval_seconds` | `30` | Auto-Speicher-Intervall in Sekunden |
| `screens_compression_level` | `2` | Bildschirm-Komprimierungsstufe (0-9). Niedriger = schnellere CPU, aber mehr Bandbreite. Höher = langsamere CPU, aber weniger Bandbreite |
| `server_loop_thread_cpu_affinity` | `-1` | CPU-Kern-Affinität für den Server-Loop-Thread (-1 = automatisch) |

> **Tipp**: Wenn dein Server eine hohe CPU-Auslastung durch Bildschirme/Dashboards hat, versuche `screens_compression_level` auf 0 oder 1 zu senken, um bessere Leistung auf Kosten von mehr Netzwerkbandbreite zu erzielen.

# Administratoren verwalten
## Administrationspanel (F4)
Ein Administrationspanel ist im Spiel über die `F4`-Taste zugänglich.
Es zeigt die Serverauslastung und seine Geschwindigkeit in Ticks pro Sekunde an. *(25 Ticks/s ist die standardmäßige maximale Tickrate, die optimale Leistung garantiert)*

Eine Checkbox `Admin Privileges` ermöglicht es unter anderem, Blueprints kostenlos zu spawnen, wenn der Spielmodus auf `Adventure` eingestellt ist.

Das Panel bietet zwei Tabs:
- **Players**: Ermöglicht es, die Liste der verbundenen Spieler zu sehen, sich zu ihnen zu teleportieren und/oder sie zu kicken.
- **Entities**: Ermöglicht es, die Liste der auf dem Server vorhandenen Entitäten (mit Besitzer und Alias) zu sehen, sie zu löschen und/oder sich zu ihnen zu teleportieren. Zeigt auch die Gesamtanzahl der Entitäten.

## Administrator hinzufügen/entfernen
Um einen Administrator hinzuzufügen, bearbeite einfach die Datei `/Archean-data/server/admins.txt`.
Diese Datei sollte eine Liste von Spieler-IDs enthalten, eine pro Zeile.
Wenn der Spieler Steam verwendet, sollte seine Steam64 ID verwendet werden.

## Admin-Befehle
Administratoren haben Zugang zu speziellen Chat-Befehlen. Siehe [Chat & Befehle](../misc/chat.md) für die vollständige Liste, einschließlich des `/ban`-Befehls.
