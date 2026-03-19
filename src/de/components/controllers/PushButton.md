<p align="center">
  <img src="PushButton.png" />
</p>

|Component|`PushButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|25 x 25 x 25 cm|
#
---

# Description
Der Push Button sendet kontinuierlich den Wert `1`, solange er gedrückt wird, ansonsten `0`.

# Usage
Der Button wird mit der `F`-Taste aktiviert und bleibt aktiv, solange die Taste gedrückt gehalten wird.

## Configuration
Im Konfigurationsmenü, zugänglich mit der `V`-Taste:

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Macht den Button von beiden Seiten bedienbar |
| **Single Pulse** | Wenn aktiviert, sendet der Button `1` für einen einzelnen Tick und setzt dann sofort auf `0` zurück, anstatt aktiv zu bleiben, solange er gedrückt wird |
