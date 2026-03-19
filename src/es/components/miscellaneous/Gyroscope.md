<p align="center">
  <img src="SmallGyroscope.png" />
  <img src="Gyroscope.png" />
</p>

|Component|`SmallGyroscope`| `Gyroscope`|
|---|---|---|
|**Module**|`ARCHEAN_gyroscope`|`ARCHEAN_gyroscope`|
|**Mass**|50 kg|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|100 x 100 x 100 cm|
#
---

# Description
El giroscopio es un componente que, cuando está alimentado y activo, amortigua su velocidad angular. Se usa principalmente para estabilizar un vehículo o detener el momento angular en gravedad cero.

# Power Supply
El SmallGyroscope se alimenta mediante **bajo voltaje** y el Gyroscope se alimenta mediante **alto voltaje**. Consumen más energía al arrancar y luego reducen gradualmente su consumo a medida que alcanzan la velocidad de rotación solicitada a través del puerto de datos.

# Usage
Para iniciar el giroscopio, debe recibir un valor entre `0.0` y `1.0` en su puerto de datos para disminuir/aumentar su velocidad de rotación, aumentando así su efecto estabilizador.

El giroscopio permite orientar manualmente un vehículo a través de su puerto de datos aprovechando el par inducido de las ruedas inerciales en su interior. Actuará según su orientación y velocidad de rotación.

### List of inputs
|Channel|Function|range|
|---|---|---|
|0|Speed| 0.0 to 1.0|
|1|Control| -1.0 to +1.0|

>Un giroscopio tiene un efecto limitado en relación con el peso de la construcción. Puedes aumentar el número de giroscopios para incrementar el efecto estabilizador.
