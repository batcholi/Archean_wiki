<p align="center">
    <img src="Numpad.png" />
</p>

|Component|`Numpad`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---
# Description
El Numpad es un componente que proporciona un teclado numérico táctil para enviar valores numéricos a otros componentes.

# Usage
Puedes ingresar un valor numérico usando los botones táctiles del teclado numérico presionando la tecla `F`, y se mostrarán en la pantalla del Numpad pero solo se harán efectivos/actualizarán cuando se presione el botón de confirmación (verde).

El botón amarillo permite borrar el último dígito ingresado, mientras que el botón rojo permite borrar todo.

> - Si el valor actual es negativo, puedes hacerlo positivo nuevamente presionando el botón táctil `-`.
> - Cuando se presiona el botón de confirmación, se envía un `1` al canal 1 durante 1 tick, de lo contrario se envía `0`.
