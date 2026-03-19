<p align="center">
  <img src="SmallPivot.png" />
</p>

|Component|`SmallPivot`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description
El Small Pivot es un componente que incluye un bloque rotativo construible. Está diseñado para permitir la rotación de objetos en una construcción.

> <font color="green"> *Este componente está relacionado con la presurización de construcciones, consulta la página de [Pressurization](../../pressurization.md) para más información.*</font>

# Usage
El Small Pivot puede funcionar en dos modos: Servo (por defecto) y Velocity. Para cambiar entre modos, pulsa la tecla V para abrir la interfaz de información del componente.

En esta interfaz, hay dos configuraciones adicionales posibles:
- `Max Rotation Speed` que determina la velocidad máxima de rotación en rotaciones por segundo.
- `Acceleration` que determina la tasa (en rotaciones por segundo al cuadrado) a la que el pivote acelerará para alcanzar su Max Rotation Speed.

## Servo Mode
En modo servo, el dispositivo rota a una posición precisa determinada por los datos recibidos a través de su puerto de datos. Acepta valores normalizados entre `-1.0` y `+1.0`, que corresponden a rotaciones de `-360°` y `+360°`. Esto significa efectivamente que los valores `0.0`, `-1.0` y `+1.0` resultarán en la misma posición servo.

## Velocity Mode
En modo velocidad, el dispositivo opera continuamente en la dirección indicada por los datos de su puerto, aceptando valores entre `-1.0` y `+1.0` para determinar su velocidad y dirección de rotación. `1.0` significa Max Rotation Speed.

> - Las construcciones instaladas en una parte móvil no pueden colisionar con una construcción padre o hermana. Solo pueden colisionar con el terreno u otras construcciones separadas.
> - Para destruir el Small Pivot, debes eliminar absolutamente todos los bloques/componentes hijos que contiene.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Angle|-1.0 to +1.0|
|1|Speed|rot/s| 

![SmallPivotDemo](pivot.gif)
