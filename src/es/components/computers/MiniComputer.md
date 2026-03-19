<p align="center">
  <img src="MiniComputer.png" />
</p>

|Component|`MiniComputer`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description

El MiniComputer es un componente diseñado para ejecutar programas XenonCode para controlar otros componentes.
Es una variante más pequeña del [Computer](Computer.md) y no tiene pantalla integrada.

# Usage
Al ser completamente similar en términos de funcionalidades al Computer, su uso es casi idéntico.

La principal diferencia es que el MiniComputer no tiene pantalla integrada y, por lo tanto, no puede mostrar un BIOS que liste los programas disponibles.

Si contiene un solo programa, se cargará automáticamente. Si deseas tener varios programas, debes crear un BIOS personalizado creando un archivo "main.xc" para cargar el programa de tu elección.

`main.xc`:
```xc
init
	load_program("rover") ; this will load the file "rover.main.xc"
```
