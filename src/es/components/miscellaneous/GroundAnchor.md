<p align="center">
  <img src="GroundAnchor.png" />
</p>

|Component|`GroundAnchor`|
|---|---|
|**Module**|`ARCHEAN_anchor`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 100 x 100 cm|
#
---

# Description
El Ground Anchor es un dispositivo que bloquea una construcción al suelo cuando se activa, impidiendo cualquier movimiento.

# Usage
El Ground Anchor funciona sin requerir energía externa. Su mecanismo se basa en un valor simple, `0` para desactivado (no anclado) o `1` para activado (anclado) a través de su puerto de datos.

>- Para liberar una construcción anclada, eliminar el Ground Anchor no es suficiente. Debes desanclar el Ground Anchor actual o instalar un nuevo Ground Anchor para reactivar la física de la construcción, siempre que no queden más anclas activas conectadas.
>- Si hay un [OwnerPad](OwnerPad.md) presente, usar el botón "Reset" para mover la construcción NO será impedido por el Ground Anchor.
>- El Ground Anchor no puede anclar un vehículo a otro vehículo, solo funciona en terrenos.
