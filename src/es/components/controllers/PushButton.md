<p align="center">
  <img src="PushButton.png" />
</p>

|Component|`PushButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
El Push Button envía constantemente un valor de `1` mientras está presionado, de lo contrario `0`.

# Usage
El botón se activa con la tecla `F` y permanecerá activo mientras se mantenga presionada la tecla.

## Configuration
En el menú de configuración accesible con la tecla `V`:

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Hace que el botón sea utilizable desde ambos lados |
| **Single Pulse** | Cuando está activado, el botón envía `1` durante un solo tick y luego se reinicia inmediatamente a `0`, en lugar de permanecer activo mientras se mantiene presionado |
