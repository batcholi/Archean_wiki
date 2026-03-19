<p align="center">
    <img src="Numpad.png" />
</p>

|Component|`Numpad`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|25 x 25 x 25 cm|
#
---
# Description
Das Numpad ist eine Komponente, die einen berührungsempfindlichen Ziffernblock zum Senden numerischer Werte an andere Komponenten bereitstellt.

# Usage
Sie können einen numerischen Wert über die Touch-Tasten des Ziffernblocks eingeben, indem Sie die `F`-Taste drücken. Die Eingabe wird auf dem Numpad-Bildschirm angezeigt, wird aber erst wirksam/aktualisiert, wenn die Bestätigungstaste (grün) gedrückt wird.

Die gelbe Taste ermöglicht das Löschen der zuletzt eingegebenen Ziffer, während die rote Taste alles löscht.

> - Wenn der aktuelle Wert negativ ist, können Sie ihn wieder positiv machen, indem Sie die `-`-Touch-Taste drücken.
> - Wenn die Bestätigungstaste gedrückt wird, wird eine `1` für 1 Tick auf Channel 1 gesendet, ansonsten wird `0` gesendet.
