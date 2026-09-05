<p align="center">
  <img src="Turbojet.png" />
</p>

|Component|`Turbojet`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|400 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
El Turbojet es un turborreactor que genera empuje quemando combustible líquido con el aire ambiente.
Puede producir hasta **60 kN** de empuje al nivel del mar, a partir de un caudal de 1,4 kg/s de dodecano (C12H26).

# Usage

## Montaje
El reactor necesita:
- Una bomba que empuje el combustible en su puerto de fluido (no tira por sí mismo de un depósito).
- Una alimentación de alta tensión capaz de suministrar **125 kW** durante el arranque.
- Tres canales de datos: el motor de arranque, los encendedores y la válvula de combustible.

No tiene regulación interna: la válvula de combustible es directamente el mando de empuje.

> **Consejo:** para convertir el Oil Shale en combustible utilizable, cocínalo en un Chemical Furnace entre **600 K y 700 K**. Este crudo es un combustible provisional hasta que el refinado esté disponible: su agua y sus hidrocarburos pesados desgastan el reactor.

## Arranque
1. Motor de arranque a 1: el eje sube hasta un 24 % de N1 aproximadamente. El motor de arranque consume 125 kW mientras gira.
2. Encendedores a 1 (400 vatios) y válvula moderadamente abierta: la combustión empieza en cuanto el combustible llega a la cámara.
3. Una vez el reactor en marcha, el motor de arranque y los encendedores pueden apagarse: la llama mantiene sola la rotación.

El combustible inyectado sin chispa se acumula en la cámara y se inflama de golpe con la primera chispa.

> El panel de inspección muestra el estado de los tres mandos y la razón por la que el reactor no funciona (motor de arranque sin alimentación, válvula cerrada, sin combustible, sin chispa, sin oxígeno).

## Pilotaje
El empuje nominal se obtiene hacia el 77 % de la válvula; totalmente abierta, deja pasar un 30 % más que el caudal nominal y la temperatura de los gases supera el límite de los álabes.

La llama solo se mantiene dentro de un rango de riqueza:
- Una apertura brusca de la válvula hace la mezcla demasiado rica: el compresor entra en bombeo (`Surge`) durante un segundo y el reactor sufre daños.
- Un cierre casi completo por encima del 45 % de N1 hace la mezcla demasiado pobre: la llama se apaga.

Tras un apagado, los encendedores solo vuelven a encender la llama cuando el eje ha bajado por debajo del 55 % de N1. Una cámara todavía caliente (más de 750 K) enciende el combustible por sí sola, sin encendedores.

Con la válvula a 0, la llama se apaga y el eje tarda unos dos minutos en detenerse.

El empuje disminuye con la altitud. En vuelo, la velocidad comprime el aire en la entrada pero reduce el empuje a igual potencia.

## Límites
- Temperatura de los gases (EGT) por encima de **1250 K**: desgaste rápido de los álabes.
- N1 por encima del **105 %**: destrucción rápida del rotor.
- Ingestión de agua por encima del 30 % de N1: los álabes se rompen.
- Combustible contaminado (agua, hidrocarburos pesados) por encima del 5 %: desgaste. El petróleo crudo desgasta el reactor.

## Estados
|Estado|Significado|
|---|---|
|Off|Reactor parado.|
|Cranking|El motor de arranque mueve el eje.|
|Running|Combustión en curso.|
|Surge|Bombeo del compresor, mezcla demasiado rica.|
|Destroyed|Reactor destruido.|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Starter|0 or 1|
|1|Igniters|0 or 1|
|2|Throttle|0.0 to 1.0|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|N1|%|
|1|Thrust|Newtons|
|2|EGT|Kelvin|
|3|Running|0 or 1|
|4|Burned fuel flow|kg/s|
|5|Unburned fuel flow|kg/s|
|6|State|"Off", "Cranking", "Running", "Surge", "Destroyed"|
