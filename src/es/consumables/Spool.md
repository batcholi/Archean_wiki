<p align="center">
  <img src="dataspool.png" />
  <img src="lowvoltagespool.png" />
  <img src="highvoltagespool.png" />
  <img src="fluidspool.png" />
  <img src="itemconduitspool.png" />
</p>

|Item|`Spool`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Length**|100 m|

# Description
Los diferentes spools permiten conectar componentes para transferir datos, energia, objetos o fluidos.

# Usage
## Creating a cable (connecting two components)
La creacion de un cable comienza y termina en un conector de componente.

La colocacion de cables es completamente libre y permite agregar tantos puntos como desees (siempre que la longitud restante de tu spool lo permita) para personalizar su forma. Durante la creacion de un cable, si has colocado multiples puntos, puedes eliminar puntos usando el `clic derecho` para refinar la colocacion o cancelar completamente la creacion del cable si no quedan puntos existentes.

- Los cables se pueden apilar sobre otros cables existentes y sobre componentes. (Para ajustarlos a la superficie de un componente, debes mantener la tecla `Shift`).
- Puedes colocar el cable en la cara interior del bloque/componente manteniendo la tecla `X`.

## Creating a Flexible Cable
Es posible que desees conectar componentes de diferentes construcciones temporalmente o simplemente unir dos construcciones.
Esto creara efectivamente un cable flexible.
Las dos construcciones estaran vinculadas y restringidas en el motor de fisicas.
No hay limite de fuerza, los cables no se desprendera.
Tambien puedes agregar un cable flexible entre dos componentes de la misma construccion manteniendo `X`, para obtener un cable recto (quizas un poco curvado) que se vera afectado por la gravedad.

## Deleting a cable
Puedes eliminar un cable con un `clic derecho` siempre que la herramienta en tu mano sea el spool de cable apropiado.

## Painting cables
Puedes pintar cables usando el [Paint Tool](../tools/PaintTool.md) igual que lo harias con los bloques.
Los cables ofrecen dos opciones de personalizacion adicionales:
- `Shift` para pintar un cable y hacerlo transparente
- `X` para pintar un cable normalmente con un efecto de rayas

Tambien puedes combinar ambos efectos manteniendo ambas teclas presionadas.

---
>- *Al crear tu cable, si se niega a crearse, es probable que no tengas suficiente longitud disponible en tu spool actual para crear el cable.*
>- *Los cables no tienen limite de transferencia ni perdida relacionada con la longitud.*
>- *Los cables no determinan la direccion de lo que transportan.*
>- *Un cable no puede modificarse una vez colocado, debes eliminarlo.*
>- *Los cables flexibles afectaran significativamente al rendimiento, mientras que los cables normales no afectaran al rendimiento en absoluto incluso si tienes miles en una construccion. Intenta priorizar el uso de cables normales cuando sea posible.*
