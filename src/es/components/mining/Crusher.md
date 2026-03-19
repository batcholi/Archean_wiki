<p align="center">
  <img src="Crusher.png" />
</p>

|Component|`Crusher`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Item**|Accept Push, Initiate Push|
#
---

# Description
El Crusher es un componente que permite la trituración rápida de rocas para obtener minerales.

También puede usarse para **reciclar cualquier objeto fabricable** convirtiéndolo de nuevo en sus materias primas. El proceso de reciclaje devuelve el **100% de los recursos primarios** utilizados para fabricar el objeto, descomponiendo recursivamente la receta de fabricación.

> **Nota:** Las [Batteries](../energy/battery/LowVoltageBattery.md) tienen una receta de reciclaje especial que solo devuelve aproximadamente el **50%** de su coste de fabricación. Esto evita explotar el sistema de reciclaje para obtener recargas gratuitas triturando y volviendo a fabricar baterías agotadas.

# Usage
El Crusher requiere energía de alto voltaje y consume 10 kW.

Para usar el Crusher, simplemente envía rocas a triturar a través de su puerto de entrada de objetos. No extraerá de su entrada, pero es capaz de empujar los minerales obtenidos hacia cualquier contenedor que acepte objetos.

El Crusher es capaz de procesar 400 kg de rocas por segundo, igualando la producción de 4 [Mining Drills](MiningDrill.md) funcionando a máxima potencia.

> Cuando la composición de las rocas contiene una baja concentración de ciertos minerales, el Crusher acumulará los minerales en baja concentración hasta que sea posible producir al menos una unidad del mineral.
