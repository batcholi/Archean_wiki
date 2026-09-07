<p align="center">
  <img src="Electrolyser.png" />
</p>

|Component|`Electrolyser`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
El Electrolyser es un componente que permite la disociación del agua en hidrógeno y oxígeno.

# Usage
El Electrolyser requiere una entrada de energía de alto voltaje y hasta 16 MW durante su funcionamiento. Produce de forma linealmente proporcional a la energía disponible, hasta un máximo de 1 kg de agua por segundo con 16 MW, es decir unos 40 kWh por kg de hidrógeno. Necesita al menos 1 kW para funcionar: por debajo de ese umbral no hace nada.

Para iniciar el proceso de electrólisis, simplemente conecta una fuente de agua a su puerto de entrada azul. Esta fuente puede provenir de un [Fluid Port](../fluids/FluidPort.md) sumergido en agua para extraer agua directamente del mar, por ejemplo, o de un tanque que contenga agua.

El hidrógeno y el oxígeno producidos pueden recogerse respectivamente desde los puertos de salida amarillo (H2) y cian (O2).

### Producción
El Electrolyser puede procesar hasta 1 kg de agua por segundo, proporcionando aproximadamente [0,9 kg de oxígeno y 0,1 kg de hidrógeno](# "O2:0.88kg / H2:0.11kg") por segundo.

Cuando los dos tanques de salida están llenos, el Electrolyser queda en reposo a 50 W y se reinicia solo en cuanto uno de ellos vuelve a aceptar gas.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Consigna de potencia, fracción de los 16 MW nominales (0 = apagado, 1 = todo lo que ofrece la fuente)|0.0 a 1.0|

### List of outputs
|Channel|Function|
|---|---|
|0|Potencia consumida (vatios)|
|1|Agua procesada (kg/s)|
|2|Hidrógeno producido (kg/s)|
|3|Oxígeno producido (kg/s)|
