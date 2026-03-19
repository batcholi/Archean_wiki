# Aerodynamics

Archean simula fuerzas aerodinamicas que se aplican automaticamente a cualquier vehiculo que se mueva a traves de un medio fluido, ya sea aire o agua. Estas fuerzas incluyen **resistencia** (resistencia al movimiento), **sustentacion** (fuerza perpendicular de superficies delgadas) y **flotabilidad** (fuerza ascendente por desplazamiento de fluido). Comprender como funcionan estos sistemas es clave para disenar aviones, barcos, submarinos y cualquier otra creacion en movimiento de manera eficiente.

## Como funciona

### Medio fluido

El motor de fisica consulta el entorno en cada punto relevante de tu vehiculo para determinar las propiedades locales del fluido:

| Propiedad | Descripcion | Valores de ejemplo |
|-----------|-------------|-------------------|
| **Densidad** (kg/m3) | Masa por volumen del fluido | Aire al nivel del mar: ~1.2, Agua: ~1000 |
| **Viscosidad** (kg/(m*s)) | Resistencia al flujo dentro del fluido | Utilizada para deteccion de agua y amortiguacion |

- En el **aire**, la densidad disminuye con la altitud. Mayor altitud significa menos resistencia y sustentacion.
- En el **agua**, la densidad es aproximadamente 800 veces mayor que la del aire - las fuerzas aerodinamicas son dramaticamente mas fuertes.
- En el **espacio** (vacio), la densidad es 0 - no se aplican fuerzas aerodinamicas.

> Las fuerzas aerodinamicas solo se activan cuando la velocidad de un vehiculo supera los **0.1 m/s**. Por debajo de ese umbral, las fuerzas no se calculan.

### Drag

La resistencia es la fuerza que se opone al movimiento de un vehiculo a traves de un fluido. Actua en la **direccion opuesta** a la velocidad.

La fuerza de resistencia en cada superficie expuesta sigue la ecuacion aerodinamica estandar:

**F = 1/2 x C<sub>d</sub> x p x v2 x A**

| Simbolo | Significado | Valor |
|---------|-------------|-------|
| C<sub>d</sub> | Coeficiente de resistencia | **0.4** para superficies de bloques |
| p | Densidad del fluido (kg/m3) | Depende del entorno |
| v | Velocidad relativa en la superficie (m/s) | Velocidad del vehiculo + velocidad rotacional en ese punto |
| A | Area frontal expuesta (m2) | Perpendicular a la velocidad, escalada por ratio de ocupacion |

Puntos clave:
- La resistencia crece con el **cuadrado** de la velocidad - duplicar tu velocidad cuadruplica la resistencia
- Solo las **superficies expuestas** contribuyen a la resistencia (ver [Oclusion](#occlusion-and-exposed-surfaces))
- La fuerza se calcula **por superficie**, en la posicion de cada superficie, lo que significa que la resistencia tambien puede inducir **torque** (rotacion) si se aplica fuera del centro

### Lift

La sustentacion se genera automaticamente por **estructuras delgadas y planas**, como alas o aletas, que el motor de fisica detecta basandose en la geometria.

Una superficie se clasifica como **superficie de sustentacion** cuando se cumplen todas las siguientes condiciones:

| Condicion | Umbral |
|-----------|--------|
| Grosor (dimension mas corta) | < **0.3 m** |
| Ancho (dimension media) | >= **longitud / 4** |
| Longitud (dimension mas larga) | >= **4 m** |

Cuando se detecta una superficie de sustentacion:
- El **coeficiente de sustentacion** depende del angulo de ataque: `C_l = sin(|angulo_de_ataque| x pi/2)`
- El **coeficiente de resistencia** es muy bajo: solo **0.01** (comparado con 0.4 para superficies regulares)
- La fuerza de sustentacion es perpendicular a la velocidad, empujando el vehiculo en la direccion de la normal de la superficie

> Para construir alas que generen sustentacion, usa disposiciones planas de bloques de al menos **4 metros de largo** y **menos de 0.3 metros de grosor**. Se pueden usar pendientes para dar forma a los bordes de ataque y de fuga.

### Buoyancy

La flotabilidad es la fuerza ascendente ejercida sobre un objeto sumergido o parcialmente sumergido. Se opone a la gravedad y depende de cuanto fluido desplazan los bloques del vehiculo.

**F<sub>buoyancy</sub> = V<sub>desplazado</sub> x p<sub>fluido</sub> x g**

| Simbolo | Significado |
|---------|-------------|
| V<sub>desplazado</sub> | Volumen desplazado (volumen del bloque x `volumeDisplacementRatio`) |
| p<sub>fluido</sub> | Densidad del fluido en el punto de muestreo |
| g | Aceleracion gravitacional (direccion opuesta) |

- El motor muestrea **al menos 16 puntos aleatorios** a traves de todos los colisionadores para manejar la **sumersion parcial** de forma fluida
- La contribucion de cada bloque depende del `volumeDisplacementRatio` de su material (ver [Materiales](#materials))
- La flotabilidad se aplica en cada punto de muestreo, por lo que un vehiculo puede inclinarse segun la sumersion desigual

## Bloques y formas

### Formas de bloques

Las diferentes formas de bloques tienen diferentes **ratios de ocupacion**, que afectan directamente los calculos de resistencia:

| Forma | Ratio de ocupacion | Multiplicador de masa |
|-------|--------------------|-----------------------|
| **Cube** | 1.0 | 1.0x |
| **Slope** | 0.5 | 0.5x |
| **Corner** | 0.5 | 0.5x |
| **Pyramid** | 0.5 | 0.5x |
| **Inverse Corner** | 0.5 | 0.5x |

El ratio de ocupacion escala el area de resistencia calculada - un bloque Slope de cara al viento produce aproximadamente **la mitad de la resistencia** de un Cube en la misma posicion.

### Materials

Cada material de bloque tiene diferentes propiedades fisicas que afectan la aerodinamica, la flotabilidad y la masa:

| Material | Masa (kg/unidad de bloque) | Ratio de desplazamiento de volumen | Friccion |
|----------|---------------------------|-----------------------------------|----------|
| **Composite** | 0.25 | 0.20 x ocupacion | 0.05 |
| **Concrete** | 10.0 | 0.25 x ocupacion | 0.50 |
| **Steel** | 1.0 | 0.01 x ocupacion | 0.20 |
| **Aluminium** | 0.5 | 0.01 x ocupacion | 0.20 |
| **Glass** | 1.0 | 0.02 x ocupacion | 0.10 |
| **Lead** | 150.0 | 1.00 x ocupacion | 0.20 |

El **ratio de desplazamiento de volumen** determina cuanto contribuye un bloque a la flotabilidad y cuan visible es para la deteccion de superficies aerodinamicas:
- **Lead** (1.0) desplaza completamente el fluido - maxima fuerza de flotabilidad pero tambien muy pesado, por lo que se hunde
- **Steel/Aluminium** (0.01) apenas desplazan fluido - casi no contribuyen a la flotabilidad
- **Composite** (0.2) ofrece un equilibrio moderado entre flotabilidad y peso ligero

### Occlusion and Exposed Surfaces

El sistema aerodinamico usa **raycasting** para determinar que superficies estan realmente expuestas al flujo de aire:

1. Para cada colisionador de bloque, el motor identifica la superficie que mira hacia la direccion de la velocidad
2. Se lanza un rayo desde esa superficie hacia afuera en la direccion de la velocidad
3. Si el rayo golpea otro bloque del mismo vehiculo, esa superficie se considera **ocluida** y **no** contribuye a la resistencia ni a la sustentacion
4. Solo las superficies verdaderamente expuestas generan fuerzas aerodinamicas

Esto significa:
- Los **bloques internos** dentro de un casco no anaden resistencia - solo importa la capa exterior
- Un **vehiculo compacto** con menos caras expuestas tiene menos resistencia que una estructura dispersa
- Cuando un grupo de bloques tiene un ratio de ocupacion inferior a **0.9**, el sistema examina recursivamente los bloques hijos individuales para encontrar las superficies realmente expuestas

> Este es un punto de optimizacion importante: dos vehiculos con la misma forma exterior pero diferentes estructuras internas experimentaran la **misma** resistencia aerodinamica. Llena los interiores libremente sin preocuparte por resistencia adicional.

### Frame Beams

Los frame beams (las barras estructurales en los bordes de los marcos) tienen un **ratio de desplazamiento de volumen de 0**. Esto significa:

- No producen **resistencia**
- No producen **sustentacion**
- No producen **flotabilidad**
- Solo sirven como geometria de colision estructural

> Los frame beams son aerodinamicamente invisibles. Usalos libremente para estructura interna sin afectar el rendimiento aerodinamico de tu vehiculo.

## Componentes aerodinamicos

### Aileron

El [Aileron](components/miscellaneous/Aileron.md) es una superficie de control que se deflecta para crear fuerzas perpendiculares al flujo de aire. Se usa para dirigir aeronaves y embarcaciones.

- **Entrada**: un valor entre `-1.0` y `+1.0` a traves de su puerto de datos, controlando la rotacion de -45 grados a +45 grados
- **Fuerza**: proporcional a la densidad del fluido x velocidad al cuadrado x angulo de deflexion
- **No calcula oclusion** - a diferencia de los bloques, el Aileron siempre genera su fuerza completa independientemente de la geometria circundante

> Debido a que los Ailerons ignoran la oclusion, puedes **ocultarlos dentro de las alas** hechas de bloques. Los bloques tendran sus superficies ocluidas (reduciendo la resistencia), mientras que los Ailerons siguen produciendo su fuerza de control completa.

### Propeller

El [Propeller](components/propulsion/Propeller.md) genera empuje haciendo girar aspas a traves de un medio fluido. Funciona tanto en aire como en agua.

Fisica clave:
- **Empuje** = 1/2 x p x A<sub>disco</sub> x v<sub>efectiva</sub>2 x 0.4
- **Resistencia en las aspas** = 1/2 x p x viscosidad x A<sub>disco</sub> x v<sub>efectiva</sub>2 x 10.0
- **Efecto suelo**: cuando un Propeller esta cerca del suelo y apuntando hacia abajo, el empuje aumenta hasta un **+50%** (dentro de 3x el radio de las aspas del terreno)
- **Precesion giroscopica**: los Propellers girando resisten cambios de orientacion, creando un torque perpendicular al eje de rotacion - igual que los giroscopios reales
- El empuje maximo esta limitado a **100,000 N**

### Thruster y RCS

Los [Thrusters](components/propulsion/thruster/SmallThruster.md) quimicos generan empuje mediante la combustion de combustible y **no se ven afectados** por la aerodinamica externa para su generacion de empuje - funcionan igual en la atmosfera y en el vacio.

Los propulsores [RCS](components/propulsion/RCS.md) (Reaction Control System), sin embargo, experimentan **atenuacion atmosferica**:

**atenuacion = max(e<sup>-p*4</sup>, 0.01)**

| Entorno | Densidad (p) | Atenuacion | Empuje efectivo |
|---------|-------------|------------|-----------------|
| Vacio | 0 | 100% | Empuje completo |
| Aire (nivel del mar) | ~1.2 | ~99.2% | Casi completo |
| Agua | ~1000 | ~1% | Casi sin empuje |

> Los propulsores RCS estan disenados para maniobras espaciales. En atmosferas densas o agua, su efectividad cae drasticamente.

## Fisica del agua

Cuando un vehiculo entra en el agua, el motor de fisica aplica efectos de amortiguacion adicionales mas alla de la resistencia estandar:

### Deteccion de agua

El motor detecta el agua midiendo la **viscosidad** del entorno. Una viscosidad entre **0.0000151** y **0.000999** kg/(m*s) se clasifica como agua.

### Efectos de amortiguacion del agua

| Efecto | Descripcion |
|--------|-------------|
| **Supresion de velocidad vertical** | La velocidad vertical se reduce con el tiempo, simulando la resistencia del agua al movimiento vertical |
| **Amortiguacion de cabeceo y alabeo** | La rotacion alrededor de los ejes horizontales se amortigua proporcionalmente a cuanto esta sumergido el vehiculo |
| **Amortiguacion de guinada** | La rotacion alrededor del eje vertical se amortigua a **la mitad** de la tasa de cabeceo/alabeo |

El **factor de sumersion** se calcula a partir de la viscosidad promedio: `sumergido = clamp(pow(viscosidad x 1000, 0.1), 0.5, 1.0)`

> El agua estabiliza naturalmente los vehiculos. Un vehiculo parcialmente sumergido resistira volcarse debido a la amortiguacion de cabeceo/alabeo. Esto hace que los barcos sean inherentemente mas estables que las aeronaves.

## Estabilidad angular a alta velocidad

A velocidades superiores a **10 m/s**, el motor de fisica aplica una amortiguacion angular artificial que simula la acumulacion de presion en las superficies del vehiculo:

**w -= w x min(1, p) x clamp(dt x |v| / 25, 0, 0.025)**

Esto significa:
- Los **vehiculos mas rapidos** son mas estables rotacionalmente
- Los **fluidos mas densos** (agua > aire) proporcionan una estabilizacion mas fuerte
- Esto previene que los vehiculos giren descontroladamente a altas velocidades
- En agua con alta viscosidad, se aplica un factor de amortiguacion angular adicional

## Consejos de diseno

### Reducir la resistencia
- **Minimiza el area de superficie expuesta** - una forma compacta y aerodinamica crea menos resistencia
- Usa **pendientes, esquinas y biseles** en los bordes de ataque y las narices en lugar de caras planas de cubos
- **Los bloques internos no anaden resistencia** - solo importa la capa exterior, asi que llena los interiores segun sea necesario
- Los frame beams son aerodinamicamente invisibles - usalos libremente para estructura interna

### Construir alas efectivas
- Las alas deben tener **al menos 4 metros de largo**, **menos de 0.3 metros de grosor**
- Una mayor envergadura (ancho >= longitud/4) asegura que la superficie se clasifique como superficie de sustentacion en lugar de superficie de resistencia

### Diseno de embarcaciones
- Los bloques **Composite** (ratio 0.2) ofrecen el mejor equilibrio flotabilidad-peso para flotar
- **Steel y Aluminium** (ratio 0.01) apenas contribuyen a la flotabilidad - usalos con moderacion en barcos
- **Lead** (ratio 1.0) desplaza la mayor cantidad de fluido, pero a 150 kg por unidad se hundira rapidamente
- La amortiguacion del agua estabiliza naturalmente tu embarcacion - los cascos anchos y planos son los mas estables

### Colocacion de Propellers
- El **efecto suelo** aumenta el empuje hasta un 50% cuando esta cerca del terreno - util para disenos de hovercrafts
- Los Propellers generan **torque giroscopico** - pares de Propellers contra-rotantes cancelan este efecto
- Los Propellers funcionan tanto en aire como en agua, adaptando su empuje segun la densidad y viscosidad del fluido
