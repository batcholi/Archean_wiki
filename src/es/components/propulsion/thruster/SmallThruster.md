<p align="center">
  <img src="SmallThruster.png" />
</p>

|Component|`SmallThruster`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
El Small Thruster genera empuje mediante la combustión de combustible líquido con oxígeno líquido.
Puede funcionar tanto con CH4 (metano) como con H2 (hidrógeno) como combustible.
Utiliza una tobera aerospike radial y es muy eficiente convirtiendo la energía de combustión directamente en empuje.
Puede producir hasta 180 KN de empuje con un caudal de 10 Kg/s de LOX y 1,25 Kg/s de H2.

# Usage
Conecta oxidante y combustible de alto caudal a los puertos de fluido, alto voltaje para la ignición, y envía 1 en el puerto de datos para encender.

La ignición inicial solo ocurrirá cuando el caudal esté entre 1 g/s y 5 kg/s, tanto para el combustible como para el oxidante.

Cuando el combustible es H2, la proporción de flujo óptima es 8:1 (LOX:H2) y una proporción < 1:1 puede resultar en apagado de llama (sin combustión).
Cuando el combustible es CH4, la proporción de flujo óptima es 4:1 (LOX:CH4) y una proporción < 1:1 puede resultar en apagado de llama (sin combustión).

El encendedor no necesita mantenerse activado una vez que ha comenzado la combustión, aunque es buena idea dejarlo encendido en caso de apagado de llama.
La ignición consume 1000 vatios continuamente cuando está activada.

La tobera del Small Thruster puede orientarse con una variación de -10 a +10 grados en dos ejes.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Ignition|0 or 1|
|1|Gimbal X|-1.0 to +1.0|
|2|Gimbal Z|-1.0 to +1.0|

### List of outputs
|Channel|Function|Unit|
|---|---|---|
|0|Thrust|Newtons|
|1|Burned flow|kg/s|
|2|Unburned flow|kg/s|

> Si tu tanque de combustible está premezclado, no necesitas usar ambos puertos de fluido.
