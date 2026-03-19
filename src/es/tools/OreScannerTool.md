<p align="center">
  <img src="OreScannerTool.png" />
</p>

|Item|`OreScannerTool`|
|---|---|
|**Module**|`ARCHEAN_celestial`|

# Description
El Ore Scanner Tool es un dispositivo portatil que muestra la composicion mineral en la direccion a la que estas mirando. Muestra un grafico en tiempo real de la densidad de mineral frente a la distancia, permitiendote localizar depositos de mineral antes de minar.

Esta herramienta es diferente del [componente OreScanner](../components/mining/OreScanner.md) - mientras que el componente esta disenado para montarse en vehiculos y controlarse mediante XenonCode, el Ore Scanner Tool proporciona una interfaz visual inmediata para el jugador.

# Usage

## Basic Operation
1. Equipa el Ore Scanner Tool desde tu inventario
2. Apunta en la direccion que deseas escanear
3. La herramienta muestra un grafico con las concentraciones de mineral en esa direccion

## Interface
La ventana del escaner muestra:
- **Distance selector**: Elige el rango de escaneo (100m, 250m, 500m o 1000m)
- **Ore checkboxes**: Selecciona que minerales mostrar en el grafico
- **Graph**: Muestra la densidad del mineral (eje Y) frente a la distancia (eje X)

## Ore Types
El escaner puede detectar los siguientes minerales:

|Simbolo|Elemento|Color|
|---|---|---|
|Al|Aluminium|Plateado/Gris claro|
|C|Carbon|Negro|
|Cr|Chrome|Gris metalico|
|Cu|Copper|Naranja|
|Au|Gold|Amarillo dorado|
|F|Fluorite|Purpura|
|Fe|Iron|Marron oxidado|
|Pb|Lead|Gris oscuro|
|Ni|Nickel|Gris verdoso|
|Si|Silicon|Azul oscuro|
|Ag|Silver|Plateado brillante|
|Sn|Tin|Grisaceo|
|Ti|Titanium|Azulado|
|W|Tungsten|Gris oscuro|
|U|Uranium|Verde|

## Scanning Tips
- La direccion de escaneo se basa en el componente horizontal de tu direccion de vision
- El grafico se actualiza automaticamente al moverte o cambiar de direccion
- Selecciona multiples minerales para comparar sus ubicaciones
- Iron (Fe) esta seleccionado por defecto ya que es el recurso mas comun

---

> **Nota:** El Ore Scanner Tool requiere estar en un cuerpo celeste con datos de terreno. No funcionara en el espacio o en entornos sin datos de composicion del terreno.
