# Chat & Befehle

## Chat-System
Der Chat ermöglicht es Spielern, miteinander zu kommunizieren. Um mit anderen Spielern zu chatten, drücke `Enter`, um den Chat zu öffnen, tippe dann deine Nachricht ein und drücke erneut `Enter`, um sie zu senden.
> - Du hast die Möglichkeit, eine Nachricht zu kopieren, indem du einfach mit der `linken Maustaste` darauf klickst. Mehrzeilige Nachrichten werden vollständig unterstützt.
> - Die maximale Länge einer Nachricht ist auf 800 Zeichen begrenzt.
> - Chat-Unterhaltungen werden in der Logdatei des Servers protokolliert.

### Befehlshistorie
Wenn der Chat geöffnet ist, verwende die **Pfeil-nach-oben/unten-Tasten**, um durch zuvor eingegebene Befehle zu blättern. Ein visuelles Popup erscheint über dem Eingabefeld und zeigt bis zu 20 letzte Einträge. Du kannst auch auf einen Eintrag klicken, um ihn auszuwählen.

> **Hinweis:** Wenn Befehlsvorschläge sichtbar sind (Auto-Vervollständigung), navigieren die Pfeiltasten stattdessen durch die Vorschläge. Das Blättern durch die Historie wird fortgesetzt, wenn keine Vorschläge angezeigt werden.

## Befehle
Befehle ermöglichen es dir, bestimmte Aktionen auszuführen, indem du sie im Chat eingibst, eingeleitet durch ein `/`. Es gibt mehrere verfügbare Befehle, von denen einige Administratoren vorbehalten sind.

#### Liste der für alle Spieler verfügbaren Befehle:
- `/clear` - Löscht die im Chat angezeigten Nachrichten.
- `/help` - Zeigt die Liste der verfügbaren Befehle und deren Auswirkungen an.
- `/list` - Zeigt die Liste der verbundenen Spieler an.
- `/info` - Zeigt Informationen über den Server an. *(Servername, CPU-Auslastung, Ticks pro Sekunde (25 Ticks/s ist der ideale Wert für einen stabilen Server))*

#### Liste der für Administratoren verfügbaren Befehle:
- `/save` - Speichert den aktuellen Spielstand.
- `/setspawn <Benutzername>` - Setzt den Spawnpunkt für einen bestimmten Benutzer.
- `/give [<Stapel>] [<Modulname>.]<Gegenstandstyp> [<Inventaralias|Benutzername>]` - Gibt einem Spieler Gegenstände. Wenn kein Benutzername angegeben wird, werden die Gegenstände dir selbst gegeben.
- `/kick <Benutzername|ID>` - Wirft einen Spieler vom Server.
- `/ban <Benutzername|ID>` - Bannt einen Spieler vom Server.
- `/timeadd [-]<Stunden>` - Fügt Zeit im Spiel hinzu oder zieht sie ab.
