<p align="center">
    <img src="Keyboard.png" />
</p>

|Component|`Keyboard`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 25 x 25 cm|
#
---
# Description
El Keyboard es un componente que proporciona un teclado táctil para enviar valores alfanuméricos a otros componentes.

# Usage
Puedes ingresar un valor alfanumérico usando los botones táctiles del Keyboard presionando la tecla `F`, y se mostrarán en la pantalla del Keyboard pero solo se harán efectivos/actualizarán cuando se presione el botón de confirmación (verde).

El botón amarillo permite borrar el último carácter ingresado, mientras que el botón rojo permite borrar todo.

> - `^` Permite alternar entre minúsculas y mayúsculas
> - `!?` Muestra caracteres especiales
> - Cuando se presiona el botón de confirmación, se envía un `1` al canal 1 durante 1 tick, de lo contrario se envía `0`.
