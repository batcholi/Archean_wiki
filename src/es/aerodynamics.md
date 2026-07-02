# Aerodinamica

Archean simula fuerzas aerodinamicas realistas, de nivel simulador de vuelo, sobre cualquier vehiculo que se mueva a traves de un fluido, aire o agua. El motor produce **sustentacion**, **resistencia**, **estabilidad**, **autoridad de control**, **flotabilidad** e incluso **calentamiento de reentrada**, todo a partir de la **forma** real de tu construccion. No hay "bloques de ala" especiales ni estadisticas ocultas: si parece un ala y esta colocado como un ala, vuela como un ala.

## Como funciona

### El campo de forma (modelo de seccion transversal)

Cuando terminas de editar una construccion, el motor toma una **instantanea de su forma exterior** escaneandola desde las seis direcciones de los ejes (como un mapa de cubo) y luego convierte el resultado en un conjunto de pequenos parches de superficie. Cada parche conoce su posicion, la direccion que encara, su area y -lo mas importante- **que tan profundo es el cuerpo detras de el** (su seccion transversal).

Esta instantanea se **almacena en cache** y solo se reconstruye cuando la construccion cambia (agregas/quitas bloques, una superficie de control se mueve, o la construccion recibe dano). La fisica de vuelo por fotograma solo lee los parches en cache, asi que el coste se mantiene **acotado sin importar la complejidad del vehiculo**: un avion de pasajeros de 300 metros con cientos de colisionadores se pilota con la misma eficiencia que un pequeno caza. La resolucion del escaneo se ajusta automaticamente al tamano del vehiculo.

De esto se derivan tres promesas — y el motor las cumple **exactamente**, no de forma aproximada:

- **Como construyes una forma nunca cambia como vuela — solo importa la forma final.** Un ala de 10 × 10 × 1 hecha de un solo bloque grande o de cien pequenos da un resultado **identico bit a bit**: las mismas fuerzas y los mismos momentos, hasta el ultimo digito. La subdivision, el numero de bloques y como se divide o fusiona la geometria son completamente invisibles para el flujo: solo importan la silueta exterior y la seccion transversal.
- **El aire y el agua son la misma fisica — no hay una "via de agua" separada.** El modelo muestrea la **densidad del fluido en cada superficie** y la introduce en las *mismas* ecuaciones de sustentacion y resistencia. Aire, linea de flotacion y agua profunda son solo puntos de una unica escala continua de densidad, de modo que un ala se convierte suavemente en un hidroala al sumergirse: nada conmuta.
- **El material es invisible para el vuelo.** Acero, aluminio, composite: una placa plana sigue siendo una placa plana. **El material solo afecta a la masa y la flotabilidad, nunca a la sustentacion ni a la resistencia** — cambia el *equilibrado* del avion, no su *forma de volar*.

> Solo se escanea el **casco exterior**. Los bloques internos nunca quedan expuestos al flujo de aire, asi que no anaden **ninguna** resistencia aerodinamica ni coste -y como el modelo lee el grosor de material solido que hay detras de una superficie (una cavidad sellada cuenta como cuerpo solido), una forma hueca vuela exactamente igual que su version maciza. Rellena, o vacia, los interiores con libertad; eso nunca cambia como vuela la nave.

### Sustentacion

Una superficie genera **sustentacion** (se comporta como un ala) cuando su **seccion transversal es delgada**: la profundidad de material solido delante-detras en esa superficie es pequena respecto al tamano del vehiculo. Un ala es delgada de arriba abajo pero amplia en envergadura y cuerda, asi que sustenta. Un fuselaje es profundo en todas las direcciones, asi que solo genera resistencia.

- La sustentacion sigue una **curva de sustentacion realista**: crece con el angulo de ataque, luego **entra en perdida** pasados unos **15°**, tras lo cual la sustentacion cae y la resistencia sube bruscamente, igual que un perfil aerodinamico real.
- La sustentacion es **de dos caras**: un ala expuesta al aire por ambas caras produce sustentacion plena; un ala cuyo intrados esta pegado al fuselaje sigue sustentando, con menor intensidad.
- Cada superficie separada sustenta por su cuenta. Una doble deriva, alas superpuestas (biplano) o un plano alineado detras de otro a lo largo del mismo eje se leen como las superficies delgadas distintas que son: el espacio de aire entre ellas no se cuenta como cuerpo solido, asi que cada una de ellas funciona.
- La sustentacion se calcula **en la ubicacion de cada superficie**, asi que produce de forma natural los momentos correctos de **cabeceo, alabeo y guinada** en torno a tu centro de masa.

> **Para hacer un ala, hazla geometricamente delgada.** Una superficie amplia y plana de solo uno o dos bloques de grosor sustentara. Un ala gruesa y profunda generara sobre todo resistencia. Como este subdividida o de que este hecha no importa: solo importa la seccion transversal.

### Resistencia

La resistencia proviene de varias fuentes fisicas, combinadas automaticamente:

| Fuente | Descripcion |
|--------|-------------|
| **Resistencia de forma (presion)** | El empuje del aire sobre las superficies que encaran el flujo. Crece con el **cuadrado de la velocidad**. |
| **Friccion superficial** | El rozamiento del aire a lo largo de superficies paralelas al flujo (basado en el numero de Reynolds). Dominante en cuerpos grandes y lentos. |
| **Resistencia inducida** | La resistencia inevitable que acompana a la sustentacion: mas sustentacion significa mas resistencia inducida. |

El comportamiento nuevo clave es el **perfilado basado en la esbeltez**. El motor mide que tan **esbelta** es cada superficie: cuanto se extiende el cuerpo *a lo largo* del flujo frente a lo delgado que es *en sentido transversal*:

- Una forma **esbelta** (un morro puntiagudo, el borde de ataque afilado de un ala, un fuselaje largo y delgado avanzando) mantiene el flujo adherido y tiene una resistencia de forma **muy baja**.
- Una forma **roma** (un cubo, una placa plana puesta de lado como un aerofreno, un morro chato) tiene la resistencia de forma **completa**.

Es puramente geometrico: lee la seccion transversal real de tu construccion, asi que perfilar el morro y los bordes de verdad compensa.

> Usa rampas, esquinas y biseles para afilar morros y bordes de ataque/salida. Una forma perfilada puede tener **una decima parte** de la resistencia de forma de una roma del mismo tamano frontal.

### Compresibilidad (alta velocidad)

El modelo distingue los regimenes. Al aproximarse y superar la **velocidad del sonido** (que depende de la temperatura del aire), la presion sobre las superficies orientadas hacia delante aumenta en el rango transonico y supersonico, y **la sustentacion de las alas se desvanece en supersonico** (dependes mas de la sustentacion del cuerpo y de la deflexion de los mandos). El vuelo a alto Mach se vuelve claramente mas pesado y menos reactivo, como debe ser.

### Estabilidad: emergente, no programada

No hay **ningun amortiguamiento artificial** del tipo "manten el morro hacia delante". La estabilidad es un resultado real y emergente de donde estan tus superficies:

- Un **estabilizador horizontal** montado detras del centro de masa encara el flujo de aire con cierto angulo cada vez que el morro sube o baja, generando una **fuerza de recuperacion** que devuelve el morro. Es **estabilidad de cabeceo** automatica.
- Un **estabilizador vertical** (deriva) hace lo mismo para la **guinada** cada vez que el vehiculo derrapa.
- El **amortiguamiento rotacional** (resistencia a tumbar) tambien emerge de forma natural: las superficies alejadas del centro de masa se mueven rapido por el aire cuando el vehiculo gira, y las fuerzas resultantes se oponen al giro.

Como es fisica real, **la estabilidad estatica depende de tu centro de masa**. Un avion es estable cuando su **centro de masa se situa en el centro de sustentacion del ala o ligeramente por delante**, e inestable cuando la masa esta demasiado atras, exactamente como un avion real (y un aeromodelo real). Ver [Volar bien](#volar-bien) mas abajo.

> La antigua estabilizacion angular artificial a alta velocidad ha **desaparecido** para las construcciones que usan este modelo. Si tu avion se siente nervioso o no se asienta, es un problema de **equilibrado**, no el motor peleando contigo: mueve masa hacia delante o anade superficie de cola.

### Superficies de control y autoridad

Las superficies de control (los [Aileron](components/miscellaneous/Aileron.md) usados como alerones, timones de profundidad o de direccion) van montadas en bisagras y **se deflectan en tiempo real**. El motor reevalua la aerodinamica de una superficie deflectada **a su angulo actual en cada fotograma**, asi que:

- Un timon de profundidad deflectado cambia de inmediato el flujo de aire sobre la cola y hace cabecear al avion.
- La autoridad depende del **area** de la superficie, de su **distancia al centro de masa** (brazo de palanca) y de **densidad del aire × velocidad²**.

> **Para un control potente:** haz las superficies de control **grandes** y montalas **lejos del centro de masa**. Un timon de profundidad en el extremo de la cola tiene mucha mas autoridad de cabeceo que uno cerca del ala. Aire mas rapido y mas denso da mas autoridad: los mandos se ablandan a baja velocidad y gran altitud.

### Aerodinamica sensible al dano

El dano de combate cambia como vuela una superficie. A medida que un panel se deforma o se agujerea (y cada vez mas a medida que se destruye):

- **Pierde sustentacion**: un ala destrozada deja de volar.
- **Pierde perfilado y recuperacion de presion**, y **genera mas resistencia** (suelta una estela turbulenta).

Como la sustentacion y la resistencia se calculan por superficie, el **dano asimetrico** tiene el efecto correcto: un ala acribillada por un lado hace que el avion **alabee** (perdida de sustentacion en ese lado) y **guine** (resistencia extra en ese lado). Los disenos simetricos y redundantes sobreviven mejor al combate.

### Flotabilidad

La flotabilidad es la fuerza ascendente sobre los bloques sumergidos, calculada por colisionador a partir del volumen de fluido que desplaza cada bloque.

**F<sub>flotabilidad</sub> = V<sub>desplazado</sub> × ρ<sub>fluido</sub> × g**

- El volumen desplazado de cada bloque = su volumen × el **ratio de desplazamiento volumetrico** de su material (ver [Materiales](#materiales)).
- Los bloques danados pierden casi toda su flotabilidad.
- La flotabilidad se aplica donde estan realmente los bloques, asi que una inmersion desigual inclina la embarcacion: un efecto de autoenderezamiento para cascos bien formados.

### Agua

El agua **no es un caso especial**. El modelo muestrea la **densidad del fluido en cada superficie** — aire por encima de la linea de flotacion, agua por debajo, con una transicion continua — de modo que el *mismo* modelo de sustentacion y resistencia simplemente produce fuerzas mucho mayores bajo el agua, donde el fluido es **~800× mas denso** que el aire. Nada esta codificado de forma fija para "estar en el agua":

- Un ala se convierte en un **hidroala**: sustenta y ofrece resistencia bajo el agua igual que en el aire, solo que mucho mas intensamente. **Las superficies de control siguen funcionando bajo el agua**, por lo que un submarino se gobierna con los mismos alerones y empenajes que un avion.
- **La resistencia es enorme** y crece con el cuadrado de la velocidad, de modo que un cuerpo que entra en el agua frena con fuerza y un casco flotante se retiene de forma natural en lugar de salir disparado — sin ningun amortiguamiento artificial.
- **El amortiguamiento rotacional** proviene directamente del mismo modelo: las superficies alejadas del centro de masa se mueven rapido por el fluido denso cuando la nave gira o vuelca, de modo que barcos y submarinos se estabilizan de forma natural.

> Como las fuerzas crecen con la densidad, **golpear el agua a gran velocidad es un impacto real**. Una panzada a gran velocidad carga toda la cara de contacto muy por encima de lo que la estructura puede soportar y la **abolla o destruye**, igual que chocar contra suelo solido — asi que entra en el agua con un angulo bajo y reduce la velocidad primero.

### Calentamiento de reentrada

Moverse rapido por el aire calienta las superficies orientadas hacia delante hacia la **temperatura de estancamiento (de recuperacion)**, que crece con el cuadrado de la velocidad. Es suave a velocidades supersonicas pero **explosivo a velocidades de reentrada**, y cada material se consume al superar su propio limite termico: por eso importan un escudo termico, un angulo de reentrada empinado pero sobrevivible y perder velocidad en altura.

## Bloques y materiales

### Materiales

La eleccion del material afecta a la **masa** y la **flotabilidad** -y por tanto al **equilibrado**- pero **no a la sustentacion ni a la resistencia**:

| Material | Masa (por unidad de bloque) | Desplazamiento volumetrico (flotabilidad) |
|----------|-----------------------------|-------------------------------------------|
| **Composite** | 0.25 | 0.20 × ocupacion |
| **Concrete** | 10.0 | 0.25 × ocupacion |
| **Steel** | 1.0 | 0.01 × ocupacion |
| **Aluminium** | 0.5 | 0.01 × ocupacion |
| **Glass** | 1.0 | 0.02 × ocupacion |
| **Lead** | 150.0 | 1.00 × ocupacion |
| **Titanium** | 0.6 | 0.01 × ocupacion |

- **Lead** es denso y desplaza por completo: ideal como **lastre de morro** para llevar tu centro de masa hacia delante (o como lastre de quilla en un barco), pero se hunde.
- **Composite** es ligero con desplazamiento moderado: el mejor flotador de uso general.
- **Steel/Aluminium/Titanium** apenas desplazan fluido: resistentes y ligeros, pero casi no aportan flotabilidad.

> Como el material no cambia la aerodinamica, eliges materiales por **resistencia, peso, resistencia al calor y equilibrado**, no por las prestaciones de vuelo.

### Formas de bloque

Las rampas, esquinas y piramides ocupan medio cubo y son mas ligeras. Aerodinamicamente importan porque te permiten **afilar** superficies, convirtiendo una cara roma y resistente en una esbelta y perfilada. Usalas en morros y bordes de ala.

### Vigas de marco

Las vigas de marco (las barras estructurales en los bordes de los marcos) son **aerodinamicamente invisibles**: sin sustentacion, sin resistencia, sin flotabilidad. Usalas con libertad como estructura interna.

## Componentes aerodinamicos

### Aileron

El [Aileron](components/miscellaneous/Aileron.md) es una superficie de control con bisagra usada como aleron, timon de profundidad o de direccion. La entrada es un valor de `-1.0` a `+1.0` (rotacion de −45° a +45°) a traves de su puerto de datos.

- Calcula su **propia** fuerza de control y queda **excluido del campo de forma principal**, asi que nunca se cuenta dos veces y siempre entrega autoridad plena aun rodeado de estructura.
- Puedes construir la parte fija de un ala o una cola con bloques (gestionados por el campo) y poner **alerones en el borde de salida** para el control.

### Propeller

El [Propeller](components/propulsion/Propeller.md) (helice) genera empuje en aire o agua y queda excluido del campo de forma (tiene su propio modelo). Comportamientos clave: el empuje depende de la densidad del fluido y del area del disco; el **efecto suelo** aumenta el empuje hasta un **+50%** cerca del terreno; las palas en giro crean una resistencia **giroscopica** a la reorientacion; el empuje esta limitado a **100.000 N**.

### Thruster y RCS

Los [Thruster](components/propulsion/thruster/SmallThruster.md) quimicos no se ven afectados por la aerodinamica y funcionan igual en atmosfera y en vacio. Los [RCS](components/propulsion/RCS.md) pierden casi toda su eficacia en fluidos densos (atenuacion ≈ e<sup>−ρ×4</sup>): son para el espacio.

## Volar bien

### Construir alas

- Haz el ala **geometricamente delgada**: una superficie amplia y plana de uno o dos bloques de grosor. Seccion mas delgada = sustentacion mas limpia.
- Dale **envergadura y cuerda**; un ala larga y amplia sustenta mas y entra en perdida de forma mas suave.
- La sustentacion es **independiente del material y del numero de bloques**: construye por resistencia y peso.
- Afila los **bordes de ataque y de salida** con rampas para reducir la resistencia.

### Equilibrar para un vuelo estable

Es lo mas importante para un avion que vuela bien:

- Manten el **centro de masa en las alas o ligeramente por delante**. Anade masa densa (p. ej. **lead** o componentes pesados) hacia el **morro** para llevarlo adelante: los aviones reales llevan el motor delante por exactamente esta razon.
- Un avion **pesado de cola** (masa demasiado atras) es inestable: cabecea y guina de forma divergente y es agotador de pilotar.
- Monta **estabilizadores horizontales** bien por detras del centro de masa para la estabilidad de cabeceo, y una **deriva** para la estabilidad de guinada. Mas superficie de cola y un brazo de cola mas largo = mas estabilidad.
- Si una construccion no se calma, **mueve masa hacia delante** o **anade superficie de cola** antes de culpar a los mandos.

### Autoridad de control

- Superficies de control mas grandes, montadas **mas lejos del centro de masa**, dan mas autoridad.
- Pon los **timones de profundidad en el extremo de la cola** para el cabeceo, los **timones de direccion en la deriva** para la guinada, los **alerones en las puntas de ala** para el alabeo.
- La autoridad cae a **baja velocidad** y **gran altitud** (aire enrarecido): manten la velocidad en aproximacion.

### Reducir la resistencia

- **Perfila** morros y bordes con rampas: las formas esbeltas generan mucha menos resistencia.
- Manten el vehiculo **compacto**; las estructuras extendidas presentan mas area frontal.
- Los **bloques internos son gratis**: solo se escanea el casco exterior, asi que la distribucion interna nunca anade resistencia.

### Embarcaciones

- Usa **composite** para el casco (mejor relacion flotabilidad/peso); usa **lead en la parte baja de la quilla** para la estabilidad.
- Los cascos **anchos y planos** son los mas estables: el amortiguamiento del agua hace el resto.
- **Steel/aluminium** apenas flotan; usalos por encima de la linea de flotacion.

### Sobrevivir al combate

- **Simetria y redundancia:** el dano asimetrico de ala te hace *alabear* y *guinar*, asi que duplica las superficies sustentadoras y de control criticas en ambos lados.
- Espera que un ala danada **pierda sustentacion y genere mas resistencia**: manten velocidad y altitud en reserva.

### Rendimiento

El campo de forma se almacena en cache y solo se reconstruye cuando la construccion cambia o recibe dano, y su coste es acotado sin importar el tamano o el numero de bloques. Nunca pagas una penalizacion por fotograma por el detalle o el relleno interno, asi que construye tan grande y detallado como quieras.
