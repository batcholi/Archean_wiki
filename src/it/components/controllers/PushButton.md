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
Il Push Button invia costantemente un valore di `1` mentre è premuto, altrimenti `0`.

# Usage
Il pulsante si attiva con il tasto `F` e rimarrà attivo finché il tasto è tenuto premuto.

## Configuration
Nel menu di configurazione accessibile con il tasto `V`:

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Rende il pulsante utilizzabile da entrambi i lati |
| **Single Pulse** | Quando attivato, il pulsante invia `1` per un singolo tick poi si reimposta immediatamente a `0`, invece di rimanere attivo mentre è tenuto premuto |
