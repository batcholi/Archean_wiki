<p align="center">
  <img src="FluidPort.png" />
</p>

|Component|`FluidPort`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Accept Push/Pull|
#
---

# Description
El Fluid Port es un dispositivo que permite la succión o expulsión de fluidos.

> <font color="green"> *Este componente está relacionado con la presurización de construcciones, consulta la página de [Pressurization](../../pressurization.md) para más información.*</font>

Al aspirar fluido, absorberá la composición del entorno circundante. Por ejemplo, si está sumergido en agua, puede llenar un tanque de fluido con H2O, y si está al aire libre, absorberá la composición de la atmósfera.

Al expulsar fluido, puede purgar el contenido de los tanques de fluido.

# Usage
El Fluid Port actúa como un puente entre un contenedor de fluido y la composición del entorno circundante.

Para funcionar, necesita estar conectado a cualquier componente capaz de contener o procesar fluidos.

A continuación se muestra un ejemplo que ilustra cómo podría conectarse.

![FluidPortDemo](fluidportdemo.jpg)

## Límite de caudal

El Fluid Port tiene un caudal máximo de **1,0 m³/s** (basado en volumen, no en masa).

Dado que el límite es volumétrico, la **masa real transferida depende de la densidad del fluido**:
- Los fluidos densos (líquidos como H2O, O2 líquido) transfieren más masa por segundo
- Los fluidos ligeros (gases, atmósfera a gran altitud) transfieren menos masa por segundo
- En el vacío (densidad = 0), no se puede transferir nada

Por ejemplo:
- Agua (~1000 kg/m³): hasta 1000 kg/s
- Aire a nivel del mar (~1,2 kg/m³): hasta 1,2 kg/s
- Aire a gran altitud (~0,4 kg/m³): hasta 0,4 kg/s

## Colocación

Al colocar un Fluid Port, asegúrate de que la **abertura de la boquilla esté orientada hacia** la zona con la que deseas interactuar. Puedes montarlo al ras de una pared con la abertura hacia el interior; siempre que la boquilla apunte hacia el compartimento, funcionará correctamente.

## Ventana de información

Pulsa `V` sobre un Fluid Port para mostrar:
- **Densidad del entorno** (kg/m³): La densidad en el punto de muestreo
- **Composición del entorno**: La composición del fluido en porcentaje de volumen

Si el punto de muestreo está dentro de un volumen presurizado, mostrará el contenido del volumen. De lo contrario, muestra el entorno ambiental (atmósfera, agua, etc.).