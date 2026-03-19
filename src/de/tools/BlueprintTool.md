<p align="center">
    <img src="BlueprintTool.png" />
</p>

|Item|`BlueprintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Das Blueprint Tool ermöglicht es dir, eine Kopie eines Bauwerks zu speichern. Blueprints werden im Ordner `(Client Settings)/blueprints` im `.json`-Format gespeichert, einer pro Blueprint mit dem jeweiligen Namen.

Mit diesem System kannst du deine Bauwerke in andere Welten oder auf andere Server übertragen, sie mit Freunden teilen oder einfach ein Bauwerk duplizieren.

# Usage

## Ein Bauwerk scannen
1. **Linksklick**, um den Scan-Modus zu betreten (Reichweite: 100 Meter)
2. Ziele auf das Bauwerk, das du speichern möchtest
3. **Linksklick eine Sekunde lang gedrückt halten**, um den Blueprint zu scannen und zu speichern
4. Gib einen Namen im Popup-Dialog ein

### Einen bestehenden Blueprint aktualisieren
Um einen bestehenden Blueprint zu aktualisieren, gib einfach exakt denselben Namen wie ein bestehender Blueprint ein. Die **Create**-Schaltfläche ändert sich zu **Update**, sodass du die vorherige Version überschreiben kannst, während die Steam Workshop-ID bei Veröffentlichung erhalten bleibt.

## Einen Blueprint spawnen
1. **Rechtsklick**, um die Blueprint-Oberfläche zu öffnen
2. Verwende die **Suchleiste**, um Blueprints nach Namen zu filtern
3. Wähle einen Blueprint aus dem **Local**- oder **Steam Workshop**-Tab
4. Klicke auf **Spawn**, um den Platzierungsmodus zu betreten

### Platzierungssteuerung

#### Freie Platzierung (neues Bauwerk)
| Aktion | Steuerung |
|--------|---------|
| Spawn bestätigen | **Linksklick gedrückt halten** (2 Sekunden) |
| Drehen | **Mausrad** |
| Am Boden einrasten und statisch setzen | **Shift gedrückt halten** |
| Abbrechen | **Rechtsklick** |

#### Auf einem bestehenden Bauwerk
Wenn du auf ein bestehendes Bauwerk zielst, **drücke kurz Linksklick**, um den Blueprint anzuheften und den **Gizmo-Modus** zu betreten:

| Aktion | Steuerung |
|--------|---------|
| Verschieben / Drehen | **Gizmo-Griffe** (ziehen) |
| Mausblick umschalten | **Rechtsklick** |
| Spawn bestätigen | **Linksklick gedrückt halten** abseits des Gizmo (2 Sekunden), oder **Spawn**-Schaltfläche |
| Abbrechen | **Rechtsklick** (wenn nicht im Mausblick) |

### Im Weltraum spawnen
Wenn du dich im Weltraum in der Nähe eines bestehenden Bauwerks befindest, kannst du Blueprints auf die gleiche Weise spawnen wie beim [Erstellen eines neuen Bauwerks](ConstructorTool.md#creating-a-build-in-space).

## Steam Workshop
- Klicke auf **Publish** neben einem lokalen Blueprint, um ihn im Steam Workshop hochzuladen
- Ein integriertes Screenshot-Tool ist beim Veröffentlichen verfügbar

# Hinweise
- Im Abenteuermodus werden benötigte Items mit ihrem Status angezeigt (grün = verfügbar, rot = fehlend, orange = Mod nicht aktiv)
- Wenn ein [OwnerPad](../components/miscellaneous/OwnerPad.md) hinzugefügt wurde, musst du die "Build"-Berechtigung haben, um einen Blueprint zu speichern
