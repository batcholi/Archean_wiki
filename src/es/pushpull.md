# Push & Pull

En Archean, los objetos y fluidos no se mueven por si solos. Cada transferencia entre dos componentes sigue un modelo de **Push/Pull**: un lado debe iniciar activamente la accion, y el otro lado debe aceptarla.

Comprender este sistema es esencial para construir configuraciones funcionales. La pagina wiki de cada componente indica su modo Push/Pull en la tabla de informacion en la parte superior.

## Los tres roles

### Initiate
Un componente que **inicia** una accion comienza activamente la transferencia. Empujara objetos/fluidos hacia lo que este conectado a su salida, o extraera de lo que este conectado a su entrada.

### Accept
Un componente que **acepta** una accion es pasivo. Puede recibir un push o responder a un pull, pero nunca iniciara una transferencia por si solo.

### Forward
Un componente que **reenvia** una accion la pasa al otro lado. No almacena nada - simplemente transmite la accion de push o pull de un puerto al otro.

> Los reenviadores son transparentes: si algo empuja hacia un lado de un Bridge, el Bridge empuja hacia lo que este del otro lado. Lo mismo para los pulls.

## Como funciona

- **Push**: La fuente envia objetos/fluidos al destino. La fuente decide *que* y *cuando* enviar.
- **Pull**: El destino solicita objetos/fluidos de la fuente. El destino decide *que* y *cuando* recuperar.

Una conexion solo funciona cuando un lado **inicia** y el otro lado **acepta** (o reenvia a algo que acepta). Dos componentes pasivos conectados entre si nunca transferiran nada.

---

## Un error comun

Considera esta configuracion: **Mining Drill -> Container -> Crusher**

El Mining Drill **inicia push**, asi que las rocas llegan al Container. Pero el Container solo **acepta** - nunca empujara nada por si solo. Y el Crusher solo **acepta push** - tampoco extraera del Container. Resultado: las rocas se acumulan en el Container y nada llega al Crusher.

### Soluciones

**Mining Drill -> Crusher -> Container**
El Mining Drill empuja rocas al Crusher, que las acepta, las procesa y empuja los minerales resultantes al Container.

**Mining Drill -> Container -> Item Conveyor -> Crusher -> Container**
El [Item Conveyor](components/items/ItemConveyor.md) es un **iniciador** - extrae activamente del primer Container y empuja hacia el Crusher. Esto es util cuando quieres almacenar rocas temporalmente o controlar la tasa de flujo.

---

## Leer las paginas de componentes

Cada pagina de componente muestra su modo Push/Pull en la tabla de informacion:

| Modo | Significado |
|---|---|
| `Initiate Push` | Empuja activamente hacia su salida |
| `Initiate Pull` | Extrae activamente de su entrada |
| `Initiate Push/Pull` | Hace ambos activamente |
| `Accept Push` | Recibe pushes de forma pasiva |
| `Accept Pull` | Responde a pulls de forma pasiva |
| `Accept Push/Pull` | Hace ambos de forma pasiva |
| `Accept Push/Pull -> Forwards action to other side` | Transmite acciones a traves |

Algunos componentes combinan roles - por ejemplo, el Crusher **acepta push** en su entrada (rocas entrantes) e **inicia push** en su salida (minerales salientes).
