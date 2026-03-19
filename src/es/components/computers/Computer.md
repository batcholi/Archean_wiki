<p align="center">
  <img src="Computer.png" />
</p>

|Component|`Computer`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 50 cm|
#
---
> Para aprender a usar la interfaz de programación del Computer, visite la página del XenonCode IDE.

# Description

El Computer es un componente diseñado para ejecutar programas XenonCode para controlar otros componentes o mostrar diversa información en su pantalla.

Tiene características que determinan su potencia, almacenamiento y memoria.
Esta información es visible en el BIOS como se muestra en la imagen siguiente.

![Bios](bios.png)

### Información del BIOS:
- **Processor Type**: El procesador XPU64-AIO se refiere a este tipo de componente Computer All-In-One.
- **Frequency**: La frecuencia es la velocidad a la que el Computer ejecuta el código del programa actual y coincidirá con la configuración `updates_per_second` del servidor (25 ticks por segundo por defecto).
- **Max IPC**: Este parámetro está determinado por un archivo de configuración y es el número máximo de instrucciones por ciclo antes de que se "bloquee" virtualmente.
- **System RAM**: En los programas XenonCode, puedes almacenar valores en variables volátiles que se reinician cuando el Computer se reinicia o cuando se recarga un programa. Este parámetro representa el número máximo de valores para todas las variables del programa en ejecución.
- **Storage Capacity**: Similar a la RAM del sistema, existe un tipo de variable de almacenamiento que guarda datos en el disco duro de forma permanente hasta que se modifiquen. En este caso, está limitado a un máximo de 256 valores.
- **I/O Ports**: Este parámetro está determinado por los componentes y simplemente indica el número de puertos de datos del Computer.

> El BIOS es un programa que se ejecuta por defecto en cada Computer cuando se inicia.
>
> En este caso, su función es indicar las características del Computer así como la lista de programas disponibles en el disco duro para que puedas seleccionar uno para ejecutar.
>
> Es posible personalizar el BIOS creando un nuevo archivo llamado "main.xc" para modificar su apariencia o cargar automáticamente un programa. Consulte la documentación del XenonCode IDE para más información.

# Usage
### Programa:
Cuando se crea y guarda un programa, aparecerá en la lista de programas del BIOS. Puedes seleccionar el programa a ejecutar usando la tecla `F`.
### Botón:
El Computer tiene dos botones físicos, el botón "Code" que abre el XenonCode IDE para desarrollar tus programas, y un botón "Reboot" que reinicia el Computer y vuelve a ejecutar el programa main.xc (BIOS).
### Energía:
Para funcionar, el Computer requiere una fuente de alimentación de bajo voltaje. Consume 30 vatios en reposo y su consumo puede subir hasta 500 vatios dependiendo de la proporción entre el número de instrucciones ejecutadas por el programa en ejecución y el MAX IPC actual configurado en el servidor.
### HDD:
El Computer tiene una bahía para disco duro. Puedes tener múltiples HDD en la bahía (solo uno activo a la vez), intercambiar HDD con otros Computer o guardarlos en tu inventario. Esto es útil cuando quieres mover tu Computer a otro lugar sin perder tu código.

---
>- La resolución de la pantalla integrada es de 200x160 píxeles.
>- *El contenido de los HDD (tu código) no se pierde si destruyes un componente Computer por error. Seguirá existiendo en los archivos del servidor (o en tu propio ordenador si juegas en solitario). Puedes encontrarlo en (Server Settings)/worlds/(World Name)/ARCHEAN_computer/HDD-... Incluso puedes editar el código desde ahí y reiniciará tu Computer en vivo en el juego, si prefieres usar un editor externo (VSCode tiene una extensión XenonCode disponible)*
