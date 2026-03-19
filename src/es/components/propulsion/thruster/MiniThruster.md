<p align="center">
  <img src="MiniThruster.png" />
</p>

|Component|`MiniThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
El Mini Thruster genera empuje mediante la combustión de combustible líquido con oxígeno líquido.
Puede funcionar tanto con CH4 (metano) como con H2 (hidrógeno) como combustible, pero requiere una combinación premezclada de combustible y oxidante.
Puede producir hasta 18 KN de empuje con un caudal de 1 Kg/s de LOX y H2 premezclados.

# Usage
Conecta oxidante y combustible de alto caudal a los puertos de fluido, bajo voltaje para la ignición, y envía 1 en el puerto de datos para encender.

Cuando el combustible es H2, la proporción de flujo óptima es 8:1 (LOX:H2) y una proporción < 1:1 puede resultar en apagado de llama (sin combustión).
Cuando el combustible es CH4, la proporción de flujo óptima es 4:1 (LOX:CH4) y una proporción < 1:1 puede resultar en apagado de llama (sin combustión).

El encendedor no necesita mantenerse activado una vez que ha comenzado la combustión, aunque es buena idea dejarlo encendido en caso de apagado de llama.
La ignición consume 100 vatios continuamente cuando está activada.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|

### List of outputs
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|
