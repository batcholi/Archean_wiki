<p align="center">
  <img src="SolarPanel.png" />
</p>

|Component|`SolarPanel`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 25 cm|
#
---

# Description
El Solar Panel genera energía de bajo voltaje. Tiene una eficiencia del 99.9% y una superficie de 4 metros cuadrados (2x2 metros).
La potencia de salida estará limitada según su distancia y orientación respecto al sol o soles.
Con la configuración predeterminada del sistema solar en Archean, el sol es solo un 25% tan brillante como nuestro sol real. En la Tierra de Archean dentro de la atmósfera en las mejores circunstancias, podrías generar hasta ~980 vatios por panel.

# Usage
Conecta el Solar Panel al componente que requiere energía de bajo voltaje para funcionar.

El Solar Panel tiene dos puertos eléctricos, lo que te permite conectar dos componentes simultáneamente o encadenar múltiples Solar Panels en serie para aumentar la potencia total disponible.

### List of outputs
|Channel|Function|
|---|---|
|0|Generated Power (Watts)|
|1|Output Power (Watts)|

> Si estás usando el Solar Panel para alimentar dos componentes, la potencia total distribuida entre los dos puertos no puede exceder la potencia de salida del panel.
>
> Si uno de los dos componentes quiere consumir toda la potencia disponible del panel, puede impedir que el otro componente use energía en absoluto. Es mejor usar junctions de energía en este caso, para asegurar que todos los componentes reciban energía.
