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
L'interruttore invia costantemente un valore quando è attivato o disattivato. Per impostazione predefinita, invia `1` quando è acceso e `0` quando è spento, ma è possibile configurare valori personalizzati.

# Usage
Il tasto `F` viene utilizzato per commutare il Toggle Button.

## Configuration
Nel menu di configurazione accessibile con il tasto `V`:

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Rende il pulsante utilizzabile da entrambi i lati |
| **Allow IO Input** | Consente di controllare il pulsante da un altro componente tramite la sua porta dati |
| **Off Value** | Il valore inviato quando il pulsante è spento (predefinito: `0`) |
| **On Value** | Il valore inviato quando il pulsante è acceso (predefinito: `1`) |
