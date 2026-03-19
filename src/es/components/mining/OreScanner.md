<p align="center">
  <img src="OreScanner.png" />
</p>

|Component|`OreScanner`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 25 x 25 cm|
#
---

# Description
El Ore Scanner es un componente que permite obtener la composición del terreno en una o más posiciones (por distancia) en la dirección de su sensor. Solo funciona en planetas y lunas y se usa principalmente para encontrar minerales para el sistema de fabricación.

# Usage
Desde un punto de vista técnico, el scanner es muy simple. Le envías un número en el canal 0 que corresponde a la distancia en metros a la que deseas escanear el terreno horizontalmente, y el scanner devolverá un objeto de texto correspondiente a la composición a esa distancia en la dirección del sensor.

Su fortaleza reside en la capacidad de enviarle múltiples distancias en diferentes canales para escanear múltiples puntos simultáneamente en cada tick del servidor (25 veces por segundo por defecto).

> Nunca lo apuntes hacia abajo/arriba, funciona mejor cuando escanea horizontalmente.

## Ejemplo
Para escanear el terreno a una distancia de 10m, necesitas enviar el valor 10 en el canal de entrada 0. El scanner devolverá un objeto de texto que corresponde a la composición a 10m de distancia en el canal de salida correspondiente.

Para escanear el terreno a distancias de 10m y 20m, necesitas enviar el valor 10 en el canal de entrada 0 y el valor 20 en el canal de entrada 1, por ejemplo. El scanner devolverá entonces un objeto de texto que corresponde a la composición a 10m de distancia en el canal de salida 0 y otro objeto de texto para 20m de distancia en el canal de salida 1.

Con estas posibilidades, puedes, por ejemplo, usar un bucle XenonCode para escanear todas las composiciones dentro de un rango de 100m con un paso de 10m y mostrarlas en la consola.

```xc
	repeat 10 ($i)
		output_number($scanner_io, $i, $i*10)
		print(input_text($scanner_io, $i))
```

Ten en cuenta que habrá un retraso de 1 tick entre el envío a la salida y la obtención desde la entrada.
Básicamente, el Scanner te dará los resultados basados en los valores que le enviaste en el tick anterior, así que no mezcles tus valores de distancia entre canales y no uses valores aleatorios, intenta mantenerlos consistentes a lo largo de múltiples ticks.

## Obtención de datos
Cuando hayas realizado un escaneo, puedes obtener la información de composición, que estará en forma de un objeto de texto key-value.
Por ejemplo, si has escaneado el terreno a una distancia de 10m, puedes obtener un objeto de texto de la forma `.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}`, lo que significa que el terreno a 10m de distancia contiene 12% de carbono, 5% de hierro, 3% de silicio y 80% de cobre.

Puedes analizar esto fácilmente para obtener los datos que te interesan usando el sistema key-value implementado en [XenonCode](../../xenoncode/documentation.md).

## Ir más allá
El Ore Scanner escanea el terreno en la dirección de su sensor. Puedes instalarlo en un Small Pivot para, por ejemplo, rotarlo y crear un mapa de composición alrededor de su posición usando un programa XenonCode y las pantallas del juego.

## Energía
El Ore Scanner consume energía de bajo voltaje para funcionar. Su consumo es directamente proporcional al número de canales que utilices. Cuantas más posiciones escanees en un solo tick, más energía consumes, que es de 100 vatios por canal por tick.
