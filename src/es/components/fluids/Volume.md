<p align="center">
  <img src="Volume.png" />
</p>

|Component|`Volume`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
El componente Volume, al añadirse a una construcción, calcula y define automáticamente el volumen que ocupa. Esta funcionalidad puede usarse para:
- Diseñar tanques de combustible con formas personalizadas.
- Garantizar la presurización de cabinas para entornos específicos (por ejemplo, submarinos, cohetes).
- Crear aeronaves...
- ...

> <font color="green"><strong> Este componente está relacionado con la presurización de construcciones, consulta la página de [Pressurization](../../pressurization.md) para más información.</strong></font>

# Usage
El componente Volume es fácil de usar y no requiere ninguna configuración especial. Simplemente añádelo a una construcción y haz clic en el botón `Scan` para detectar automáticamente el volumen del compartimento sellado donde está colocado. Ten en cuenta que solo calcula el volumen del compartimento en el que se encuentra, no el de toda la construcción. Necesitarás añadir un componente Volume separado para cada compartimento que desees presurizar.

Este componente puede mostrar dos estados:
- `Airtight`: El estado se vuelve verde si el compartimento está completamente sellado.
- `Leak`: El estado se vuelve rojo si el compartimento no es hermético.

La pantalla del Volume solo muestra el volumen del compartimento sellado en metros cúbicos (m³). Para información más detallada, puedes acceder a su ventana de información presionando la tecla `V`. Los datos disponibles incluyen:
- `Volume capacity (m³)`: La capacidad total del volumen sellado.
- `Contents Mass (kg)`: La masa total del contenido presente en el volumen.
- `Pressure (kPa)`: La presión dentro del compartimento sellado.
- `Liquid Level (%)`: El porcentaje de llenado de líquido.
- `Composition`: La distribución de los diferentes fluidos como porcentajes normalizados.

En modo Creativo, aparecen botones adicionales para permitir llenar o vaciar el volumen.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Level|0 to 1|
|1|Volume (m³)|number|
|2|State|text|

