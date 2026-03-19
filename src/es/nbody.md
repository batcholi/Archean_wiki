# N-Body Physics

## Introduccion
Archean soporta dos tipos de fisica para entidades ubicadas fuera de la atmosfera de un cuerpo celeste:

- **Dominant Gravity Physics (por defecto)**: El cuerpo celeste con la mayor influencia gravitacional afectara a la entidad.
- **N-Body Physics**: Todos los cuerpos celestes afectaran a la entidad.

## Por que N-Body Physics no esta habilitado por defecto?
**N-Body Physics** ofrece una simulacion mas realista, para jugadores con conocimientos avanzados de fisica espacial que quieran un desafio extra. En la realidad, las agencias espaciales dependen de supercomputadoras para calcular las trayectorias de satelites y sondas y ajustarlas segun sea necesario. En *Archean*, los jugadores deben realizar estos calculos manualmente, limitados por la capacidad de computo de una computadora **Xenoncode**.

Un problema unico en *Archean* es la proximidad de la Luna a la Tierra durante esa era, lo que hace casi imposible lograr una orbita estable alrededor de la Tierra sin ser fuertemente influenciado por la gravedad lunar. Sin embargo, con **Dominant Gravity Physics**, los jugadores pueden centrarse en la gravedad de la Tierra e ignorar la influencia de la Luna cuando estan en orbita alrededor de la Tierra.

## Configuracion
Para habilitar N-Body Physics, necesitas modificar el archivo `Archean-data/server/ARCHEAN_celestial.ini` y establecer el valor de `nbody` a `yes`.

---
## Informacion adicional
Cuando uses N-Body Physics, no recomendamos usar el [NavInstrument](/components/navigation/NavInstrument.md) que esta disenado para funcionar nativamente con Dominant Gravity Physics. Es posible usarlo con N-Body Physics, pero devolvera informacion inexacta y tu orbita no sera estable.

