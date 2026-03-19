# XenonCode IDE
Die **XenonCode IDE** ist eine Oberfläche, die es dir ermöglicht, Skripte und Programme zum Steuern von Komponenten und Systemen zu erstellen/bearbeiten. Sie basiert auf der Programmiersprache **XenonCode**, die speziell für dieses Spiel geschrieben wurde.

## Funktionen
- **Texteditor**: Ein Texteditor mit Syntaxhervorhebung zum Schreiben von Skripten/Programmen.
- **Node-Editor**: Ein alternatives Programmiersystem basierend auf visuellen Nodes zum Erstellen von Skripten auf visuelle und intuitive Weise.
- **Konsole**: Eine Konsole zur Anzeige von Informationen, Debugging- und Fehlermeldungen.
- **Werkzeugleiste**: Eine Werkzeugleiste zum Erstellen/Löschen von Skripten/Programmen, Neustarten des Systems und Zugriff auf die Dokumentation auf der [Archean](archean.md)-Seite.

---
## Die IDE auf Computern verwenden
Die `CODE`-Schaltfläche auf Computern ermöglicht den Zugriff auf die IDE. Von dort aus kannst du mit dem Schreiben von Skripten und Programmen zum Steuern von Komponenten und Systemen beginnen.

### IDE-Bibliothek
Die IDE enthält eine Bibliotheksfunktion, die es dir ermöglicht, XenonCode-Dateien lokal zu speichern und über verschiedene Computer hinweg wiederzuverwenden. Dies ist nützlich, um gemeinsame Funktionen, Hilfsskripte oder Vorlagen zwischen mehreren Computern im Spiel zu teilen, ohne Code manuell kopieren und einfügen zu müssen.

### Zusätzliche computerspezifische Informationen
#### [Computer](../components/computers/Computer.md)
Der Computer hat einen integrierten Touchscreen und ein UI-BIOS, das Systeminformationen und verfügbare Programme auf der Festplatte beim Start anzeigt. Du kannst ein Programm zur Ausführung auswählen, indem du es anvisierst und die `F`-Taste drückst.

#### [Mini Computer](../components/computers/MiniComputer.md)
Der MiniComputer ist kleiner als der Computer und hat keinen Touchscreen oder visuelles BIOS. Er führt nativ das erste auf der Festplatte erstellte Programm aus.

## Oberfläche
Die Oberfläche der XenonCode IDE funktioniert ähnlich wie eine normale IDE, die Programmierer verwenden, außer dass anstelle einer Dateihierarchie alle Dateien auf der virtuellen Festplatte dieses Computers immer als Tabs geöffnet sind.  
Tabs können verschoben und in und aus der IDE angedockt werden, nebeneinander, übereinander usw.  
Du kannst mehrere IDEs (also von mehreren Computern im Spiel) gleichzeitig geöffnet haben, obwohl sie nicht zusammen angedockt/eingerastet werden können.  

## Ein benutzerdefiniertes BIOS erstellen
Es ist möglich, das BIOS des Computers anzupassen, indem du eine Datei namens `main.xc` erstellst. Diese Datei wird als erste ausgeführt, wenn ein Computer startet. Du kannst sie verwenden, um das Aussehen des BIOS zu ändern oder automatisch ein Programm zu laden oder direkt beliebigen Code auszuführen.

## Programme vs. Dateien
Ein Programm ist eine Datei, die mit `load_program()` geladen werden kann, und ihr Name endet auf `*.main.xc` (du musst das nicht im Namen hinzufügen, schreibe einfach das Präfix).  
Eine Datei soll innerhalb eines Programms eingebunden werden, kann nicht als eigenständiges Programm geladen werden, kann aber ein benutzerdefiniertes BIOS sein, wenn sie genau `main.xc` ohne Präfix heißt.  
Programme können entweder mit dem Node-System oder reinem Code geschrieben werden, während normale Dateien nur in reinem Code geschrieben werden können.  
Programme können Dateien oder andere Programme mit `include()` einbinden, solange es keine Namenskonflikte in ihrem Inhalt gibt und nur ein `init`-Einstiegspunkt definiert ist.  

## Zwischen Modi wechseln (visuelle Nodes / Code)
Wenn du ein Programm erstellst, startet es mit dem Visual-Nodes-Modus und einigen anfänglichen IO-Nodes als Beispiel, die du löschen kannst.  
Das Visual-Nodes-System generiert immer automatisch Code im Hintergrund, wenn du Änderungen vornimmst.  
Du kannst jederzeit zu "Switch To Code" wechseln, allerdings ist er nicht sofort editierbar.  
Um ihn editierbar zu machen, kannst du "Convert to Code" verwenden, was einfach die erste #NODES-Zeile auskommentiert, die die Nodes definiert, und du kannst den Code bearbeiten.  
Nach der Bearbeitung im Code: Wenn du zurück zu Nodes wechseln möchtest, wird dein Code durch die Nodes überschrieben, die du hattest, bevor du ursprünglich zum Code gewechselt hast.  
Das bedeutet, dass die Konvertierung zu Code in der Regel permanent ist, es sei denn, du möchtest zum vorherigen Stand zurückkehren.  

## Den Code ausführen
Die Computer im Spiel starten immer automatisch neu, wenn eine Änderung in der aktuellen Datei gespeichert wurde (CTRL+S).  
Speichern ohne Änderung bewirkt nichts, aber du kannst einen Neustart mit CTRL+SHIFT+S erzwingen, was auch alle geöffneten Dateien zwangsweise speichert.  
Beim Neustart nach dem Speichern einer Änderung lädt der Computer sofort das vorherige Programm, wenn eines lief, ohne durch das BIOS zu gehen.  
Wenn ein Fehler auftritt, sei es ein Syntaxfehler oder ein Laufzeitfehler (wie Division durch Null oder fehlerhafte Indizierung), friert der Computer ein, der Bildschirm wird schwarz, und der Fehler erscheint in der Konsole. An diesem Punkt musst du das Problem beheben und ihn durch Speichern der geänderten Datei neu starten.  

## Persistenz
Computer im Spiel laufen alle serverseitig und laufen weiter, wenn du dich abmeldest, sofern du auf einem dedizierten Server spielst.  
Dateien werden auf der Server-Festplatte im Klartext gespeichert, einschließlich einer temporären Datei für ungespeicherte Änderungen, die bei jeder einzelnen Änderung aktualisiert wird, sodass du deinen Code nicht verlierst.  
Auch wenn du deine Datei nicht gespeichert hattest: Wenn dein Spiel abstürzt, ob du solo oder remote spielst, wirst du sie beim erneuten Einloggen wiederherstellen.  
Wenn du eine externe IDE wie VSCode bevorzugst, kannst du die Dateien auch direkt auf dem Server bearbeiten, wenn du ihn selbst hostest oder solo spielst.  
Die virtuellen Festplatten werden unter `Archean-data/server/worlds/<WORLD_NAME>/ARCHEAN_computer/HDD-*` gespeichert und enthalten die .xc-Dateien wie du sie erstellt hast, sowie das `storage`-Unterverzeichnis, das Storage-Variablen in eigenen individuellen Dateien mit ihren Werten im Klartext enthält, zeilengetrennt für Arrays.  
Wenn du eine Datei extern bearbeitest, erkennt das Spiel alle am aktuell laufenden Programm vorgenommenen Änderungen und startet den Computer automatisch neu.  
Das Bearbeiten einer Storage-Datei bewirkt jedoch keinen Neustart, und die Werte werden nicht sofort verwendet, da sie beim Laden im Speicher des Computers zwischengespeichert werden.  
Die Storage-Dateien werden jedoch sofort auf der Server-Festplatte aktualisiert, wenn der Wert geändert wird.  

## Zusammenarbeit
Die IDE ist kollaborativ, das heißt mehrere Spieler können zumindest den Inhalt einsehen, während ein einzelner Spieler gleichzeitig den Code bearbeiten kann.  
Immer wenn der bearbeitende Spieler eine Änderung vornimmt, auch wenn sie nicht gespeichert ist, sehen andere Spieler die Änderung in Echtzeit, ob im Code- oder Nodes-Modus.  
Nicht-bearbeitende Spieler sind schreibgeschützt; sie können den Code oder die Nodes nicht bearbeiten, bis sie auf Bearbeiten klicken — in diesem Fall werden sie zum aktuellen Bearbeiter und der vorherige Bearbeiter wird zum schreibgeschützten Betrachter.  

## Tastenkombinationen
- `CTRL+S` Aktuelle Datei speichern und Computer neu starten
- `CTRL+SHIFT+S` Alle Dateien speichern und Computer neu starten
- `CTRL+D` Das nächste Vorkommen im Code auswählen, oder die ausgewählten Node(s) duplizieren im Nodes-Modus
- `CTRL+C` Ausgewählten Code oder Nodes kopieren
- `CTRL+V` Code oder Nodes einfügen
- `CTRL+N` Eine neue Datei erstellen
- `CTRL+SHIFT+N` Ein neues Programm erstellen
- `CTRL+Q` Die IDE schließen

## VSCode
Wir haben eine VSCode-Erweiterung zur Unterstützung der XenonCode-Syntaxhervorhebung sowie einiger Linting-Funktionen verfügbar gemacht, falls du sie verwenden möchtest.  

---
