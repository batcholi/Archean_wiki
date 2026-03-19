<p align="center">
  <img src="ThrottleLever.png" />
</p>

|Component|`ThrottleLever`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
El Throttle Lever es un tipo de control que envía constantemente un valor analógico dependiendo de la posición de la palanca. El valor de salida se mapea a un rango configurable (por defecto `-1.0` a `+1.0`).

# Usage
La palanca se controla con el ratón manteniendo presionada la tecla `F` y moviendo el `ratón arriba/abajo`.

> - Hay resistencia en el centro de la palanca para ayudar a encontrar la posición central precisa.
> - Es posible configurar los valores **Min** y **Max** de la palanca, así como la función de **snap-to-center** desde el menú de configuración accesible con la tecla `V`.
> - El Throttle Lever puede ser controlado desde otro componente a través de su puerto de datos activando el modo "Allow IO Input" en el menú de configuración.
