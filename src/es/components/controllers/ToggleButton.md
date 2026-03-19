<p align="center">
  <img src="ToggleButton.png" />
</p>

|Component|`ToggleButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description
El interruptor envía constantemente un valor cuando está activado o desactivado. Por defecto, envía `1` cuando está encendido y `0` cuando está apagado, pero se pueden configurar valores personalizados.

# Usage
La tecla `F` se usa para alternar el Toggle Button.

## Configuration
En el menú de configuración accesible con la tecla `V`:

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Hace que el botón sea utilizable desde ambos lados |
| **Allow IO Input** | Permite que el botón sea controlado desde otro componente a través de su puerto de datos |
| **Off Value** | El valor enviado cuando el botón está apagado (por defecto: `0`) |
| **On Value** | El valor enviado cuando el botón está encendido (por defecto: `1`) |
