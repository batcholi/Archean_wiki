Archean offre un'esperienza multiplayer, permettendoti di aprire le tue partite in solitaria ad altri giocatori o di configurare un server dedicato.

# Requisiti hardware
Per garantire il corretto funzionamento di un server Archean in modalita multiplayer, si raccomanda la seguente configurazione minima:
- **Processore**: Privilegiare l'alta potenza per core (i7, Ryzen...)
- **Memoria**: Minimo 8 GB di RAM

Questa configurazione potrebbe cambiare a seconda della piattaforma utilizzata (Windows, Linux, ecc.) e dei futuri aggiornamenti del gioco.

# Rete
Indipendentemente dal sistema operativo scelto, devi assicurarti che la porta `8881` sia aperta sia per `UDP` che per `TCP`.

> **Nota**: Quando giochi in solitaria senza `accept_remote_connections = yes`, se la porta 8881 e gia in uso, il gioco utilizzera automaticamente una porta disponibile casuale.

# Configurazione di un server

## SteamCMD (Consigliato)
Archean Server e disponibile tramite SteamCMD. Questo e il metodo consigliato per i server dedicati poiche permette aggiornamenti facili.

```bash
steamcmd +login anonymous +app_update 3557220 +quit
```

Una volta scaricato, avvia l'eseguibile del server come descritto in **Installazione manuale** qui sotto.

## Installazione manuale
Sia per Linux che per Windows, e disponibile un eseguibile standalone per eseguire un server Archean.

Per avviare il server, esegui semplicemente il file `Archean_server[.exe]` situato nella cartella `Archean-game`. Il server si avviera in modalita console e ti chiedera una serie di informazioni per configurarlo. Queste informazioni non saranno piu richieste una volta che il valore `server_public_name` sara impostato nel file `server.ini`.

## Docker
Per configurare un server dedicato su un server Linux, avrai bisogno di `curl` e di `Docker` per eseguire lo script di installazione automatica.

L'installazione di Docker puo variare significativamente a seconda della distribuzione utilizzata. Raccomandiamo di consultare il Wiki della tua distribuzione per indicazioni su un'installazione corretta.

Per installare il server con lo script ufficiale, ecco i passaggi da seguire:
```bash
# Scarica lo script di installazione
curl -s -o install_archean_server.sh https://archean.space/assets/user_scripts/run_server_with_docker.sh

# Rendilo eseguibile
chmod +x install_archean_server.sh

# Esegui questo script per installare o aggiornare il server
./install_archean_server.sh
```
> Nota: E possibile utilizzare questo metodo su Windows tramite WSL (Windows Subsystem for Linux), ma alcuni utenti hanno riscontrato potenziali problemi di prestazioni.

## Consentire l'accesso alla tua partita in solitaria
Puoi consentire l'accesso alla tua partita in solitaria configurando manualmente il file `server.ini` con i seguenti parametri:
- `server_online = yes`
- `server_public_name = <Qualsiasi nome desideri>`
- `accept_remote_connections = yes`

Quindi, ogni volta che premi `Play` nel launcher, un server pubblico sara elencato e gli altri giocatori potranno unirsi a te.
> - Non dimenticare di aprire la porta 8881 (o qualsiasi altra porta configurata in `listen_port`).
> - Non e necessario impostare il parametro `server_online` su `yes` per permettere ad altri giocatori di unirsi alla tua partita. Puoi anche invitarli fornendo il tuo indirizzo IP e la porta del tuo server, che dovranno inserire manualmente nel launcher del gioco. Devi solo impostare `accept_remote_connections = yes`.

# Installazione di mod su un server dedicato
Su un server dedicato, devi scaricare manualmente le mod usando SteamCMD e configurare il server per trovarle.

## 1. Scaricare le mod con SteamCMD
Usa SteamCMD per scaricare le mod dal Workshop. Puoi installare SteamCMD ovunque nel tuo sistema.

```bash
# Scarica una mod tramite il suo ID Workshop (sostituisci WORKSHOP_ID con l'ID effettivo)
steamcmd +login anonymous +workshop_download_item 2941660 WORKSHOP_ID +quit
```

dove `2941660` e l'AppID Steam di Archean e `WORKSHOP_ID` e l'ID Workshop della mod (presente nell'URL Workshop della mod).

Per impostazione predefinita, SteamCMD scarica i contenuti del Workshop in:
- **Linux**: `~/.local/share/Steam/steamapps/workshop/content/2941660/`
- **Windows**: `<percorso_installazione_SteamCMD>/steamapps/workshop/content/2941660/`

Puoi anche specificare una directory di download personalizzata con l'opzione `+force_install_dir`.

## 2. Configurare external_mods_dir
Nel tuo `server.ini`, imposta `external_mods_dir` per puntare alla directory contenente le mod scaricate:

```ini
[server]
external_mods_dir = /path/to/steamcmd/steamapps/workshop/content/2941660/
```

Il server scansionera questa directory alla ricerca di cartelle mod contenenti un file `repository`.

## 3. Abilitare le mod per il tuo mondo
Modifica il file `mods.txt` nella cartella del tuo mondo:
```
Archean-data/server/worlds/<nome_mondo>/mods.txt
```

Aggiungi un nome di mod per riga. Il nome della mod e definito nel file `repository` della mod (non nel nome della cartella).

Esempio di `mods.txt`:
```
MYVENDOR_mymod
OTHERVENDOR_anothermod
```

> - Se una mod elencata in `mods.txt` non viene trovata, il server ti chiedera se continuare senza di essa o interrompere.
> - Il nome della mod (formato VENDOR_nomemod) e solitamente visualizzato sulla pagina Steam Workshop della mod.

# Configurazione del server (server.ini)
Il file `server.ini` contiene tutte le impostazioni del server. Ecco una lista completa dei parametri disponibili:

## Impostazioni del server
| Parametro | Predefinito | Descrizione |
|-----------|---------|-------------|
| `server_online` | `no` | Se il server e elencato pubblicamente |
| `server_public_name` | *(vuoto)* | Nome visualizzato nella lista dei server |
| `accept_remote_connections` | `no` | Permettere ai giocatori di connettersi da remoto |
| `max_simultaneous_players` | `16` | Numero massimo di giocatori contemporanei |
| `password` | *(vuoto)* | Password per server privati (lascia vuoto per pubblico) |
| `external_mods_dir` | *(vuoto)* | Percorso alla directory delle mod esterne |

## Impostazioni di gioco
| Parametro | Predefinito | Descrizione |
|-----------|---------|-------------|
| `world` | *(vuoto)* | Nome del salvataggio del mondo |
| `spawn` | `earth` | Posizione di spawn (corpo celeste) |
| `spawn_x`, `spawn_y`, `spawn_z` | Coordinate terrestri | Coordinate della posizione di spawn |

## Impostazioni di rete
| Parametro | Predefinito | Descrizione |
|-----------|---------|-------------|
| `listen_port` | `8881` | Porta di ascolto |
| `listen_new_connection_timeout_ms` | `500` | Timeout di connessione in millisecondi |
| `automatic_blacklist` | `no` | Inserire automaticamente nella blacklist le connessioni problematiche |

## Impostazioni delle prestazioni
| Parametro | Predefinito | Descrizione |
|-----------|---------|-------------|
| `updates_per_second` | `25` | Frequenza di aggiornamento del server (aggiornamenti al secondo) |
| `physics_steps_per_update` | `8` | Numero di passi della simulazione fisica per aggiornamento del server |
| `auto_save_interval_seconds` | `30` | Intervallo di salvataggio automatico in secondi |
| `screens_compression_level` | `2` | Livello di compressione degli schermi (0-9). Piu basso = CPU piu veloce ma piu banda. Piu alto = CPU piu lenta ma meno banda |
| `server_loop_thread_cpu_affinity` | `-1` | Affinita del core CPU per il thread del loop del server (-1 = automatico) |

> **Suggerimento**: Se il tuo server ha un carico CPU elevato a causa degli schermi/dashboard, prova ad abbassare `screens_compression_level` a 0 o 1 per migliori prestazioni a costo di piu banda di rete.

# Gestione degli amministratori
## Pannello di amministrazione (F4)
Un pannello di amministrazione e accessibile nel gioco con il tasto `F4`.
Mostra il carico del server e la sua velocita in tick al secondo. *(25 tick/s e la frequenza massima predefinita che garantisce prestazioni ottimali)*

Una casella di controllo `Admin Privileges` permette, tra le altre cose, di generare Blueprint gratuitamente quando la modalita di gioco e impostata su `Adventure`.

Il pannello offre due schede:
- **Players**: Permette di vedere la lista dei giocatori connessi, teletrasportarsi da loro e/o espellerli.
- **Entities**: Permette di vedere la lista delle entita presenti sul server (con proprietario e alias), eliminarle e/o teletrasportarsi ad esse. Mostra anche il conteggio totale delle entita.

## Aggiungere/Rimuovere un amministratore
Per aggiungere un amministratore, modifica semplicemente il file `/Archean-data/server/admins.txt`.
Questo file deve contenere una lista di ID dei giocatori, uno per riga.
Se il giocatore usa Steam, deve essere usato il suo Steam64 ID.

## Comandi amministratore
Gli amministratori hanno accesso a comandi speciali della chat. Consulta [Chat e comandi](../misc/chat.md) per la lista completa, incluso il comando `/ban`.
