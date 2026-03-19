<p align="center">
    <img src="Keyboard.png" />
</p>

|Component|`Keyboard`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|2 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|50 x 25 x 25 cm|
#
---
# Description
Das Keyboard ist eine Komponente, die eine berührungsempfindliche Tastatur zum Senden alphanumerischer Werte an andere Komponenten bereitstellt.

# Usage
Sie können einen alphanumerischen Wert über die Touch-Tasten des Keyboards eingeben, indem Sie die `F`-Taste drücken. Die Eingabe wird auf dem Keyboard-Bildschirm angezeigt, wird aber erst wirksam/aktualisiert, wenn die Bestätigungstaste (grün) gedrückt wird.

Die gelbe Taste ermöglicht das Löschen des zuletzt eingegebenen Zeichens, während die rote Taste alles löscht.

> - `^` Ermöglicht das Umschalten zwischen Klein- und Großbuchstaben
> - `!?` Zeigt Sonderzeichen an
> - Wenn die Bestätigungstaste gedrückt wird, wird eine `1` für 1 Tick auf Channel 1 gesendet, ansonsten wird `0` gesendet.
